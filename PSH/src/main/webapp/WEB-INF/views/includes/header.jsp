<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../resources/css/include_header.css"></link>
<link rel="stylesheet" type="text/css" href="../resources/css/include_footer.css"></link>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../resources/js/include_header.js"></script>

</head>
<body>
	<div id="header_top">
		<div id="header_main">
		<h2><span id="header_title"><a href="/PSH/main/front">MySelf</a></span></h2>
			<c:if test="${not empty sessionScope.id}">
			</c:if>
			<div id="header_manual">
				<ul id="header_manual_ul">
					<li class="header_li">
					<a href="/PSH/content/itsme" class="top_a">소개</a>
						<div class="header_manual_content">
							<ul>
								<li><a href="/PSH/content/itsme">it's me</a></li>
							</ul>
						</div>
					</li>
					<li class="header_li">
					<a href="/PSH/content/activity" class="top_a">흔적</a>
						<div class="header_manual_content">
							<ul>
								<li><a href="/PSH/content/activity">Activity</a></li>
							</ul>
						</div>
					</li>
					<li class="header_li">
					<a href="/PSH/crud/list" class="top_a">backand</a>
						<div class="header_manual_content">
							<ul>
								<li><a href="/PSH/crud/list">CRUD</a></li>
								<li><a href="/PSH/login/main">Login</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="Blank_block">

	</div>
	<div id="session_div">
			<c:if test="${not empty sessionScope.id}">
			<span id="session_idform"><span id="session_idtext"><c:out value="${sessionScope.id}" /></span>님이 로그인 되었습니다.
			<span id="logout"><a href="/PSH/login/logout">로그아웃</a></span></span>
			</c:if>
	</div>		
<script	type="text/javascript">
		$(document).ready(function(){
	
			$(".top_a").hover(function(){
				$(this).css("color","blue");
				},function(){
				$(this).css("color","black");
			 	});
			$(".header_manual_content ul li a").hover(function(){
				$(this).css("color","blue");
				},function(){
				$(this).css("color","black");
			 	});
		});
	</script>
			