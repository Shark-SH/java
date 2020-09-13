<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="../resources/css/login_main.css"></link>


<%@include file="../includes/header.jsp"%>

<form action="/PSH/login/main" method="post">
<div id="login_frame">
	<h1>Login </h1>
	<div id="login_form">
			<input type="text" name="id" placeholder="아이디를 입력하세요." required id="input_id">
			<input type="password" name="ps" placeholder="비밀번호를 입력하세요." required id="input_ps">
			<ul>
				<li><button type="submit">Login</button></li>
			</ul>
			<ul id="find_ul">
				<li><a href="/PSH/login/signup">회원가입</a></li>
				<li><a href="/PSH/login/findid">아이디찾기</a></li>
				<li><a href="/PSH/login/findps">비밀번호찾기</a></li>
			</ul>
	</div>
</div>

</form>

<script type="text/javascript">
var fail = '${fail}';
if(fail == "fail"){
	alert("아이디와 비밀번호를 확인해주세요.");
}

</script>





<%@include file="../includes/footer.jsp"%>
