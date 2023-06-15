<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<section class="banner-area organic-breadcrumb">
	<div class="container">
		<div
			class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
			<div class="col-first">
				<h1>Contact us</h1>
				<nav class="d-flex align-items-center">
					<a href="/shop/home">Home<span class="lnr lnr-arrow-right"></span></a>
					<a href="/shop/contact">Contact us</a>
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
						<h6>TP Da Nang, Viet Nam</h6>
						<p>137 Nguyen Thi Thap, Thanh Khe Tay, Lien Chieu, Da Nang</p>
					</div>
					<div class="info_item">
						<i class="lnr lnr-phone-handset"></i>
						<h6>
							<a href="#">02363710999</a>
						</h6>
						<p>Mon to Fri 9am to 6 pm</p>
					</div>
					<div class="info_item">
						<i class="lnr lnr-envelope"></i>
						<h6>
							<a href="#">kamarShop@gmail.com</a>
						</h6>
						<p>Send us your query anytime!</p>
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
						<button type="submit" value="submit" class="primary-btn">Send
							Message</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</section>

