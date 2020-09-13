<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../resources/css/findpsok.css"></link>


<div id="login_frame">
	<h1>찾은 비밀번호입니다.</h1>
	<div id="login_form">
		<c:forEach items="${ps}" var="i">
		<p><c:out value="${i.ps}"/></p>
		</c:forEach>
		<div id="a_div">
			<a href="/PSH/login/main">로그인</a>
		</div>
	</div>
</div>



<%@include file="../includes/footer.jsp"%>