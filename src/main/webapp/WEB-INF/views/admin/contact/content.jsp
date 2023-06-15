<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@taglib
	uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="app-email-content">
	<div class="content-area">
		<div class="app-wrapper">
			<div class="card card-default scrollspy border-radius-6 fixed-width">
				<div class="card-content pt-0">
					<div class="row">
						<div class="col s12">
							<!-- Email Header -->
							<div class="email-header">
								<div class="subject">
									<div class="back-to-mails">
										<a href="/admin/contact"><i class="material-icons">arrow_back</i></a>
									</div>
									<div class="email-title">${contact.subject }</div>
								</div>
							</div>
							<!-- Email Header Ends -->
							<hr>
							<!-- Email Content -->
							<div class="email-content">
								<div class="list-title-area">
									<div class="user-media">
										<div class="list-title">
											<span class="name">${contact.fullName }</span>
										</div>
									</div>
									<div class="title-right">
										<span class="mail-time"><fmt:formatDate type="both"
												value="${contact.createdDate }" /></span>
									</div>
								</div>
								<div class="email-desc">
									<p>${contact.message }</p>
								</div>
							</div>
							<!-- Email Content Ends -->
							<hr>
							<!-- Email Footer -->
							<div class="email-footer">
								<div class="reply-box">
									<form action="#">
										<div class="input-field col s12">
											<div class="snow-container mt-2">
												<div class="compose-editor"></div>
											</div>
										</div>
										<div class="input-field col s12">
											<a class="btn reply-btn right">Reply</a>
										</div>
									</form>
								</div>
							</div>
							<!-- Email Footer Ends -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>