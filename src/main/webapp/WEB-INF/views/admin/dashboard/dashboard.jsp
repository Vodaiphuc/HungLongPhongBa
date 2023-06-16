<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div id="card-stats" class="pt-0">
	<div class="row">
		<div class="col s12 m6 l3">
			<div class="card animate fadeLeft">
				<div class="card-content cyan white-text">
					<p class="card-stats-title">
						<i class="material-icons">person_outline</i> Khách hàng mới
					</p>
					<h4 class="card-stats-number white-text">
						<c:if test="${countUserMonthNow == '0' }">
										0
								</c:if>
						<c:if test="${countUserMonthNow != '0' }">
										${countUserMonthNow }
								</c:if>
					</h4>
					<p class="card-stats-compare">
						<c:if
							test="${countUserMonthNow == '0' || countUserLastMonth == '0' }">
										0 <span class="cyan text text-lighten-5">% last month</span>
						</c:if>
						<c:if
							test="${countUserMonthNow != '0' && countUserLastMonth != '0' }">
							<c:if test="${countUserMonthNow >= countUserLastMonth }">
								<i class="material-icons">arrow_drop_up</i>
								<fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${countUserMonthNow / countUserLastMonth }" />
								<span class="cyan text text-lighten-5">% last month</span>
							</c:if>
							<c:if test="${countUserMonthNow < countUserLastMonth }">
								<i class="material-icons">arrow_drop_down</i>
								<fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${countUserMonthNow / countUserLastMonth }" />
								<span class="cyan text text-lighten-5">% last month</span>
							</c:if>
						</c:if>
					</p>
				</div>
			</div>
		</div>
		<div class="col s12 m6 l3">
			<div class="card animate fadeLeft">
				<div class="card-content red accent-2 white-text">
					<p class="card-stats-title">
						<i class="material-icons">attach_money</i>Tổng doanh thu theo tháng
					</p>
					<h4 class="card-stats-number white-text">
						<c:if test="${totailPriceMonthNow == '0' }">
										$0
								</c:if>
						<c:if test="${totailPriceMonthNow != '0' }">
										$${totailPriceMonthNow }
								</c:if>
					</h4>
					<p class="card-stats-compare">
						<c:if
							test="${totailPriceMonthNow == '0' || totailPriceLastMonth == '0' }">
										0 <span class="red-text text-lighten-5">% last month</span>
						</c:if>
						<c:if
							test="${totailPriceMonthNow != '0' && totailPriceLastMonth != '0' }">
							<c:if test="${totailPriceMonthNow >= totailPriceLastMonth }">
								<i class="material-icons">arrow_drop_up</i>
								<fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${totailPriceMonthNow / totailPriceLastMonth }" />
								<span class="red-text text-lighten-5">% last month</span>
							</c:if>
							<c:if test="${totailPriceMonthNow < totailPriceLastMonth }">
								<i class="material-icons">arrow_drop_down</i>
								<fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${totailPriceMonthNow / totailPriceLastMonth }" />
								<span class="red-text text-lighten-5">% last month</span>
							</c:if>
						</c:if>
					</p>
				</div>
			</div>
		</div>
		<div class="col s12 m6 l3">
			<div class="card animate fadeRight">
				<div class="card-content orange lighten-1 white-text">
					<p class="card-stats-title">
						<i class="material-icons">trending_up</i> Thống kê theo số lượng 
					</p>
					<h4 class="card-stats-number white-text">
						<c:if test="${totailQuantityMonthNow == '0' }">
										0
								</c:if>
						<c:if test="${totailQuantityMonthNow != '0' }">
										${totailQuantityMonthNow }
								</c:if>
					</h4>
					<p class="card-stats-compare">
						<c:if
							test="${totailQuantityMonthNow == '0' || totailQuantityLastMonth == '0' }">
										0 <span class="orange-text text-lighten-5">% last month</span>
						</c:if>
						<c:if
							test="${totailQuantityMonthNow != '0' && totailQuantityLastMonth != '0' }">
							<c:if
								test="${totailQuantityMonthNow >= totailQuantityLastMonth }">
								<i class="material-icons">arrow_drop_up</i>
								<fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${totailQuantityMonthNow / totailQuantityLastMonth }" />
								<span class="orange-text text-lighten-5">% last month</span>
							</c:if>
							<c:if test="${totailQuantityMonthNow < totailQuantityLastMonth }">
								<i class="material-icons">arrow_drop_down</i>
								<fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${totailQuantityMonthNow / totailQuantityLastMonth }" />
								<span class="orange-text text-lighten-5">% last month</span>
							</c:if>
						</c:if>
					</p>
				</div>
			</div>
		</div>
		<div class="col s12 m6 l3">
			<div class="card animate fadeRight">
				<div class="card-content green lighten-1 white-text">
					<p class="card-stats-title">
						<i class="material-icons">content_copy</i> Thống kê theo hóa đơn
					</p>
					<h4 class="card-stats-number white-text">
						<c:if test="${countOrderMonthNow == '0' }">
										0
								</c:if>
						<c:if test="${countOrderMonthNow != '0' }">
										${countOrderMonthNow }
								</c:if>
					</h4>
					<p class="card-stats-compare">
						<c:if
							test="${countOrderMonthNow == '0' || countOrderLastMonth == '0' }">
										0 <span class="green-text text-lighten-5">% last month</span>
						</c:if>
						<c:if
							test="${countOrderMonthNow != '0' && countOrderLastMonth != '0' }">
							<c:if test="${countOrderMonthNow >= countOrderLastMonth }">
								<i class="material-icons">arrow_drop_up</i>
								<fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${countOrderMonthNow / countOrderLastMonth }" />
								<span class="green-text text-lighten-5">% last month</span>
							</c:if>
							<c:if test="${countOrderMonthNow < countOrderLastMonth }">
								<i class="material-icons">arrow_drop_down</i>
								<fmt:formatNumber type="number" maxIntegerDigits="3"
									value="${countOrderMonthNow / countOrderLastMonth }" />
								<span class="green-text text-lighten-5">% last month</span>
							</c:if>
						</c:if>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col s12 l12">
		<!-- User Statistics -->
		<div class="card user-statistics-card animate fadeLeft">
			<div class="card-content">
				<h4 class="card-title mb-0">Danh sách khách hàng mới</h4>
				<div class="row">
					<div class="col s12 m6">
						<ul class="collection border-none mb-0">
							<c:if
								test="${countUserYearNow == '0' || countUserYearMonth == '0' }">
								<li class="collection-item avatar">
									<p class="medium-small">Năm nay</p>
									<h5 class="mt-0 mb-0">0%</h5>
								</li>
							</c:if>
							<c:if
								test="${countUserYearNow != '0' && countUserYearMonth != '0' }">
								<c:if test="${countUserYearNow >= countUserYearMonth }">
									<li class="collection-item avatar"><i
										class="material-icons circle pink accent-2">trending_up</i>
										<p class="medium-small">Năm nay</p>
										<h5 class="mt-0 mb-0">
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${countUserYearNow / countUserYearMonth }" />
											%
										</h5></li>
								</c:if>
								<c:if test="${countUserYearNow < countUserYearMonth }">
									<li class="collection-item avatar"><i
										class="material-icons circle purple accent-4">trending_down</i>
										<p class="medium-small">Năm nay</p>
										<h5 class="mt-0 mb-0">
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${countUserYearNow / countUserYearMonth }" />
											%
										</h5></li>
								</c:if>
							</c:if>
						</ul>
					</div>
					<div class="col s12 m6">
						<ul class="collection border-none mb-0">
							<c:if
								test="${countUserYearNow == '0' || countUserYearMonth == '0' }">
								<li class="collection-item avatar">
									<p class="medium-small">Năm ngoái</p>
									<h5 class="mt-0 mb-0">0%</h5>
								</li>
							</c:if>
							<c:if
								test="${countUserYearMonth != '0' && countUserYearNow != '0' }">
								<c:if test="${countUserYearMonth >= countUserYearNow }">
									<li class="collection-item avatar"><i
										class="material-icons circle pink accent-2">trending_up</i>
										<p class="medium-small">Năm ngoái</p>
										<h5 class="mt-0 mb-0">
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${countUserYearMonth / countUserYearNow }" />
											%
										</h5></li>
								</c:if>
								<c:if test="${countUserYearMonth < countUserYearNow }">
									<li class="collection-item avatar"><i
										class="material-icons circle purple accent-4">trending_down</i>
										<p class="medium-small">Năm ngoái</p>
										<h5 class="mt-0 mb-0">
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${countUserYearMonth / countUserYearNow }" />
											%
										</h5></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="user-statistics-container">
					<canvas id="user-statistics-bar-chart" height="150"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col s12 m12 l12">
		<div class="card subscriber-list-card animate fadeRight">
			<div class="card-content pb-1">
				<h4 class="card-title mb-0">Danh sách khách hàng</h4>
			</div>
			<table class="subscription-table responsive-table highlight">
				<thead>
					<tr>
						<th>Tên</th>
						<th>Ảnh</th>
						<th>Ngày đăng ký</th>
						<th>Email</th>
						<th>Giới tính</th>
						<th>Trạng thái</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${listSubscriber }"
						varStatus="loopCounter">
						<tr>
							<td>${item.fullName }</td>
							<td><img src="/uploads/${item.avatar }" alt="users avatar"
								class="z-depth-4 circle" height="64" width="64"></td>
							<td><fmt:formatDate type="both" value="${item.createdDate }" /></td>
							<td>${item.email }</td>
							<td><c:choose>
									<c:when test="${item.gender == 'true'}">
										<span class="material-icons">male</span>
									</c:when>
									<c:when test="${item.gender == 'false'}">
										<span class="material-icons">female</span>
									</c:when>
									<c:otherwise>
										<p class="text-muted">Updatting...</p>
									</c:otherwise>
								</c:choose></td>
							<td><c:if test="${item.login == 'True' }">
									<span class="badge green lighten-5 green-text text-accent-4">Active</span>
								</c:if> <c:if test="${item.login == 'False' }">
									<span class="badge pink lighten-5 pink-text text-accent-2">UnActive</span>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>