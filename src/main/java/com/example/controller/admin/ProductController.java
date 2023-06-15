package com.example.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.helper.PageTypeEnum;
import com.example.helper.RequestTypeEnum;
import com.example.helper.StatusTypeEnum;
import com.example.helper.TransferTypeEnum;
import com.example.model.Brand;
import com.example.model.CategoryProduct;
import com.example.model.Color;
import com.example.model.ImageProduct;
import com.example.model.Product;
import com.example.service.BrandService;
import com.example.service.CategoryProductService;
import com.example.service.ColorService;
import com.example.service.ImageProductService;
import com.example.service.ProductService;
import com.example.service.SessionService;
import com.example.service.StorageService;

@Controller
@RequestMapping(value = "admin/product")
public class ProductController {

	@Autowired
	BrandService brandService;

	@Autowired
	CategoryProductService categoryProductService;

	@Autowired
	ColorService colorService;

	@Autowired
	StorageService storageService;

	@Autowired
	ProductService productService;

	@Autowired
	ImageProductService imageProductService;

	@Autowired
	SessionService session;

	private boolean isEdit = false;

	@ModelAttribute("brands")
	public Map<Brand, String> brands() {
		Map<Brand, String> map = new HashMap<>();
		List<Brand> list = brandService.findAll();
		for (Brand brand : list) {
			map.put(brand, brand.getName());
		}
		return map;
	}

	@ModelAttribute("categoryProducts")
	public Map<CategoryProduct, String> categoryProducts() {
		Map<CategoryProduct, String> map = new HashMap<>();
		List<CategoryProduct> list = categoryProductService.findAll();
		for (CategoryProduct categoryProduct : list) {
			map.put(categoryProduct, categoryProduct.getName());
		}
		return map;
	}

	@ModelAttribute("colors")
	public Map<Color, String> colors() {
		Map<Color, String> map = new HashMap<>();
		List<Color> list = colorService.findAll();
		for (Color color : list) {
			map.put(color, color.getName());
		}
		return map;
	}

	@GetMapping(value = "")
	public String productPage(Model model, @RequestParam(name = "field") Optional<String> field,
			@RequestParam(name = "page") Optional<Integer> page, @RequestParam(name = "size") Optional<Integer> size,
			@RequestParam(name = "keywords", defaultValue = "") Optional<String> keywords,
			@RequestParam(name = "brand_id") Optional<String> brandId,
			@RequestParam(name = "categoryProduct_id") Optional<String> categoryProductId,
			@RequestParam(name = "color_id") Optional<String> colorId,
			@RequestParam(name = "star") Optional<Integer> star) {
		String keyword = keywords.orElse(session.get("keywords"));
		session.set("keywords", keyword);

		Sort sort = Sort.by(Direction.DESC, field.orElse("id"));

		Pageable pageable = PageRequest.of(page.orElse(1) - 1, size.orElse(10), sort);
		Page<Product> resultPage;
		if (!brandId.isEmpty())
			resultPage = productService.findAllByBrandId(brandId.get(), pageable);
		else if (!categoryProductId.isEmpty())
			resultPage = productService.findAllByCategoryProductId(categoryProductId.get(), pageable);
		else if (!colorId.isEmpty())
			resultPage = productService.findAllByColorId(colorId.get(), pageable);
		else if (!star.isEmpty())
			resultPage = productService.findByReviewStar(star.get(), pageable);
		else
			resultPage = productService.findAllByNameLike("%" + keyword + "%", pageable);

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
		model.addAttribute("keywords", keyword);
		model.addAttribute("resultPage", resultPage);
		return PageTypeEnum.ADMIN_PRODUCT_LIST.type;
	}

	@GetMapping(value = "/new")
	public String newProduct(Model model, @ModelAttribute("product") Product product) {
		isEdit = false;
		model.addAttribute("isEdit", isEdit);
		model.addAttribute("listImage", null);
		return PageTypeEnum.ADMIN_PRODUCT_FORM.type;
	}

	@PostMapping(value = "/saveOrUpdate")
	public String saveOrUpdate(Model model,
			@Valid @ModelAttribute("product") Product product, 
			BindingResult result,
			@RequestParam(name = "file") MultipartFile[] file) {
		if (result.hasErrors()) {
			model.addAttribute(StatusTypeEnum.ERROR.type, "Data format error.");
			return PageTypeEnum.ADMIN_PRODUCT_FORM.type;
		}
		if (file.length > 0) {
			UUID uuid = UUID.randomUUID();
			String uuidString = uuid.toString();
			product.setBanner(storageService.getStorageFilename(file[0], uuidString));
			storageService.store(file[0], product.getBanner());
		}
		Optional<Product> productOld = productService.saveOrUpdate(product);
		if (productOld.isEmpty()) {
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		}
		if (file.length > 0) {
			for (MultipartFile multipartFile : file) {
				UUID uuid = UUID.randomUUID();
				String uuidString = uuid.toString();
				ImageProduct imageProduct = new ImageProduct();
				imageProduct.setName(storageService.getStorageFilename(multipartFile, uuidString));
				storageService.store(multipartFile, imageProduct.getName());
				imageProduct.setProduct(productOld.get());
				imageProductService.saveOrUpdate(imageProduct);
			}
		}
		model.addAttribute(StatusTypeEnum.MESSAGE.type, "Create or update user to public !");
		return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_PRODUCT.type;
	}

	@GetMapping(value = "/edit")
	public String editProduct(Model model, @RequestParam(name = "id") String id) {
		isEdit = true;
		Optional<Product> product = productService.findById(id);
		if (product.isEmpty()) {
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		}
		List<ImageProduct> list = imageProductService.findAllByProductId(id);
		model.addAttribute("isEdit", isEdit);
		model.addAttribute("product", product.get());
		model.addAttribute("listImage", list);
		return PageTypeEnum.ADMIN_PRODUCT_FORM.type;
	}

	@GetMapping(value = "/delete-image-product")
	public String deleteImageProduct(Model model, 
			@RequestParam(name = "product_id") Optional<String> productId,
			@RequestParam(name = "image_id") Optional<String> imageId,
			@RequestParam(name = "image_name") Optional<String> imageName) throws IOException {
		if (productId.isEmpty() || imageId.isEmpty() || imageName.isEmpty()) {
			return TransferTypeEnum.REDIRECT.type + RequestTypeEnum.ADMIN_ERROR_500.type;
		}
		imageProductService.deleteByIdAndProductId(imageId.get(), productId.get());
		storageService.delete(imageName.get());
		return editProduct(model, productId.get());
	}

	@GetMapping(value = "/view/{id}")
	public ResponseEntity<Product> viewApi(@PathVariable(name = "id") String id) {
		Optional<Product> product = productService.findById(id);
		if (product.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Product>(product.get(), HttpStatus.OK);
	}
	
	@GetMapping(value = "/view-image/{id}")
	public ResponseEntity<List<ImageProduct>> viewImageApi(@PathVariable(name = "id") String id) {
		List<ImageProduct> list = imageProductService.findAllByProductId(id);
		return new ResponseEntity<List<ImageProduct>>(list, HttpStatus.OK);
	}

	@DeleteMapping(value = "/delete/{id}")
	public ResponseEntity<Void> deleteApi(@PathVariable(name = "id") String id) throws IOException {
		List<ImageProduct> list = imageProductService.findAllByProductId(id);
		for (ImageProduct imageProduct : list) {
			storageService.delete(imageProduct.getName());
		}
		Optional<Product> product = productService.findById(id);
		if (product.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!product.get().getBanner().equals("noImage.png"))
			storageService.delete(product.get().getBanner());
		productService.deleteById(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
