<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="../resources/css/login_authentication.css"></link>

<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>


<div id="login_frame">
	<div id="login_form">
		<h1>로그인 완료되는 페이지</h1>
		<h3 id="coment">ID가 세션에 저장되었습니다.</h3>
		<div id="ul_div">
				
				<h3>ID : ${id}</h3>
				
			<ul id="find_ul">
				<li><a href="/PSH/login/logout">로그아웃</a></li>
				<li><a href="/PSH/crud/list">CRUD</a></li>
				<li><a href="/PSH/main/front">HOME</a></li>
			</ul>
		</div>
	</div>
</div>












<%@include file="../includes/footer.jsp"%>
