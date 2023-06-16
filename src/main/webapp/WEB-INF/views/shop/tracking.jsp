<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>theo dõi đơn hàng</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/tracking">theo dõi </a>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="tracking_box_area section_gap">
	<div class="container">
		<c:if test="${not empty error}">
			<b class="error text-danger"> <c:out value="${error}" />
			</b>
		</c:if>
		<div class="tracking_box_inner">
			<p>Để theo dõi đơn hàng của bạn, vui lòng nhập ID đơn hàng của
				bạn vào ô bên dưới và nhấn nút "Theo dõi". Điều này đã được trao cho
				bạn trên của bạn biên nhận và trong email xác nhận mà lẽ ra bạn phải
				nhận được.</p>
			<form class="row tracking_form" action="/shop/tracking/submit">
				<div class="col-md-12 form-group">
					<input type="text" class="form-control" id="id_cart" name="id_cart"
						placeholder="Order ID" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Order ID'">
				</div>
				<div class="col-md-12 form-group">
					<button type="submit" value="submit" class="primary-btn">Theo
						dõi Đặt hàng</button>
				</div>
			</form>
		</div>
	</div>
</section>