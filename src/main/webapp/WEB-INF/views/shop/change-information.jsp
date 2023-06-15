<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Change information</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a> <a
						href="/shop/account/change-information">Change information</a>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="change_information_box_area section_gap">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="login_form_inner">
				<h3 class="text-center">Change information an account</h3>
				<c:if test="${not empty error}">
					<b class="error text-danger"> <c:out value="${error}" />
					</b>
				</c:if>
				<form:form action="/shop/account/change-information"
					modelAttribute="user" method="post" class="row login_form"
					id="contactForm" enctype="multipart/form-data">
					<form:hidden path="id" />
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-3">
								<img src="/uploads/${user.avatar}" id="avatar" alt="" class="img-fluid">
							</div>
							<div class="col-md-9 mt-sm-20">
								<input type="file"
									onchange="readImageUser(this);" id="file" name="file">
							</div>
						</div>
					</div>
					<script>
						function readImageUser(input) {
							if (input.files && input.files[0]) {
								var reader = new FileReader();

								reader.onload = function(e) {
									$('#avatar').attr('src', e.target.result);
								};

								reader.readAsDataURL(input.files[0]);
							}
						}
					</script>
					<div class="col-md-12 form-group">
						<form:input path="email" class="form-control" placeholder="Email"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Email'" />
						<form:errors path="email" class="error text-danger" />
					</div>
					<div class="col-md-12 form-group">
						<form:input path="fullName" class="form-control"
							placeholder="Full name" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Full name'" />
						<form:errors path="fullName" class="error text-danger" />
					</div>
					<div class="col-md-12 form-group">
						<form:input path="birthDay" type="date" class="form-control"
							placeholder="Birth day" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Birth day'" />
						<form:errors path="birthDay" class="error text-danger" />
					</div>
					<div class="col-md-12 form-group">
						<form:input path="address" class="form-control"
							placeholder="Address" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Address'" />
					</div>
					<div class="col-md-12 form-group">
						<form:input path="addressOrder" class="form-control"
							placeholder="Address order" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Address order'" />
					</div>
					<div class="col-md-12 form-group">
						<div class="form-select">
							<form:select path="gender">
								<form:option value="true">Male</form:option>
								<form:option value="false">Female</form:option>
							</form:select>
						</div>
					</div>
					<div class="col-md-12 form-group">
						<button type="submit" value="submit" class="primary-btn">Change
							information</button>
					</div>
				</form:form></div>
			</div>
		</div>
	</div>
</section>