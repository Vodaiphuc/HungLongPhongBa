package com.example.controller.shop;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.dto.Item;
import com.example.helper.CartStatusTypeEnum;
import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.StatusTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.Order;
import com.example.model.OrderDetail;
import com.example.model.Product;
import com.example.model.User;
import com.example.service.CartService;
import com.example.service.OrderDetailService;
import com.example.service.OrderService;
import com.example.service.ProductService;
import com.example.service.SessionService;
import com.example.service.UserService;

@Controller
@RequestMapping("shop/checkout")
public class CheckoutController {

	@Autowired
	ProductService productService;

	@Autowired
	CartService cartService;

	@Autowired
	UserService userService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderDetailService orderDetailService;

	@Autowired
	SessionService session;

	@GetMapping(value = "")
	public String checkoutPage(Model model, @ModelAttribute("order") Order order) {
		Collection<Item> items = cartService.getItems();
		User user = session.get("shop");
		if (user != null) {
			order.setFullName(user.getFullName());
			order.setEmail(user.getEmail());
			order.setBirthDay(user.getBirthDay());
			order.setAddressOrder(user.getAddressOrder());
		}
		model.addAttribute("order", order);
		model.addAttribute("cart", items);
		return PageTypeEnum.SHOP_CHECK_OUT.type;
	}

	@PostMapping(value = "/submit")
	public String checkout(Model model, @Valid @ModelAttribute("order") Order order, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("error", "Data format error.");
			return checkoutPage(model, order);
		}
		User user = session.get("shop");
		if (user == null)
			if (!userService.findByEmail(order.getEmail()).isEmpty()) {
				model.addAttribute(StatusTypeEnum.ERROR.type, "Email already in use.");
				return checkoutPage(model, order);
			}
		order.setStatus(CartStatusTypeEnum.WAITING.type);
		Order orderOld = orderService.saveOrUpdate(order).get();
		Collection<Item> items = cartService.getItems();
		items.forEach(item -> {
			Product product = productService.findById(item.getProduct_id()).get();
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setPrice(item.getPrice());
			orderDetail.setDiscount(item.getDiscount());
			orderDetail.setQuantity(item.getQuantity());
			orderDetail.setProduct(product);
			orderDetail.setOrder(orderOld);
			orderDetailService.saveOrUpdate(orderDetail);
			product.setQuantity(product.getQuantity() - item.getQuantity());
			productService.saveOrUpdate(product);
		});
		cartService.clear();
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_CONFIRMATION.type + "?id_cart=" + orderOld.getId();
	}
}
