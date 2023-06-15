<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="app-email">
	<div class="content-area content-right">
		<div class="app-wrapper">
			<form action="/admin/contact">
				<div class="app-search">
					<i class="material-icons mr-2 search-icon"
						onchange="this.form.submit()">search</i> <input type="text" name="keywords"
						placeholder="Search full name" class="app-filter"
						id="email_filter">
				</div>
			</form>
			<div
				class="card card card-default scrollspy border-radius-6 fixed-width">
				<div class="card-content p-0 pb-2">
					<div class="collection email-collection">
						<c:if test="${not empty list }">
							<c:forEach var="item" items="${list }" varStatus="loopCounter">
								<div
									class="email-brief-info collection-item animate fadeUp delay-1">
									<a class="list-content"
										href="/admin/contact/view?id=${item.id }">
										<div class="list-title-area">
											<div class="user-media">
												<div class="list-title">${item.fullName }</div>
											</div>
										</div>
										<div class="list-desc">${item.message }</div>
									</a>
									<div class="list-right">
										<div class="list-date">
											<fmt:formatDate type="both" value="${item.createdDate }" />
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<div class="collection-item text-center">
								<h6 class="center-align font-weight-500">No Results Found</h6>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>