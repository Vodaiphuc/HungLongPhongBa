<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="section users-edit">
	<div class="card">
		<div class="card-content">
			<div class="row">
				<div class="col s12">
					<form:form action="/admin/user/saveOrUpdate" modelAttribute="user"
						method="post" enctype="multipart/form-data">
						<form:hidden path="id" />
						<!-- users edit media object start -->
						<div class="row">
							<div class="col s12 m1">
								<div class="row">
									<div class="media display-flex align-items-center">
										<img src="/uploads/${user.avatar}" alt="Ảnh đại diện người dùng"
											class="z-depth-4 circle" height="64" width="64" id="avatar">
									</div>
								</div>
							</div>
							<div class="col s12 m11">
								<div class="row">
									<div class="file-field input-field align-items-center">
										<div class="btn">
											<span>Tệp</span> <input type="file"
												onchange="readImageUser(this);" id="file" name="file">
										</div>
										<div class="file-path-wrapper">
											<input class="file-path validate" type="text">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- users edit media object ends -->
						<!-- users edit account form start -->
						<div class="row">
							<div class="col s12 m6">
								<div class="row">
									<div class="col s12 input-field">
										<form:input path="email" />
										<label for="email">Email</label>
										<form:errors path="email" class="error red-text" />
									</div>
									<div class="col s12 input-field">
										<form:input path="fullName" />
										<label for="fullName">Họ và tên</label>
										<form:errors path="fullName" class="error red-text" />
									</div>
									<div class="col s12 input-field">
										<form:input path="address" />
										<label for="address">Địa chỉ</label>
									</div>
									<div class="col s12 input-field">
										<form:input path="addressOrder" />
										<label for="address">Địa chỉ giao hàng</label>
									</div>
								</div>
							</div>
							<div class="col s12 m6">
								<div class="row">
									<div class="col s12 input-field">
										<form:input path="birthDay" type="date"
											class="birthdate-picker" />
										<label for="birthDay">Ngày sinh</label>
										<form:errors path="birthDay" class="error red-text" />
									</div>
									<div class="col s12 input-field">
										<form:select path="role">
											<form:option value="true">Quản trị viên</form:option>
											<form:option value="false">Người dùng</form:option>
										</form:select>
										 <label>Vai trò</label>
									</div>
									<div class="col s12 input-field">
										<form:select path="gender">
											<form:option value="true">Nam</form:option>
											<form:option value="false">Nữ</form:option>
										</form:select>
										<label>Giới tính</label>
									</div>
									<div class="col s12 input-field">
										<form:select path="login">
											<form:option value="true">Hoạt động</form:option>
											<form:option value="false">Không hoạt động</form:option>
										</form:select>
										<label>Đăng nhập</label>
									</div>
								</div>
							</div>
							<div class="col s12 display-flex justify-content-end mt-3">
								<button type="submit" class="btn indigo mr-3">
									<c:if test="${not isEdit }">Lưu
									thay đổi</c:if>
									<c:if test="${isEdit }">Cập
									nhật</c:if>
								</button>
								<a href="/admin/user" class="btn btn-light">Hủy</a>
							</div>
						</div>
					</form:form>
					<!-- users edit account form ends -->
				</div>
			</div>
		</div>
	</div>
</div>