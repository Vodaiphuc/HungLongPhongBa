package com.example.controller.shop;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.helper.PageTypeEnum;
import com.example.model.Brand;
import com.example.model.CategoryProduct;
import com.example.model.Color;
import com.example.model.Product;
import com.example.service.BrandService;
import com.example.service.CategoryProductService;
import com.example.service.ColorService;
import com.example.service.ProductService;
import com.example.service.SessionService;

@Controller
@RequestMapping(value = "shop/shop-category")
public class ShopCategoryController {

	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryProductService categoryProductService;
	
	@Autowired
	BrandService brandService;
	
	@Autowired
	ColorService colorService;

	@Autowired
	SessionService session;
	
	@ModelAttribute(value = "related")
	public List<Product> related() {
		return productService.related();
	}

	@ModelAttribute("categories")
	public List<CategoryProduct> categories() {
		return categoryProductService.findAll();
	}
	
	@ModelAttribute("brands")
	public List<Brand> brands() {
		return brandService.findAll();
	}
	
	@ModelAttribute("colors")
	public List<Color> colors() {
		return colorService.findAll();
	}

	@GetMapping(value = "")
	public String shopCategoryPage(Model model, 
			@RequestParam(name = "field") Optional<String> field,
			@RequestParam(name = "page") Optional<Integer> page, 
			@RequestParam(name = "size") Optional<Integer> size,
			@RequestParam(name = "brand_id") Optional<String> brandId,
			@RequestParam(name = "categoryProduct_id") Optional<String> categoryProductId,
			@RequestParam(name = "color_id") Optional<String> colorId) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("id"));

		Pageable pageable = PageRequest.of(page.orElse(1) - 1, size.orElse(9), sort);
		Page<Product> resultPage;
		if (!brandId.isEmpty())
			resultPage = productService.findAllByBrandId(brandId.get(), pageable);
		else if (!categoryProductId.isEmpty())
			resultPage = productService.findAllByCategoryProductId(categoryProductId.get(), pageable);
		else if (!colorId.isEmpty())
			resultPage = productService.findAllByColorId(colorId.get(), pageable);
		else
			resultPage = productService.findAllByActiveTrueAndQuantityNot(0, pageable);

		int totalPages = resultPage.getTotalPages();
		int startPage = Math.max(1, page.orElse(1) - 2);
		int endPage = Math.min(page.orElse(1) + 2, totalPages);
		if (totalPages > 5) {
			if (endPage == totalPages)
				startPage = endPage - 5;
			else if (startPage == 1)
				endPage = startPage + 5;
		}
		List<Integer> pageNumbers = IntStream.rangeClosed(startPage, endPage).boxed().collect(Collectors.toList());

		model.addAttribute("pageNumbers", pageNumbers);
		model.addAttribute("field", field.orElse("id"));
		model.addAttribute("size", size.orElse(10));
		model.addAttribute("resultPage", resultPage);
		return PageTypeEnum.SHOP_CATEGORY.type;
	}
}
