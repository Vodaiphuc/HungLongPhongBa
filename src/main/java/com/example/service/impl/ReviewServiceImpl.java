package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.Review;
import com.example.repository.ReviewRepository;
import com.example.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewRepository reviewRepository;

	@Override
	public Optional<Review> saveOrUpdate(Review entity) {
		Review review = reviewRepository.save(entity);
		return Optional.of(review);
	}

	@Override
	public Optional<Review> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return reviewRepository.findById(id);
	}

	@Override
	public void updateByEmail(String fullName, String avatar, String email) {
		reviewRepository.updateByEmail(fullName, avatar, email);
	}

	@Override
	public List<Review> findAllByEmailOrderByCreatedDateDesc(String email) {
		return reviewRepository.findAllByEmailOrderByCreatedDateDesc(email);
	}

	@Override
	public List<Review> findAllByProductId(String id) {
		return reviewRepository.findAllByProductId(id);
	}

	@Override
	public Page<Review> findAllByProductId(String id, Pageable pageable) {
		return reviewRepository.findAllByProductId(id, pageable);
	}

	@Override
	public List<Object[]> numberReviewStar(String id) {
		return reviewRepository.numberReviewStar(id);
	}

	@Override
	public void deleteById(String id) {
		reviewRepository.deleteById(id);
	}

	@Override
	public Page<Review> findAllByFullNameLike(String keyword, Pageable pageable) {
		return reviewRepository.findAllByFullNameLike(keyword, pageable);
	}

	@Override
	public List<Object[]> reviewProductByYear(int year) {
		return reviewRepository.reviewProductByYear(year);
	}

	@Override
	public List<Object[]> listReviewProduct(int year) {
		return reviewRepository.listReviewProduct(year);
	}

	@Override
	public List<Object[]> listReviewUser(int year) {
		return reviewRepository.listReviewUser(year);
	}
}
