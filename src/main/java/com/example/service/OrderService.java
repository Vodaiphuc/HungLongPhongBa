package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.Order;

public interface OrderService {

	Optional<Order> saveOrUpdate(Order entity);
	
	Optional<Order> findById(String id);
	
	Page<Order> findAllByFullNameLike(String keywords, Pageable pageable);
	
	void deleteById(String id);
	
	List<Object[]> orderUserByYear(int year);
	
	Integer countOrder(int month, int year);
	
	List<Order> findAllByEmail(String email);
}
