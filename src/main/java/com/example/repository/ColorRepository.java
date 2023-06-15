package com.example.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Color;

@Repository
public interface ColorRepository extends JpaRepository<Color, String>{
	Page<Color> findAllByNameLike(String keyword, Pageable pageable);
}
