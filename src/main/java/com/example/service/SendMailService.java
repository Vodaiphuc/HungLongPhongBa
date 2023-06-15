package com.example.service;

import java.util.List;
import java.util.Optional;

import com.example.model.SendMail;

public interface SendMailService {

	Optional<SendMail> save(SendMail entity);

	List<SendMail> findByEmailTo(String emailTo);
	
	Optional<SendMail> findById(String id);
}
