$(window).on("load",
	function loadCharProduct() {
		var year = document.getElementById("year").value,
			baseUrl = new URL(window.location.href).origin,
			reviewProductByYearApi = baseUrl + "/admin/statistical/reviewProductByYear/" + year,
			likeProductByYearApi = baseUrl + "/admin/statistical/likeProductByYear/" + year,
			dataReview = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			dataLike = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: reviewProductByYearApi,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(responseData) {
				Object.keys(responseData).forEach(function(key) {
					dataReview[parseInt(responseData[key][0] - 1)] = parseInt(responseData[key][1]);
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
			url: likeProductByYearApi,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(responseData) {
				Object.keys(responseData).forEach(function(key) {
					dataLike[parseInt(responseData[key][0] - 1)] = parseInt(responseData[key][1]);
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
		var a = $("#chart-like-review"),
			e = {
				type: "line",
				options: {
					responsive: !0,
					maintainAspectRatio: !1,
					legend: { position: "bottom" },
					hover: { mode: "label" },
					scales: {
						xAxes: [{
							display: !0,
							gridLines: {
								color: "#f3f3f3",
								drawTicks: !1
							},
							scaleLabel: {
								display: !0,
								labelString: "Tháng"
							}
						}],
						yAxes: [{
							display: !0,
							gridLines: {
								color: "#f3f3f3",
								drawTicks: !1
							},
							scaleLabel: {
								display: !0,
								labelString: "Số lượt"
							}
						}]
					},
					title: { display: !0, text: "Bảng thống kế lượt yêu thích, đánh giá trong năm" }
				},
				data: {
					labels: ["T1", "T2", "T3", "T4", "T5", "T6", "T7", "T8", "T9", "T10", "T11", "T12"],
					datasets: [{
						label: "Số lượt đánh giá",
						data: dataReview,
						fill: !1,
						borderColor: "#03a9f4",
						pointBorderColor: "#03a9f4",
						pointBackgroundColor: "#FFF",
						pointBorderWidth: 2,
						pointHoverBorderWidth: 2,
						pointRadius: 4
					}, {
						label: "Số lượt yêu thích",
						data: dataLike,
						fill: !1,
						borderColor: "#ffc107",
						pointBorderColor: "#ffc107",
						pointBackgroundColor: "#FFF",
						pointBorderWidth: 2,
						pointHoverBorderWidth: 2,
						pointRadius: 4
					}]
				}
			};
		new Chart(a, e);
	});