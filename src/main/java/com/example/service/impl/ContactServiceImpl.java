package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.model.Contact;
import com.example.repository.ContactRepository;
import com.example.service.ContactService;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	ContactRepository contactRepository;

	@Override
	public Optional<Contact> saveOrUpdate(Contact entity) {
		Contact contact = contactRepository.save(entity);
		return Optional.of(contact);
	}
	@Override
	public Optional<Contact> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return contactRepository.findById(id);
	}
	@Override
	public List<Contact> findAllByFullNameLike(String keyword, Sort sort) {
		return contactRepository.findAllByFullNameLike(keyword, sort);
	}
}
