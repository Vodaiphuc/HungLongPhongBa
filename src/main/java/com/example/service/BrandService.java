package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.Brand;

public interface BrandService {

	Optional<Brand> saveOrUpdate(Brand entity);

	Optional<Brand> findById(String id);

	void deleteById(String id);

	Page<Brand> findAllByNameLike(String keyword, Pageable pageable);
	
	List<Brand> findAll();

}
