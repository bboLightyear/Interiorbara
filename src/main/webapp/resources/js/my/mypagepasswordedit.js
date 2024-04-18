var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
var inputpwd=document.getElementById("inputpwd");
var pwdMatchResule=document.getElementById("pwdMatchResule");
var toggleMyPwd=document.getElementById("toggleMyPwd");

inputpwd.addEventListener("input", function (){
	if(!reg.test(inputpwd.value)){
    	pwdMatchResule.innerHTML="영문숫자특수문자를 포함한 8자리 이상"
    	pwdMatchResule.style.color = "lightcoral"
    	return false;
    }else{
    	pwdMatchResule.innerHTML="";
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
