package com.example.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {

	Page<Product> findAllByNameLike(String keyword, Pageable pageable);

	Page<Product> findAllByBrandId(String id, Pageable pageable);

	Page<Product> findAllByCategoryProductId(String id, Pageable pageable);

	Page<Product> findAllByColorId(String id, Pageable pageable);

	Page<Product> findAllByActiveTrueAndQuantityNot(int quantity, Pageable pageable);
	
	@Query("select r.product from Review r where r.star=:star")
	Page<Product> findByReviewStar(int star, Pageable pageable);

	List<Product> findAllByActiveTrueAndQuantityNotAndDiscountNotAndStartDayDiscountLessThanEqualAndEndDayDiscountGreaterThanEqualOrderByEndDayDiscountAsc(int quantity, float discount, Date startDayDiscount, Date endDayDiscount, Pageable pageable);

}
