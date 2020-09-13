<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="../resources/css/findps.css"></link>

<%@include file="../includes/header.jsp"%>


<form action="/PSH/login/findps" method="post">
<div id="login_frame">
		<h1>비밀번호 찾기</h1>
			<div id="login_form">
				<input type="text" name="id" placeholder="가입하신 아이디를 입력하세요." required id="input_id" maxlength="12" >
				<div><button type="submit">확인</button></div>
		</div>
	</div>
</form>


<%@include file="../includes/footer.jsp"%>
