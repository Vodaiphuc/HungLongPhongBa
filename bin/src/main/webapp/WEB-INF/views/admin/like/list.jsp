<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="section">
	<!-- Responsive Table -->
	<div class="row">
		<div class="col s12 m12 l12">
			<div id="responsive-table" class="card card card-default scrollspy">
				<div class="card-content">
					<h2 class="card-title">Danh sách yêu thích</h2>
					<div class="row">
						<div class="col s12">
							<div class="row">
								<div class="col s6 left-align">
									<form action="/admin/like">
										<label for="">Hiển thị
											<div class="input-field inline">
												<select class="select2 browser-default" name="size" id="size" onchange="this.form.submit()">
													<option value="5" <c:if test="${resultPage.size == 5}">selected="selected"</c:if>>5</option>
													<option <c:if test="${resultPage.size == 10}">selected="selected"</c:if> value="10">10</option>
													<option <c:if test="${resultPage.size == 15}">selected="selected"</c:if> value="15">15</option>
													<option <c:if test="${resultPage.size == 20}">selected="selected"</c:if> value="20">20</option>
													<option <c:if test="${resultPage.size == 25}">selected="selected"</c:if> value="25">25</option>
													<option <c:if test="${resultPage.size == 30}">selected="selected"</c:if> value="30">30</option>
													<option <c:if test="${resultPage.size == 35}">selected="selected"</c:if> value="35">35</option>
													<option <c:if test="${resultPage.size == 40}">selected="selected"</c:if> value="40">40</option>
												</select>
											</div> bản ghi
										</label>
									</form>
								</div>
								<div class="col s6 right-align">
									<form action="/admin/like">
										<label for="">Tìm kiếm:
											<div class="input-field inline">
												<input name="keywords" class="size-sm" placeholder="Tìm kiếm theo tên đầy đủ">
											</div>
											<button type="submit" class="btn-floating mb-1 waves-effect waves-light ">
												<i class="material-icons">search</i>
											</button>
										</label>
									</form>
								</div>
							</div>
						</div>
						<div class="col s12">
							<table class="responsive-table highlight">
								<thead>
									<tr>
										<th>#</th>
										<th><a href="/admin/like?field=user.fullName&keywords=${keywords}&size=${size}">Họ tên</a></th>
										<th>Ảnh đại diện</th>
										<th><a href="/admin/like?field=product.name&keywords=${keywords}&size=${size}">Tên sản phẩm</a></th>
										<th>Banner</th>
										<th><a href="/admin/like?field=createdDate&keywords=${keywords}&size=${size}">Ngày yêu thích</a></th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${resultPage.content}" varStatus="loopCounter">
										<tr>
											<td>${loopCounter.count}</td>
											<td>${item.user.fullName}</td>
											<td><img src="/uploads/${item.user.avatar}" alt="Ảnh đại diện" class="z-depth-4 circle" height="64" width="64"></td>
											<td>${item.product.name}</td>
											<td><img src="/uploads/${item.product.banner}" alt="Banner" class="z-depth-4 circle" height="64" width="64"></td>
											<td><fmt:formatDate type="both" value="${item.createdDate}" /></td>
											<td>
												<div class="invoice-action">
													<a data-id="${item.id}" data-name="${item.user.fullName}" onclick="deleteLike(this.getAttribute('data-id'), this.getAttribute('data-name'))" class="waves-effect invoice-action-edit">
														<i class="material-icons">delete</i>
													</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col s12">
							<c:if test="${resultPage.totalPages > 0}">
								<ul class="pagination center-align">
									<li class="${resultPage.number + 1 == 1 ? 'waves-effect active' : 'waves-effect'}">
										<a href="/admin/like?field=${field}&keywords=${keywords}&size=${size}&page=1">
											<i class="material-icons">chevron_left</i>
										</a>
									</li>
									<c:forEach var="pageNumber" items="${pageNumbers}">
										<c:if test="${resultPage.totalPages > 1}">
											<li class="waves-effect active" class="${pageNumber == resultPage.number + 1 ? 'waves-effect active' : 'waves-effect'}">
												<a href="/admin/like?field=${field}&keywords=${keywords}&size=${size}&page=${pageNumber}">
													${pageNumber}
												</a>
											</li>
										</c:if>
									</c:forEach>
									<li class="${resultPage.number + 1 == resultPage.totalPages ? 'waves-effect active' : 'waves-effect'}">
										<a href="/admin/like?field=${field}&keywords=${keywords}&size=${size}&page=${resultPage.totalPages}">
											<i class="material-icons">chevron_right</i>
										</a>
									</li>
								</ul>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
