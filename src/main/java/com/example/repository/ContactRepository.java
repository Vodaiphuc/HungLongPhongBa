package com.example.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Contact;

@Repository
public interface ContactRepository extends JpaRepository<Contact, String> {
	
	List<Contact> findAllByFullNameLike(String keyword, Sort sort);
	
}
