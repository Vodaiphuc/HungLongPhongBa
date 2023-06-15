var baseUrl = new URL(window.location.href).origin;

function deleteColor(id, name) {
	swal({
		title: "Are you sure?",
		text: "You have want to delete color " + name + ". You will not be able to recover this imaginary file!",
		icon: "warning",
		dangerMode: !0,
		buttons: {
			cancel: "No, Please!",
			delete: "Yes, Delete It"
		}
	}).then(function(e) {
		e ? $.ajax({
			type: "DELETE",
			url: baseUrl + "/admin/color/delete/" + id,
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

function viewApiColor(id) {
	let viewApi = baseUrl + "/admin/color/view/";
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
}