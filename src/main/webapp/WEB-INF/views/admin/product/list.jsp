<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="section">
	<div class="row" id="ecommerce-products">
		<div class="col s12 m3 l2 pr-0 hide-on-med-and-down animate fadeLeft">
			<div class="card">
				<div class="card-content">
					<span class="card-title">Categories</span>
					<hr class="p-0 mb-10">
					<ul class="collapsible categories-collapsible">
						<c:forEach var="item" items="${categoryProducts }"
							varStatus="loopCounter">
							<li>
								<div class="collapsible-header">
									<a
										href="/admin/product?categoryProduct_id=${item.key.id }&field=${field }&size=${size }">${item.value }</a>
								</div>
							</li>
						</c:forEach>
					</ul>
					<span class="card-title mt-10">Color</span>
					<hr class="p-0 mb-10">
					<div class="display-grid">
						<c:forEach var="item" items="${colors }" varStatus="loopCounter">
							<c:choose>
								<c:when test="${item.value == 'white'}">
									<a
										href="/admin/product?color_id=${item.key.id }&field=${field }&size=${size }">
										<label class="mt-4"><span><i
												class="material-icons vertical-align-bottom blue-grey-text text-lighten-5">
													lens </i> ${item.value}</span></label>
									</a>
								</c:when>
								<c:otherwise>
									<c:set var="colorCss" value="${item.value}-text" />
									<a
										href="/admin/product?color_id=${item.key.id }&field=${field }&size=${size }">
										<label class="mt-4"> <span><i
												class="material-icons vertical-align-bottom ${colorCss }">
													lens </i> ${item.value}</span>
									</label>
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<span class="card-title mt-10">Brand</span>
					<hr class="p-0 mb-10">
					<div class="display-grid">
						<c:forEach var="item" items="${brands }" varStatus="loopCounter">
							<a
								href="/admin/product?brand_id=${item.key.id }&field=${field }&size=${size }"><b>
									<span>${item.value }</span>
							</b></a>
						</c:forEach>
					</div>
					<span class="card-title mt-10">Customer Ratings</span>
					<hr class="p-0 mb-10">
					<div class="display-grid">
						<a href="/admin/product?star=5&field=${field }&size=${size }"><label><span>
									<i class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i>
							</span> </label> </a> <a href="/admin/product?star=4&field=${field }&size=${size }"><label>
								<span> <i class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i>
							</span>
						</label> </a> <a href="/admin/product?star=3&field=${field }&size=${size }"><label>
								<span> <i class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i>
							</span>
						</label> </a> <a href="/admin/product?star=2&field=${field }&size=${size }"><label>
								<span> <i class="material-icons amber-text"> star </i> <i
									class="material-icons amber-text"> star </i>
							</span>
						</label> </a> <a href="/admin/product?star=1&field=${field }&size=${size }"><label>
								<span> <i class="material-icons amber-text"> star </i>
							</span>
						</label></a>
					</div>
				</div>
			</div>
		</div>
		<div class="col s12 m12 l10 pr-0">
			<div id="responsive-table" class="card card card-default scrollspy">
				<div class="card-content">
					<h4 class="card-title">Product list</h4>
					<div class="row">
						<div class="col s12">
							<div class="row">
								<div class="col s6 left-align">
									<form action="/admin/product">
										<label for="">Show
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
											</div> Entities
										</label>
									</form>
								</div>
								<div class="col s6 right-align">
									<form action="/admin/product">
										<label for=""> Search:
											<div class="input-field inline">
												<input name="keywords" class="size-sm"
													placeholder="Search product name">
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
											href="/admin/product?field=name&keywords=${keywords }&size=${size }">Product
												name</a></th>
										<th>Banner</th>
										<th><a
											href="/admin/product?field=price&keywords=${keywords }&size=${size }">Price</a></th>
										<th><a
											href="/admin/product?field=discount&keywords=${keywords }&size=${size }">Discount</a></th>
										<th>Status discount</th>
										<!-- <th><a -->
										<%-- href="/admin/product?field=startDayDiscount&keywords=${keywords }&size=${size }">Start --%>
										<!-- day discount</a></th> -->
										<!-- <th><a -->
										<%-- href="/admin/product?field=endDayDiscount&keywords=${keywords }&size=${size }">End --%>
										<!-- day discount</a></th> -->
										<th><a
											href="/admin/product?field=quantity&keywords=${keywords }&size=${size }">Quantity</a></th>
										<th><a
											href="/admin/product?field=active&keywords=${keywords }&size=${size }">Active</a></th>
										<th><a
											href="/admin/product?field=brand.name&keywords=${keywords }&size=${size }">Brand</a></th>
										<th><a
											href="/admin/product?field=color.name&keywords=${keywords }&size=${size }">Color</a></th>
										<th><a
											href="/admin/product?field=categoryProduct.name&keywords=${keywords }&size=${size }">Category</a></th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${resultPage.content }"
										varStatus="loopCounter">
										<tr>
											<td>${loopCounter.count}</td>
											<td>${item.name }</td>
											<td><img src="/uploads/${item.banner }"
												alt="product banner" class="z-depth-4 circle" height="64"
												width="64"></td>
											<td>$ ${item.price }</td>
											<td>${item.discount }%</td>
											<td><c:set var="startDay"
													value="${item.startDayDiscount.getTime() }" /> <c:set
													var="endDay" value="${item.endDayDiscount.getTime() }" />
												<c:set var="dayNow" value="<%=(new Date()).getTime()%>" />
												<c:if
													test="${item.discount > '0' && startDay <= dayNow && endDay >= dayNow }">
													<span class="chip green lighten-5"><span
														class="green-text">Discount class available</span></span>
												</c:if> <c:if
													test="${item.discount == '0' || startDay > dayNow || endDay < dayNow }">
													<span class="chip red lighten-5"><span
														class="red-text">End of discount</span></span>
												</c:if></td>
											<%-- <td><fmt:formatDate pattern="dd-MM-yyyy" --%>
											<%-- value="${item.startDayDiscount }" /></td> --%>
											<%-- <td><fmt:formatDate pattern="dd-MM-yyyy" --%>
											<%-- value="${item.endDayDiscount }" /></td> --%>
											<td>${item.quantity }</td>
											<td><c:if test="${item.active == 'True' }">
													<span class="chip green lighten-5"><span
														class="green-text">Active</span></span>
												</c:if> <c:if test="${item.active == 'False' }">
													<span class="chip red lighten-5"><span
														class="red-text">UnActive</span></span>
												</c:if></td>
											<td>${item.brand.name }</td>
											<td><c:choose>
													<c:when test="${item.color.name == 'White'}">
														<span><i
															class="material-icons vertical-align-bottom blue-grey-text text-lighten-5">
																lens </i> ${item.color.name}</span>
													</c:when>
													<c:otherwise>
														<c:set var="colorCss" value="${item.color.name}-text" />
														<span><i
															class="material-icons vertical-align-bottom ${colorCss }">
																lens </i> ${item.color.name} </span>
													</c:otherwise>
												</c:choose></td>
											<td>${item.categoryProduct.name }</td>
											<td>
												<div class="invoice-action">
													<a href="#modalViews" data-id="${item.id}"
														onclick="viewApiProduct(this.getAttribute('data-id'))"
														class="waves-effect invoice-action-view modal-trigger mr-4">
														<i class="material-icons">remove_red_eye</i>
													</a> <a class="waves-effect invoice-action-edit"
														href="/admin/product/edit?id=${item.id }"> <i
														class="material-icons">edit</i>
													</a> <a data-id="${item.id}" data-name="${item.name}"
														onclick="deleteProduct(this.getAttribute('data-id'), this.getAttribute('data-name'))"
														class="waves-effect invoice-action-edit"> <i
														class="material-icons">delete</i>
													</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col s12 center">
							<c:if test="${resultPage.totalPages > 0}">
								<ul class="pagination center-align">
									<li
										class="${resultPage.number + 1 == 1 ? 'waves-effect active' : 'waves-effect'}">
										<a
										href="/admin/product?keywords=${keywords }&field=${field }&size=${size }&page=1"><i
											class="material-icons">chevron_left</i></a>
									</li>
									<c:forEach var="pageNumber" items="${pageNumbers }">
										<c:if test="${resultPage.totalPages > 1}">
											<li
												class="${pageNumber == resultPage.number + 1 ? 'waves-effect active' : 'waves-effect'}">
												<a
												href="/admin/product?keywords=${keywords }&field=${field }&size=${size }&page=${pageNumber }">${pageNumber}
											</a>
											</li>
										</c:if>
									</c:forEach>

									<li
										class="${resultPage.number + 1 == resultPage.totalPages ? 'waves-effect active' : 'waves-effect'}">
										<a
										href="/admin/product?keywords=${keywords }&field=${field }&size=${size }&page=${resultPage.totalPages }"><i
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

	<!-- START MODAL SHOW VIEWS -->
	<div id="modalViews" class="modal">
		<div class="modal-content">
			<h4>Information product</h4>
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">ID</h6>
					<div class="invoice-address">
						<span id="viewId">################.</span>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">Product name</h6>
					<div class="invoice-address">
						<span id="viewName">Category 1.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">Price</h6>
					<div class="invoice-address">
						<span id="viewPrice">User 1.</span>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">Discount</h6>
					<div class="invoice-address">
						<span id="viewDiscount">10/12/2022.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">Start day discount</h6>
					<div class="invoice-address">
						<span id="viewStartDayDiscount">User 1.</span>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">End day discount</h6>
					<div class="invoice-address">
						<span id="viewEndDayDiscount">10/12/2022.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m4 s12">
					<h6 class="invoice-from">Views</h6>
					<div class="invoice-address">
						<span id="viewViews">User 1.</span>
					</div>
				</div>
				<div class="col m4 s12">
					<h6 class="invoice-from">Quantity</h6>
					<div class="invoice-address">
						<span id="viewQuantity">10/12/2022.</span>
					</div>
				</div>
				<div class="col m4 s12">
					<h6 class="invoice-from">Active</h6>
					<div class="invoice-address">
						<span id="viewActive">10/12/2022.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m12 s12">
					<h6 class="invoice-from">Description</h6>
					<div class="invoice-address">
						<span id="viewDescription">User 1.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m3 s12">
					<h6 class="invoice-from">Width</h6>
					<div class="invoice-address">
						<span id="viewWidth">User 1.</span>
					</div>
				</div>
				<div class="col m3 s12">
					<h6 class="invoice-from">Height</h6>
					<div class="invoice-address">
						<span id="viewHeight">User 1.</span>
					</div>
				</div>
				<div class="col m3 s12">
					<h6 class="invoice-from">Depth</h6>
					<div class="invoice-address">
						<span id="viewDepth">User 1.</span>
					</div>
				</div>
				<div class="col m3 s12">
					<h6 class="invoice-from">Weight</h6>
					<div class="invoice-address">
						<span id="viewWeight">User 1.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m4 s12">
					<h6 class="invoice-from">Brand</h6>
					<div class="invoice-address">
						<span id="viewBrand">User 1.</span>
					</div>
				</div>
				<div class="col m4 s12">
					<h6 class="invoice-from">Category product</h6>
					<div class="invoice-address">
						<span id="viewCategoryProduct">10/12/2022.</span>
					</div>
				</div>
				<div class="col m4 s12">
					<h6 class="invoice-from">Color</h6>
					<div class="invoice-address">
						<span id="viewColor">10/12/2022.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">User create</h6>
					<div class="invoice-address">
						<span id="viewCreatedBy">User 1.</span>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">Create day</h6>
					<div class="invoice-address">
						<span id="viewCreatedDate">10/12/2022.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">User update</h6>
					<div class="invoice-address">
						<span id="viewLastModifiedBy">User 1.</span>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">Update day</h6>
					<div class="invoice-address">
						<span id="viewLastModifiedDate">10/12/2022.</span>
					</div>
				</div>
			</div>
			<div class="divider mb-3 mt-3"></div>
			<div class="row" id="tbodyExample">
				
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!"
				class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
		</div>
	</div>
</div>

<div style="bottom: 50px; right: 19px;"
	class="fixed-action-btn direction-top">
	<a href="/admin/product/new"
		class="btn-floating btn-large gradient-45deg-light-blue-cyan gradient-shadow"><i
		class="material-icons">add</i></a>
</div>
