var baseUrl = new URL(window.location.href).origin;

function deleteInvoice(id, fullName) {
	swal({
		title: "Are you sure?",
		text: "You have want to delete invoice " + fullName + ". You will not be able to recover this imaginary file!",
		icon: "warning",
		dangerMode: !0,
		buttons: {
			cancel: "No, Please!",
			delete: "Yes, Delete It"
		}
	}).then(function(e) {
		e ? $.ajax({
			type: "DELETE",
			url: baseUrl + "/admin/invoice/delete/" + id,
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
				var error_msg = '';
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

$(".invoice-print").length && $(".invoice-print").on("click", function() { window.print() });

function viewApiInvoice(id) {
	document.getElementById("hiddenId").value = id;
	let viewApi = baseUrl + "/admin/invoice/edit/";
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
			if (responseData.status == 'waiting') {
				document.getElementById("status1").checked = false;
				document.getElementById("status2").checked = false;
				document.getElementById("status3").checked = true;
			} else if (responseData.status == 'being transported') {
				document.getElementById("status1").checked = false;
				document.getElementById("status2").checked = true;
				document.getElementById("status3").checked = false;
			} else if (responseData.status == 'delivered') {
				document.getElementById("status1").checked = true;
				document.getElementById("status2").checked = false;
				document.getElementById("status3").checked = false;
			}

			if (responseData.pay == 'check payments') {
				document.getElementById("pay1").checked = false;
				document.getElementById("pay2").checked = true;
			} else if (responseData.pay == 'paypal') {
				document.getElementById("pay1").checked = true;
				document.getElementById("pay2").checked = false;
			}
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

function updateInvoice() {
	let id = document.getElementById("hiddenId").value;
	let status = document.querySelector('input[name="status"]:checked').value;
	let pay = document.querySelector('input[name="pay"]:checked').value;
	let viewApi = baseUrl + "/admin/invoice/update/";
	$.ajax({
		type: "PUT",
		url: viewApi + id + '/' + status + '/' + pay,
		success: function() {
			swal("Cart update successfull!",
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
	});
}

