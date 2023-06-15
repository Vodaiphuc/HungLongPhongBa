package com.example.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.PageTypeEnum;
import com.example.model.Contact;
import com.example.service.ContactService;
import com.example.service.SessionService;

@Controller
@RequestMapping(value = "admin/contact")
public class ContactsController {

	@Autowired
	ContactService contactService;

	@Autowired
	SessionService session;

	@GetMapping(value = "")
	public String contactPage(Model model,
			@RequestParam(name = "keywords", defaultValue = "") Optional<String> keywords) {
		String keyword = keywords.orElse(session.get("keywords"));
		session.set("keywords", keyword);
		Sort sort = Sort.by(Direction.DESC, "createdDate");
		List<Contact> list = contactService.findAllByFullNameLike("%" + keyword + "%", sort);
		model.addAttribute("keywords", keyword);
		model.addAttribute("list", list);
		return PageTypeEnum.ADMIN_CONTACT_LIST.type;
	}
	
	@GetMapping(value = "/view")
	public String viewContact(Model model, @RequestParam(name = "id") String id) {
		Contact contact = contactService.findById(id).get();
		contact.setConfirm(true);
		contactService.saveOrUpdate(contact);
		model.addAttribute("contact", contact);
		return PageTypeEnum.ADMIN_CONTACT_CONTENT.type;
	}
}
