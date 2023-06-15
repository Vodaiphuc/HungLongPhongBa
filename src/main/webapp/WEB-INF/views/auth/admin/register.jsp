<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google.">
<meta name="keywords"
	content="materialize, admin template, dashboard template, flat admin template, responsive admin template, eCommerce dashboard, analytic dashboard">
<meta name="author" content="ThemeSelect">
<title>Admin</title>
<link rel="apple-touch-icon"
	href="<c:url value="/static/admin/assets/images/favicon/apple-touch-icon-152x152.png" />">
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value="/static/admin/assets/images/favicon/favicon-32x32.png" />">
<link
	href="<c:url value="/static/admin/icon.css?family=Material+Icons" />"
	rel="stylesheet">
<!-- BEGIN: VENDOR CSS-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/vendors.min.css" />">
<!-- END: VENDOR CSS-->
<!-- BEGIN: Page Level CSS-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/themes/vertical-dark-menu-template/materialize.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/themes/vertical-dark-menu-template/style.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/register.min.css" />">
<!-- END: Page Level CSS-->
<!-- BEGIN: Custom CSS-->
<!-- END: Custom CSS-->
</head>
<!-- END: Head-->
<body
	class="vertical-layout page-header-light vertical-menu-collapsible vertical-dark-menu preload-transitions 1-column register-bg   blank-page blank-page"
	data-open="click" data-menu="vertical-dark-menu" data-col="1-column">
	<div class="row">
		<div class="col s12">
			<div class="container">

				<jsp:include
					page="../../../../WEB-INF/layout/admin/common/message.jsp"></jsp:include>

				<div id="register-page" class="row">
					<div
						class="col s12 m6 l4 z-depth-4 card-panel border-radius-6 register-card bg-opacity-8">
						<form:form action="/auth/admin/register" modelAttribute="register"
							method="post" class="login-form">
							<div class="row">
								<div class="input-field col s12">
									<h5 class="ml-4">Register</h5>
									<p class="ml-4">Join to our community now !</p>
								</div>
							</div>
							<div class="row margin">
								<div class="input-field col s12">
									<i class="material-icons prefix pt-2">person_outline</i>
									<form:input path="fullName" />
									<label for="fullName" class="center-align">Full name</label>
									<form:errors path="fullName" class="error red-text" />
								</div>
							</div>
							<div class="row margin">
								<div class="input-field col s12">
									<i class="material-icons prefix pt-2">mail_outline</i>
									<form:input path="email" />
									<label for="email">Email</label>
									<form:errors path="email" class="error red-text" />
								</div>
							</div>
							<div class="row margin">
								<div class="input-field col s12">
									<i class="material-icons prefix pt-2">lock_outline</i>
									<form:password path="password" />
									<label for="password">Password</label>
									<form:errors path="password" class="error red-text" />
								</div>
							</div>
							<div class="row margin">
								<div class="input-field col s12">
									<i class="material-icons prefix pt-2">lock_outline</i>
									<form:password path="passwordAgain" />
									<label for="passwordAgain">Password again</label>
									<form:errors path="passwordAgain" class="error red-text" />
								</div>
							</div>
							<div class="row margin">
								<div class="input-field col s12">
									<i class="material-icons prefix pt-2">cake</i>
									<form:input path="birthDay" type="date" />
									<label for="birthDay">Birth day</label>
									<form:errors path="birthDay" class="error red-text" />
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<button type="submit"
										class="btn waves-effect waves-light border-round gradient-45deg-purple-deep-orange col s12">Register</button>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s12">
									<p class="margin medium-small">
										<a href="/auth/admin/login">Already have an account? Login</a>
									</p>
								</div>
							</div>
							</form:form>
					</div>
				</div>
			</div>
			<div class="content-overlay"></div>
		</div>
	</div>

	<!-- BEGIN VENDOR JS-->
	<script src="<c:url value="/static/admin/assets/js/vendors.min.js" />"></script>
	<!-- BEGIN VENDOR JS-->
	<!-- BEGIN PAGE VENDOR JS-->
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN THEME  JS-->
	<script src="<c:url value="/static/admin/assets/js/plugins.min.js" />"></script>
	<script src="<c:url value="/static/admin/assets/js/search.min.js" />"></script>
	<!-- END THEME  JS-->
	<!-- BEGIN PAGE LEVEL JS-->
	<!-- END PAGE LEVEL JS-->
</body>
</html>