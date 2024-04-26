var regNickName = /^(?=.*[a-z0-9가-힣])[a-z0-9ㄱ-힣]{2,15}$/;
var nickname = document.getElementById("nickname")
var nicknameResult = document.getElementById("nicknameResult")

nickname.addEventListener("input", checkNickname);

function checkNickname() {
	if (!regNickName.test(nickname.value)) {
		nicknameResult.innerHTML = "한글영문숫자포함2~15자리로입력해주세요"
		nicknameResult.style.color = "lightcoral"
	} else {
		nicknameResult.innerHTML = "";
		nicknameResult.style.color = "lightseagreen";
	}	
}
