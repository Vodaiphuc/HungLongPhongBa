<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="section">
	<!-- Responsive Table -->
	<div class="row">
		<div class="col s12 m12 l12">
			<div id="responsive-table" class="card card card-default scrollspy">
				<div class="card-content">
					<h4 class="card-title">Danh mục sản phẩm</h4>
					<div class="row">
						<div class="col s12">
							<div class="row">
								<div class="col s6 left-align">
									<form action="/admin/category-product">
										<label for="">Hiện
											<div class="input-field inline">
												<select class="select2 browser-default" name="size"
													id="size" onchange="this.form.submit()">
													<option value="5"
														<c:if test="${resultPage.size == 5}">selected="selected"</c:if>>5</option>
													<option
														<c:if test="${resultPage.size == 10}">selected="selected"</c:if>
														value="10">10</option>
													<option
														<c:if test="${resultPage.size == 15}">selected="selected"</c:if>
														value="15">15</option>
													<option
														<c:if test="${resultPage.size == 20}">selected="selected"</c:if>
														value="20">20</option>
													<option
														<c:if test="${resultPage.size == 25}">selected="selected"</c:if>
														value="25">25</option>
													<option
														<c:if test="${resultPage.size == 30}">selected="selected"</c:if>
														value="30">30</option>
													<option
														<c:if test="${resultPage.size == 35}">selected="selected"</c:if>
														value="35">35</option>
													<option
														<c:if test="${resultPage.size == 40}">selected="selected"</c:if>
														value="40">40</option>
												</select>
											</div> Sản phẩm
										</label>
									</form>
								</div>
								<div class="col s6 right-align">
									<form action="/admin/category-product">
										<label for=""> Tìm kiếm:
											<div class="input-field inline">
												<input name="keywords" class="size-sm"
													placeholder="Tìm theo tên">
											</div>
											<button type="submit"
												class="btn-floating mb-1 waves-effect waves-light ">
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
										<th><a
											href="/admin/category-product?field=name&keywords=${keywords }&size=${size}">Tên
												loại sản phảm</a></th>
										<th><a
											href="/admin/category-product?field=createdBy.fullName&keywords=${keywords }&size=${size}">Người
												tạo</a></th>
										<th><a
											href="/admin/category-product?field=createdDate&keywords=${keywords }&size=${size}">Ngày
												tạo</a></th>
										<th><a
											href="/admin/category-product?field=lastModifiedBy.fullName&keywords=${keywords }&size=${size}">Người
												sữa</a></th>
										<th><a
											href="/admin/category-product?field=lastModifiedDate&keywords=${keywords }&size=${size}">Ngày
												sữa</a></th>
										<th>Hoạt động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${resultPage.content }"
										varStatus="loopCounter">
										<tr>
											<td>${loopCounter.count}</td>
											<td>${item.name }</td>
											<td>${item.createdBy.fullName }</td>
											<td><fmt:formatDate type="both"
													value="${item.createdDate }" /></td>
											<td>${item.lastModifiedBy.fullName }</td>
											<td><fmt:formatDate type="both"
													value="${item.lastModifiedDate }" /></td>
											<td>
												<div class="invoice-action">
													<a href="#modalViews" data-id="${item.id}"
														onclick="viewApiCategoryProduct(this.getAttribute('data-id'))"
														class="waves-effect invoice-action-view modal-trigger mr-4">
														<i class="material-icons">remove_red_eye</i>
													</a> <a data-target="${item.id}"
														class="waves-effect sidenav-trigger invoice-action-edit">
														<i class="material-icons">edit</i>
													</a> <a data-id="${item.id}" data-name="${item.name}"
														onclick="deleteCategoryProduct(this.getAttribute('data-id'), this.getAttribute('data-name'))"
														class="waves-effect invoice-action-edit"> <i
														class="material-icons">delete</i>
													</a>
												</div>
											</td>
											<!-- Slide Out Edit -->
											<aside id="right-sidebar-nav">
												<ul id="${item.id}"
													class="sidenav slide-out-right-sidenav-chat">
													<li class="center-align pt-2 pb-2 sidenav-close chat-head">
														<a href="#!"><i class="material-icons mr-0">chevron_left</i>Update
															category product</a>
													</li>
													<li class="chat-body">
														<div class="card-content">
															<form:form action="/admin/category-product/saveOrUpdate"
																modelAttribute="categoryProduct" method="post">
																<form:hidden path="id" value="${item.id}" />
																<div class="row">
																	<div class="input-field col s12">
																		<form:input path="name" value="${item.name}" />
																		<label for="name">Name category product</label>
																		<form:errors path="name" class="error red-text" />
																	</div>
																</div>
																<div class="row">
																	<div class="input-field col s12">
																		<button
																			class="btn cyan waves-effect waves-light right"
																			type="submit">
																			Update <i class="material-icons right">send</i>
																		</button>
																	</div>
																</div>
															</form:form>
														</div>
													</li>
													<li class="center-align chat-footer"></li>
												</ul>
											</aside>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col s12">
							<c:if test="${resultPage.totalPages > 0}">
								<ul class="pagination center-align">
									<li
										class="${resultPage.number + 1 == 1 ? 'waves-effect active' : 'waves-effect'}">
										<a
										href="/admin/user?field=${field }&keywords=${keywords }&size=${size}&page=1"><i
											class="material-icons">chevron_left</i></a>
									</li>
									<c:forEach var="pageNumber" items="${pageNumbers }">
										<c:if test="${resultPage.totalPages > 1}">
											<li
												class="${pageNumber == resultPage.number + 1 ? 'waves-effect active' : 'waves-effect'}">
												<a
												href="/admin/category-product?field=${field }&keywords=${keywords }&size=${size}&page=${pageNumber }">${pageNumber}
											</a>
											</li>
										</c:if>
									</c:forEach>

									<li
										class="${resultPage.number + 1 == resultPage.totalPages ? 'waves-effect active' : 'waves-effect'}">
										<a
										href="/admin/user?field=${field }&keywords=${keywords }&size=${size}&page=${resultPage.totalPages }"><i
											class="material-icons">chevron_right</i></a>
									</li>
								</ul>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Slide Out new -->
	<aside id="right-sidebar-nav">
		<ul id="slide-out-new" class="sidenav slide-out-right-sidenav-chat">
			<li class="center-align pt-2 pb-2 sidenav-close chat-head"><a
				href="#!"><i class="material-icons mr-0">chevron_left</i>Tên
					loại sản phẩm mới</a></li>
			<li class="chat-body">
				<div class="card-content">
					<form:form action="/admin/category-product/saveOrUpdate"
						modelAttribute="categoryProduct" method="post">
						<div class="row">
							<div class="input-field col s12">
								<form:input path="name" />
								<label for="name">Tên loại sản phẩm</label>
								<form:errors path="name" class="error red-text" />
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<button class="btn cyan waves-effect waves-light right"
									type="submit">
									Thêm <i class="material-icons right">send</i>
								</button>
							</div>
						</div>
					</form:form>
				</div>
			</li>
			<li class="center-align chat-footer"></li>
		</ul>
	</aside>

	<!-- START MODAL SHOW VIEWS -->
	<div id="modalViews" class="modal">
		<div class="modal-content">
			<h4>Thông tin danh mục sản phẩm</h4>
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">ID</h6>
					<div class="invoice-address">
						<span id="viewId">################.</span>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">Tên loại sản phẩm</h6>
					<div class="invoice-address">
						<span id="viewName">Category 1.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">Người tạo</h6>
					<div class="invoice-address">
						<span id="viewCreatedBy">User 1.</span>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">Ngày tạo</h6>
					<div class="invoice-address">
						<span id="viewCreatedDate">10/12/2022.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">Người cập nhât</h6>
					<div class="invoice-address">
						<span id="viewLastModifiedBy">User 1.</span>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">Ngày cập nhật</h6>
					<div class="invoice-address">
						<span id="viewLastModifiedDate">10/12/2022.</span>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!"
				class="modal-action modal-close waves-effect waves-green btn-flat">Đồng ý</a>
		</div>
	</div>
</div>

<div style="bottom: 50px; right: 19px;"
	class="fixed-action-btn direction-top">
	<a data-target="slide-out-new"
		class="btn-floating btn-large gradient-45deg-light-blue-cyan gradient-shadow sidenav-trigger"><i
		class="material-icons">add</i></a>
</div>
