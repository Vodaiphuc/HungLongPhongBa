package com.example.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.CategoryProduct;

@Repository
public interface CategoryProductRepository extends JpaRepository<CategoryProduct, String>{
	Page<CategoryProduct> findAllByNameLike(String keyword, Pageable pageable);
}
