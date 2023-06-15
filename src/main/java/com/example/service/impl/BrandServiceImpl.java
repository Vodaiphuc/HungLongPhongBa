package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.Brand;
import com.example.repository.BrandRepository;
import com.example.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	BrandRepository brandRepository;

	@Override
	public Optional<Brand> saveOrUpdate(Brand entity) {
		Brand brand = brandRepository.save(entity);
		return Optional.of(brand);
	}

	@Override
	public Optional<Brand> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return brandRepository.findById(id);
	}

	@Override
	public void deleteById(String id) {
		brandRepository.deleteById(id);
	}

	@Override
	public Page<Brand> findAllByNameLike(String keyword, Pageable pageable) {
		return brandRepository.findAllByNameLike(keyword, pageable);
	}

	@Override
	public List<Brand> findAll() {
		return brandRepository.findAll();
	}
}
