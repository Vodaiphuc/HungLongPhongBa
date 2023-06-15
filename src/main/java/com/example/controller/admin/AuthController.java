package com.example.controller.admin;

import java.util.Optional;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.ConfirmPassword;
import com.example.dto.Login;
import com.example.dto.MailInfo;
import com.example.dto.Register;
import com.example.helper.DateHelper;
import com.example.helper.IntegerHelper;
import com.example.helper.MailSubjectTypeEnum;
import com.example.helper.MailTypeEnum;
import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.StatusTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.SendMail;
import com.example.model.User;
import com.example.service.CookieService;
import com.example.service.MailerService;
import com.example.service.SendMailService;
import com.example.service.SessionService;
import com.example.service.UserService;

@Controller
@RequestMapping(value = "auth/admin")
public class AuthController {
	@Autowired
	UserService userService;

	@Autowired
	SendMailService sendMailService;

	@Autowired
	CookieService cookie;

	@Autowired
	SessionService session;

	@Autowired
	MailerService mailerService;

	@GetMapping(value = "/login")
	public String loginPage(@ModelAttribute("login") Login login) {
		User user = session.get("user");
		if (user != null) {
			userService.updateLastLoginDate(user.getId());
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_DASHBOARD.type;
		}
		return PageTypeEnum.ADMIN_LOGIN.type;
	}

