<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="section">
	<!-- Form Advance -->
	<div class="col s12 m12 l12">
		<div id="Form-advance" class="card card card-default scrollspy">
			<div class="card-content">
				<h4 class="card-title">Product form</h4>
				<form:form action="/admin/product/saveOrUpdate"
					modelAttribute="product" method="post"
					enctype="multipart/form-data">
					<form:hidden path="id" />
					<div class="row">
						<div class="input-field col m3 s12">
							<form:input path="name" />
							<label for="name">Product name</label>
							<form:errors path="name" class="error red-text" />
						</div>
						<div class="input-field col m3 s12">
							<form:select path="color">
								<form:options items="${colors }" />
							</form:select>
							<label>Color</label>
						</div>
						<div class="input-field col m3 s12">
							<form:select path="brand">
								<form:options items="${brands }" />
							</form:select>
							<label>Brand</label>
						</div>
						<div class="input-field col m3 s12">
							<form:select path="categoryProduct">
								<form:options items="${categoryProducts }" />
							</form:select>
							<label>Category</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col m4 s12">
							<div id="view-set-value">
								<div class="row">
									<div class="col s12">
										<label for="price">Price</label>
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
										<label for="discount">Discount</label>
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
									<form:input path="startDayDiscount" type="date"
										class="datepicker-picker" />
									<label for="startDayDiscount">Start day discount</label>
								</div>
								<div class="input-field col m6 s12">
									<form:input path="endDayDiscount" type="date"
										class="datepicker-picker" />
									<label for="endDayDiscount">End day discount</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="input-field col m2 s12">
							<form:select path="active">
								<form:option value="true">Active</form:option>
								<form:option value="false">UnActive</form:option>
							</form:select>
							<label>Active</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="quantity" type="number" min="0" />
							<label for="quantity">Quantity</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="width" type="number" min="0" />
							<label for="width">Width</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="height" type="number" min="0" />
							<label for="height">Height</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="depth" type="number" min="0" />
							<label for="depth">Depth</label>
						</div>
						<div class="input-field col m2 s12">
							<form:input path="weight" type="number" min="0" />
							<label for="weight">Weight</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col m12 s12">
							<form:textarea path="description" class="materialize-textarea"
								rows="5" />
							<label for="description">Description</label>
						</div>
					</div>
					<div class="row">
						<c:if test="${empty listImage}">
							<div class="custom-image col m12 s12">
								<div class="drag-area">
									<span class="visible"> Drag & drop image here or <span
										class="select" role="button">Browse</span>
									</span> <span class="on-drop">Drop images here</span> <input
										name="file" type="file" class="file" multiple />
								</div>

							</div>
						</c:if>
						<div class="showImage col m12 s12">
							<c:if test="${not empty listImage}">
								<c:forEach var="item" items="${listImage }">
									<div class="col s12 m6 l4 xl2">
										<div>
											<a class="btn-floating mb-1 waves-effect waves-light "
												href="/admin/product/delete-image-product?product_id=${product.id }&image_id=${item.id }&image_name=${item.name }">
												<i class="material-icons">clear</i>
											</a> <img src="/uploads/${item.name }"
												class="responsive-img mb-10" alt="">
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="row">
						<div class="col s12 display-flex justify-content-end mt-3">
							<button type="submit" class="btn indigo mr-3">
								<c:if test="${not isEdit }">Save
									changes</c:if>
								<c:if test="${isEdit }">Update
									changes</c:if>
							</button>
							<a href="/admin/product" class="btn btn-light">Cancel</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
