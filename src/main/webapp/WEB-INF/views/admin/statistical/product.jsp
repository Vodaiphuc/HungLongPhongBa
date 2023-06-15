<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="row">
	<div class="col s12">
		<div class="card-panel">
			<div class="input-field">
				<div class="row">
					<div class="col s12 m1">
						<span>Filter by year: </span>
					</div>
					<div class="col s12 m3">
						<form action="/admin/statistical/product">
							<select class="select2 browser-default" name="year" id="year"
								onchange="this.form.submit(); loadCharProduct();">
								<option value="2019"
									<c:if test="${year == '2019'}">selected="selected"</c:if>>2019</option>
								<option value="2020"
									<c:if test="${year == '2020'}">selected="selected"</c:if>>2020</option>
								<option value="2021"
									<c:if test="${year == '2021'}">selected="selected"</c:if>>2021</option>
								<option value="2022"
									<c:if test="${year == '2022'}">selected="selected"</c:if>>2022</option>
								<option value="2023"
									<c:if test="${year == '2023'}">selected="selected"</c:if>>2023</option>
								<option value="2024"
									<c:if test="${year == '2024'}">selected="selected"</c:if>>2024</option>
								<option value="2025"
									<c:if test="${year == '2025'}">selected="selected"</c:if>>2025</option>
							</select>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="chartjs-line-chart" class="card">
	<div class="card-content">
		<h4 class="card-title">Chart of likes, reviews</h4>
		<p class="caption">This chart summarizes the months by each year
			you choose.</p>
		<div class="row">
			<div class="col s12">
				<div class="sample-chart-wrapper">
					<canvas id="chart-like-review" height="400"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col s12 m12 l12">
		<div id="preselecting" class="card card card-default scrollspy">
			<div class="card-content">
				<div class="card-title">
					<div class="row">
						<div class="col s12 m6 l10">
							<h4 class="card-title">List of liked and rated products</h4>
							<p>Displays a tabular list sorted by likes and ratings from
								high to low.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s12">
						<div class="row" id="main-view-tab">
							<div class="col s12">
								<ul class="tabs tab-demo-active z-depth-1 cyan">
									<li class="tab col m6"><a
										class="white-text waves-effect waves-light active"
										href="#like">List like product</a></li>
									<li class="tab col m6"><a
										class="white-text waves-effect waves-light" href="#review">List
											review product</a></li>
								</ul>
							</div>
							<div class="col s12">
								<div id="like" class="col s12  cyan lighten-4">
									<table class="responsive-table">
										<thead>
											<tr>
												<th>#</th>
												<th>Product name</th>
												<th>Banner</th>
												<th>Number of likes</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listLikeProduct }"
												varStatus="loopCounter">
												<tr>
													<td>${loopCounter.count}</td>
													<td>${item[0] }</td>
													<td><img src="/uploads/${item[1] }" alt="users avatar"
														class="z-depth-4 circle" height="64" width="64"></td>
													<td>${item[2] }<i class="material-icons cyan-text">
															favorite </i></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div id="review" class="col s12  cyan lighten-4">
									<table class="responsive-table">
										<thead>
											<tr>
												<th>#</th>
												<th>Product name</th>
												<th>Banner</th>
												<th>Number of review</th>
												<th>Totail star</th>
												<th>Average number of stars</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listReviewProduct }"
												varStatus="loopCounter">
												<tr>
													<td>${loopCounter.count}</td>
													<td>${item[0] }</td>
													<td><img src="/uploads/${item[1] }" alt="users avatar"
														class="z-depth-4 circle" height="64" width="64"></td>
													<td>${item[2] }<i class="material-icons teal-text">
															reviews </i></td>
													<td>${item[3] }<i class="material-icons amber-text">
															star </i></td>
													<td><fmt:formatNumber type="number"
															maxIntegerDigits="3" value="${item[3] / item[2] }" /><i
														class="material-icons amber-text"> star </i></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>