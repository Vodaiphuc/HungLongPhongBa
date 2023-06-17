let base_url = new URL(window.location.href).origin;

function increase(id, count) {
	let result = document.getElementById('sst' + count);
	let sst = result.value;
	let check;
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: base_url + "/shop/cart/find-qty?id=" + id,
		data: JSON.stringify(id),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(responseData) {
			check = parseInt(responseData);
			if (!isNaN(sst) && sst <= check && sst <= 10)
				result.value++;
			let resultOld = document.getElementById('sst' + count).value;
			updateQty(id, resultOld, count);
		}
	});
	return false;
}
function reduced(id, count) {
	let result = document.getElementById('sst' + count);
	let sst = result.value;
	if (!isNaN(sst) && sst > 1)
		result.value--;
	let resultOld = document.getElementById('sst' + count).value;
	updateQty(id, resultOld, count);
	return false;
}
function updateQty(id, resultOld, count) {
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: base_url + "/shop/cart/update?id=" + id + "&sst=" + resultOld,
		data: JSON.stringify(id),
		dataType: 'json',
		cache: false,
		timeout: 600000,
		success: function(responseData) {
			let totailCart = 0;
			responseData.forEach(item => {
				if (item.discount > 0) {
					totailCart += item.price * item.quantity - (item.price * item.quantity * item.discount * 0.01);
				} else {
					totailCart += item.price * item.quantity;
				}
			});
			document.getElementById('totailCart').innerHTML = "$" + totailCart;
			let price = document.getElementById('price' + count).innerHTML.replace('$', '');
			let discount = document.getElementById('discount' + count).innerHTML.replace('%', '');;
			let totail = 0;
			if (discount > 0) {
				totail = price * resultOld - (price * resultOld * discount * 0.01);
				document.getElementById("totail" + count).innerHTML = "$" + totail;
			} else {
				totail = price * resultOld;
				document.getElementById("totail" + count).innerHTML = "$" + totail;
			}
		}
	});
}
