var mypwd=document.getElementById("mypwd");
var inputpwd=document.getElementById("inputpwd");
var pwdMatchResule=document.getElementById("pwdMatchResule");

inputpwd.addEventListener("input", matchPwd);

function matchPwd(){
	if(mypwd.value==inputpwd.value){
    	pwdMatchResule.innerHTML="현재 비밀번호 확인되었습니다."
    	pwdMatchResule.style.color = "lightseagreen"
    }else{
    	pwdMatchResule.innerHTML="현재 비밀번호를 다시 확인해주세요.";
    	pwdMatchResule.style.color = "lightcoral"
    } 
}
