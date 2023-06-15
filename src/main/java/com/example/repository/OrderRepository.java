package com.example.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.model.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, String> {

	Page<Order> findAllByFullNameLike(String keywords, Pageable pageable);

	@Query("select MONTH(o.createdDate), COUNT(o.id) " 
			+ "from Order o " 
			+ "where YEAR(o.createdDate) = :year "
			+ "group by MONTH(o.createdDate) " + "order by MONTH(o.createdDate) asc")
	List<Object[]> orderUserByYear(@Param("year") int year);

	@Query("select COUNT(o.id) " 
			+ "from Order o "
			+ "where MONTH(o.createdDate) = :month and YEAR(o.createdDate) = :year")
	Optional<Integer> countOrder(@Param("month") int month, @Param("year") int year);
	
	List<Order> findAllByEmail(String email);
}
