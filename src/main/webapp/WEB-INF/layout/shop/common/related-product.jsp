<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="related-product-area section_gap_bottom">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6 text-center">
				<div class="section-title">
					<h1>Deals of the Week</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-9">
				<div class="row">
					<c:forEach var="item" items="${related }" varStatus="loopCounter">
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="/shop/product-detail?id=${item.id }"><img
									src="/uploads/${item.banner }" alt="" style="max-width: 70px;"></a>
								<div class="desc">
									<a href="#" class="title">${item.name }</a>
									<div class="price">
										<h6>$${item.price - (item.price * item.discount * 0.01) }</h6>
										<h6 class="l-through">$${item.price }</h6>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="ctg-right">
					<a href="#" target="_blank"> <img
						class="img-fluid d-block mx-auto"
						src="<c:url value="/static/shop/img/category/c5.jpg" />" alt="">
					</a>
				</div>
			</div>
		</div>
	</div>
</section>