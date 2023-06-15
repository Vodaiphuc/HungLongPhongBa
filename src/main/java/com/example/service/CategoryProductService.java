package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.CategoryProduct;

public interface CategoryProductService {

	Optional<CategoryProduct> saveOrUpdate(CategoryProduct entity);

	Optional<CategoryProduct> findById(String id);

	void deleteById(String id);

	Page<CategoryProduct> findAllByNameLike(String keyword, Pageable pageable);
	
	List<CategoryProduct> findAll();

}
