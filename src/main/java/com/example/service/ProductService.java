package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.Product;

public interface ProductService {

	Optional<Product> saveOrUpdate(Product entity);

	Optional<Product> findById(String id);

	void deleteById(String id);

	Page<Product> findAllByNameLike(String keyword, Pageable pageable);

	Page<Product> findAllByBrandId(String id, Pageable pageable);

	Page<Product> findAllByCategoryProductId(String id, Pageable pageable);

	Page<Product> findAllByColorId(String id, Pageable pageable);
	
	Page<Product> findAllByActiveTrueAndQuantityNot(int quantity, Pageable pageable);
	
	Page<Product> findByReviewStar(int star, Pageable pageable);
	
	List<Product> related();
}
