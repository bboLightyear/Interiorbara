var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
var pw = document.getElementById("pw");
var pwResult = document.getElementById("pwResult");
var togglePwd = document.getElementById("togglePwd");

pw.addEventListener("input", function () {
	if (!reg.test(pw.value)) {
		pwResult.innerHTML = "영문숫자특수문자를 포함한 8자리 이상"
		pwResult.style.color = "lightcoral"
	} else {
		pwResult.innerHTML = ""
	}
});

togglePwd.addEventListener('click', function () {
    if (pw.type === 'password') {
        pw.type = 'text';
        togglePwd.innerHTML="<i class='fa-solid fa-eye-slash'></i>";
    } else {
        pw.type = 'password';
        togglePwd.innerHTML="<i class='fa-solid fa-eye'></i>";
   }
});