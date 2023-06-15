package com.example.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.model.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, String> {
	
	List<OrderDetail> findAllByOrderId(String id);
	
	@Query("select o.product.categoryProduct.name, sum(o.quantity) "
			+ "from OrderDetail o "
			+ "where YEAR(o.order.createdDate)=:year "
			+ "group by o.product.categoryProduct.name ")
	List<Object[]> orderDetailCategoryProductByYear(@Param("year")int year);
	
	@Query("select MONTH(o.order.createdDate), SUM(o.quantity), SUM(o.discount), SUM((o.quantity * o.price) - (o.quantity * o.price * o.discount * 0.01)) "
			+ "from OrderDetail o "
			+ "where YEAR(o.order.createdDate) = :year "
			+ "group by MONTH(o.order.createdDate) "
			+ "order by MONTH(o.order.createdDate) asc")
	List<Object[]> totailOrderDetailByYear(@Param("year")int year);
	
	@Query("select SUM((o.quantity * o.price) - (o.quantity * o.price * o.discount * 0.01)) "
			+ "from OrderDetail o "
			+ "where YEAR(o.order.createdDate) = :year")
	Optional<Float> totailOrderDetail(@Param("year")int year);
	
	@Query("select SUM((o.quantity * o.price) - (o.quantity * o.price * o.discount * 0.01)) "
			+ "from OrderDetail o "
			+ "where MONTH(o.order.createdDate) = :month and YEAR(o.order.createdDate) = :year")
	Optional<Float> totailPrice(@Param("month")int month, @Param("year")int year);
	
	@Query("select SUM(o.quantity) "
			+ "from OrderDetail o "
			+ "where MONTH(o.order.createdDate) = :month and YEAR(o.order.createdDate) = :year")
	Optional<Integer> totailQuantity(@Param("month")int month, @Param("year")int year);
}
