<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Shop Category page</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a> <a
						href="/shop/shop-category">Shop<span
						class="lnr lnr-arrow-right"></span></a> <a href="/shop/shop-category">Fashon
						Category</a>
				</nav>
			</div>
		</div>
	</div>
</section>
<div class="container">
	<div class="row">
		<div class="col-xl-3 col-lg-4 col-md-5">
			<div class="sidebar-categories">
				<div class="head">Categories</div>
				<ul class="main-categories">
					<c:forEach var="item" items="${categories }">
						<li class="main-nav-list"><a
							href="/shop/shop-category?categoryProduct_id=${item.id }&size=40">${item.name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="sidebar-categories">
				<div class="head">Brands</div>
				<ul class="main-categories">
					<c:forEach var="item" items="${brands }">
						<li class="main-nav-list"><a
							href="/shop/shop-category?brand_id=${item.id }&size=40">${item.name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="sidebar-categories">
				<div class="head">Colors</div>
				<ul class="main-categories">
					<c:forEach var="item" items="${colors }">
						<li class="main-nav-list"><a
							href="/shop/shop-category?color_id=${item.id }&size=40"> <i
								class="fa fa-circle" aria-hidden="true"
								style="color: ${item.name };"></i> ${item.name }
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="col-xl-9 col-lg-8 col-md-7">
			<!-- Start Filter Bar -->
			<div class="filter-bar d-flex flex-wrap align-items-center">
				<div class="sorting">
					<form action="/shop/shop-category">
						<select name="field" id="field" onchange="this.form.submit()">
							<option value="id"
								<c:if test="${field == 'id'}">selected="selected"</c:if>>Default
								sorting</option>
							<option value="name"
								<c:if test="${field == 'name'}">selected="selected"</c:if>>Product
								name</option>
							<option value="price"
								<c:if test="${field == 'price'}">selected="selected"</c:if>>Price</option>
							<option value="discount"
								<c:if test="${field == 'discount'}">selected="selected"</c:if>>Discount</option>
							<option value="quantity"
								<c:if test="${field == 'quantity'}">selected="selected"</c:if>>Quantity</option>
						</select>
					</form>
				</div>
				<div class="sorting mr-auto">
					<form action="/shop/shop-category">
						<select name="size" id="size" onchange="this.form.submit()">
							<option
								<c:if test="${resultPage.size == 3}">selected="selected"</c:if>
								value="3">Show 3</option>
							<option
								<c:if test="${resultPage.size == 6}">selected="selected"</c:if>
								value="6">Show 6</option>
							<option
								<c:if test="${resultPage.size == 9}">selected="selected"</c:if>
								value="9">Show 9</option>
							<option
								<c:if test="${resultPage.size == 12}">selected="selected"</c:if>
								value="12">Show 12</option>
							<option
								<c:if test="${resultPage.size == 15}">selected="selected"</c:if>
								value="15">Show 15</option>
							<option
								<c:if test="${resultPage.size == 18}">selected="selected"</c:if>
								value="18">Show 18</option>
							<option
								<c:if test="${resultPage.size == 21}">selected="selected"</c:if>
								value="21">Show 21</option>
							<option
								<c:if test="${resultPage.size == 24}">selected="selected"</c:if>
								value="24">Show 24</option>
						</select>
					</form>
				</div>
				<c:if test="${resultPage.totalPages > 0}">
					<div class="pagination">
						<a href="/shop/shop-category?field=${field }&size=${size }&page=1"
							class="${resultPage.number + 1 == 1 ? 'prev-arrow active' : 'prev-arrow'}">
							<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
						</a>
						<c:forEach var="pageNumber" items="${pageNumbers }">
							<c:if test="${resultPage.totalPages > 1}">
								<a
									href="/shop/shop-category?field=${field }&size=${size }&page=${pageNumber }"
									class="${pageNumber == resultPage.number + 1 ? 'active' : ''}">${pageNumber}</a>
							</c:if>
						</c:forEach>

						<a
							href="/shop/shop-category?field=${field }&size=${size }&page=${resultPage.totalPages }"
							class="${resultPage.number + 1 == resultPage.totalPages ? 'next-arrow active' : 'next-arrow'}"><i
							class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
					</div>
				</c:if>
			</div>
			<!-- End Filter Bar -->
			<!-- Start Best Seller -->
			<section class="lattest-product-area pb-40 category-list">
				<c:if test="${empty resultPage.content }">
					<h3 class="title_confirmation text-center text-danger m-4">No
						product.</h3>
				</c:if>
				<c:if test="${not empty resultPage.content }">
					<div class="row">
						<!-- single product -->
						<c:forEach var="item" items="${resultPage.content }"
							varStatus="loopCounter">
							<div class="col-lg-4 col-md-6">
								<div class="single-product">
									<a href="/shop/product-detail?id=${item.id }"><img class="img-fluid"
										src="/uploads/${item.banner }" alt="Banner product"></a>
									<div class="product-details">
										<h6>${item.name }</h6>
										<div class="price">
											<c:set var="startDay"
												value="${item.startDayDiscount.getTime() }" />
											<c:set var="endDay" value="${item.endDayDiscount.getTime() }" />
											<c:set var="dayNow" value="<%=(new Date()).getTime()%>" />
											<c:if
												test="${item.discount > '0' && startDay <= dayNow && endDay >= dayNow }">
												<h6>$${item.price - (item.price * item.discount * 0.01)
													}</h6>
												<h6 class="l-through">$${item.price }</h6>
											</c:if>
											<c:if
												test="${item.discount == '0' || startDay > dayNow || endDay < dayNow }">
												<h6>$${item.price }</h6>
											</c:if>
										</div>
										<div class="prd-bottom">
											<a href="/shop/cart/add?id=${item.id }" class="social-info"> <span class="ti-bag"></span>
												<p class="hover-text">add to bag</p>
											</a> 
											
											<a href="/shop/like/add?id=${item.id }" class="social-info"> <span
												class="lnr lnr-heart"></span>
												<p class="hover-text">Wishlist</p>
											</a> 
											
											<a href="/shop/shop-category?categoryProduct_id=${item.categoryProduct.id }&size=40" class="social-info"> <span
												class="lnr lnr-move"></span>
												<p class="hover-text">view more</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</section>
			<!-- End Best Seller -->
			<!-- Start Filter Bar -->
			<div class="filter-bar d-flex flex-wrap align-items-center">
				<div class="sorting mr-auto">
					<form action="/shop/shop-category">
						<select name="size" id="size" onchange="this.form.submit()">
							<option
								<c:if test="${resultPage.size == 3}">selected="selected"</c:if>
								value="3">Show 3</option>
							<option
								<c:if test="${resultPage.size == 6}">selected="selected"</c:if>
								value="6">Show 6</option>
							<option
								<c:if test="${resultPage.size == 9}">selected="selected"</c:if>
								value="9">Show 9</option>
							<option
								<c:if test="${resultPage.size == 12}">selected="selected"</c:if>
								value="12">Show 12</option>
							<option
								<c:if test="${resultPage.size == 15}">selected="selected"</c:if>
								value="15">Show 15</option>
							<option
								<c:if test="${resultPage.size == 18}">selected="selected"</c:if>
								value="18">Show 18</option>
							<option
								<c:if test="${resultPage.size == 21}">selected="selected"</c:if>
								value="21">Show 21</option>
							<option
								<c:if test="${resultPage.size == 24}">selected="selected"</c:if>
								value="24">Show 24</option>
						</select>
					</form>
				</div>
				<c:if test="${resultPage.totalPages > 0}">
					<div class="pagination">
						<a href="/shop/shop-category?field=${field }&size=${size }&page=1"
							class="${resultPage.number + 1 == 1 ? 'prev-arrow active' : 'prev-arrow'}">
							<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
						</a>
						<c:forEach var="pageNumber" items="${pageNumbers }">
							<c:if test="${resultPage.totalPages > 1}">
								<a
									href="/shop/shop-category?field=${field }&size=${size }&page=${pageNumber }"
									class="${pageNumber == resultPage.number + 1 ? 'active' : ''}">${pageNumber}</a>
							</c:if>
						</c:forEach>

						<a
							href="/shop/shop-category?field=${field }&size=${size }&page=${resultPage.totalPages }"
							class="${resultPage.number + 1 == resultPage.totalPages ? 'next-arrow active' : 'next-arrow'}"><i
							class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
					</div>
				</c:if>

			</div>
			<!-- End Filter Bar -->
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/layout/shop/common/related-product.jsp"></jsp:include>