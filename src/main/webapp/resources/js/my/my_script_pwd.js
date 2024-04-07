var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
var pw1 = document.getElementById("pw1");
var pw2 = document.getElementById("pw2");
var pw1Result = document.getElementById("pw1Result");
var pw2Result = document.getElementById("pw2Result");

pw1.addEventListener("input", checkPw);
pw2.addEventListener("input", comparePw);

function checkPw() {
	if (!reg.test(pw1.value)) {
		pw1Result.innerHTML = "영문숫자특수문자를 포함한 8자리 이상"
		pw1Result.style.color = "lightcoral"
		return false;
	} else {
		pw1Result.innerHTML = "안전한비밀번호입니다."
		pw1Result.style.color = "lightseagreen"
		return false;
	}
}

function comparePw() {
	if (pw1.value != pw2.value) {
		pw2Result.innerHTML = "비밀번호 불일치"
		pw2Result.style.color = "lightcoral"
		return false;
	} else {
		pw2Result.innerHTML = ""
		return true;
	}
}

var togglePwd1 = document.getElementById("togglePwd1");
var togglePwd2 = document.getElementById("togglePwd2");

togglePwd1.addEventListener('click', function () {
    if (pw1.type === 'password') {
        pw1.type = 'text';
        togglePwd1.innerHTML="<i class='fa-solid fa-eye-slash'></i>";
    } else {
        pw1.type = 'password';
        togglePwd1.innerHTML="<i class='fa-solid fa-eye'></i>";
   }
});
togglePwd2.addEventListener("click", function () {
	if (pw2.type === 'password') {
        pw2.type = 'text';
        togglePwd2.innerHTML="<i class='fa-solid fa-eye-slash'></i>";
    } else {
        pw2.type = 'password';
        togglePwd2.innerHTML="<i class='fa-solid fa-eye'></i>";
   }
});