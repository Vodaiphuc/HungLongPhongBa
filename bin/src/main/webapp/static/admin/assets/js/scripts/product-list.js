var baseUrl = new URL(window.location.href).origin;

function deleteProduct(id, name) {
	swal({
		title: "Are you sure?",
		text: "You have want to delete product " + name + ". You will not be able to recover this imaginary file!",
		icon: "warning",
		dangerMode: !0,
		buttons: {
			cancel: "No, Please!",
			delete: "Yes, Delete It"
		}
	}).then(function(e) {
		e ? $.ajax({
			type: "DELETE",
			url: baseUrl + "/admin/product/delete/" + id,
			cache: false,
			success: function() {
				swal("Poof! Your imaginary file has been deleted!",
					{
						icon: "success"
					}).then(function() {
						location.reload(true)
					})
			},
			error: function(jqXHR, e) {
				console.log(e)
				let error_msg = '';
				if (jqXHR.status == 404) {
					error_msg = 'Requested page not found. [404]';
					window.location = baseUrl + "/error/admin/404";
				} else if (jqXHR.status == 500) {
					error_msg = 'Internal Server Error [500].';
					window.location = baseUrl + "/error/admin/500";
				}
				console.log(error_msg)
			}
		})
			: swal("Your imaginary file is safe",
				{
					title: "Cancelled",
					icon: "error"
				})
	})
}

function viewApiProduct(id) {
	let viewApi = baseUrl + "/admin/product/view/";
	let viewImageApi = baseUrl + "/admin/product/view-image/";
	$('.modal').modal();
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: viewApi + id,
		data: JSON.stringify(id),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(responseData) {
			$("#viewId").text(responseData.id);
			$("#viewName").text(responseData.name);
			$("#viewPrice").text(responseData.price);
			$("#viewDiscount").text(responseData.discount);
			$("#viewStartDayDiscount").text(moment(responseData.startDayDiscount).format('L'));
			$("#viewEndDayDiscount").text(moment(responseData.endDayDiscount).format('L'));
			$("#viewViews").text(responseData.views);
			$("#viewQuantity").text(responseData.quantity);
			$("#viewActive").text(responseData.active);
			$("#viewDescription").text(responseData.description);
			$("#viewWidth").text(responseData.width);
			$("#viewHeight").text(responseData.height);
			$("#viewDepth").text(responseData.depth);
			$("#viewWeight").text(responseData.weight);
			$("#viewBrand").text(responseData.brand.name);
			$("#viewCategoryProduct").text(responseData.categoryProduct.name);
			$("#viewColor").text(responseData.color.name);
			$("#viewCreatedBy").text(responseData.createdBy.fullName);
			$("#viewCreatedDate").text(moment(responseData.createdDate).format('L'));
			$("#viewLastModifiedBy").text(responseData.lastModifiedBy.fullName);
			$("#viewLastModifiedDate").text(moment(responseData.lastModifiedDate).format('L'))
		},
		error: function(jqXHR, e) {
			console.log(e)
			let error_msg = '';
			if (jqXHR.status == 404) {
				error_msg = 'Requested page not found. [404]';
				window.location = baseUrl + "/error/admin/404";
			} else if (jqXHR.status == 500) {
				error_msg = 'Internal Server Error [500].';
				window.location = baseUrl + "/error/admin/500";
			}
			console.log(error_msg)
		}
	});

	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: viewImageApi + id,
		data: JSON.stringify(id),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(responseData) {
			$('#tbodyExample').empty();
			$.each(responseData, function(index) {
				$('#tbodyExample').append("<div class='col s12 m6 l4 xl2'>\
            								<div>\
                  								<img src='/uploads/" + responseData[index].name + "' class='responsive-img mb-10'>\
            								</div>\
       									  </div>");
			})
		},
		error: function(jqXHR, e) {
			console.log(e)
			let error_msg = '';
			if (jqXHR.status == 404) {
				error_msg = 'Requested page not found. [404]';
				window.location = baseUrl + "/error/admin/404";
			} else if (jqXHR.status == 500) {
				error_msg = 'Internal Server Error [500].';
				window.location = baseUrl + "/error/admin/500";
			}
			console.log(error_msg)
		}
	});
}