package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.Like;
import com.example.repository.LikeRepository;
import com.example.service.LikeService;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	LikeRepository likeRepository;

	@Override
	public Optional<Like> saveOrUpdate(Like entity) {
		Like like = likeRepository.save(entity);
		return Optional.of(like);
	}

	@Override
	public List<Like> findAllByUserIdOrderByCreatedDateDesc(String id) {
		List<Like> list = likeRepository.findAllByUserIdOrderByCreatedDateDesc(id);
		return list;
	}

	@Override
	public void deleteById(String id) {
		likeRepository.deleteById(id);
	}

	@Override
	public Optional<Like> findByUserIdAndProductId(String userId, String productId) {
		Optional<Like> like = likeRepository.findByUserIdAndProductId(userId, productId);
		return like;
	}

	@Override
	public Page<Like> findAllByUserFullNameLike(String keyword, Pageable pageable) {
		return likeRepository.findAllByUserFullNameLike(keyword, pageable);
	}

	@Override
	public Optional<Like> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return likeRepository.findById(id);
	}
	
	@Override
	public List<Object[]> likeProductByYear(int year){
		return likeRepository.likeProductByYear(year);
	}

	@Override
	public List<Object[]> listLikeProduct(int year) {
		return likeRepository.listLikeProduct(year);
	}

	@Override
	public List<Object[]> listLikeUser(int year) {
		return likeRepository.listLikeUser(year);
	}
}
