package com.example.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.DateHelper;
import com.example.helper.PageTypeEnum;
import com.example.service.LikeService;
import com.example.service.OrderDetailService;
import com.example.service.OrderService;
import com.example.service.ProductService;
import com.example.service.ReviewService;
import com.example.service.UserService;

@Controller
@RequestMapping(value = "admin/statistical")
public class StatisticalController {

	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	LikeService likeService;
	
	@Autowired
	OrderDetailService orderDetailService;
	
	private int yearNow = DateHelper.getYear();

	@GetMapping(value = "/product")
	public String productPage(Model model, @RequestParam(name = "year") Optional<Integer> year) {
		List<Object[]> listLikeProduct = likeService.listLikeProduct(year.orElse(yearNow));
		List<Object[]> listReviewProduct = reviewService.listReviewProduct(year.orElse(yearNow));
		
		model.addAttribute("year", year.orElse(yearNow));
		model.addAttribute("listLikeProduct", listLikeProduct);
		model.addAttribute("listReviewProduct", listReviewProduct);
		return PageTypeEnum.ADMIN_STATISTICAL_PRODUCT.type;
	}

	@GetMapping(value = "/user")
	public String userPage(Model model, @RequestParam(name = "year") Optional<Integer> year) {
		List<Object[]> listLikeUser = likeService.listLikeUser(year.orElse(yearNow));
		List<Object[]> listReviewUser = reviewService.listReviewUser(year.orElse(yearNow));
		
		model.addAttribute("yearUser", year.orElse(yearNow));
		model.addAttribute("listLikeUser", listLikeUser);
		model.addAttribute("listReviewUser", listReviewUser);
		return PageTypeEnum.ADMIN_STATISTICAL_USER.type;
	}

	@GetMapping(value = "/revenue")
	public String revenuePage(Model model, @RequestParam(name = "year") Optional<Integer> year) {
		List<Object[]> totailOrderDetailByYear = orderDetailService.totailOrderDetailByYear(year.orElse(yearNow));
		
		float totailYearNow = orderDetailService.totailOrderDetail(year.orElse(yearNow));
		float totailLastYear = orderDetailService.totailOrderDetail(year.orElse(yearNow) - 1);
		
		model.addAttribute("totailYearNow", totailYearNow);
		model.addAttribute("totailLastYear", totailLastYear);
		model.addAttribute("yearRevenue", year.orElse(yearNow));
		model.addAttribute("totailOrderDetailByYear", totailOrderDetailByYear);
		return PageTypeEnum.ADMIN_STATISTICAL_REVENUE.type;
	}

	@GetMapping(value = "/reviewProductByYear/{year}")
	public ResponseEntity<List<Object[]>> reviewProductByYearApi(@PathVariable(name = "year") Optional<Integer> year) {
		List<Object[]> list = reviewService.reviewProductByYear(year.orElse(yearNow));
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/likeProductByYear/{year}")
	public ResponseEntity<List<Object[]>> likeProductByYearApi(@PathVariable(name = "year") Optional<Integer> year) {
		List<Object[]> list = likeService.likeProductByYear(year.orElse(yearNow));
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/visitUserByYear/{year}")
	public ResponseEntity<List<Object[]>> visitUserByYearApi(@PathVariable(name = "year") Optional<Integer> year) {
		List<Object[]> list = userService.visitUserByYear(year.orElse(yearNow));
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/orderUserByYear/{year}")
	public ResponseEntity<List<Object[]>> orderUserByYearApi(@PathVariable(name = "year") Optional<Integer> year) {
		List<Object[]> list = orderService.orderUserByYear(year.orElse(yearNow));
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/orderDetailCategoryProductByYear/{year}")
	public ResponseEntity<List<Object[]>> orderDetailCategoryProductByYearApi(@PathVariable(name = "year") Optional<Integer> year) {
		List<Object[]> list = orderDetailService.orderDetailCategoryProductByYear(year.orElse(yearNow));
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value = "/totailOrderDetailByYear/{year}")
	public ResponseEntity<List<Object[]>> totailOrderDetailByYear(@PathVariable(name = "year") Optional<Integer> year) {
		List<Object[]> list = orderDetailService.totailOrderDetailByYear(year.orElse(yearNow));
		return new ResponseEntity<List<Object[]>>(list, HttpStatus.OK);
	}
}
