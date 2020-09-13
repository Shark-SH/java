<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../resources/css/login_signup.css"></link>
<form action="/PSH/login/signup" method="post">
	<div id="signup_frame">
		<div id="signup_form">
			<div id="id_div" class="signup_input">
				<p>아이디</p>
				<input type="text" name="id" placeholder="아이디를 입력하세요." id="input_id"
					maxlength="12" required> <input type="button" value="중복체크"
					id="idcheck">
			</div>
			<div id="id_inspection"></div>
			<div id="ps_div" class="signup_input">
				<p>비밀번호</p>
				<input type="password" name="ps" placeholder="비밀번호를 입력하세요."
					id="input_ps" maxlength="12" required>
			</div>
			<span id="ps_inspection"></span>
			<div id="pss_div" class="signup_input">
				<p>비밀번호확인</p>
				<input type="password" name="PSS" placeholder="비밀번호를 입력하세요."
					id="input_pss" maxlength="12">
			</div>
			<div id="ph_div" class="signup_input">
				<p>휴대폰번호</p>
				<input type="text" name="ph" placeholder="휴대폰번호를 입력하세요."
					id="input_ph" maxlength="13" required>
			</div>
			<span id="ph_inspection"></span>
			<div><button type="submit" id="submit_button">확인</button></div>
		</div>
	</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	var regExp=/^[a-z0-9]{8,12}$/;	//아이디를 위한 변수선언
	var password= /^(?=.*[a-z])(?=.*[0-9]).{8,12}$/;	//비밀번호를 위한 변수선언
	var phone = /^[0-9]{11}$/;
	var idck = 0;	//아이디 체크 변수 1 / 0 / -1
	var idtrue = 0;	//정규식 아이디 체크 변수
	var pstrue = 0;	//정규식 비밀번호 체크 변수
	var phture = 0;

	//#input_id라는 input태그value 값을 조건판단 하는 이벤트(아이디 조건 판단)
	$("#input_id").keyup(function(){ 
		var inputid=$("#input_id").val();	
		 selectid = regExp.test(inputid);	 
	if(!selectid){
		$("#id_inspection").text("영문과 숫자로 조합된 8~12자리의 아이디를 입력하세요.");
		$("#id_inspection").attr("style", "color:red");
		idtrue = 0
	}
	else{
		$("#id_inspection").text("");
		idtrue= 1;
	}
	});
	//#input_ps라는 input태그value 값을 조건판단 하는 이벤트(비밀번호 조건 판단)
	$("#input_ps").keyup(function(){
		var inputps=$("#input_ps").val();
		var selectps = password.test(inputps);
	if(!selectps){
		$("#ps_inspection").html("영문과 숫자로 조합된 8~12자리의 비밀번호를 입력하세요.");
		$("#ps_inspection").css("color","red");
		pstrue = 0;
	}
	else{
		$("#ps_inspection").html("");
		pstrue = 1;
	}
	});
	//#input_ph라는 input태그value 값을 조건판단 하는 이벤트(휴대폰 조건 판단)
	$("#input_ph").keyup(function(){
		var inputph = $("#input_ph").val();
		var selectph = phone.test(inputph);
		if(!selectph){
			$("#ph_inspection").html("숫자로이루어진 11자리를 입력하여주세요.");
			$("#ph_inspection").css("color","red");
			phtrue = 0;
		}
		else{
			$("#ph_inspection").html("");
			phtrue = 1;
		}
	})
	
	//#idcheck조건의 버튼을 클릭하면(~
		$("#idcheck").on("click",function(){
		 var userid =  $("#input_id").val(); 
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : userid,
	            url : "/PSH/login/idcheck",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data.cnt > 0) {	
	                    alert($("#input_id").val()+"(은)는 아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                    $("#input_id").val('');
	                    idck = -1;
	                }
	                else if(idtrue == 0){
	                    alert($("#input_id").val()+"(은)는 사용할 수 없는 아이디 입니다.");
	                    $("#input_id").val('');
	            		$("#id_inspection").html("");
	            		idck= 0;
	                }
	                else{
	                	alert($("#input_id").val()+"(은)는 사용할 수 있는 아이디입니다.")
	                	idck = 1;
	                }
	            }
	        ,
	            error : function(error) {
	                        alert("아이디를 입력해주세요!");
	            }
	              });
			});
		$("#submit_button").on("click",function(e){
			var ps = $("#input_ps");
			var pss = $("#input_pss");
			
			if(ps.val()!=pss.val()){
				e.preventDefault();
				alert("비밀번호를 다시 확인하여 주세요.");
				pss.val('');
			}
			
			else if(idck==0){
				e.preventDefault();
				alert("아이디 중복체크를 해주세요!");
				
			}
			else if(idck==-1){
				e.preventDefault();
				alert($("#input_id").val()+"(은)는 사용할 수 없는 아이디입니다.");
				$("#input_id").val('');
			}
			else if(pstrue == 0){
				e.preventDefault();
				alert("사용할 수 없는 비밀번호 입니다.");
				$("#input_ps").val('');
				$("#input_pss").val('');
			}
			else if(phtrue == 0){
				e.preventDefault();
				alert("휴대폰 번호를 확인하여주세요.");
			}
			else{
				alert("회원가입 완료");
			}
		});
});


</script>



<%@include file="../includes/footer.jsp"%>
