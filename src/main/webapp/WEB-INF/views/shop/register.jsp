<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Register</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a> <a
						href="/shop/account/register">Register</a>
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
						<h4>New to our website?</h4>
						<p>There are advances being made in science and technology
							everyday, and a good example of this is the</p>
						<a class="primary-btn" href="/shop/account/login">Login shop</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="login_form_inner">
					<h3>Register an account</h3>
					<c:if test="${not empty error}">
						<b class="error text-danger"> <c:out value="${error}" />
						</b>
					</c:if>
					<form:form action="/shop/account/register"
						modelAttribute="register" method="post" class="row login_form"
						id="contactForm">
						<div class="col-md-12 form-group">
							<form:input path="fullName" class="form-control"
								placeholder="Full name" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Full name'" />
							<form:errors path="fullName" class="error text-danger" />
						</div>
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
							<form:password path="passwordAgain" class="form-control"
								placeholder="Password again" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Password again'" />
							<form:errors path="passwordAgain" class="error text-danger" />
						</div>
						<div class="col-md-12 form-group">
							<form:input path="birthDay" type="date" class="form-control"
								placeholder="Birth day" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Birth day'" />
							<form:errors path="birthDay" class="error text-danger" />
						</div>
						<div class="col-md-12 form-group">
							<button type="submit" value="submit" class="primary-btn">Register</button>
							<a href="/shop/account/forgot-password">Forgot Password?</a>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>