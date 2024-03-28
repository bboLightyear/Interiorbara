window.onload = function() {
	var myjoin = document.getElementById("myjoin");
	myjoin.onsubmit = function() {
		var pw1 = document.getElementById("pw1");
		var pw2 = document.getElementById("pw2");
		var pwResult = document.getElementById("pwResult");
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		var nickname = document.getElementById("nickname")
		var nicknameResult = document.getElementById("nicknameResult")
		var regNickName = /^(?=.*[a-z0-9가-힣])[a-z0-9ㄱ-힣]{2,15}$/;

		if (pw1.value.length < 8) {
			pwResult.innerHTML = "입력한 글자가 8글자 이상이어야 합니다."
			pwResult.style.color = "lightcoral"
			return false;
		}
		if (pw1.value != pw2.value) {
			pwResult.innerHTML = "비밀번호 불일치"
			pwResult.style.color = "lightcoral"
			return false;
		} else {
			if (!reg.test(pw1.value)) {
				pwResult.innerHTML = "비밀번호 규칙을 지켜서 다시 입력해주세요."
				pwResult.style.color = "lightcoral"
				return false;
			} else {
				pwResult.innerHTML = "비밀번호 사용가능합니다."
				pwResult.style.color = "lightseagreen"
				if (nickname.value.length < 2 || nickname.value.length > 15) {
					nicknameResult.innerHTML = "2~15글자로 입력하세요."
					nicknameResult.style.color = "lightcoral"
						return false;
				} else {
					if (!regNickName.test(nickname.value)) {
						nicknameResult.innerHTML = "한글영문숫자포함2~15자리로입력해주세요"
						nicknameResult.style.color = "lightcoral"
						return false;
					} else {
						nicknameResult.innerHTML = "정상입력"
						nicknameResult.style.color = "lightseagreen"
						return true;
					}
				}
			}
		}
	}
}