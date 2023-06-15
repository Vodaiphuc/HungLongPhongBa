package com.example.controller.shop;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.PageTypeEnum;
import com.example.model.ImageProduct;
import com.example.model.Product;
import com.example.model.Review;
import com.example.service.ImageProductService;
import com.example.service.ProductService;
import com.example.service.ReviewService;
import com.example.service.SessionService;

@Controller
@RequestMapping(value = "shop/product-detail")
public class ProductDetailController {

	@Autowired
	ProductService productService;

	@Autowired
	ReviewService reviewService;

	@Autowired
	ImageProductService imgImageProductService;

	@Autowired
	SessionService session;

	@GetMapping(value = "")
	public String productDetailPage(Model model, @RequestParam(name = "id") String id, @ModelAttribute("review") Review review) {
		Product product = productService.findById(id).get();
		product.setViews(product.getViews() + 1);
		productService.saveOrUpdate(product);
		
		List<ImageProduct> list = imgImageProductService.findAllByProductId(id);
		
		Sort sort = Sort.by(Direction.DESC, "createdDate");
		Pageable pageable = PageRequest.of(0, 3, sort);
		Page<Review> resultPageReview = reviewService.findAllByProductId(id, pageable);
		
		int totailReview = 0;
		float totailStar = 0;
		List<Review> listNumber = reviewService.findAllByProductId(id);
		if (listNumber.size() > 0) {
			int totailStarOld = 0;
			for (Review review2 : listNumber) {
				totailReview ++;
				totailStarOld += review2.getStar();
			}
			totailStar = totailStarOld / totailReview;
		}
		
		List<Object[]> listNumberReviewStar = reviewService.numberReviewStar(id);

		model.addAttribute("listNumberReviewStar", listNumberReviewStar);
		model.addAttribute("totailReview", totailReview);
		model.addAttribute("totailStar", totailStar);
		model.addAttribute("resultPageReview", resultPageReview);
		model.addAttribute("product", product);
		model.addAttribute("listImage", list);
		model.addAttribute("review", review);
		return PageTypeEnum.SHOP_PRODUCT_DETAIL.type;
	}

	@PostMapping(value = "/review")
	public String review(Model model, @Valid @ModelAttribute("review") Review review, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("error", "Data format error.");
			return productDetailPage(model, review.getProduct().getId(), review);
		}
		reviewService.saveOrUpdate(review);
		return productDetailPage(model, review.getProduct().getId(), new Review());
	}
}
