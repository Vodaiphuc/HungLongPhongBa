package com.example.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

	Optional<User> findByEmail(String email);
	
	Optional<User> findByEmailAndPassword(String email, String password);
	
	Page<User> findAllByFullNameLike(String keyword, Pageable pageable);
	
	List<User> findAllByRole(boolean role);
	
	List<User> findAllByRoleOrderByCreatedDateDesc(boolean role, Pageable pageable);
	
	List<User> findAllByLogin(boolean login);
	
	@Query("select MONTH(u.lastLoginDate), COUNT(u.id) "
			+ "from User u "
			+ "where YEAR(u.lastLoginDate) = :year "
			+ "group by MONTH(u.lastLoginDate) "
			+ "order by MONTH(u.lastLoginDate) asc")
	List<Object[]> visitUserByYear(@Param("year")int year);
	
	@Query("select COUNT(u.id) "
			+ "from User u "
			+ "where MONTH(u.createdDate) = :month and YEAR(u.createdDate) = :year ")
	Optional<Integer> countUserByMonth(@Param("month")int month, @Param("year")int year);
	
	@Query("select MONTH(u.createdDate), COUNT(u.id) "
			+ "from User u "
			+ "where YEAR(u.createdDate) = :year "
			+ "group by MONTH(u.createdDate) "
			+ "order by MONTH(u.createdDate) asc")
	List<Object[]> visitNewUserByYear(@Param("year")int year);
	
	@Query("select COUNT(u.id) "
			+ "from User u "
			+ "where YEAR(u.createdDate) = :year ")
	Optional<Integer> countUserByYear(@Param("year")int year);
}
