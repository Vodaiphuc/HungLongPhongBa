<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon"
	href="<c:url value="/static/shop/img/fav.png" />">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Karma Shop</title>
<!--
		CSS
		============================================= -->
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/linearicons.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/font-awesome.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/themify-icons.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/owl.carousel.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/nice-select.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/nouislider.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/ion.rangeSlider.css" />" />
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/ion.rangeSlider.skinFlat.css" />" />
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/magnific-popup.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/shop/css/main.css" />">
</head>

<body>

	<tiles:insertAttribute name="menu" />

	<tiles:insertAttribute name="body" />

	<tiles:insertAttribute name="footer" />

	<script
		src="<c:url value="/static/shop/js/vendor/jquery-2.2.4.min.js" />"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="<c:url value="/static/shop/js/vendor/bootstrap.min.js" />"></script>
	<script src="<c:url value="/static/shop/js/jquery.ajaxchimp.min.js" />"></script>
	<script
		src="<c:url value="/static/shop/js/jquery.nice-select.min.js" />"></script>
	<script src="<c:url value="/static/shop/js/jquery.sticky.js" />"></script>
	<script src="<c:url value="/static/shop/js/nouislider.min.js" />"></script>
	<script src="<c:url value="/static/shop/js/countdown.js" />"></script>
	<script
		src="<c:url value="/static/shop/js/jquery.magnific-popup.min.js" />"></script>
	<script src="<c:url value="/static/shop/js/owl.carousel.min.js" />"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="<c:url value="/static/shop/js/gmaps.min.js" />"></script>
	<script src="<c:url value="/static/shop/js/main.js" />"></script>
	<script src="<c:url value="/static/shop/js/cart.js" />"></script>
</body>

</html>