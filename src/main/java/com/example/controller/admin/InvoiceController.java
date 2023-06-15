package com.example.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.Order;
import com.example.service.OrderService;
import com.example.service.SessionService;

@Controller
@RequestMapping(value = "admin/invoice")
public class InvoiceController {

	@Autowired
	SessionService session;

	@Autowired
	OrderService orderService;

	@GetMapping(value = "")
	public String invoicePage(Model model, @RequestParam(name = "field") Optional<String> field,
			@RequestParam(name = "page") Optional<Integer> page, @RequestParam(name = "size") Optional<Integer> size,
			@RequestParam(name = "keywords", defaultValue = "") Optional<String> keywords) {
		String keyword = keywords.orElse(session.get("keywords"));
		session.set("keywords", keyword);

		Sort sort = Sort.by(Direction.DESC, field.orElse("id"));

		Pageable pageable = PageRequest.of(page.orElse(1) - 1, size.orElse(10), sort);
		Page<Order> resultPage = orderService.findAllByFullNameLike("%" + keyword + "%", pageable);

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
		return PageTypeEnum.ADMIN_INVOICE_LIST.type;
	}

	@GetMapping(value = "/view")
	public String viewInvoice(Model model, @RequestParam(name = "id") String id) {
		Optional<Order> order = orderService.findById(id);
		if (order.isEmpty())
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		model.addAttribute("order", order.get());
		return PageTypeEnum.ADMIN_INVOICE_VIEW.type;
	}

	@DeleteMapping(value = "/delete/{id}")
	public ResponseEntity<Void> deleteApi(@PathVariable(name = "id") String id) throws IOException {
		Optional<Order> order = orderService.findById(id);
		if (order.isEmpty()) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		orderService.deleteById(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@GetMapping(value = "/edit/{id}")
	public ResponseEntity<Order> editApi(@PathVariable(name = "id") String id) {
		Optional<Order> order = orderService.findById(id);
		if (order.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Order>(order.get(), HttpStatus.OK);
	}

	@PutMapping(value = "/update/{id}/{status}/{pay}")
	public ResponseEntity<Void> updateApi(@PathVariable(name = "id") String id,
			@PathVariable(name = "status") String status, @PathVariable(name = "pay") String pay) {
		Order order = orderService.findById(id).get();
		order.setStatus(status);
		order.setPay(pay);
		orderService.saveOrUpdate(order);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
