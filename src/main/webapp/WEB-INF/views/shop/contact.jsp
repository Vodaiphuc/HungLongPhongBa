<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Liên hệ với chúng tôi</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/contact">Liên hệ với chúng tôi</a>
				</nav>
			</div>
		</div>
	</div>
</section>
<section class="contact_area section_gap_bottom section_gap_top">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="contact_info">
					<div class="info_item">
						<i class="lnr lnr-home"></i>
						<h6>Cái Răng,TP Cần Thơ</h6>
						<p>Đường số 8, Thường Thạnh, Cái Răng, Cần Thơ</p>
					</div>
					<div class="info_item">
						<i class="lnr lnr-phone-handset"></i>
						<h6>
							<a href="#">(0292) 7300 468 </a>
						</h6>
						<p>Thứ Hai đến Thứ Sáu 9 giờ sáng đến 6 giờ chiều</p>
					</div>
					<div class="info_item">
						<i class="lnr lnr-envelope"></i>
						<h6>
							<a href="#">phucvdpc03426@fpt.edu.vn</a>
						</h6>
						<p>Hãy gửi câu hỏi của bạn bất cứ lúc nào! Tôi sẽ cố gắng trả
							lời nhanh nhất có thể.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<form:form action="/shop/contact/submit" modelAttribute="contact"
					method="post" class="row contact_form" id="contactForm">
					<div class="col-md-6">
						<div class="form-group">
							<form:input path="fullName" class="form-control"
								placeholder="Enter your full name"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Enter your full name'" />
							<form:errors path="fullName" class="error text-danger" />
						</div>
						<div class="form-group">
							<form:input path="email" class="form-control"
								placeholder="Enter email address"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Enter email address'" />
							<form:errors path="email" class="error text-danger" />
						</div>
						<div class="form-group">
							<form:input path="subject" class="form-control"
								placeholder="Enter subject" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Enter subject'" />
							<form:errors path="subject" class="error text-danger" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<form:textarea path="message" class="form-control" rows="1"
								placeholder="Enter message" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Enter message'" />
							<form:errors path="message" class="error text-danger" />
						</div>
					</div>
					<div class="col-md-12 text-right">
						<button type="submit" value="submit" class="primary-btn">Gửi
							tin nhắn</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</section>

