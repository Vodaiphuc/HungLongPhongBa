package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.Color;
import com.example.repository.ColorRepository;
import com.example.service.ColorService;

@Service
public class ColorServiceImpl implements ColorService {

	@Autowired
	ColorRepository colorRepository;

	@Override
	public Optional<Color> saveOrUpdate(Color entity) {
		Color color = colorRepository.save(entity);
		return Optional.of(color);
	}

	@Override
	public Optional<Color> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return colorRepository.findById(id);
	}

	@Override
	public void deleteById(String id) {
		colorRepository.deleteById(id);
	}

	@Override
	public Page<Color> findAllByNameLike(String keyword, Pageable pageable) {
		return colorRepository.findAllByNameLike(keyword, pageable);
	}

	@Override
	public List<Color> findAll() {
		return colorRepository.findAll();
	}
}
