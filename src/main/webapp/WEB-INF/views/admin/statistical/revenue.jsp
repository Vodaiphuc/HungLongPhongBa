<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div id="chart-dashboard">
	<div class="row">
		<div class="col s12 m12 l12">
			<div class="card animate fadeUp">
				<div class="card-move-up waves-effect waves-block waves-light">
					<div class="move-up cyan darken-1">
						<div>
							<span class="chart-title white-text">The graph of the
								number of products sold is displayed by product categories by
								year ${yearRevenue }</span>
							<div class="chart-revenue cyan darken-2 white-text">
								<p class="chart-revenue-total">
									<c:if test="${totailYearNow == '0' }">
										$0
								</c:if>
									<c:if test="${totailYearNow != '0' }">
										$${totailYearNow }
								</c:if>
								</p>
								<p class="chart-revenue-per">
									<c:if test="${totailYearNow == '0' || totailLastYear == '0' }">
										0 %
								</c:if>
									<c:if test="${totailYearNow != '0' && totailLastYear != '0' }">
										<c:if test="${totailYearNow >= totailLastYear }">
											<i class="material-icons">arrow_drop_up</i>
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${totailYearNow / totailLastYear }" />%
								</c:if>
										<c:if test="${totailYearNow < totailLastYear }">
											<i class="material-icons">arrow_drop_down</i>
											<fmt:formatNumber type="number" maxIntegerDigits="3"
												value="${totailYearNow / totailLastYear }" />%
								</c:if>
									</c:if>
								</p>
							</div>
							<div class="switch chart-revenue-switch right">
								<form action="/admin/statistical/revenue">
									<select class="select2 browser-default" name="year" id="year"
										onchange="this.form.submit(); loadCharRevenue();">
										<option value="2019"
											<c:if test="${yearRevenue == '2019'}">selected="selected"</c:if>>2019</option>
										<option value="2020"
											<c:if test="${yearRevenue == '2020'}">selected="selected"</c:if>>2020</option>
										<option value="2021"
											<c:if test="${yearRevenue == '2021'}">selected="selected"</c:if>>2021</option>
										<option value="2022"
											<c:if test="${yearRevenue == '2022'}">selected="selected"</c:if>>2022</option>
										<option value="2023"
											<c:if test="${yearRevenue == '2023'}">selected="selected"</c:if>>2023</option>
										<option value="2024"
											<c:if test="${yearRevenue == '2024'}">selected="selected"</c:if>>2024</option>
										<option value="2025"
											<c:if test="${yearRevenue == '2025'}">selected="selected"</c:if>>2025</option>
									</select>
								</form>
							</div>
						</div>
						<div class="trending-line-chart-wrapper">
							<canvas id="revenue-line-chart" height="80"></canvas>
						</div>
					</div>
				</div>
				<div class="card-content">
					<a
						class="btn-floating btn-move-up waves-effect waves-light red accent-2 z-depth-4 right">
						<i class="material-icons activator">filter_list</i>
					</a>
					<div class="col s12 m3 l3">
						<div id="doughnut-chart-wrapper">
							<canvas id="doughnut-chart" height="200"></canvas>
						</div>
					</div>
					<div class="col s12 m2 l2">
						<ul class="doughnut-chart-legend" id="legend-color">
							<!-- 							<li class="mobile ultra-small"><span class="legend-color"></span>Mobile</li> -->
							<!-- 							<li class="kitchen ultra-small"><span class="legend-color"></span> -->
							<!-- 								Kitchen</li> -->
							<!-- 							<li class="home ultra-small"><span class="legend-color"></span> -->
							<!-- 								Home</li> -->
						</ul>
					</div>
					<div class="col s12 m5 l6">
						<div class="trending-bar-chart-wrapper">
							<canvas id="trending-bar-chart" height="90"></canvas>
						</div>
					</div>
				</div>
				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4">Revenue by
						month of the year ${yearRevenue }<i class="material-icons right">close</i>
					</span>
					<table class="responsive-table">
						<thead>
							<tr>
								<th data-field="id">ID</th>
								<th data-field="month">Month</th>
								<th data-field="item-sold">Totail quantity</th>
								<th data-field="item-price">Totail discount</th>
								<th data-field="total-profit">Total price</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${totailOrderDetailByYear }"
								varStatus="loopCounter">
								<tr>
									<td>${loopCounter.count}</td>
									<td><c:if test="${item[0] == '1'}">January</c:if> <c:if
											test="${item[0] == '2'}">February</c:if> <c:if
											test="${item[0] == '3'}">March</c:if> <c:if
											test="${item[0] == '4'}">April</c:if> <c:if
											test="${item[0] == '5'}">May</c:if> <c:if
											test="${item[0] == '6'}">June</c:if> <c:if
											test="${item[0] == '7'}">July</c:if> <c:if
											test="${item[0] == '8'}">August</c:if> <c:if
											test="${item[0] == '9'}">September</c:if> <c:if
											test="${item[0] == '10'}">October</c:if> <c:if
											test="${item[0] == '11'}">November</c:if> <c:if
											test="${item[0] == '12'}">December</c:if></td>
									<td>${item[1] }</td>
									<td>${item[2] }%</td>
									<td>$<fmt:formatNumber type="number" maxIntegerDigits="3"
											value="${item[3] }" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</div>