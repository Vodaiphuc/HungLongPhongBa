package com.example.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, String> {

	@Transactional
	@Modifying
	@Query("update Review r set r.fullName=:fullName, r.avatar=:avatar where r.email=:email")
	void updateByEmail(@Param("fullName") String fullName, @Param("avatar") String avatar,
			@Param("email") String email);
	
	List<Review> findAllByEmailOrderByCreatedDateDesc(String email);
	
	Page<Review> findAllByProductId(String id, Pageable pageable);
	
	List<Review> findAllByProductId(String id);
	
	@Query("select r.star, count(r.star) from Review r where r.product.id=:id group by r.star order by r.star desc")
	List<Object[]> numberReviewStar(String id);
	
	Page<Review> findAllByFullNameLike(String keyword, Pageable pageable);
	
	@Query("select MONTH(r.createdDate), COUNT(r.id) "
			+ "from Review r "
			+ "where YEAR(r.createdDate) = :year "
			+ "group by MONTH(r.createdDate) "
			+ "order by MONTH(r.createdDate) asc")
	List<Object[]> reviewProductByYear(@Param("year")int year);
	
	@Query("select r.product.name, r.product.banner, COUNT(r.id), SUM(r.star), r.product.id "
			+ "from Review r "
			+ "where YEAR(r.createdDate)=:year "
			+ "group by r.product.name, r.product.banner, r.product.id "
			+ "order by COUNT(r.id) desc")
	List<Object[]> listReviewProduct(@Param("year")int year);
	
	@Query("select r.fullName, r.avatar, COUNT(r.id), SUM(r.star) "
			+ "from Review r "
			+ "where YEAR(r.createdDate)=:year "
			+ "group by r.fullName, r.avatar "
			+ "order by COUNT(r.id) desc")
	List<Object[]> listReviewUser(@Param("year")int year);

}
