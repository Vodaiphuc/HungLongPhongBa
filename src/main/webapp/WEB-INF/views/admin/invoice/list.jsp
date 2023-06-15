<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="section">
	<div class="row">
		<div class="col s12 m12 l12">
			<div id="responsive-table" class="card card card-default scrollspy">
				<div class="card-content">
					<h4 class="card-title">Invoice list</h4>
					<div class="row">
						<div class="col s12">
							<div class="row">
								<div class="col s6 left-align">
									<form action="/admin/invoice">
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
									<form action="/admin/invoice">
										<label for=""> Search:
											<div class="input-field inline">
												<input name="keywords" class="size-sm"
													placeholder="Search full name">
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
											href="/admin/invoice?field=fullName&keywords=${keywords }&size=${size }">Full
												name</a></th>
										<th><a
											href="/admin/invoice?field=email&keywords=${keywords }&size=${size }">Email</a></th>
										<th><a
											href="/admin/invoice?field=status&keywords=${keywords }&size=${size }">Status</a></th>
										<th><a
											href="/admin/invoice?field=pay&keywords=${keywords }&size=${size }">Pay</a></th>
										<th><a
											href="/admin/invoice?field=createdDate&keywords=${keywords }&size=${size }">Day
												order</a></th>
										<th>Quantity</th>
										<th>Totail</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${resultPage.content }"
										varStatus="loopCounter">
										<c:set var="quantity" value="0" />
										<c:set var="totail" value="0" />
										<c:forEach var="itemDetail" items="${item.orderDetails }">
											<c:set var="quantity"
												value="${itemDetail.quantity + quantity }" />
											<c:if test="${itemDetail.discount > '0' }">
												<c:set var="totail"
													value="${((itemDetail.quantity * itemDetail.price) - (itemDetail.quantity * itemDetail.price * itemDetail.discount * 0.01)) + totail }" />
											</c:if>
											<c:if test="${itemDetail.discount <= '0' }">
												<c:set var="totail"
													value="${(itemDetail.quantity * itemDetail.price) + totail }" />
											</c:if>
										</c:forEach>
										<tr>
											<td>${loopCounter.count}</td>
											<td>${item.fullName }</td>
											<td>${item.email }</td>
											<td><c:if test="${item.status == 'delivered' }">
													<span class="chip green lighten-5"><span
														class="green-text">delivered</span></span>
												</c:if> <c:if test="${item.status == 'being transported' }">
													<span class="chip orange lighten-5"><span
														class="orange-text">being transported</span></span>
												</c:if> <c:if test="${item.status == 'waiting' }">
													<span class="chip red lighten-5"><span
														class="red-text">waiting</span></span>
												</c:if></td>
											<td><c:if test="${item.pay == 'paypal' }">
													<span class="chip green lighten-5"><span
														class="green-text">paypal</span></span>
												</c:if> <c:if test="${item.pay == 'check payments' }">
													<span class="chip red lighten-5"><span
														class="red-text">check payments</span></span>
												</c:if></td>
											<td><fmt:formatDate pattern="dd-MM-yyyy"
													value="${item.createdDate }" /></td>
											<td>${quantity }</td>
											<td>$<fmt:formatNumber type="number"
													maxIntegerDigits="3" value="${totail }" /></td>
											<td>
												<div class="invoice-action">
													<a href="/admin/invoice/view?id=${item.id }"
														class="waves-effect invoice-action-view mr-4"> <i
														class="material-icons">remove_red_eye</i>
													</a> <a href="#modalEdit" data-id="${item.id}"
														onclick="viewApiInvoice(this.getAttribute('data-id'))"
														class="waves-effect invoice-action-edit modal-trigger">
														<i class="material-icons">edit</i>
													</a> <a data-id="${item.id}" data-name="${item.fullName}"
														onclick="deleteInvoice(this.getAttribute('data-id'), this.getAttribute('data-name'))"
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
										href="/admin/invoice?keywords=${keywords }&field=${field }&size=${size }&page=1"><i
											class="material-icons">chevron_left</i></a>
									</li>
									<c:forEach var="pageNumber" items="${pageNumbers }">
										<c:if test="${resultPage.totalPages > 1}">
											<li
												class="${pageNumber == resultPage.number + 1 ? 'waves-effect active' : 'waves-effect'}">
												<a
												href="/admin/invoice?keywords=${keywords }&field=${field }&size=${size }&page=${pageNumber }">${pageNumber}
											</a>
											</li>
										</c:if>
									</c:forEach>

									<li
										class="${resultPage.number + 1 == resultPage.totalPages ? 'waves-effect active' : 'waves-effect'}">
										<a
										href="/admin/invoice?keywords=${keywords }&field=${field }&size=${size }&page=${resultPage.totalPages }"><i
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

	<!-- START MODAL SHOW EDIT -->
	<div id="modalEdit" class="modal">
		<div class="modal-content">
			<h4>Edit invoice</h4>
			<input type="hidden" id="hiddenId" />
			<div class="row">
				<div class="col m6 s12">
					<h6 class="invoice-from">Status</h6>
					<div class="invoice-address">
						<p>
							<label> <input name="status" id="status1" type="radio"
								value="delivered" checked /> <span class="green-text">Delivered</span>
							</label> <label> <input name="status" id="status2" type="radio"
								value="being transported" /> <span class="orange-text">Being
									transported</span>
							</label> <label> <input name="status" id="status3" type="radio"
								value="waiting" /> <span class="red-text">Waiting</span>
							</label>
						</p>
					</div>
				</div>
				<div class="col m6 s12">
					<h6 class="invoice-from">Pay</h6>
					<div class="invoice-address">
						<p>
							<label> <input name="pay" id="pay1" type="radio" value="paypal"
								checked /> <span class="green-text">Paypal</span>
							</label> <label> <input name="pay" id="pay2" type="radio"
								value="check payments" /> <span class="red-text">Check
									payments</span>
							</label>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" onclick="updateInvoice()"
				class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
		</div>
	</div>
</div>