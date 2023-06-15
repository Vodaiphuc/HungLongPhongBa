package com.example.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.model.User;
import com.example.repository.UserRepository;
import com.example.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Override
	public Optional<User> saveOrUpdate(User entity) {
		User user = userRepository.save(entity);
		return Optional.of(user);
	}

	@Override
	public Optional<User> findById(String id) {
		if (id.equals(""))
			return Optional.empty();
		return userRepository.findById(id);
	}

	@Override
	public Optional<User> findByEmail(String email) {
		if (email.equals(""))
			return Optional.empty();
		return userRepository.findByEmail(email);
	}

	@Override
	public Optional<User> findByEmailAndPassword(String email, String password) {
		if (email.equals("") || password.equals(""))
			return Optional.empty();
		return userRepository.findByEmailAndPassword(email, password);
	}

	@Override
	public void deleteById(String id) {
		userRepository.deleteById(id);
	}

	@Override
	public Page<User> findAllByFullNameLike(String keyword, Pageable pageable) {
		return userRepository.findAllByFullNameLike(keyword, pageable);
	}

	@Override
	public List<User> findAllByRole(boolean role) {
		return userRepository.findAllByRole(role);
	}

	@Override
	public List<User> findAllByRoleOrderByCreatedDateDesc(boolean role) {
		Pageable pageable = PageRequest.of(0, 5);
		return userRepository.findAllByRoleOrderByCreatedDateDesc(role, pageable);
	}

	@Override
	public List<User> findAllByLogin(boolean login) {
		return userRepository.findAllByLogin(login);
	}

	@Override
	public boolean checkLogin(String email, String password) {
		if (email.equals("") || password.equals(""))
			return false;
		Optional<User> user = userRepository.findByEmailAndPassword(email, password);
		return user.isPresent();
	}

	@Override
	public Optional<User> updateLastLoginDate(String id) {
		if (id.equals(""))
			return Optional.empty();
		Optional<User> user = userRepository.findById(id);
		if (user.isEmpty())
			return Optional.empty();
		user.get().setLastLoginDate(new Date());
		return saveOrUpdate(user.get());
	}

	@Override
	public Optional<User> updatePasswordByEmail(String email, String password) {
		if (email.equals("") || password.equals(""))
			return Optional.empty();
		Optional<User> user = userRepository.findByEmail(email);
		if (user.isEmpty())
			return Optional.empty();
		user.get().setPassword(password);
		return saveOrUpdate(user.get());
	}

	@Override
	public List<Object[]> visitUserByYear(int year) {
		return userRepository.visitUserByYear(year);
	}

	@Override
	public Integer countUserByMonth(int month, int year) {
		Optional<Integer> count = userRepository.countUserByMonth(month, year);
		if (count.isEmpty())
			return 0;
		return count.get();
	}

	@Override
	public List<Object[]> visitNewUserByYear(int year) {
		return userRepository.visitNewUserByYear(year);
	}

	@Override
	public Integer countUserByYear(int year) {
		Optional<Integer> count = userRepository.countUserByYear(year);
		if (count.isEmpty())
			return 0;
		return count.get();
	}

}
