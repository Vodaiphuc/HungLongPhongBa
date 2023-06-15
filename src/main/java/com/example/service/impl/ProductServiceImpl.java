package com.example.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.Product;
import com.example.repository.ProductRepository;
import com.example.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository productRepository;

	@Override
	public Optional<Product> saveOrUpdate(Product entity) {
		Product product = productRepository.save(entity);
		return Optional.of(product);
	}

	@Override
	public Optional<Product> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return productRepository.findById(id);
	}

	@Override
	public void deleteById(String id) {
		productRepository.deleteById(id);
	}

	@Override
	public Page<Product> findAllByNameLike(String keyword, Pageable pageable) {
		return productRepository.findAllByNameLike(keyword, pageable);
	}

	@Override
	public Page<Product> findAllByBrandId(String id, Pageable pageable) {
		return productRepository.findAllByBrandId(id, pageable);
	}

	@Override
	public Page<Product> findAllByCategoryProductId(String id, Pageable pageable) {
		return productRepository.findAllByCategoryProductId(id, pageable);
	}

	@Override
	public Page<Product> findAllByColorId(String id, Pageable pageable) {
		return productRepository.findAllByColorId(id, pageable);
	}

	@Override
	public Page<Product> findAllByActiveTrueAndQuantityNot(int quantity, Pageable pageable) {
		return productRepository.findAllByActiveTrueAndQuantityNot(0, pageable);
	}

	@Override
	public Page<Product> findByReviewStar(int star, Pageable pageable) {
		return productRepository.findByReviewStar(star, pageable);
	}

	@Override
	public List<Product> related() {
		Pageable pageable = PageRequest.of(0, 10);
		return productRepository
				.findAllByActiveTrueAndQuantityNotAndDiscountNotAndStartDayDiscountLessThanEqualAndEndDayDiscountGreaterThanEqualOrderByEndDayDiscountAsc(
						0, 0, new Date(), new Date(), pageable);
	}

}
