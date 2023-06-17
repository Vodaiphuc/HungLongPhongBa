<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="invoice-view-wrapper section">
	<div class="row">
		<!-- Trang xem hóa đơn -->
		<div class="col xl12 m12 s12">
			<div class="card">
				<div class="card-content invoice-print-area">
					<!-- Phần tiêu đề -->
					<div class="row invoice-date-number">
						<div class="col xl8 s12">
							<span class="invoice-number mr-1">Số hóa đơn:</span> <span>${order.id}</span>
						</div>
						<div class="col xl4 s12">
							<div class="invoice-date display-flex align-items-center flex-wrap">
								<div class="mr-3">
									<small>Ngày phát hành:</small> <span><fmt:formatDate pattern="dd-MM-yyyy" value="${order.createdDate}" /></span>
								</div>
							</div>
						</div>
					</div>
					<!-- Logo và tiêu đề -->
					<div class="row mt-3 invoice-logo-title">
						<div class="col m6 s12 display-flex invoice-logo mt-1 push-m6">

						</div>
						<div class="col m6 s12 pull-m6">
							<h4 class="indigo-text">Hóa đơn</h4>
						</div>
					</div>
					<div class="divider mb-3 mt-3"></div>
					<!-- Địa chỉ và thông tin liên hệ trong hóa đơn -->
					<div class="row invoice-info">
						<div class="col m6 s12">
							<h6 class="invoice-from">Người gửi</h6>
							<div class="invoice-address">
								<span>Hùng Long Phong Bá shop online</span>
							</div>
							<div class="invoice-address">
								<span>137 Nguyễn Thị Thập, Thanh Khê Tây, Liên Chiểu, Đà Nẵng</span>
							</div>
							<div class="invoice-address">
								<span>hunglongphongba@gmail.com</span>
							</div>
							<div class="invoice-address">
								<span>02363710999</span>
							</div>
						</div>
						<div class="col m6 s12">
							<div class="divider show-on-small hide-on-med-and-up mb-3"></div>
							<h6 class="invoice-to">Người nhận</h6>
							<div class="invoice-address">
								<span>${order.fullName}</span>
							</div>
							<div class="invoice-address">
								<span>${order.addressOrder}</span>
							</div>
							<div class="invoice-address">
								<span>${order.email}</span>
							</div>
							<div class="invoice-address">
								<span>${order.phone}</span>
							</div>
						</div>
					</div>
					<div class="divider mb-3 mt-3"></div>
					<!-- Bảng chi tiết sản phẩm -->
					<div class="invoice-product-details">
						<table class="striped responsive-table">
							<thead>
								<tr>
									<th>#</th>
									<th>Tên sản phẩm</th>
									<th>Số lượng</th>
									<th>Giảm giá</th>
									<th>Giá</th>
									<th class="right-align">Tổng cộng</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="subtotal" value="0" />
								<c:set var="discount" value="0" />
								<c:forEach var="item" items="${order.orderDetails}" varStatus="loopCounter">
									<c:set var="subtotal" value="${(item.quantity * item.price) + subtotal}" />
									<c:if test="${item.discount > '0'}">
										<c:set var="discount" value="${(item.quantity * item.price * item.discount * 0.01) + discount}" />
									</c:if>
									<tr>
										<td>${loopCounter.count}</td>
										<td>${item.product.name}</td>
										<td>${item.quantity}</td>
										<td>${item.discount}%</td>
										<td>$${item.price}</td>
										<td class="indigo-text right-align">
											<c:if test="${item.discount > '0'}">
												$${(item.quantity * item.price) - (item.quantity * item.price * item.discount * 0.01)}
											</c:if>
											<c:if test="${item.discount <= '0'}">
												$${item.quantity * item.price}
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- Tổng cộng hóa đơn -->
					<div class="divider mt-3 mb-3"></div>
					<div class="invoice-subtotal">
						<div class="row">
							<div class="col m5 s12">
								<p>Cảm ơn bạn đã mua hàng.</p>
								<ul>
									<li class="display-flex justify-content-between">
										<span class="invoice-subtotal-title">Trạng thái: 
											<c:if test="${order.status == 'delivered'}">
												<span class="chip green lighten-5">
													<span class="green-text">Đã giao</span>
												</span>
											</c:if> 
											<c:if test="${order.status == 'being transported'}">
												<span class="chip red lighten-5">
													<span class="orange-text">Đang vận chuyển</span>
												</span>
											</c:if> 
											<c:if test="${order.status == 'waiting'}">
												<span class="chip red lighten-5">
													<span class="red-text">Đang chờ</span>
												</span>
											</c:if>
										</span>
									</li>
									<li class="display-flex justify-content-between">
										<span class="invoice-subtotal-title">Phương thức thanh toán: 
											<c:if test="${order.pay == 'paypal'}">
												<span class="chip green lighten-5">
													<span class="green-text">Paypal</span>
												</span>
											</c:if> 
											<c:if test="${order.pay == 'check payments'}">
												<span class="chip red lighten-5">
													<span class="red-text">Kiểm tra thanh toán</span>
												</span>
											</c:if>
										</span>
									</li>
								</ul>
							</div>
							<div class="col xl4 m7 s12 offset-xl3">
								<ul>
									<li class="display-flex justify-content-between">
										<span class="invoice-subtotal-title">Tổng cộng</span>
										<h6 class="invoice-subtotal-value">
											$
											<fmt:formatNumber type="number" maxIntegerDigits="3" value="${subtotal}" />
										</h6>
									</li>
									<li class="display-flex justify-content-between">
										<span class="invoice-subtotal-title">Giảm giá</span>
										<h6 class="invoice-subtotal-value">
											- $
											<fmt:formatNumber type="number" maxIntegerDigits="3" value="${discount}" />
										</h6>
									</li>
									<li class="divider mt-2 mb-2"></li>
									<li class="display-flex justify-content-between">
										<span class="invoice-subtotal-title">Tổng số tiền</span>
										<h6 class="invoice-subtotal-value">
											$
											<fmt:formatNumber type="number" maxIntegerDigits="3" value="${subtotal - discount}" />
										</h6>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
