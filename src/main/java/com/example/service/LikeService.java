package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.Like;

public interface LikeService {

	Optional<Like> saveOrUpdate(Like entity);

	List<Like> findAllByUserIdOrderByCreatedDateDesc(String id);
	
	void deleteById(String id);
	
	Optional<Like> findByUserIdAndProductId(String userId, String productId);
	
	Page<Like> findAllByUserFullNameLike(String keyword, Pageable pageable);
	
	Optional<Like> findById(String id);
	
	List<Object[]> likeProductByYear(int year);
	
	List<Object[]> listLikeProduct(int year);
	
	List<Object[]> listLikeUser(int year);

}
