package com.example.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.CategoryBlog;

public interface CategoryBlogService {

	Optional<CategoryBlog> saveOrUpdate(CategoryBlog entity);

	Optional<CategoryBlog> findById(String id);

	void deleteById(String id);

	Page<CategoryBlog> findAllByNameLike(String keyword, Pageable pageable);

}
