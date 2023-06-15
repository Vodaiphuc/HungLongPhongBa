<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Confirmation</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/cart">Cart<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/checkout">Checkout<span
						class="lnr lnr-arrow-right"></span></a> <a href="/shop/confirmation">Confirmation<span
						class="lnr lnr-arrow-right"></span></a>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="order_details section_gap">
	<div class="container">
		<c:if test="${empty list }">
			<h3 class="title_confirmation text-center text-danger m-4">You
				have not rated any products yet.</h3>
		</c:if>
		<c:if test="${not empty list }">
			<c:set var="totailCart" value="0" />
			<c:set var="subtotal" value="0" />
			<c:set var="totalDiscount" value="0" />
			<c:forEach var="item" items="${list }" varStatus="loopCounter">
				<c:if test="${item.discount > '0' }">
					<c:set var="totailCart"
						value="${((item.price * item.quantity) - (item.price * item.quantity * item.discount * 0.01)) + totailCart }" />
				</c:if>
				<c:if test="${item.discount == '0' }">
					<c:set var="totailCart"
						value="${(item.price * item.quantity) + totailCart }" />
				</c:if>
				<c:set var="subtotal"
					value="${(item.price * item.quantity) + subtotal }" />
				<c:if test="${item.discount > '0' }">
					<c:set var="totalDiscount"
						value="${(item.price * item.quantity * item.discount * 0.01) + totalDiscount }" />
				</c:if>
				<c:if test="${item.discount == '0' }">
					<c:set var="totalDiscount" value="${totalDiscount }" />
				</c:if>
			</c:forEach>
			<h3 class="title_confirmation">Thank you. Your order has been
				received.</h3>
			<div class="row order_d_inner">
				<div class="col-lg-6">
					<div class="details_item">
						<h4>Order Info</h4>
						<ul class="list">
							<li><a href="#"><span>Order id</span> : ${order.id }</a></li>
							<li><a href="#"><span>Date</span> : <fmt:formatDate
										pattern="dd-MM-yyyy" value="${order.createdDate }" /></a></li>
							<li><a href="#"><span>Total</span> : $${totailCart }</a></li>
							<li><a href="#"><span>Payment method</span> :
									${order.pay }</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="details_item">
						<h4>Shipping Address</h4>
						<ul class="list">
							<li><a href="#"><span>Full name</span> :
									${order.fullName }</a></li>
							<li><a href="#"><span>Email</span> : ${order.email }</a></li>
							<li><a href="#"><span>Address</span> :
									${order.addressOrder }</a></li>
							<li><a href="#"><span>Postcode </span> : ${order.zip }</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="order_details_table">
				<h2>
					Order Details -
					<c:if test="${order.status == 'waiting' }">
						<span class="text-danger">${order.status }</span>
					</c:if>
					<c:if test="${order.status == 'being transported' }">
						<span class="text-warning">${order.status }</span>
					</c:if>
					<c:if test="${order.status == 'delivered' }">
						<span class="text-success">${order.status }</span>
					</c:if>
				</h2>
				<div class="table-responsive">
					<table class="table text-center">
						<thead>
							<tr>
								<th scope="col">Product</th>
								<th scope="col">Quantity
									<p>(*1*)</p>
								</th>
								<th scope="col">Discount
									<p>(*2*)</p>
								</th>
								<th scope="col">Price
									<p>(*3*)</p>
								</th>
								<th scope="col">Total
									<p>(*4 = (1 * 3) - (1 * 3 * 2%)*)</p>
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list }" varStatus="loopCounter">
								<tr>
									<td>
										<p>${item.product.name }</p>
									</td>
									<td>
										<h5>x ${item.quantity }</h5>
									</td>
									<td>
										<h5>${item.discount }%</h5>
									</td>
									<td>
										<p>$${item.price }</p>
									</td>
									<td>
										<p>
											<c:if test="${item.discount > '0' }">
										$${item.price * item.quantity - (item.price * item.quantity * item.discount * 0.01) }
											</c:if>
											<c:if test="${item.discount == '0' }">
										$${item.price * item.quantity }
											</c:if>
										</p>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td>
									<h4>Subtotal</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>$${subtotal }</p>
								</td>
							</tr>
							<tr>
								<td>
									<h4>TotalDiscount</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>$${totalDiscount }</p>
								</td>
							</tr>
							<tr>
								<td>
									<h4>Total</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>$${totailCart }</p>
								</td>
							</tr>
							<tr>
								<td><a href="/shop/home"
									class="genric-btn info circle arrow">Submit<span
										class="lnr lnr-arrow-right"></span></a></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</div>
</section>