	@PostMapping(value = "/login")
	public String login(Model model, @Valid @ModelAttribute("login") Login login, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.ADMIN_LOGIN.type;
		}
		Optional<User> user = userService.findByEmailAndPassword(login.getEmail(), login.getPassword());
		if (!user.isPresent()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Email and password do not match.");
			return PageTypeEnum.ADMIN_LOGIN.type;
		}
		if (!user.get().isRole()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Only admin account has access.");
			return PageTypeEnum.ADMIN_LOGIN.type;
		}
		if (!user.get().isLogin()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Account blocked access.");
			return PageTypeEnum.ADMIN_LOGIN.type;
		}
		cookie.add("email", user.get().getEmail(), 5 * 60 * 60);
		cookie.add("role", String.valueOf(user.get().isRole()), 5 * 60 * 60);
		session.set("user", user.get());
		userService.updateLastLoginDate(user.get().getId());
		MailInfo mailInfo = new MailInfo(login.getEmail(), MailSubjectTypeEnum.THANK.type, null,
				MailTypeEnum.LOGIN.type);
		try {
			mailerService.send(mailInfo);
		} catch (MessagingException e) {
			e.printStackTrace();
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		}
		SendMail sendMail = new SendMail();
		sendMail.setEmailTo(login.getEmail());
		sendMail.setSubject(MailSubjectTypeEnum.THANK.type);
		sendMail.setType(MailTypeEnum.LOGIN.type);
		sendMailService.save(sendMail);
		String uri = session.get("security-uri");
		if (uri != null) {
			session.remove("security-uri");
			return TransferTypeEnum.REDIRECT.type + uri;
		}
		model.addAttribute(StatusTypeEnum.MESSAGE.type, "Logged in successfully.");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_DASHBOARD.type;
	}

	@GetMapping(value = "/register")
	public String registerPage(@ModelAttribute("register") Register register) {
		return PageTypeEnum.ADMIN_REGISTER.type;
	}

	@PostMapping(value = "/register")
	public String register(Model model, @Valid @ModelAttribute("register") Register register, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.ADMIN_REGISTER.type;
		}
		if (userService.findByEmail(register.getEmail()).isPresent()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Email already exists.");
			return PageTypeEnum.ADMIN_REGISTER.type;
		}
		if (!register.getPassword().equals(register.getPasswordAgain())) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Confirm password and password do not match.");
			return PageTypeEnum.ADMIN_REGISTER.type;
		}
		User user = new User();
		user.setEmail(register.getEmail());
		user.setFullName(register.getFullName());
		user.setPassword(register.getPassword());
		user.setBirthDay(register.getBirthDay());
		user.setRole(true);
		userService.saveOrUpdate(user);
		model.addAttribute(StatusTypeEnum.MESSAGE.type, "Registered successfully, you can login.");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_LOGIN.type;
	}

	@GetMapping(value = "/forgot-password")
	public String forgotPasswordPage() {
		return PageTypeEnum.ADMIN_FORGOT_PASSWORD.type;
	}

	@PostMapping(value = "/forgot-password")
	public String forgotPassword(Model model, @RequestParam(name = "email") String email) {
		Optional<User> user = userService.findByEmail(email);
		if (user.isEmpty()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Email account not registered !");
			return PageTypeEnum.ADMIN_FORGOT_PASSWORD.type;
		}
		if (!user.get().isRole()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Only admin account has access.");
			return PageTypeEnum.ADMIN_FORGOT_PASSWORD.type;
		}
		int code = IntegerHelper.random5Number();
		session.set("code", code);
		MailInfo mailInfo = new MailInfo(email, MailSubjectTypeEnum.VERIFICATION.type, String.valueOf(code),
				MailTypeEnum.FORGOT.type);
		try {
			mailerService.send(mailInfo);
		} catch (MessagingException e) {
			e.printStackTrace();
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		}
		SendMail sendMail = new SendMail();
		sendMail.setEmailTo(email);
		sendMail.setSubject(MailSubjectTypeEnum.VERIFICATION.type);
		sendMail.setBody(String.valueOf(code));
		sendMail.setType(MailTypeEnum.FORGOT.type);
		Optional<SendMail> sendMailOld = sendMailService.save(sendMail);
		if (sendMailOld.isEmpty())
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		session.set("idEmailCode", sendMailOld.get().getId());
		session.set("emailConfirm", email);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_CONFIRM_PASSWORD.type;
	}

	@GetMapping(value = "/confirm-password")
	public String confirmPasswordPage(@ModelAttribute("confirmPassword") ConfirmPassword confirmPassword) {
		String emailConfirm = session.get("emailConfirm");
		String idEmailCode = session.get("idEmailCode");
		if (emailConfirm == null || emailConfirm.equals("") || idEmailCode == null || idEmailCode.equals("")) {
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_CONFIRM_PASSWORD.type;
		}
		return PageTypeEnum.ADMIN_CONFIRM_PASSWORD.type;
	}

	@PostMapping(value = "/confirm-password")
	public String confirmPassword(Model model,
			@Valid @ModelAttribute("confirmPassword") ConfirmPassword confirmPassword, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.ADMIN_CONFIRM_PASSWORD.type;
		}
		int code = session.get("code");
		String emailConfirm = session.get("emailConfirm");
		String idEmailCode = session.get("idEmailCode");
		if (!String.valueOf(code).equals(confirmPassword.getCode())) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Verification code does not match.");
			return PageTypeEnum.ADMIN_CONFIRM_PASSWORD.type;
		}
		if (!confirmPassword.getPassword().equals(confirmPassword.getPasswordAgain())) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Confirm password and password do not match.");
			return PageTypeEnum.ADMIN_CONFIRM_PASSWORD.type;
		}
		Optional<SendMail> sendMail = sendMailService.findById(idEmailCode);
		if (sendMail.isEmpty())
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		if (DateHelper.checkTime15P(DateHelper.dateNow(), sendMail.get().getCreatedDate())) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Verification code timed out.");
			return PageTypeEnum.ADMIN_CONFIRM_PASSWORD.type;
		}
		userService.updatePasswordByEmail(emailConfirm, confirmPassword.getPassword());
		session.remove("code");
		session.remove("emailConfirm");
		session.remove("idEmailCode");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_LOGIN.type;
	}

	@GetMapping(value = "/logout")
	public String logout() {
		cookie.remove("email");
		cookie.remove("role");
		session.remove("user");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_LOGIN.type;
	}
}
