package com.example.service;

import java.util.List;
import java.util.Optional;

import com.example.model.OrderDetail;

public interface OrderDetailService {

	Optional<OrderDetail> saveOrUpdate(OrderDetail entity);
	
	List<OrderDetail> findAllByOrderId(String id);
	
	List<Object[]> orderDetailCategoryProductByYear(int year);
	
	List<Object[]> totailOrderDetailByYear(int year);
	
	Float totailOrderDetail(int year);
	
	Float totailPrice(int month, int year);
	
	Integer totailQuantity(int month, int year);
}
