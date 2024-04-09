var mypwd=document.getElementById("mypwd");
var inputpwd=document.getElementById("inputpwd");
var pwdMatchResule=document.getElementById("pwdMatchResule");
var toggleMyPwd=document.getElementById("toggleMyPwd");

inputpwd.addEventListener("input", function (){
	if(mypwd.value==inputpwd.value){
    	pwdMatchResule.innerHTML="현재 비밀번호 확인되었습니다."
    	pwdMatchResule.style.color = "lightseagreen"
    	return false;
    }else{
    	pwdMatchResule.innerHTML="현재 비밀번호를 다시 확인해주세요.";
    	pwdMatchResule.style.color = "lightcoral"
    	return false;
    } 
});

toggleMyPwd.addEventListener('click', function () {
    if (inputpwd.type === 'password') {
    	inputpwd.type = 'text';
    	toggleMyPwd.innerHTML="<i class='fa-solid fa-eye-slash'></i>";
    } else {
    	inputpwd.type = 'password';
        toggleMyPwd.innerHTML="<i class='fa-solid fa-eye'></i>";
   }
});
