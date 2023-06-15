package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.Review;

public interface ReviewService {

	Optional<Review> saveOrUpdate(Review entity);

	Optional<Review> findById(String id);
	
	void updateByEmail(String fullName, String avatar,String email);
	
	List<Review> findAllByEmailOrderByCreatedDateDesc(String email);
	
	List<Review> findAllByProductId(String id);
	
	Page<Review> findAllByProductId(String id, Pageable pageable);
	
	List<Object[]> numberReviewStar(String id);
	
	void deleteById(String id);
	
	Page<Review> findAllByFullNameLike(String keyword, Pageable pageable);
	
	List<Object[]> reviewProductByYear(int year);
	
	List<Object[]> listReviewProduct(int year);
	
	List<Object[]> listReviewUser(int year);

}
