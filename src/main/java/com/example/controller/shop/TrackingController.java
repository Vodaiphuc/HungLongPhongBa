package com.example.controller.shop;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.StatusTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.Order;
import com.example.service.OrderService;

@Controller
@RequestMapping(value = "shop/tracking")
public class TrackingController {
	
	@Autowired
	OrderService orderService;

	@GetMapping(value = "")
	public String trackingPage() {
		return PageTypeEnum.SHOP_TRACKING.type;
	}
	
	@GetMapping(value = "/submit")
	public String confirmation(Model model, @RequestParam(name = "id_cart") String idCart) {
		if (idCart.equals("")) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Invoice code cannot be left blank.");
			return PageTypeEnum.SHOP_TRACKING.type;
		}
		Optional<Order> order = orderService.findById(idCart);
		if (order.isEmpty()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Invoice code does not exist.");
			return PageTypeEnum.SHOP_TRACKING.type;
		}
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_CONFIRMATION.type + "?id_cart=" + idCart;
	}
}
