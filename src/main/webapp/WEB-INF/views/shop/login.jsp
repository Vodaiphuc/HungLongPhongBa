<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Đăng nhập</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/account/login">Đăng nhập</a>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="login_box_area section_gap">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="login_box_img">
					<img class="img-fluid"
						src="<c:url value="/static/shop/img/hunglongphongba.png" />" alt="">
					<div class="hover">
						<h4>Mới vào trang web của chúng tôi?</h4>
						<p>Có những tiến bộ đang được thực hiện trong khoa học và công
							nghệ hàng ngày, và một ví dụ tốt về điều này là</p>
						<a class="primary-btn" href="/shop/account/register">Tạo một
							tài khoản </a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner">
					<h3>Đăng nhập để vào</h3>
					<c:if test="${not empty error}">
						<b class="error text-danger"> <c:out value="${error}" />
						</b>
					</c:if>
					<form:form action="/shop/account/login" modelAttribute="login"
						method="post" class="row login_form" id="contactForm">
						<div class="col-md-12 form-group">
							<form:input path="email" class="form-control" placeholder="Email"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email'" />
							<form:errors path="email" class="error text-danger" />
						</div>
						<div class="col-md-12 form-group">
							<form:password path="password" class="form-control"
								placeholder="Password" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password'" />
							<form:errors path="password" class="error text-danger" />
						</div>
						<div class="col-md-12 form-group">
							<button type="submit" value="submit" class="primary-btn">Đăng
								nhập</button>
							<a href="/shop/account/forgot-password">Quên mật khẩu? </a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>