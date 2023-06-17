<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="section">
	<!-- Form Advance -->
	<div class="col s12 m12 l12">
		<div id="Form-advance" class="card card card-default scrollspy">
			<div class="card-content">
				<h4 class="card-title">Form sản phẩm</h4>
				<form:form action="/admin/product/saveOrUpdate" modelAttribute="product" method="post" enctype="multipart/form-data">
					<form:hidden path="id" />
					<div class="row">
						<div class="input-field col m3 s12">
							<form:input path="name" />
							<label for="name">Tên sản phẩm</label>
							<form:errors path="name" class="error red-text" />
						</div>
						<div class="input-field col m3 s12">
							<form:select path="color">
								<form:options items="${colors }" />
							</form:select>
							<label>Màu sắc</label>
						</div>
						<div class="input-field col m3 s12">
							<form:select path="brand">
								<form:options items="${brands }" />
							</form:select>
							<label>Thương hiệu</label>
						</div>
						<div class="input-field col m3 s12">
							<form:select path="categoryProduct">
								<form:options items="${categoryProducts }" />
							</form:select>
							<label>Danh mục</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col m4 s12">
							<div id="view-set-value">
								<div class="row">
									<div class="col s12">
										<label for="price">Giá</label>
									</div>
								</div>
								<div class="row">
									<div class="col s12">
										<form:input path="price" type="range" min="10" max="1000" />
									</div>
								</div>
							</div>
						</div>
						<div class="input-field col m4 s12">
							<div id="view-set-value">
								<div class="row">
									<div class="col s12">
										<label for="discount">Giảm giá</label>
									</div>
								</div>
								<div class="row">
									<div class="col s12">
										<form:input path="discount" type="range" min="0" max="100" />
									</div>
								</div>
							</div>
						</div>
						<div class="input-field col m4 s12">
							<div class="row">
								<div class="input-field col m6 s12">
									<form:input path="startDayDiscount" type="date" class="datepicker-picker" />
									<label for="startDayDiscount">Ngày bắt đầu giảm giá</label>
								</div>
								<div class="input-field col m6 s12">
									<form:input path="endDayDiscount" type="date" class="datepicker-picker" />
									<label for="endDayDiscount">Ngày kết thúc giảm giá</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="input-field col m2 s12">
							<form:select path="active">
								<form:option value="true">Hoạt động</form:option>
								<form:option value="false">Ngưng hoạt động</form:option>
							</form:select>
							<label>Hoạt động</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="quantity" type="number" min="0" />
							<label for="quantity">Số lượng</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="width" type="number" min="0" />
							<label for="width">Chiều rộng</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="height" type="number" min="0" />
							<label for="height">Chiều cao</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="depth" type="number" min="0" />
							<label for="depth">Chiều sâu</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="weight" type="number" min="0" />
							<label for="weight">Trọng lượng</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col m12 s12">
							<form:textarea path="description" class="materialize-textarea" rows="5" />
							<label for="description">Mô tả</label>
						</div>
					</div>
					<div class="row">
						<c:if test="${empty listImage}">
							<div class="custom-image col m12 s12">
								<div class="drag-area">
									<span class="visible">Kéo và thả hình ảnh vào đây hoặc <span class="select" role="button">Duyệt</span></span>
									<span class="on-drop">Thả hình ảnh vào đây</span>
									<input name="file" type="file" class="file" multiple />
								</div>
							</div>
						</c:if>
						<div class="showImage col m12 s12">
							<c:if test="${not empty listImage}">
								<c:forEach var="item" items="${listImage }">
									<div class="col s12 m6 l4 xl2">
										<div>
											<a class="btn-floating mb-1 waves-effect waves-light " href="/admin/product/delete-image-product?product_id=${product.id }&image_id=${item.id }&image_name=${item.name }">
												<i class="material-icons">clear</i>
											</a>
											<img src="/uploads/${item.name }" class="responsive-img mb-10" alt="">
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="row">
						<div class="col s12 display-flex justify-content-end mt-3">
							<button type="submit" class="btn indigo mr-3">
								<c:if test="${not isEdit }">Lưu thay đổi</c:if>
								<c:if test="${isEdit }">Cập nhật thay đổi</c:if>
							</button>
							<a href="/admin/product" class="btn btn-light">Hủy</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
