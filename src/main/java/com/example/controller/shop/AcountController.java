package com.example.controller.shop;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

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
import com.example.model.Review;
import com.example.model.SendMail;
import com.example.model.User;
import com.example.service.CookieService;
import com.example.service.MailerService;
import com.example.service.ReviewService;
import com.example.service.SendMailService;
import com.example.service.SessionService;
import com.example.service.StorageService;
import com.example.service.UserService;

@Controller
@RequestMapping(value = "shop/account")
public class AcountController {

	@Autowired
	UserService userService;

	@Autowired
	ReviewService reviewService;

	@Autowired
	SendMailService sendMailService;

	@Autowired
	CookieService cookie;

	@Autowired
	SessionService session;

	@Autowired
	StorageService storageService;

	@Autowired
	MailerService mailerService;

	@GetMapping(value = "/login")
	public String loginPage(@ModelAttribute("login") Login login) {
		User user = session.get("shop");
		if (user != null) {
			userService.updateLastLoginDate(user.getId());
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_HOME.type;
		}
		return PageTypeEnum.SHOP_LOGIN.type;
	}

	@PostMapping(value = "/login")
	public String login(Model model, @Valid @ModelAttribute("login") Login login, BindingResult result)
			throws MessagingException {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.SHOP_LOGIN.type;
		}
		Optional<User> user = userService.findByEmailAndPassword(login.getEmail(), login.getPassword());
		if (!user.isPresent()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Email and password do not match.");
			return PageTypeEnum.SHOP_LOGIN.type;
		}
		session.set("shop", user.get());
		userService.updateLastLoginDate(user.get().getId());
		MailInfo mailInfo = new MailInfo(login.getEmail(), MailSubjectTypeEnum.THANK.type, null,
				MailTypeEnum.LOGIN.type);
		mailerService.send(mailInfo);
		SendMail sendMail = new SendMail();
		sendMail.setEmailTo(login.getEmail());
		sendMail.setSubject(MailSubjectTypeEnum.THANK.type);
		sendMail.setType(MailTypeEnum.LOGIN.type);
		sendMailService.save(sendMail);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_HOME.type;
	}

	@GetMapping(value = "/register")
	public String registerPage(@ModelAttribute("register") Register register) {
		return PageTypeEnum.SHOP_REGISTER.type;
	}

	@PostMapping(value = "/register")
	public String register(Model model, @Valid @ModelAttribute("register") Register register, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.SHOP_REGISTER.type;
		}
		if (userService.findByEmail(register.getEmail()).isPresent()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Email already exists.");
			return PageTypeEnum.SHOP_REGISTER.type;
		}
		if (!register.getPassword().equals(register.getPasswordAgain())) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Confirm password and password do not match.");
			return PageTypeEnum.SHOP_REGISTER.type;
		}
		User user = new User();
		user.setEmail(register.getEmail());
		user.setFullName(register.getFullName());
		user.setPassword(register.getPassword());
		user.setBirthDay(register.getBirthDay());
		userService.saveOrUpdate(user);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_ACCOUNT_LOGIN.type;
	}

	@GetMapping(value = "/change-password")
	public String changePasswordPage() throws MessagingException {
		User user = session.get("shop");
		int code = IntegerHelper.random5Number();
		session.set("code", code);
		MailInfo mailInfo = new MailInfo(user.getEmail(), MailSubjectTypeEnum.VERIFICATION.type, String.valueOf(code),
				MailTypeEnum.FORGOT.type);
		mailerService.send(mailInfo);
		SendMail sendMail = new SendMail();
		sendMail.setEmailTo(user.getEmail());
		sendMail.setSubject(MailSubjectTypeEnum.VERIFICATION.type);
		sendMail.setBody(String.valueOf(code));
		sendMail.setType(MailTypeEnum.FORGOT.type);
		SendMail sendMailOld = sendMailService.save(sendMail).get();
		session.set("idEmailCode", sendMailOld.getId());
		session.set("emailConfirm", user.getEmail());
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_ACCOUNT_CONFIM_PASSWORD.type;
	}

	@GetMapping(value = "/forgot-password")
	public String forgotPasswordPage() {
		return PageTypeEnum.SHOP_FORGOT_PASSWORD.type;
	}

	@PostMapping(value = "/forgot-password")
	public String forgotPassword(Model model, @RequestParam(name = "email") String email) throws MessagingException {
		Optional<User> user = userService.findByEmail(email);
		if (user.isEmpty()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Email account not registered !");
			return PageTypeEnum.SHOP_FORGOT_PASSWORD.type;
		}
		int code = IntegerHelper.random5Number();
		session.set("code", code);
		MailInfo mailInfo = new MailInfo(email, MailSubjectTypeEnum.VERIFICATION.type, String.valueOf(code),
				MailTypeEnum.FORGOT.type);
		mailerService.send(mailInfo);
		SendMail sendMail = new SendMail();
		sendMail.setEmailTo(email);
		sendMail.setSubject(MailSubjectTypeEnum.VERIFICATION.type);
		sendMail.setBody(String.valueOf(code));
		sendMail.setType(MailTypeEnum.FORGOT.type);
		SendMail sendMailOld = sendMailService.save(sendMail).get();
		session.set("idEmailCode", sendMailOld.getId());
		session.set("emailConfirm", email);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_ACCOUNT_CONFIM_PASSWORD.type;
	}

	@GetMapping(value = "/confirm-password")
	public String confirmPasswordPage(@ModelAttribute("confirmPassword") ConfirmPassword confirmPassword) {
		String emailConfirm = session.get("emailConfirm");
		String idEmailCode = session.get("idEmailCode");
		if (emailConfirm == null || emailConfirm.equals("") || idEmailCode == null || idEmailCode.equals("")) {
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_ACCOUNT_FORGOT_PASSWORD.type;
		}
		return PageTypeEnum.SHOP_CONFIM_PASSWORD.type;
	}

	@PostMapping(value = "/confirm-password")
	public String confirmPassword(Model model,
			@Valid @ModelAttribute("confirmPassword") ConfirmPassword confirmPassword, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.SHOP_CONFIM_PASSWORD.type;
		}
		String code = session.get("code");
		String emailConfirm = session.get("emailConfirm");
		String idEmailCode = session.get("idEmailCode");
		if (!code.equals(confirmPassword.getCode())) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Verification code does not match.");
			return PageTypeEnum.SHOP_CONFIM_PASSWORD.type;
		}
		if (!confirmPassword.getPassword().equals(confirmPassword.getPasswordAgain())) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Confirm password and password do not match.");
			return PageTypeEnum.SHOP_CONFIM_PASSWORD.type;
		}
		SendMail sendMail = sendMailService.findById(idEmailCode).get();
		if (DateHelper.checkTime15P(new Date(), sendMail.getCreatedDate())) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Verification code timed out.");
			return PageTypeEnum.SHOP_CONFIM_PASSWORD.type;
		}
		User user = userService.findByEmail(emailConfirm).get();
		user.setPassword(confirmPassword.getPassword());
		userService.saveOrUpdate(user);
		session.remove("code");
		session.remove("emailConfirm");
		session.remove("idEmailCode");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_ACCOUNT_LOGOUT.type;
	}

	@GetMapping(value = "/change-information")
	public String changeInformationPage(Model model) {
		User user = session.get("shop");
		model.addAttribute("user", user);
		return PageTypeEnum.SHOP_CHANGE_INFORMATION.type;
	}

	@PostMapping(value = "/change-information")
	public String changeInformation(Model model, @Valid @ModelAttribute("user") User user, BindingResult result,
			@RequestParam(name = "file") MultipartFile file) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.SHOP_CHANGE_INFORMATION.type;
		}
		if (!file.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String uuidString = uuid.toString();
			user.setAvatar(storageService.getStorageFilename(file, uuidString));
			storageService.store(file, user.getAvatar());
		}
		List<Review> list = reviewService.findAllByEmailOrderByCreatedDateDesc(user.getEmail());
		if (list.isEmpty()) {
			reviewService.updateByEmail(user.getFullName(), user.getAvatar(), user.getEmail());
		}
		user.setPassword(userService.findByEmail(user.getEmail()).get().getPassword());
		userService.saveOrUpdate(user);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_ACCOUNT_LOGOUT.type;
	}

	@GetMapping(value = "/logout")
	public String logout() {
		session.remove("shop");
		session.remove("code");
		session.remove("emailConfirm");
		session.remove("idEmailCode");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_HOME.type;
	}
}
