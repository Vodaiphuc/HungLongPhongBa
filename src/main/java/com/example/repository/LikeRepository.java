package com.example.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.model.Like;

@Repository
public interface LikeRepository extends JpaRepository<Like, String> {

	List<Like> findAllByUserIdOrderByCreatedDateDesc(String id);

	Optional<Like> findByUserIdAndProductId(String userId, String productId);
	
	Page<Like> findAllByUserFullNameLike(String keyword, Pageable pageable);

	@Query("select MONTH(l.createdDate), COUNT(l.id) "
			+ "from Like l "
			+ "where YEAR(l.createdDate) = :year "
			+ "group by MONTH(l.createdDate) "
			+ "order by MONTH(l.createdDate) asc")
	List<Object[]> likeProductByYear(@Param("year")int year);
	
	@Query("select l.product.name, l.product.banner, COUNT(l.id), l.product.id "
			+ "from Like l "
			+ "where YEAR(l.createdDate)=:year "
			+ "group by l.product.name, l.product.banner, l.product.id "
			+ "order by COUNT(l.id) desc")
	List<Object[]> listLikeProduct(@Param("year")int year);
	
	@Query("select l.user.fullName, l.user.avatar, COUNT(l.id), l.user.id "
			+ "from Like l "
			+ "where YEAR(l.createdDate)=:year "
			+ "group by l.user.fullName, l.user.avatar, l.user.id "
			+ "order by COUNT(l.id) desc")
	List<Object[]> listLikeUser(@Param("year")int year);
}
