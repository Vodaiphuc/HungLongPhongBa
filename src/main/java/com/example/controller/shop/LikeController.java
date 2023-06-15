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
import com.example.model.Like;
import com.example.model.Product;
import com.example.model.User;
import com.example.service.LikeService;
import com.example.service.ProductService;
import com.example.service.SessionService;
import com.example.service.UserService;

@Controller
@RequestMapping(value = "shop/like")
public class LikeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	LikeService likeService;
	
	@Autowired
	SessionService session;
	
	@GetMapping(value = "")
	public String likePage(Model model) {
		User user = session.get("shop");
		List<Like> list = likeService.findAllByUserIdOrderByCreatedDateDesc(user.getId());
		model.addAttribute("list", list);
		return PageTypeEnum.SHOP_LIKE.type;
	}
	
	@GetMapping(value = "/add")
	public String like(Model model, @RequestParam(name = "id") String id) {
		User user = session.get("shop");
		Product product = productService.findById(id).get();
		if (!likeService.findByUserIdAndProductId(user.getId(), product.getId()).isEmpty()) {
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_LIKE.type;
		}
		Like like = new Like();
		like.setUser(user);
		like.setProduct(product);
		likeService.saveOrUpdate(like);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_PRODUCT_DETAIL.type + "?id=" + id;
	}
	
	@GetMapping(value = "/delete")
	public String delete(Model model, @RequestParam(name = "id") String id) {
		likeService.deleteById(id);
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.SHOP_LIKE.type;
	}
	
}
