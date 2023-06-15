<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<header class="header_area sticky-header">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light main_box">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="/shop/home"><img
					src="<c:url value="/static/shop/img/logo.png" />" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="/shop/home">Home</a></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Shop</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="/shop/shop-category">Shop Category</a></li>
								<li class="nav-item"><a class="nav-link" href="/shop/checkout">Product
										Checkout</a></li>
								<li class="nav-item"><a class="nav-link" href="/shop/cart">Shopping
										Cart</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="/shop/contact">Contact</a></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false"><c:if
									test="${sessionScope['shop'] != null}">
									<c:out value="${sessionScope['shop'].getFullName()}" />
								</c:if> <c:if test="${sessionScope['shop'] == null}">
									Account
								</c:if></a>
							<ul class="dropdown-menu">
								<c:if test="${sessionScope['shop'] != null}">
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/change-information">Change information</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/change-password">Change password</a></li>
									<li class="nav-item"><a class="nav-link" href="/shop/order-history">Order
											history</a></li>
									<li class="nav-item"><a class="nav-link" href="/shop/like">Favorites
											list</a></li>
									<li class="nav-item"><a class="nav-link" href="/shop/review">Review
											history</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/logout">Logout</a></li>
								</c:if>
								<c:if test="${sessionScope['shop'] == null}">
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/login">Login</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/register">Register</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/account/forgot-password">Forgot password</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/shop/tracking">Tracking</a></li>
								</c:if>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="nav-item"><a href="/shop/cart" class="cart"><span
								class="ti-bag"></span></a></li>
						<li class="nav-item">
							<button class="search">
								<span class="lnr lnr-magnifier" id="search"></span>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="search_input" id="search_input_box">
		<div class="container">
			<form class="d-flex justify-content-between">
				<input type="text" class="form-control" id="search_input"
					placeholder="Search Here">
				<button type="submit" class="btn"></button>
				<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
			</form>
		</div>
	</div>
</header>