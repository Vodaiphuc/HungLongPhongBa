package com.example.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.Review;
import com.example.model.User;
import com.example.service.ReviewService;
import com.example.service.SessionService;

@Controller
@RequestMapping(value = "shop/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	SessionService session;
	
	@GetMapping(value = "")
	public String reviewPage(Model model) {
		User user = session.get("shop");
		List<Review> list = reviewService.findAllByEmailOrderByCreatedDateDesc(user.getEmail());
		model.addAttribute("list", list);
		return PageTypeEnum.SHOP_REVIEW.type;
	}
	
	@GetMapping(value = "/delete")
	public String delete(Model model, @RequestParam(name = "id") String id) {
		reviewService.deleteById(id);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_REVIEW.type;
	}
	
}
