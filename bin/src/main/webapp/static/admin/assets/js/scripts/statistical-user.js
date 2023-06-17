$(window).on("load",
	function loadCharUser() {
		var year = document.getElementById("year").value,
			baseUrl = new URL(window.location.href).origin,
			visitUserByYearApi = baseUrl + "/admin/statistical/visitUserByYear/" + year,
			orderUserByYearApi = baseUrl + "/admin/statistical/orderUserByYear/" + year,
			dataVisit = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			dataOrder = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: visitUserByYearApi,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(responseData) {
				Object.keys(responseData).forEach(function(key) {
					console.log(responseData[key][0] + '-' + responseData[key][1]);
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
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: orderUserByYearApi,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(responseData) {
				Object.keys(responseData).forEach(function(key) {
					dataOrder[parseInt(responseData[key][0] - 1)] = parseInt(responseData[key][1]);
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
		var a = $("#chart-visit-order"),
			e = {
				type: "horizontalBar",
				options: {
					elements: {
						rectangle: {
							borderWidth: 2,
							borderColor: "rgb(0, 255, 0)",
							borderSkipped: "left"
						}
					},
					responsive: !0,
					maintainAspectRatio: !1,
					responsiveAnimationDuration: 500,
					legend: { position: "top" },
					scales: {
						xAxes: [{
							display: !0,
							gridLines: { color: "#f3f3f3", drawTicks: !1 },
							scaleLabel: { display: !0 }
						}],
						yAxes: [{
							display: !0, gridLines: { color: "#f3f3f3", drawTicks: !1 },
							scaleLabel: { display: !0 }
						}]
					}, title: { display: !1, text: "Chart of visits, orders" }
				}, data: {
					labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
					datasets: [{
						label: "Access times",
						data: dataVisit,
						backgroundColor: "#00bcd4",
						hoverBackgroundColor: "#00acc1",
						borderColor: "transparent"
					}, {
						label: "Order count",
						data: dataOrder,
						backgroundColor: "#ffeb3b",
						hoverBackgroundColor: "#fdd835",
						borderColor: "transparent"
					}]
				}
			};
		new Chart(a, e);
	});