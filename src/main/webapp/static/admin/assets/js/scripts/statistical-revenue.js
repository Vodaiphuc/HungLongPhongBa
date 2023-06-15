!function(o, e) {
	var colorArray = ['#FF6633', '#FFB399', '#FF33FF', '#FFFF99', '#00B3E6',
		'#E6B333', '#3366E6', '#999966', '#99FF99', '#B34D4D',
		'#80B300', '#809900', '#E6B3B3', '#6680B3', '#66991A',
		'#FF99E6', '#CCFF1A', '#FF1A66', '#E6331A', '#33FFCC',
		'#66994D', '#B366CC', '#4D8000', '#B33300', '#CC80CC',
		'#66664D', '#991AFF', '#E666FF', '#4DB3FF', '#1AB399',
		'#E666B3', '#33991A', '#CC9999', '#B3B31A', '#00E680',
		'#4D8066', '#809980', '#E6FF80', '#1AFF33', '#999933',
		'#FF3380', '#CCCC00', '#66E64D', '#4D80CC', '#9900B3',
		'#E64D66', '#4DB380', '#FF4D4D', '#99E6E6', '#6666FF'],
		year = document.getElementById("year").value,
		baseUrl = new URL(window.location.href).origin,
		orderDetailCategoryProductByYearApi = baseUrl + "/admin/statistical/orderDetailCategoryProductByYear/" + year,
		orderDetailCategoryProductByLastYearApi = baseUrl + "/admin/statistical/orderDetailCategoryProductByYear/" + (year -1),
		totailOrderDetailByYearApi = baseUrl + "/admin/statistical/totailOrderDetailByYear/" + year,
		dataCategoryProduct = [],
		lableCategoryProduct = [],
		colorCategoryProduct = [],
		dataCategoryProductLastYear = [],
		datatotailOrderDetailByYear = [];
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: orderDetailCategoryProductByYearApi,
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(responseData) {
			$('#legend-color').empty();
			var i = 0;
			Object.keys(responseData).forEach(function(key) {
				dataCategoryProduct.push(parseInt(responseData[key][1]));
				lableCategoryProduct.push(responseData[key][0]);
				colorCategoryProduct.push(colorArray[i]);
				$('#legend-color').append("<li class='ultra-small' style='color:" + colorArray[i] + "'>\
												<span class='legend-color'></span>\
												" + responseData[key][0] + "\
											</li>");
											console.log(i)
				i++;
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
		url: orderDetailCategoryProductByLastYearApi,
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(responseData) {
			Object.keys(responseData).forEach(function(key) {
				dataCategoryProductLastYear.push(parseInt(responseData[key][1]));
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
			url: totailOrderDetailByYearApi,
			dataType: 'json',
			cache: false,
			timeout: 600000,
			success: function(responseData) {
				Object.keys(responseData).forEach(function(key) {
					datatotailOrderDetailByYear[parseInt(responseData[key][0] - 1)] = parseInt(responseData[key][1]);
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
	var a, r = e("#revenue-line-chart"),
		i = {
			labels: lableCategoryProduct,
			datasets: [{
				label: "Year now",
				data: dataCategoryProduct,
				backgroundColor: "rgba(128, 222, 234, 0.5)",
				borderColor: "#d1faff",
				pointBorderColor: "#d1faff",
				pointBackgroundColor: "#00bcd4",
				pointHighlightFill: "#d1faff",
				pointHoverBackgroundColor: "#d1faff",
				borderWidth: 2,
				pointBorderWidth: 2,
				pointHoverBorderWidth: 4,
				pointRadius: 4
			},
			{
				label: "Last year",
				data: dataCategoryProductLastYear,
				borderDash: [15, 5],
				backgroundColor: "rgba(128, 222, 234, 0.2)",
				borderColor: "#80deea",
				pointBorderColor: "#80deea",
				pointBackgroundColor: "#00bcd4",
				pointHighlightFill: "#80deea",
				pointHoverBackgroundColor: "#80deea",
				borderWidth: 2,
				pointBorderWidth: 2,
				pointHoverBorderWidth: 4,
				pointRadius: 4
			}]
		};
	var n = {
		type: "line",
		options: {
			responsive: !0,
			legend: { display: !1 },
			hover: { mode: "label" },
			scales: {
				xAxes: [{
					display: !0,
					gridLines: { display: !1 },
					ticks: { fontColor: "#fff" }
				}],
				yAxes: [{
					display: !0,
					fontColor: "#fff",
					gridLines: { display: !0, color: "rgba(255,255,255,0.3)" },
					ticks: { beginAtZero: !1, fontColor: "#fff" }
				}]
			},
			title: { display: !0, text: "Chart of the number of products sold by category" }
		}, data: i
	}, d = e("#doughnut-chart"),
		s = {
			type: "doughnut",
			options: b = { 
				cutoutPercentage: 70, 
				legend: { display: !1 }, 
				title: { display: !0, text: "Chart of the number of products sold by category" } },
			data: {
				labels: lableCategoryProduct,
				datasets: [{
					label: "Sales",
					data: dataCategoryProduct,
					backgroundColor: colorCategoryProduct
				}]
			}
		}, f = e("#trending-bar-chart"),
		p = {
			labels: ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"],
			datasets: [{
				label: "Sales",
				data: datatotailOrderDetailByYear,
				backgroundColor: "#46BFBD",
				hoverBackgroundColor: "#009688"
			}]
		};
	var c = {
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
			title: { display: !0, text: "Chart of the number of products sold by month" },
			tooltips: {
				titleFontSize: 0,
				callbacks: { label: function(o, e) { return o.yLabel } }
			}
		}, data: p
	};
	o.onload = function() {
		a = new Chart(r, n),
		l = new Chart(f, c);
		new Chart(d, s);
	};
}(window, (document, jQuery));