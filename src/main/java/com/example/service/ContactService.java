package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;

import com.example.model.Contact;

public interface ContactService {

	Optional<Contact> saveOrUpdate(Contact entity);
	
	List<Contact> findAllByFullNameLike(String keyword, Sort sort);
	
	Optional<Contact> findById(String id);
}
