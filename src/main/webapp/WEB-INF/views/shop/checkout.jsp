<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Thủ tục thanh toán</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Trang Chủ<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/cart">Giỏ hàng<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/checkout">Thủ tục thanh toán </a>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="checkout_area section_gap">
	<div class="container">
		<c:if test="${empty cart }">
			<h3 class="title_confirmation text-center text-danger m-4">Bạn
				không có sản phẩm nào trong giỏ hàng của bạn .</h3>
		</c:if>
		<c:if test="${not empty cart }">
			<c:if test="${sessionScope['shop'] == null}">
				<div class="returning_customer">
					<div class="check_title">
						<h2>
							Phản hồi khách hàng? <a href="/shop/account/login">Nhấn vào
								đây để đăng nhập </a>
						</h2>
					</div>
					<p>Nếu bạn đã mua sắm với chúng tôi trước đây, vui lòng nhập
						thông tin chi tiết của bạn vào các ô bên dưới. Nếu bạn là khách
						hàng mới, vui lòng chuyển sang phần Thanh toán & Vận chuyển.</p>
					<div class="col-md-12 form-group">
						<a class="lost_pass" href="/shop/account/forgot-password">Quên
							mật khẩu? </a>
					</div>
				</div>
			</c:if>
			<div class="billing_details">
				<form:form action="/shop/checkout/submit" modelAttribute="order"
					method="post">
					<div class="row">
						<div class="col-lg-6">
							<h3>Chi tiết thanh toán</h3>
							<c:if test="${not empty error}">
								<b class="error text-danger"> <c:out value="${error}" />
								</b>
							</c:if>
							<div class="row contact_form">
								<div class="col-md-12 form-group">
									<form:input path="fullName" class="form-control"
										placeholder="Full name" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Full name'" />
									<form:errors path="fullName" class="error text-danger" />
								</div>
								<div class="col-md-6 form-group p_star">
									<form:input path="phone" class="form-control"
										placeholder="Phone number" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Phone number'" />
									<form:errors path="phone" class="error text-danger" />
								</div>
								<div class="col-md-6 form-group p_star">
									<form:input path="email" class="form-control"
										placeholder="Email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Email'" />
									<form:errors path="email" class="error text-danger" />
								</div>
								<div class="col-md-12 form-group p_star">
									<form:input path="birthDay" type="date" class="form-control"
										placeholder="Birth day" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Birth day'" />
									<form:errors path="birthDay" class="error text-danger" />
								</div>
								<div class="col-md-12 form-group p_star">
									<form:input path="addressOrder" class="form-control"
										placeholder="Address order" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Address order'" />
									<form:errors path="addressOrder" class="error text-danger" />
								</div>
								<div class="col-md-12 form-group">
									<form:input path="zip" class="form-control"
										placeholder="Postcode/ZIP" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Postcode/ZIP'" />
									<form:errors path="zip" class="error text-danger" />
								</div>
								<div class="col-md-12 form-group">
									<div class="creat_account">
										<h3>chi tiết vận chuyển</h3>
									</div>
									<form:textarea path="note" class="form-control" rows="1"
										placeholder="Order Notes"></form:textarea>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="order_box">
								<h2>đơn đặt hàng của bạn</h2>
								<c:set var="subtotal" value="0" />
								<c:set var="totalDiscount" value="0" />
								<ul class="list">
									<li><a href="#">Sản phẩm <span>Tổng cộng</span></a></li>
									<c:forEach var="item" items="${cart }" varStatus="loopCounter">
										<li><a href="/shop/product-detail?id=${item.product_id }">${item.name }
												<span class="middle">x ${item.quantity }</span> <span
												class="last">$${item.price * item.quantity }</span>
										</a></li>
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
								</ul>
								<ul class="list list_2">
									<li><a href="#">tổng phụ <span>$${subtotal }</span></a></li>
									<li><a href="#">Tổng khấu trừ <span>$${totalDiscount
												}</span></a></li>
									<li><a href="#">Tổng cộng <span>$${subtotal -
												totalDiscount }</span></a></li>
								</ul>
								<div class="payment_item">
									<div class="radion_btn">
										<form:radiobutton path="pay" id="f-option5" name="pay"
											checked="checked" value="check payments" />
										<label for="f-option5">Kiểm tra thanh toán </label>
										<div class="check"></div>
									</div>
									<p>Vui lòng gửi séc tới Tên cửa hàng, Phố cửa hàng, Thị
										trấn cửa hàng, Bang / Hạt cửa hàng, Mã bưu điện cửa hàng.</p>
								</div>
								<div class="payment_item active">
									<div class="radion_btn">
										<form:radiobutton path="pay" id="f-option6" name="pay"
											value="paypal" />
										<label for="f-option6">Paypal </label> <img
											src="<c:url value="/static/shop/img/product/card.jpg" />"
											alt="">
										<div class="check"></div>
									</div>
									<p>Thanh toán qua PayPal; bạn có thể thanh toán bằng thẻ
										tín dụng nếu bạn không có tài khoản PayPal.</p>
								</div>
								<button class="primary-btn" type="submit">Tiến hành
									Paypal</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</c:if>
	</div>
</section>