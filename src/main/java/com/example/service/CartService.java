package com.example.service;

import java.util.Collection;

import com.example.dto.Item;

public interface CartService {
	/**
	 * Thêm mặt hàng vào giỏ hoặc tăng số lượng lên 1 nếu đã tồn tại
	 * 
	 * @param id là mã mặt hàng cần thêm
	 * @return mặt hàng đã được thêm vào hoặc cập nhật số lượng
	 */
	Item add(String id);

	/**
	 * Xóa mặt hàng khỏi giỏ
	 * 
	 * @param id mã mặt hàng cần xóa
	 */
	void remove(String id);

	/**
	 * Thay đổi số lượng lên của mặt hàng trong giỏ
	 * 
	 * @param id  mã mặt hàng
	 * @param qty số lượng mới
	 * @return mặt hàng đã được thay đổi số lượng
	 */
	Item update(String id, int qty);

	/**
	 * Xóa sạch các mặt hàng trong giỏ
	 */
	void clear();

	/**
	 * Lấy tất cả các mặt hàng trong giỏ
	 */
	Collection<Item> getItems();

	/**
	 * Lấy một mặt hàng trong giỏ
	 */
	Item getItem(String id);

	/**
	 * Lấy tổng số lượng các mặt hàng trong giỏ
	 */
	int getCount();
	
	/**
	 * Lấy tổng số tiền tất cả các mặt hàng trong giỏ sau khi đã giảm giá
	 */
	float getTotail();

}
