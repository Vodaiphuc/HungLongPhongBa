!function(o, e) {
	var today = new Date();
	var baseUrl = new URL(window.location.href).origin,
		visitNewUserByYearApi = baseUrl + "/admin/dashboard/visitNewUserByYear/" + today.getFullYear(),
		dataVisit = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: visitNewUserByYearApi,
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(responseData) {
			Object.keys(responseData).forEach(function(key) {
				dataVisit[parseInt(responseData[key][0] - 1)] = parseInt(responseData[key][1]);
			});
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

	var f = e("#user-statistics-bar-chart"),
		p = {
			labels: ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"],
			datasets: [{
				label: "Sales",
				data: dataVisit,
				backgroundColor: "#46BFBD",
				hoverBackgroundColor: "#009688"
			}]
		},
		c = {
			type: "bar",
			options: {
				responsive: !0,
				legend: { display: !1 },
				hover: { mode: "label" },
				scales: {
					xAxes: [{
						display: !0,
						gridLines: { display: !1 }
					}],
					yAxes: [{
						display: !0,
						fontColor: "#fff",
						gridLines: { display: !1 },
						ticks: { beginAtZero: !0 }
					}]
				},
				title: { display: !0, text: "Chart of the new user by year now" },
				tooltips: {
					titleFontSize: 0,
					callbacks: { label: function(o, e) { return o.yLabel } }
				}
			}, data: p
		};
	o.onload = function() {
		new Chart(f, c);
	};
}(window, (document, jQuery));