package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.model.User;

public interface UserService {

	Optional<User> saveOrUpdate(User entity);

	Optional<User> findById(String id);

	Optional<User> findByEmail(String email);

	Optional<User> findByEmailAndPassword(String email, String password);

	void deleteById(String id);

	Page<User> findAllByFullNameLike(String keyword, Pageable pageable);

	List<User> findAllByRole(boolean role);
	
	List<User> findAllByRoleOrderByCreatedDateDesc(boolean role);

	List<User> findAllByLogin(boolean login);

	boolean checkLogin(String email, String password);
	
	Optional<User> updateLastLoginDate(String id);
	
	Optional<User> updatePasswordByEmail(String email, String password);
	
	List<Object[]> visitUserByYear(int year);
	
	Integer countUserByMonth(int month, int year);
	
	List<Object[]> visitNewUserByYear(int year);
	
	Integer countUserByYear(int year);

}
