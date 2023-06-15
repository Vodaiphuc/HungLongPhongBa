package com.example.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.helper.PageTypeEnum;
import com.example.model.Product;
import com.example.service.ProductService;

@Controller
@RequestMapping(value = "shop/home")
public class HomeController {

	@Autowired
	ProductService productService;

	@ModelAttribute(value = "related")
	public List<Product> related() {
		return productService.related();
	}

	@GetMapping(value = "")
	public String homePage() {
		return PageTypeEnum.SHOP_INDEX.type;
	}
}
