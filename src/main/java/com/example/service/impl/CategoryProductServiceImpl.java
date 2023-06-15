package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.CategoryProduct;
import com.example.repository.CategoryProductRepository;
import com.example.service.CategoryProductService;

@Service
public class CategoryProductServiceImpl implements CategoryProductService {

	@Autowired
	CategoryProductRepository categoryProductRepository;

	@Override
	public Optional<CategoryProduct> saveOrUpdate(CategoryProduct entity) {
		CategoryProduct categoryProduct = categoryProductRepository.save(entity);
		return Optional.of(categoryProduct);
	}

	@Override
	public Optional<CategoryProduct> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return categoryProductRepository.findById(id);
	}

	@Override
	public void deleteById(String id) {
		categoryProductRepository.deleteById(id);
	}

	@Override
	public Page<CategoryProduct> findAllByNameLike(String keyword, Pageable pageable) {
		return categoryProductRepository.findAllByNameLike(keyword, pageable);
	}

	@Override
	public List<CategoryProduct> findAll() {
		return categoryProductRepository.findAll();
	}
}
