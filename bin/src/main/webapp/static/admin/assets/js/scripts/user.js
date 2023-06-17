var baseUrl = new URL(window.location.href).origin;

function deleteUser(id, fullName) {
	swal({
		title: "Are you sure?",
		text: "You have want to delete user " + fullName + ". You will not be able to recover this imaginary file!",
		icon: "warning",
		dangerMode: !0,
		buttons: {
			cancel: "No, Please!",
			delete: "Yes, Delete It"
		}
	}).then(function(e) {
		e ? $.ajax({
			type: "DELETE",
			url: baseUrl + "/admin/user/delete/" + id,
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
					window.location = baseUrl +  "/error/admin/500";
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

function readImageUser(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#avatar').attr('src', e.target.result);
		};

		reader.readAsDataURL(input.files[0]);
	}
}


