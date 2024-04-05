var regPhone= /^(010)-?[0-9]{3,4}-?[0-9]{4}$/;
var phone = document.getElementById("phone")
var phoneResult = document.getElementById("phoneResult")

phone.addEventListener("input", checkPhone);

function checkPhone() {
	if (!regPhone.test(phone.value)) {
		phoneResult.innerHTML = "휴대폰번호형식으로10~11자리숫자만입력해주세요"
		phoneResult.style.color = "lightcoral"
	}else{
		phoneResult.innerHTML = ""
	}
}
var redDate = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;

var birth = document.getElementById("birth")
var birthResult = document.getElementById("birthResult")

birth.addEventListener("input", checkBirth);

function checkBirth(){
	if(!redDate.test(birth.value)){
		birthResult.innerHTML = "날짜형식으로8자리숫자만입력해주세요"
		birthResult.style.color = "lightcoral"
	}else{
		birthResult.innerHTML = ""
	}	
	
}
			
		