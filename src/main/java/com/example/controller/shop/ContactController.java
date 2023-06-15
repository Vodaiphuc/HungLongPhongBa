package com.example.controller.shop;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.Contact;
import com.example.model.User;
import com.example.service.ContactService;
import com.example.service.SessionService;

@Controller
@RequestMapping(value = "shop/contact")
public class ContactController {

	@Autowired
	ContactService contactService;

	@Autowired
	SessionService session;

	@GetMapping(value = "")
	public String contactPage(Model model, Contact contact) {
		User user = session.get("shop");
		if (user != null) {
			contact.setFullName(user.getFullName());
			contact.setEmail(user.getEmail());
		}

		model.addAttribute("contact", contact);
		return "contact";
	}

	@PostMapping(value = "/submit")
	public String contact(Model model, @Valid @ModelAttribute("contact") Contact contact, BindingResult result) {
		if (result.hasErrors()) {
			return contactPage(model, contact);
		}
		contactService.saveOrUpdate(contact);
		return "redirect:/shop/home";
	}
}
