package com.example.service.impl;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.example.dto.Item;
import com.example.model.Product;
import com.example.service.CartService;
import com.example.service.ProductService;

@SessionScope
@Service
public class CartServiceImpl implements CartService {

	Map<String, Item> map = new HashMap<>();

	@Autowired
	ProductService productService;

	@Override
	public Item add(String id) {
		if (getItem(id) == null) {
			Product product = productService.findById(id).get();
			Item item = new Item();
			item.setProduct_id(id);
			item.setName(product.getName());
			item.setImage(product.getBanner());
			item.setPrice(product.getPrice());
			Long dateNow = (new Date()).getTime();
			if (product.getDiscount() > 0 && product.getStartDayDiscount().getTime() <= dateNow
					&& product.getEndDayDiscount().getTime() >= dateNow) {
				item.setDiscount(product.getDiscount());
			}
			item.setQuantity(1);
			map.put(id, item);
		} else {
			map.forEach((key, value) -> {
				if (value.getProduct_id().equals(id)) {
					value.setQuantity(value.getQuantity() + 1);
					map.put(id, value);
					return;
				}
			});
		}
		return null;
	}

	@Override
	public void remove(String id) {
		map.remove(id);
	}

	@Override
	public Item update(String id, int qty) {
		for (Item item : map.values()) {
			if (item.getProduct_id().equals(id)) {
				item.setQuantity(qty);
				map.put(id, item);
				return item;
			}
		}
		return null;
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<Item> getItems() {
		return map.values();
	}

	@Override
	public Item getItem(String id) {
		for (Item item : map.values()) {
			if (item.getProduct_id().equals(id)) {
				return item;
			}
		}
		return null;
	}

	@Override
	public int getCount() {
		return map.size();
	}

	@Override
	public float getTotail() {
		float amount = 0;
		for (Item item : map.values()) {
			if (item.getDiscount() == 0)
				amount += item.getPrice() * item.getQuantity();
			else
				amount += (item.getPrice() * item.getQuantity())
						- (item.getPrice() * item.getQuantity() * item.getDiscount() * 0.01);
		}
		return amount;
	}

}
