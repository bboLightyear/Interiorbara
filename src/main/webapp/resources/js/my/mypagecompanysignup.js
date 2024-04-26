function oninputNum(target){
//	target.
	target.value=target.value
	.replace(/[^0-9]/g,'')
//	.replace(/([0-9]{3})([0-9]{2})([0-9]{5})/g, "$1-$2-$3")
}
var regNum= /^([0-9]{3})([0-9]{2})([0-9]{5})$/;
var interior = document.getElementById("interior")
var interiorResult = document.getElementById("interiorResult")

var seller = document.getElementById("seller")
var sellerResult = document.getElementById("sellerResult")

interior.addEventListener("input",function () {
	if (!regNum.test(interior.value)) {
		interiorResult.innerHTML = "10자리숫자만입력해주세요"
		interiorResult.style.color = "lightcoral"
		return false;
	}else if(interior.value.length == 10 || interior.value.length == 0) {
		interiorResult.innerHTML = ""
	}

});
seller.addEventListener("input", function () {
	if (!regNum.test(seller.value)) {
		sellerResult.innerHTML = "10자리숫자만입력해주세요"
		sellerResult.style.color = "lightcoral"
		return false;
	}else if(seller.value.length == 10 || seller.value.length == 0){
		sellerResult.innerHTML = ""
	}
});
