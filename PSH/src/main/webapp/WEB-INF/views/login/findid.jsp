<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../resources/css/findid.css"></link>


<form action="/PSH/login/findid" method="post">
<div id="login_frame">
		<h1>아이디 찾기</h1>
			<div id="login_form">
				<input type="text" name="ph" placeholder="가입하신 휴대폰번호를 입력하세요." required id="input_ph" maxlength="13">
				<div><button type="submit">확인</button></div>
		</div>
	</div>
</form>



<%@include file="../includes/footer.jsp"%>