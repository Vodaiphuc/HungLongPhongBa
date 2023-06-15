<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:if test="${not empty message}">
	<div class="card-alert card gradient-45deg-green-teal"
		style="position: absolute; bottom: 20px; right: 20px; min-width: 400px; z-index: 2;">
		<div class="card-content white-text">
			<p>
				<i class="material-icons">check</i> SUCCESS :
				<c:out value="${message}" />
			</p>
		</div>
		<button type="button" class="close white-text" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">×</span>
		</button>
	</div>
</c:if>

<c:if test="${not empty error}">
	<div class="card-alert card gradient-45deg-red-pink"
		style="position: absolute; bottom: 20px; right: 20px; min-width: 400px; z-index: 2;">
		<div class="card-content white-text">
			<p>
				<i class="material-icons">error</i> ERROR :
				<c:out value="${error}" />
			</p>
		</div>
		<button type="button" class="close white-text" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">×</span>
		</button>
	</div>
</c:if>