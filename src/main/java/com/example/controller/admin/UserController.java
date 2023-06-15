package com.example.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.exception.StorageFileNotFoundException;
import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.StatusTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.Review;
import com.example.model.User;
import com.example.service.ReviewService;
import com.example.service.SessionService;
import com.example.service.StorageService;
import com.example.service.UserService;

@Controller
@RequestMapping(value = "admin/user")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	StorageService storageService;

	@Autowired
	ReviewService reviewService;

	@Autowired
	SessionService session;

	private boolean isEdit = false;

	@GetMapping(value = "")
	public String userPage(Model model, @RequestParam(name = "field") Optional<String> field,
			@RequestParam(name = "page") Optional<Integer> page, @RequestParam(name = "size") Optional<Integer> size,
			@RequestParam(name = "keywords", defaultValue = "") Optional<String> keywords) {
		String keyword = keywords.orElse(session.get("keywords"));
		session.set("keywords", keyword);

		Sort sort = Sort.by(Direction.DESC, field.orElse("id"));

		Pageable pageable = PageRequest.of(page.orElse(1) - 1, size.orElse(10), sort);
		Page<User> resultPage = userService.findAllByFullNameLike("%" + keyword + "%", pageable);

		int totalPages = resultPage.getTotalPages();
		int startPage = Math.max(1, page.orElse(1) - 2);
		int endPage = Math.min(page.orElse(1) + 2, totalPages);
		if (totalPages > 5) {
			if (endPage == totalPages)
				startPage = endPage - 5;
			else if (startPage == 1)
				endPage = startPage + 5;
		}
		List<Integer> pageNumbers = IntStream.rangeClosed(startPage, endPage).boxed().collect(Collectors.toList());

		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("field", field.orElse("id"));
		model.addAttribute("size", size.orElse(10));
		model.addAttribute("keywords", keyword);
		model.addAttribute("resultPage", resultPage);
		return PageTypeEnum.ADMIN_USER_LIST.type;
	}

	@DeleteMapping(value = "/delete/{id}")
	public ResponseEntity<Void> deleteApi(@PathVariable(name = "id") String id) throws IOException {
		Optional<User> user = userService.findById(id);
		if (user.isEmpty()) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (user.get().isRole()) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		}
		if (!user.get().getAvatar().equals("noImageAvata.png"))
			storageService.delete(user.get().getAvatar());
		userService.deleteById(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@GetMapping(value = "/new")
	public String newUser(Model model, @ModelAttribute("user") User user) {
		isEdit = false;
		model.addAttribute("isEdit", isEdit);
		return PageTypeEnum.ADMIN_USER_FORM.type;
	}

	@PostMapping(value = "/saveOrUpdate")
	public String saveOrUpdate(Model model, @Valid @ModelAttribute("user") User user, BindingResult result,
			@RequestParam(name = "file") MultipartFile file) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.ADMIN_USER_FORM.type;
		}
		if (!isEdit) {
			if (userService.findByEmail(user.getEmail()).isPresent()) {
				model.addAttribute(StatusTypeEnum.ERROR.type, "Email already exists.");
				return PageTypeEnum.ADMIN_USER_FORM.type;
			}
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
		userService.saveOrUpdate(user);
		model.addAttribute(StatusTypeEnum.MESSAGE.type, "Create or update user to public !");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_USER.type;
	}

	@GetMapping(value = "/view")
	public String viewUser(Model model, @RequestParam(name = "id") String id) {
		Optional<User> user = userService.findById(id);
		if (user.isEmpty())
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		model.addAttribute("user", user.get());
		return PageTypeEnum.ADMIN_USER_VIEW.type;
	}

	@GetMapping(value = "/edit")
	public String editUser(Model model, @RequestParam(name = "id") String id) {
		isEdit = true;
		Optional<User> user = userService.findById(id);
		if (user.isEmpty())
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		model.addAttribute("isEdit", isEdit);
		model.addAttribute("user", user.get());
		return PageTypeEnum.ADMIN_USER_FORM.type;
	}

	@GetMapping(value = "/images/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
		Resource file = storageService.loadAsResource(filename);
		return ResponseEntity.ok().header("Content-Disposition", "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}

	@ExceptionHandler(StorageFileNotFoundException.class)
	public ResponseEntity<?> handleStorageFileNotFound(StorageFileNotFoundException exc) {
		return ResponseEntity.notFound().build();
	}

}
