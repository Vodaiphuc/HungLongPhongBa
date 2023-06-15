package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.Color;

public interface ColorService {

	Optional<Color> saveOrUpdate(Color entity);

	Optional<Color> findById(String id);

	void deleteById(String id);

	Page<Color> findAllByNameLike(String keyword, Pageable pageable);

	List<Color> findAll();
}
