<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/animate-css/animate.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/chartist-js/chartist.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/chartist-js/chartist-plugin-tooltip.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/flag-icon/css/flag-icon.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/static/admin/assets/vendors/select2/select2.min.css" />"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/sweetalert/sweetalert.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/noUiSlider/nouislider.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/ionRangeSlider/css/ion.rangeSlider.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/ionRangeSlider/css/ion.rangeSlider.skinFlat.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/data-tables/css/jquery.dataTables.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/data-tables/extensions/responsive/css/responsive.dataTables.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/vendors/quill/quill.snow.css" />">
<!-- END: VENDOR CSS-->
<!-- BEGIN: Page Level CSS-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/themes/vertical-dark-menu-template/materialize.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/themes/vertical-dark-menu-template/style.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/index.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/form-select2.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/page-users.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/custom.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/eCommerce-products-page.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/product-form.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/app-invoice.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/app-sidebar.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/app-email.min.css" />">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/static/admin/assets/css/pages/app-email-content.min.css" />">
<!-- END: Page Level CSS-->

</head>
<body
	class="vertical-layout page-header-light vertical-menu-collapsible vertical-dark-menu preload-transitions 2-columns   "
	data-open="click" data-menu="vertical-dark-menu" data-col="2-columns">

	<jsp:include page="/WEB-INF/layout/admin/common/message.jsp"></jsp:include>

	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="menu" />

	<div id="main">
		<div class="row">
			<div class="content-wrapper-before blue-grey lighten-5"></div>
			<div class="col s12">
				<div class="container">

					<tiles:insertAttribute name="body" />

				</div>
				<div class="content-overlay"></div>
			</div>
		</div>
	</div>

	<tiles:insertAttribute name="footer" />

	<!-- END: Footer-->
	<!-- BEGIN VENDOR JS-->
	<script src="<c:url value="/static/admin/assets/js/vendors.min.js" />"></script>
	<!-- BEGIN VENDOR JS-->
	<!-- BEGIN PAGE VENDOR JS-->
	<script
		src="<c:url value="/static/admin/assets/vendors/sparkline/jquery.sparkline.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/chartjs/chart.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/chartist-js/chartist.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/chartist-js/chartist-plugin-tooltip.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/chartist-js/chartist-plugin-fill-donut.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/select2/select2.full.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/sweetalert/sweetalert.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/moment/moment.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/noUiSlider/nouislider.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/ionRangeSlider/js/ion.rangeSlider.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/data-tables/js/jquery.dataTables.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/data-tables/extensions/responsive/js/dataTables.responsive.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/vendors/quill/quill.min.js" />"></script>
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN THEME  JS-->
	<script src="<c:url value="/static/admin/assets/js/plugins.min.js" />"></script>
	<script src="<c:url value="/static/admin/assets/js/search.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/customizer.min.js" />"></script>
	<!-- END THEME  JS-->
	<!-- BEGIN PAGE LEVEL JS-->
	<script
		src="<c:url value="/static/admin/assets/js/scripts/dashboard-modern.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/form-select2.min.js" />"></script>
	<script src="<c:url value="/static/admin/assets/js/scripts/user.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/category-product.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/category-blog.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/brand.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/color.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/product-list.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/eCommerce-products-page.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/product-form.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/invoice.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/app-email.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/app-email-content.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/app-like.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/app-review.min.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/statistical-product.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/statistical-user.js" />"></script>
	<script
		src="<c:url value="/static/admin/assets/js/scripts/statistical-revenue.js" />"></script>
	<!-- END PAGE LEVEL JS-->

</body>
</html>