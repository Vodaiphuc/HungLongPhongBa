<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Quên mật khẩu</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/account/forgot-password">Quên mật khẩu</a>
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
						<a class="primary-btn" href="/shop/account/login">Đăng nhập vào cửa hàng</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner">
					<h3>Quên mật khẩu của tài khoản</h3>
					<c:if test="${not empty error}">
						<b class="error text-danger"> <c:out value="${error}" />
						</b>
					</c:if>
					<form class="row login_form" action="/shop/account/forgot-password"
						method="post" id="contactForm">
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="email" name="email"
								placeholder="Email" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Email'">
						</div>
						<div class="col-md-12 form-group">
							<button type="submit" value="submit" class="primary-btn">Gửi mail</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>