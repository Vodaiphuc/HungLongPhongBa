<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<aside
	class="sidenav-main nav-expanded nav-lock nav-collapsible sidenav-dark sidenav-active-rounded">
	<div class="brand-sidebar">
		<h1 class="logo-wrapper">
			<a class="brand-logo darken-1" href="/admin/dashboard"><img
				class="hide-on-med-and-down "
				src="<c:url value="/static/admin/assets/images/logo/materialize-logo.png" />"
				alt="materialize logo"><img
				class="show-on-medium-and-down hide-on-med-and-up"
				src="<c:url value="/static/admin/assets/images/logo/materialize-logo-color.png" />"
				alt="materialize logo"><span
				class="logo-text hide-on-med-and-down">Admin</span></a><a
				class="navbar-toggler" href="#"><i class="material-icons">radio_button_checked</i></a>
		</h1>
	</div>
	<ul
		class="sidenav sidenav-collapsible leftside-navigation collapsible sidenav-fixed menu-shadow"
		id="slide-out" data-menu="menu-navigation"
		data-collapsible="accordion">
		<li class="active bold"><a class="waves-effect waves-cyan "
			href="/admin/dashboard"><i class="material-icons">settings_input_svideo</i><span
				class="menu-title">Trang chủ</span></a></li>
		<li class="bold"><a
			class="collapsible-header waves-effect waves-cyan "
			href="JavaScript:void(0)"><i class="material-icons">dvr</i><span
				class="menu-title">Danh mục</span></a>
			<div class="collapsible-body">
				<ul class="collapsible collapsible-sub" data-collapsible="accordion">
					<li><a href="/admin/category-product"><i
							class="material-icons">radio_button_unchecked</i><span>Loại
								sản phẩm</span></a></li>
					<li><a href="/admin/category-blog"><i
							class="material-icons">radio_button_unchecked</i><span>Thể
								loại blog</span></a></li>
					<li><a href="/admin/brand"><i class="material-icons">radio_button_unchecked</i><span>
								Nhãn hiệu</span></a></li>
					<li><a href="/admin/color"><i class="material-icons">radio_button_unchecked</i><span>Màu</span></a>
					</li>
				</ul>
			</div></li>
		<li class="bold"><a class="waves-effect waves-cyan "
			href="/admin/user"><i class="material-icons">group</i><span
				class="menu-title">Khách hàng</span></a></li>
		<li class="bold"><a class="waves-effect waves-cyan "
			href="/admin/product"><i class="material-icons">inventory_2</i><span
				class="menu-title">Sản phẩm</span></a></li>
		<li class="bold"><a class="waves-effect waves-cyan "
			href="/admin/invoice"><i class="material-icons">receipt</i><span
				class="menu-title">Hóa đơn</span></a></li>
		<li class="bold"><a class="waves-effect waves-cyan "
			href="/admin/contact"><i class="material-icons">import_contacts</i><span
				class="menu-title"> Liên hệ</span></a></li>
		<li class="bold"><a class="waves-effect waves-cyan "
			href="/admin/like"><i class="material-icons">favorite</i><span
				class="menu-title">Yêu thích</span></a></li>
		<li class="bold"><a class="waves-effect waves-cyan "
			href="/admin/review"><i class="material-icons">reviews</i><span
				class="menu-title">Đánh giá</span></a></li>
		<li class="bold"><a
			class="collapsible-header waves-effect waves-cyan "
			href="JavaScript:void(0)"><i class="material-icons">query_stats</i><span
				class="menu-title">Thống kê</span></a>
			<div class="collapsible-body">
				<ul class="collapsible collapsible-sub" data-collapsible="accordion">
					<li><a href="/admin/statistical/product"><i
							class="material-icons">radio_button_unchecked</i><span>Theo sản
								phẩm</span></a></li>
					<li><a href="/admin/statistical/user"><i
							class="material-icons">radio_button_unchecked</i><span>Theo khách
								hàng</span></a></li>
					<li><a href="/admin/statistical/revenue"><i
							class="material-icons">radio_button_unchecked</i><span>Theo doanh thu</span></a>
					</li>
				</ul>
			</div></li>
		<li class="navigation-header"><a class="navigation-header-text">Tài khoản
		</a><i class="navigation-header-icon material-icons">more_horiz</i></li>
		<li class="bold"><a class="waves-effect waves-cyan " href="#"><i
				class="material-icons">manage_accounts</i><span class="menu-title">Cập nhật thông tin</span></a></li>
		<li class="bold"><a class="waves-effect waves-cyan " href="#"><i
				class="material-icons">enhanced_encryption</i><span
				class="menu-title">Đổi mật khẩu</span></a></li>
		<li class="bold"><a class="waves-effect waves-cyan "
			href="/admin/dashboard/logout"><i class="material-icons">logout</i><span
				class="menu-title">Đăng xuất</span></a></li>
	</ul>
	<div class="navigation-background"></div>
	<a
		class="sidenav-trigger btn-sidenav-toggle btn-floating btn-medium waves-effect waves-light hide-on-large-only"
		href="#" data-target="slide-out"><i class="material-icons">menu</i></a>
</aside>