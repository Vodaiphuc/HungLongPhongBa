package com.example.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.CategoryBlog;
import com.example.repository.CategoryBlogRepository;
import com.example.service.CategoryBlogService;

@Service
public class CategoryBlogServiceImpl implements CategoryBlogService {

	@Autowired
	CategoryBlogRepository categoryBlogRepository;

	@Override
	public Optional<CategoryBlog> saveOrUpdate(CategoryBlog entity) {
		CategoryBlog categoryBlog = categoryBlogRepository.save(entity);
		return Optional.of(categoryBlog);
	}

	@Override
	public Optional<CategoryBlog> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return categoryBlogRepository.findById(id);
	}

	@Override
	public void deleteById(String id) {
		categoryBlogRepository.deleteById(id);
	}

	@Override
	public Page<CategoryBlog> findAllByNameLike(String keyword, Pageable pageable) {
		return categoryBlogRepository.findAllByNameLike(keyword, pageable);
	}
}
