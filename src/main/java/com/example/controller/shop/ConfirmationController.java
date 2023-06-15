package com.example.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.PageTypeEnum;
import com.example.model.Order;
import com.example.model.OrderDetail;
import com.example.service.OrderDetailService;
import com.example.service.OrderService;

@Controller
@RequestMapping("shop/confirmation")
public class ConfirmationController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderDetailService orderDetailService;
	
	@GetMapping(value = "")
	public String confirmationPage(Model model, @RequestParam(name = "id_cart") String idCart) {
		Order order = orderService.findById(idCart).get();
		List<OrderDetail> list = orderDetailService.findAllByOrderId(idCart);
		model.addAttribute("order", order);
		model.addAttribute("list", list);
		return PageTypeEnum.SHOP_CONFIRMATION.type;
	}
}
