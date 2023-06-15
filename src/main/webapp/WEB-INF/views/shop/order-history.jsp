<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Order history</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/order-history">Order history</a>
				</nav>
			</div>
		</div>
	</div>
</section>

<div class="whole-wrap pb-100 m-4">
	<div class="container">
		<div class="section">
			<c:if test="${empty list }">
				<h3 class="title_confirmation text-center text-danger m-4">You
					don't have any orders yet.</h3>
			</c:if>
			<c:if test="${not empty list }">
				<div class="progress-table-wrap">
					<div class="progress-table">
						<div class="table-head">
							<div class="serial">#</div>
							<div class="image">ID order</div>
							<div class="name">Status</div>
							<div class="day">Pay</div>
							<div class="action">Action</div>
						</div>
						<c:forEach var="item" items="${list }" varStatus="loopCounter">
							<div class="table-row">
								<div class="serial">${loopCounter.count}</div>
								<div class="image">${item.id }</div>
								<div class="name">
									<c:if test="${item.status == 'waiting' }">
										<span class="text-danger">${item.status }</span>
									</c:if>
									<c:if test="${item.status == 'being transported' }">
										<span class="text-warning">${item.status }</span>
									</c:if>
									<c:if test="${item.status == 'delivered' }">
										<span class="text-success">${item.status }</span>
									</c:if>
								</div>
								<div class="day">
									<c:if test="${item.pay == 'paypal' }">
										<span class="text-danger">${item.pay }</span>
									</c:if>
									<c:if test="${item.pay == 'check payments' }">
										<span class="text-success">${item.pay }</span>
									</c:if>
								</div>
								<div class="action">
									<a href="/shop/confirmation?id_cart=${item.id }"
										class="genric-btn info radius">View</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>