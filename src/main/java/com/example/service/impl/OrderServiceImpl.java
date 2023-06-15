package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.Order;
import com.example.repository.OrderRepository;
import com.example.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderRepository orderRepository;

	@Override
	public Optional<Order> saveOrUpdate(Order entity) {
		Order order = orderRepository.save(entity);
		return Optional.of(order);
	}

	@Override
	public Optional<Order> findById(String id) {
		return orderRepository.findById(id);
	}

	@Override
	public Page<Order> findAllByFullNameLike(String keywords, Pageable pageable) {
		return orderRepository.findAllByFullNameLike(keywords, pageable);
	}

	@Override
	public void deleteById(String id) {
		orderRepository.deleteById(id);
	}

	@Override
	public List<Object[]> orderUserByYear(int year) {
		return orderRepository.orderUserByYear(year);
	}

	@Override
	public Integer countOrder(int month, int year) {
		Optional<Integer> count = orderRepository.countOrder(month, year);
		if (count.isEmpty())
			return 0;
		return count.get();
	}

	@Override
	public List<Order> findAllByEmail(String email) {
		return orderRepository.findAllByEmail(email);
	}
}
