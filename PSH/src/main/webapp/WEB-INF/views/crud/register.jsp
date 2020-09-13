<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../resources/css/crud_register.css"></link>

<div id="register_frame">
	<p id="maintext"><h2>게시글을 입력해주세요.</h2><p>
	<div id="register_subframe">
	<form role="form" action="/PSH/crud/register" method="POST">
	<div id="title_div">
	<input name="title" placeholder="제목을 입력하세요." required>
	</div>
	<div id="content_div">
	<textarea rows="3" name="content" placeholder="내용을 입력해주세요." required></textarea>
	</div>
	<div id="writer_div">
	<input name="writer" value="${sessionScope.id}" readonly="readonly">
	</div>
	<button type="submit" id="button_submit">글쓰기</button>
	<button type="reset" id="button_reset">초기화</button>
	</form>
	</div>
	
</div>

<%@include file="../includes/footer.jsp"%>