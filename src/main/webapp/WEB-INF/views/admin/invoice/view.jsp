<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="invoice-view-wrapper section">
	<div class="row">
		<!-- invoice view page -->
		<div class="col xl12 m12 s12">
			<div class="card">
				<div class="card-content invoice-print-area">
					<!-- header section -->
					<div class="row invoice-date-number">
						<div class="col xl8 s12">
							<span class="invoice-number mr-1">Invoice#</span> <span>${order.id }</span>
						</div>
						<div class="col xl4 s12">
							<div
								class="invoice-date display-flex align-items-center flex-wrap">
								<div class="mr-3">
									<small>Date Issue:</small> <span><fmt:formatDate
											pattern="dd-MM-yyyy" value="${order.createdDate }" /></span>
								</div>
							</div>
						</div>
					</div>
					<!-- logo and title -->
					<div class="row mt-3 invoice-logo-title">
						<div class="col m6 s12 display-flex invoice-logo mt-1 push-m6">

						</div>
						<div class="col m6 s12 pull-m6">
							<h4 class="indigo-text">Invoice</h4>
						</div>
					</div>
					<div class="divider mb-3 mt-3"></div>
					<!-- invoice address and contact -->
					<div class="row invoice-info">
						<div class="col m6 s12">
							<h6 class="invoice-from">Bill From</h6>
							<div class="invoice-address">
								<span>Kamar shop online</span>
							</div>
							<div class="invoice-address">
								<span>137 Nguyen Thi Thap, Thanh Khe Tay, Lien Chieu, Da
									Nang</span>
							</div>
							<div class="invoice-address">
								<span>kamarShop@gmail.com</span>
							</div>
							<div class="invoice-address">
								<span>02363710999</span>
							</div>
						</div>
						<div class="col m6 s12">
							<div class="divider show-on-small hide-on-med-and-up mb-3"></div>
							<h6 class="invoice-to">Bill To</h6>
							<div class="invoice-address">
								<span>${order.fullName }</span>
							</div>
							<div class="invoice-address">
								<span>${order.addressOrder }</span>
							</div>
							<div class="invoice-address">
								<span>${order.email }</span>
							</div>
							<div class="invoice-address">
								<span>${order.phone }</span>
							</div>
						</div>
					</div>
					<div class="divider mb-3 mt-3"></div>
					<!-- product details table-->
					<div class="invoice-product-details">
						<table class="striped responsive-table">
							<thead>
								<tr>
									<th>#</th>
									<th>Product name</th>
									<th>Quantity</th>
									<th>Discount</th>
									<th>Price</th>
									<th class="right-align">Total</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="subtotal" value="0" />
								<c:set var="discount" value="0" />
								<c:forEach var="item" items="${order.orderDetails }"
									varStatus="loopCounter">
									<c:set var="subtotal"
										value="${(item.quantity * item.price) + subtotal }" />
									<c:if test="${item.discount > '0' }">
										<c:set var="discount"
											value="${(item.quantity * item.price * item.discount * 0.01) + discount }" />
									</c:if>
									<tr>
										<td>${loopCounter.count}</td>
										<td>${item.product.name }</td>
										<td>${item.quantity }</td>
										<td>${item.discount }%</td>
										<td>$${item.price }</td>
										<td class="indigo-text right-align"><c:if
												test="${item.discount > '0' }">
												$${(item.quantity * item.price) - 
												(item.quantity * item.price * item.discount * 0.01) }
											</c:if> <c:if test="${item.discount <= '0' }">
												$${item.quantity * item.price }
											</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- invoice subtotal -->
					<div class="divider mt-3 mb-3"></div>
					<div class="invoice-subtotal">
						<div class="row">
							<div class="col m5 s12">
								<p>Thanks for your business.</p>
								<ul>
									<li class="display-flex justify-content-between"><span
										class="invoice-subtotal-title">Status: <c:if
												test="${order.status == 'delivered' }">
												<span class="chip green lighten-5"><span
													class="green-text">delivered</span></span>
											</c:if> <c:if test="${order.status == 'being transported' }">
												<span class="chip red lighten-5"><span
													class="orange-text">being transported</span></span>
											</c:if> <c:if test="${order.status == 'waiting' }">
												<span class="chip red lighten-5"><span
													class="red-text">waiting</span></span>
											</c:if></span></li>
									<li class="display-flex justify-content-between"><span
										class="invoice-subtotal-title">Pay: <c:if
												test="${order.pay == 'paypal' }">
												<span class="chip green lighten-5"><span
													class="green-text">paypal</span></span>
											</c:if> <c:if test="${order.pay == 'check payments' }">
												<span class="chip red lighten-5"><span
													class="red-text">check payments</span></span>
											</c:if></span></li>
								</ul>
							</div>
							<div class="col xl4 m7 s12 offset-xl3">
								<ul>
									<li class="display-flex justify-content-between"><span
										class="invoice-subtotal-title">Subtotal</span>
										<h6 class="invoice-subtotal-value">
											$
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${subtotal }" />
										</h6></li>
									<li class="display-flex justify-content-between"><span
										class="invoice-subtotal-title">Discount</span>
										<h6 class="invoice-subtotal-value">
											- $
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${discount }" />
										</h6></li>
									<li class="divider mt-2 mb-2"></li>
									<li class="display-flex justify-content-between"><span
										class="invoice-subtotal-title">Invoice Total</span>
										<h6 class="invoice-subtotal-value">
											$
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${subtotal - discount}" />
										</h6></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- invoice action  -->
		<!-- 		<div class="col xl3 m4 s12"> -->
		<!-- 			<div class="card invoice-action-wrapper"> -->
		<!-- 				<div class="card-content"> -->
		<!-- 					<div class="invoice-action-btn"> -->
		<!-- 						<a href="#" -->
		<!-- 							class="btn indigo waves-effect waves-light display-flex align-items-center justify-content-center"> -->
		<!-- 							<i class="material-icons mr-4">check</i> <span -->
		<!-- 							class="text-nowrap">Send Invoice</span> -->
		<!-- 						</a> -->
		<!-- 					</div> -->
		<!-- 					<div class="invoice-action-btn"> -->
		<!-- 						<a href="#" -->
		<!-- 							class="btn-block btn btn-light-indigo waves-effect waves-light invoice-print"> -->
		<!-- 							<span>Print</span> -->
		<!-- 						</a> -->
		<!-- 					</div> -->
		<!-- 					<div class="invoice-action-btn"> -->
		<!-- 						<a href="app-invoice-edit.html" -->
		<!-- 							class="btn-block btn btn-light-indigo waves-effect waves-light"> -->
		<!-- 							<span>Edit Invoice</span> -->
		<!-- 						</a> -->
		<!-- 					</div> -->
		<!-- 					<div class="invoice-action-btn"> -->
		<!-- 						<a href="#" -->
		<!-- 							class="btn waves-effect waves-light display-flex align-items-center justify-content-center"> -->
		<!-- 							<i class="material-icons mr-3">attach_money</i> <span -->
		<!-- 							class="text-nowrap">Add Payment</span> -->
		<!-- 						</a> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
	</div>
</section>