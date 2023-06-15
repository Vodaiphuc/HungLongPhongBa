package com.example.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.helper.PageTypeEnum;
import com.example.model.Order;
import com.example.model.User;
import com.example.service.OrderService;
import com.example.service.SessionService;

@Controller
@RequestMapping(value = "shop/order-history")
public class OrderHistoryController {
	
	@Autowired
	SessionService session;
	
	@Autowired
	OrderService orderService;
	
	@GetMapping(value = "")
	public String orderHistoryPage(Model model) {
		User user = session.get("shop");
		List<Order> list = orderService.findAllByEmail(user.getEmail());
		model.addAttribute("list", list);
		return PageTypeEnum.SHOP_ORDER_HISTORY.type;
	}
}
