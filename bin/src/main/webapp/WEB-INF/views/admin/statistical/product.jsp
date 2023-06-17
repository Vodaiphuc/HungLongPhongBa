<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="row">
	<div class="col s12">
		<div class="card-panel">
			<div class="input-field">
				<div class="row">
					<div class="col s12 m1">
						<span>Lọc theo năm: </span>
					</div>
					<div class="col s12 m3">
						<form action="/admin/statistical/product">
							<select class="select2 browser-default" name="year" id="year" onchange="this.form.submit(); loadCharProduct();">
								<option value="2019" <c:if test="${year == '2019'}">selected="selected"</c:if>>2019</option>
								<option value="2020" <c:if test="${year == '2020'}">selected="selected"</c:if>>2020</option>
								<option value="2021" <c:if test="${year == '2021'}">selected="selected"</c:if>>2021</option>
								<option value="2022" <c:if test="${year == '2022'}">selected="selected"</c:if>>2022</option>
								<option value="2023" <c:if test="${year == '2023'}">selected="selected"</c:if>>2023</option>
									<option value="2024" <c:if test="${year == '2024'}">selected="selected"</c:if>>2024</option>
								<option value="2025" <c:if test="${year == '2025'}">selected="selected"</c:if>>2025</option>
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
		<h4 class="card-title">Biểu đồ yêu thích, đánh giá</h4>
		<p class="caption">Biểu đồ này tóm tắt các tháng theo từng năm bạn chọn.</p>
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
							<h4 class="card-title">Danh sách sản phẩm được thích và được đánh giá</h4>
							<p>Hiển thị danh sách theo bảng được sắp xếp theo lượt thích và đánh giá từ cao đến thấp.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s12">
						<div class="row" id="main-view-tab">
							<div class="col s12">
								<ul class="tabs tab-demo-active z-depth-1 cyan">
									<li class="tab col m6"><a class="white-text waves-effect waves-light active" href="#like">Danh sách sản phẩm được thích</a></li>
									<li class="tab col m6"><a class="white-text waves-effect waves-light" href="#review">Danh sách sản phẩm được đánh giá</a></li>
								</ul>
							</div>
							<div class="col s12">
								<div id="like" class="col s12  cyan lighten-4">
									<table class="responsive-table">
										<thead>
											<tr>
												<th>#</th>
												<th>Tên sản phẩm</th>
												<th>Banner</th>
												<th>Số lượt thích</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listLikeProduct }" varStatus="loopCounter">
												<tr>
													<td>${loopCounter.count}</td>
													<td>${item[0] }</td>
													<td><img src="/uploads/${item[1] }" alt="users avatar" class="z-depth-4 circle" height="64" width="64"></td>
													<td>${item[2] }<i class="material-icons cyan-text">favorite </i></td>
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
												<th>Tên sản phẩm</th>
												<th>Banner</th>
												<th>Số lượt đánh giá</th>
												<th>Tổng số sao</th>
												<th>Số sao trung bình</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listReviewProduct }" varStatus="loopCounter">
												<tr>
													<td>${loopCounter.count}</td>
													<td>${item[0] }</td>
													<td><img src="/uploads/${item[1] }" alt="users avatar" class="z-depth-4 circle" height="64" width="64"></td>
													<td>${item[2] }<i class="material-icons teal-text">reviews </i></td>
													<td>${item[3] }<i class="material-icons amber-text">star </i></td>
													<td><fmt:formatNumber type="number" maxIntegerDigits="3" value="${item[3] / item[2] }" /><i class="material-icons amber-text"> star </i></td>
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
