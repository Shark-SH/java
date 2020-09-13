<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../resources/css/findidok.css"></link>

<div id="login_frame">
	<h1>찾은 아이디의 목록입니다.</h1>
	<div id="login_form">
		<c:forEach items="${id}" var="i">
		<p><c:out value="${i.id}"/></p>
		</c:forEach>
		<div id="a_div">
			<a href="/PSH/login/main">로그인</a>
		</div>
	</div>
</div>



<%@include file="../includes/footer.jsp"%>