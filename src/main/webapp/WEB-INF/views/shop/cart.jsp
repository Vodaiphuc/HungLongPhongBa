<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Giỏ Hàng</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/cart">Giỏ hàng</a>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="cart_area">
	<div class="container">
		<c:if test="${empty cart }">
			<h3 class="title_confirmation text-center text-danger m-4">Bạn
				không có sản phẩm nào trong giỏ hàng của bạn .</h3>
		</c:if>
		<c:if test="${not empty cart }">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Sản phẩm</th>
								<th scope="col">Giá</th>
								<th scope="col">Giảm giá</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Tổng Tiền</th>
								<th scope="col">Hoạt động</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="totailCart" value="0" />
							<c:forEach var="item" items="${cart }" varStatus="loopCounter">
								<tr>
									<td>${loopCounter.count}</td>
									<td>
										<div class="media">
											<div class="d-flex">
												<a href="/shop/product-detail?id=${item.product_id }"><img
													src="/uploads/${item.image }" alt=""
													style="max-width: 150px;"></a>
											</div>
											<div class="media-body">
												<p>${item.name }</p>
											</div>
										</div>
									</td>
									<td>
										<h5 id="price${loopCounter.count}">$${item.price }</h5>
									</td>
									<td>
										<h5 id="discount${loopCounter.count}">${item.discount }%</h5>
									</td>
									<td>
										<div class="product_count">
											<input type="text" name="qty" id="sst${loopCounter.count}"
												maxlength="12" value="${item.quantity }" title="Quantity:"
												class="input-text qty" disabled="disabled">
											<button data-id="${item.product_id }"
												data-name="${loopCounter.count}"
												onclick="increase(this.getAttribute('data-id'),this.getAttribute('data-name'))"
												id="increase" class="increase items-count">
												<i class="lnr lnr-chevron-up"></i>
											</button>
											<button data-id="${item.product_id }"
												data-name="${loopCounter.count}"
												onclick="reduced(this.getAttribute('data-id') ,this.getAttribute('data-name'))"
												id="reduced" class="reduced items-count">
												<i class="lnr lnr-chevron-down"></i>
											</button>
										</div>
									</td>
									<td>
										<h5 id="totail${loopCounter.count}">
											<c:if test="${item.discount > '0' }">
										$${item.price * item.quantity - (item.price * item.quantity * item.discount * 0.01) }
										<c:set var="totailCart"
													value="${((item.price * item.quantity) - (item.price * item.quantity * item.discount * 0.01)) + totailCart }" />
											</c:if>
											<c:if test="${item.discount == '0' }">
										$${item.price * item.quantity }
										<c:set var="totailCart"
													value="${(item.price * item.quantity) + totailCart }" />
											</c:if>
										</h5>
									</td>
									<td><a class="icon_btn"
										href="/shop/cart/remove?id=${item.product_id }"><i
											class="lnr lnr-cross text-danger font-weight-bold"></i></a></td>
								</tr>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<h5>tổng phụ</h5>
								</td>
								<td>
									<h5 id="totailCart">$${totailCart }</h5>
								</td>
								<td></td>
							</tr>
							<tr class="out_button_area">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<div class="checkout_btn_inner d-flex align-items-center">
										<a class="gray_btn" href="/shop/shop-category">Tiếp tục
											mua sắm </a> <a class="primary-btn" href="/shop/checkout">Tiến hành kiểm tra

</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</div>
</section>
