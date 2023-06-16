<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Xác nhận mật khẩu</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/account/confirm-password">Xác nhận mật khẩu</a>
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
						src="<c:url value="/static/shop/img/login.jpg" />" alt="">
					<div class="hover">
						<h4>Mới vào trang web của chúng tôi?</h4>
						<p>Mỗi ngày có những tiến bộ được đạt được trong khoa học và
							công nghệ, và một ví dụ tốt về điều này là</p>
						<a class="primary-btn" href="/shop/account/login">Đăng nhập
							vào cửa hàng</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner">
					<h3>Xác nhận mật khẩu tài khoản</h3>
					<c:if test="${not empty error}">
						<b class="error text-danger"> <c:out value="${error}" />
						</b>
					</c:if>
					<form:form class="row login_form"
						action="/shop/account/confirm-password"
						modelAttribute="confirmPassword" method="post" id="contactForm">
						<div class="col-md-12 form-group">
							<form:input path="code" class="form-control" placeholder="Code"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Code'" />
						</div>
						<div class="col-md-12 form-group">
							<form:password path="password" class="form-control"
								placeholder="Password" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password'" />
							<form:errors path="password" class="error text-danger" />
						</div>
						<div class="col-md-12 form-group">
							<form:password path="passwordAgain" class="form-control"
								placeholder="Password again" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password again'" />
							<form:errors path="passwordAgain" class="error text-danger" />
						</div>
						<div class="col-md-12 form-group">
							<button type="submit" value="submit" class="primary-btn">Gửi</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>