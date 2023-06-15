<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="section users-view">
	<!-- users view media object start -->
	<div class="card-panel">
		<div class="row">
			<div class="col s12 m7">
				<div class="display-flex media">
					<a href="#" class="avatar"> <img src="/uploads/${user.avatar }"
						alt="users view avatar" class="z-depth-4 circle" height="64"
						width="64">
					</a>
					<div class="media-body">
						<h6 class="media-heading">
							<span class="users-view-name">${user.fullName } </span>
						</h6>
						<span>ID:</span> <span class="users-view-id">${user.id }</span>
					</div>
				</div>
			</div>
			<div
				class="col s12 m5 quick-action-btns display-flex justify-content-end align-items-center pt-2">
				<a href="#" class="btn-small btn-light-indigo"><i
					class="material-icons">mail_outline</i></a> <a href="/admin/user/edit?id=${user.id }"
					class="btn-small indigo">Edit</a>
			</div>
		</div>
	</div>
	<!-- users view media object ends -->
	<!-- users view card data start -->
	<div class="card">
		<div class="card-content">
			<div class="row">
				<div class="col s12">
					<table class="striped">
						<tbody>
							<tr>
								<td>Created day:</td>
								<td><fmt:formatDate type="both"
										value="${user.createdDate }" /></td>
							</tr>
							<tr>
								<td>Update day:</td>
								<td><fmt:formatDate type="both"
										value="${user.lastModifiedDate }" /></td>
							</tr>
							<tr>
								<td>Last login day:</td>
								<td><fmt:formatDate type="both"
										value="${user.lastLoginDate }" /></td>
							</tr>
							<tr>
								<td>Role:</td>
								<td><c:if test="${user.role == 'true' }">Admin</c:if> <c:if
										test="${user.role == 'false' }">User</c:if></td>
							</tr>
							<tr>
								<td>Status:</td>
								<td><c:if test="${user.login == 'true' }">
										<span
											class=" users-view-status chip green lighten-5 green-text">Active</span>
									</c:if> <c:if test="${user.login == 'false' }">
										<span class=" users-view-status chip red lighten-5 red-text">UnActive</span>
									</c:if></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- users view card data ends -->

	<!-- users view card details start -->
	<div class="card">
		<div class="card-content">
			<div class="row">
				<div class="col s12">
					<h6 class="mb-2 mt-2">
						<i class="material-icons">error_outline</i> Personal Info
					</h6>
					<table class="striped">
						<tbody>
							<tr>
								<td>Full name:</td>
								<td>${user.fullName }</td>
							</tr>
							<tr>
								<td>Email:</td>
								<td>${user.email }</td>
							</tr>
							<tr>
								<td>Gender:</td>
								<td><c:choose>
										<c:when test="${user.gender == 'true'}">
											Male
										</c:when>
										<c:when test="${user.gender == 'false'}">
											Female
										</c:when>
										<c:otherwise>
											<p class="text-muted">Updatting...</p>
										</c:otherwise>
									</c:choose></td>
							</tr>
							<tr>
								<td>Birthday:</td>
								<td><c:if test="${user.birthDay != null || user.birthDay != '' }">
										<fmt:formatDate pattern="dd-MM-yyyy" value="${user.birthDay }" />
									</c:if> <c:if test="${user.birthDay == null }">
										<p class="text-muted">Updatting...</p>
									</c:if></td>
							</tr>
							<tr>
								<td>Address:</td>
								<td><c:if test="${user.address != null || user.address != '' }">
										${user.address }
									</c:if> <c:if test="${user.address == null }">
										<p class="text-muted">Updatting...</p>
									</c:if></td>
							</tr>
							<tr>
								<td>Address order:</td>
								<td><c:if test="${user.addressOrder != null || user.addressOrder != '' }">
										${user.addressOrder }
									</c:if> <c:if test="${user.addressOrder == null }">
										<p class="text-muted">Updatting...</p>
									</c:if></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- </div> -->
		</div>
	</div>
	<!-- users view card details ends -->

</div>