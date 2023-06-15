package com.example.controller.admin;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.StatusTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.Brand;
import com.example.service.BrandService;
import com.example.service.SessionService;

@Controller
@RequestMapping(value = "admin/brand")
public class BrandController {

	@Autowired
	BrandService brandService;

	@Autowired
	SessionService session;

	@GetMapping(value = "")
	public String brandPage(Model model, @ModelAttribute("brand") Brand brand,
			@RequestParam(name = "field") Optional<String> field, @RequestParam(name = "page") Optional<Integer> page,
			@RequestParam(name = "size") Optional<Integer> size,
			@RequestParam(name = "keywords") Optional<String> keywords) {
		String keyword = keywords.orElse(session.get("keywords"));
		session.set("keywords", keyword);

		Sort sort = Sort.by(Direction.DESC, field.orElse("id"));

		Pageable pageable = PageRequest.of(page.orElse(1) - 1, size.orElse(10), sort);
		Page<Brand> resultPage = brandService.findAllByNameLike("%" + keyword + "%", pageable);

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
		return PageTypeEnum.ADMIN_BRAND.type;
	}

	@GetMapping(value = "/view/{id}")
	public ResponseEntity<Brand> viewApi(@PathVariable(name = "id") String id) {
		Optional<Brand> brand = brandService.findById(id);
		if (brand.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Brand>(brand.get(), HttpStatus.OK);
	}

	@DeleteMapping(value = "/delete/{id}")
	public ResponseEntity<Void> deleteApi(@PathVariable(name = "id") String id) {
		Optional<Brand> brand = brandService.findById(id);
		if (brand.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		brandService.deleteById(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@PostMapping(value = "/saveOrUpdate")
	public String saveOrUpdate(Model model, @Valid @ModelAttribute("brand") Brand brand, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return brandPage(model, brand, Optional.of("id"), Optional.of(1), Optional.of(10), Optional.of(""));
		}
		brandService.saveOrUpdate(brand);
		model.addAttribute(StatusTypeEnum.MESSAGE.type, "Create or update brand to public !");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_BRAND.type;
	}
}
