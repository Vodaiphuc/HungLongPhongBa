<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Product Details Page</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/shop-category">Shop<span
						class="lnr lnr-arrow-right"></span></a> <a
						href="/shop/product-detail?id=${product.id }">product-details</a>
				</nav>
			</div>
		</div>
	</div>
</section>
<div class="product_image_area">
	<div class="container">
		<div class="row s_product_inner">
			<div class="col-lg-6">
				<div class="s_Product_carousel">
					<c:forEach var="item" items="${listImage }">
						<div class="single-prd-item">
							<img class="img-fluid"
								src="<c:url value="/uploads/${item.name }" />" alt="">
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-lg-5 offset-lg-1">
				<div class="s_product_text">
					<h3>${product.name }</h3>

					<c:set var="startDay"
						value="${product.startDayDiscount.getTime() }" />
					<c:set var="endDay" value="${product.endDayDiscount.getTime() }" />
					<c:set var="dayNow" value="<%=(new Date()).getTime()%>" />
					<c:if
						test="${product.discount > '0' && startDay <= dayNow && endDay >= dayNow }">
						<h2>$${product.price - (product.price * product.discount *
							0.01) }</h2>
						<h6 class="l-through">$${product.price }</h6>
					</c:if>
					<c:if
						test="${product.discount == '0' || startDay > dayNow || endDay < dayNow }">
						<h2>$${product.price }</h2>
					</c:if>

					<ul class="list">
						<li><a class="active"
							href="/shop/shop-category?categoryProduct_id=${product.categoryProduct.id }&size=40"><span>Category</span>
								: ${product.categoryProduct.name }</a></li>
						<li><a href="#"><span>Availibility</span> : In Stock</a></li>
						<li><a class="active"
							href="/shop/shop-category?brand_id=${product.brand.id }&size=40"><span>Brand</span>
								: ${product.brand.name }</a></li>
						<li><a class="active"
							href="/shop/shop-category?color_id=${product.color.id }&size=40"><span>Color</span>
								: <i class="fa fa-circle" aria-hidden="true"
								style="color: ${product.color.name };"></i> ${product.color.name }</a></li>
					</ul>
					<div class="card_area d-flex align-items-center">
						<a class="primary-btn" href="/shop/cart/add?id=${product.id }">Add
							to Cart</a> <a class="icon_btn"
							href="/shop/like/add?id=${product.id }"><i
							class="lnr lnr lnr-heart"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<section class="product_description_area">
	<div class="container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">Description</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">Specification</a></li>
			<li class="nav-item"><a class="nav-link active" id="review-tab"
				data-toggle="tab" href="#review" role="tab" aria-controls="review"
				aria-selected="false">Reviews</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<p>${product.description }</p>
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<td>
									<h5>Width</h5>
								</td>
								<td>
									<h5>
										<c:if test="${product.width == '0' }">
											<span>Updatting ...</span>
										</c:if>
										<c:if test="${product.width != '0' }">
											<span>${product.width } mm</span>
										</c:if>
									</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Height</h5>
								</td>
								<td>
									<h5>
										<c:if test="${product.height == '0' }">
											<span>Updatting ...</span>
										</c:if>
										<c:if test="${product.height != '0' }">
											<span>${product.height } mm</span>
										</c:if>
									</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Depth</h5>
								</td>
								<td>
									<h5>
										<c:if test="${product.depth == '0' }">
											<span>Updatting ...</span>
										</c:if>
										<c:if test="${product.depth != '0' }">
											<span>${product.depth } mm</span>
										</c:if>
									</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>Weight</h5>
								</td>
								<td>
									<h5>
										<c:if test="${product.weight == '0' }">
											<span>Updatting ...</span>
										</c:if>
										<c:if test="${product.weight != '0' }">
											<span>${product.weight } mm</span>
										</c:if>
									</h5>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade show active" id="review" role="tabpanel"
				aria-labelledby="review-tab">
				<div class="row">
					<div class="col-lg-6">
						<div class="row total_rate">
							<div class="col-6">
								<div class="box_total">
									<h5>Overall</h5>
									<h4>${totailStar }</h4>
									<h6>(${totailReview } Reviews)</h6>
								</div>
							</div>
							<div class="col-6">
								<div class="rating_list">
									<h3>Based on ${totailReview } Reviews</h3>
									<ul class="list">
										<c:forEach var="item" items="${listNumberReviewStar }"
											varStatus="loopCounter">
											<li><a>${item[0] } Star <c:forEach var="i" begin="1"
														end="${item[0] }">
														<i class="fa fa-star"></i>
													</c:forEach> ${item[1] }
											</a></li>

										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="review_list">
							<c:if test="${empty resultPageReview.content }">
								<h3 class="title_confirmation text-center text-danger m-4">No
									review.</h3>
							</c:if>
							<c:if test="${not empty resultPageReview.content }">
								<c:forEach var="item" items="${resultPageReview.content }"
									varStatus="loopCounter">
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="/uploads/${item.avatar }" alt=""
													style="width: 70px; height: 70px; border-radius: 100%;">
											</div>
											<div class="media-body">
												<h4>${item.fullName }</h4>
												<c:forEach var="i" begin="1" end="${item.star }">
													<i class="fa fa-star"></i>
												</c:forEach>
											</div>
										</div>
										<p>${item.review }</p>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="review_box">
							<form:form action="/shop/product-detail/review"
								modelAttribute="review" method="post" class="row contact_form"
								id="contactForm">
								<form:hidden path="product.id" value="${product.id }" />
								<c:if test="${sessionScope['shop'] != null}">
									<form:hidden path="avatar"
										value="${sessionScope['shop'].getAvatar()}" />
									<c:set var="email" value="${sessionScope['shop'].getEmail()}" />
									<c:set var="fullName"
										value="${sessionScope['shop'].getFullName()}" />
								</c:if>
								<div class="col-md-12">
									<h4>Add a Review</h4>
									<p>Your Rating:</p>
									<div class="rating-wrapper">
										<form:radiobutton path="star" id="5-star-rating"
											name="star-rating" value="5" />
										<label for="5-star-rating" class="star-rating"> <i
											class="fa fa-star d-inline-block"></i>
										</label>
										<form:radiobutton path="star" id="4-star-rating"
											name="star-rating" value="4" />
										<label for="4-star-rating" class="star-rating star"> <i
											class="fa fa-star d-inline-block"></i>
										</label>
										<form:radiobutton path="star" id="3-star-rating"
											name="star-rating" value="3" />
										<label for="3-star-rating" class="star-rating star"> <i
											class="fa fa-star d-inline-block"></i>
										</label>
										<form:radiobutton path="star" id="2-star-rating"
											name="star-rating" value="2" />
										<label for="2-star-rating" class="star-rating star"> <i
											class="fa fa-star d-inline-block"></i>
										</label>
										<form:radiobutton path="star" id="1-star-rating"
											name="star-rating" value="1" />
										<label for="1-star-rating" class="star-rating star"> <i
											class="fa fa-star d-inline-block"></i>
										</label>
									</div>
									<p>Outstanding</p>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<form:input path="fullName" class="form-control"
											placeholder="Full name" onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Full name'" value="${fullName }" />
										<form:errors path="fullName" class="error text-danger" />
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<form:input path="email" class="form-control"
											placeholder="Email" onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Email'" value="${email }" />
										<form:errors path="email" class="error text-danger" />
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<form:textarea path="review" class="form-control" rows="1"
											placeholder="Review" onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Review'"></form:textarea>
										<form:errors path="review" class="error text-danger" />
									</div>
								</div>
								<div class="col-md-12 text-right">
									<button type="submit" value="submit" class="primary-btn">Submit
										Now</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>