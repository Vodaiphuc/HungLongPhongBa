package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.OrderDetail;
import com.example.repository.OrderDetailRepository;
import com.example.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	OrderDetailRepository orderDetailRepository;

	@Override
	public Optional<OrderDetail> saveOrUpdate(OrderDetail entity) {
		OrderDetail orderDetail = orderDetailRepository.save(entity);
		return Optional.of(orderDetail);
	}

	@Override
	public List<OrderDetail> findAllByOrderId(String id) {
		return orderDetailRepository.findAllByOrderId(id);
	}

	@Override
	public List<Object[]> orderDetailCategoryProductByYear(int year) {
		return orderDetailRepository.orderDetailCategoryProductByYear(year);
	}

	@Override
	public List<Object[]> totailOrderDetailByYear(int year) {
		return orderDetailRepository.totailOrderDetailByYear(year);
	}

	@Override
	public Float totailOrderDetail(int year) {
		Optional<Float> totail = orderDetailRepository.totailOrderDetail(year);
		if (totail.isEmpty())
			return (float) 0;
		return totail.get();
	}

	@Override
	public Float totailPrice(int month, int year) {
		Optional<Float> totail = orderDetailRepository.totailPrice(month, year);
		if (totail.isEmpty())
			return (float) 0;
		return totail.get();
	}

	@Override
	public Integer totailQuantity(int month, int year) {
		Optional<Integer> totail = orderDetailRepository.totailQuantity(month, year);
		if (totail.isEmpty())
			return 0;
		return totail.get();
	}
}
