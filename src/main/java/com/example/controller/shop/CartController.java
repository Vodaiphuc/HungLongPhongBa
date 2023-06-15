package com.example.controller.shop;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.Item;
import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.Product;
import com.example.service.CartService;
import com.example.service.ProductService;
import com.example.service.SessionService;

@Controller
@RequestMapping("shop/cart")
public class CartController {

	@Autowired
	ProductService productService;

	@Autowired
	CartService cartService;

	@Autowired
	SessionService session;

	@GetMapping(value = "")
	public String cartPage(Model model) {
		Collection<Item> items = cartService.getItems();
		model.addAttribute("cart", items);
		return PageTypeEnum.SHOP_CART.type;
	}

	@GetMapping(value = "/add")
	public String add(Model model, @RequestParam(name = "id") String id) {
		cartService.add(id);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_CART.type;
	}

	@GetMapping(value = "/remove")
	public String remove(Model model, @RequestParam(name = "id") String id) {
		cartService.remove(id);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_CART.type;
	}

	@PostMapping(value = "/update")
	public ResponseEntity<Collection<Item>> update(Model model, @RequestParam("id") String id,
			@RequestParam("sst") Integer quantity) {
		cartService.update(id, quantity);
		Collection<Item> items = cartService.getItems();
		return new ResponseEntity<Collection<Item>>(items, HttpStatus.OK);
	}
	
	@GetMapping(value = "/find-qty")
	public ResponseEntity<Integer> maxQty(Model model, @RequestParam(name = "id") String id) {
		Product product = productService.findById(id).get();
		return new ResponseEntity<Integer>(product.getQuantity(), HttpStatus.OK);
	}
}
