package com.example.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.SendMail;
import com.example.repository.SendMailRepository;
import com.example.service.SendMailService;

@Service
public class SendMailServiceImpl implements SendMailService{
	
	@Autowired
	SendMailRepository sendMailRepository;

	@Override
	public Optional<SendMail> save(SendMail entity) {
		SendMail sendMail = sendMailRepository.save(entity);
		return Optional.of(sendMail);
	}

	@Override
	public List<SendMail> findByEmailTo(String emailTo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<SendMail> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return sendMailRepository.findById(id);
	}

	
}
