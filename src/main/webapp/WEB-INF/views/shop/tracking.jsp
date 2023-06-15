<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Order tracking</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/tracking">Tracking</a>
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
			<p>To track your order please enter your Order ID in the box
				below and press the "Track" button. This was given to you on your
				receipt and in the confirmation email you should have received.</p>
			<form class="row tracking_form" action="/shop/tracking/submit">
				<div class="col-md-12 form-group">
					<input type="text" class="form-control" id="id_cart" name="id_cart"
						placeholder="Order ID" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Order ID'">
				</div>
				<div class="col-md-12 form-group">
					<button type="submit" value="submit" class="primary-btn">Track
						Order</button>
				</div>
			</form>
		</div>
	</div>
</section>