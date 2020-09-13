<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../resources/css/crud_modify.css"></link>

<form role="form" action="/PSH/crud/modify" method="post">
<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
<input type="hidden" name='bno' value='<c:out value="${board.bno}"/>'>



<div id="modify_frame">
<p id="maintext"><h2>수정되는 게시글을 작성해주세요</h2><p>
<div id="modify_subframe">
<div id="title_div">
<input name="title" value='<c:out value="${board.title}"/>' required>
</div>
<div id="content_div">
<textarea rows="3" name="content" required>
<c:out value="${board.content}"/>
</textarea>
</div>
<div id="writer_div">
<input name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
</div>
<button type="submit" data-oper='modify' id="button_submit">확인</button>
<button type="submit" data-oper='remove' id="button_submit">삭제</button>
<button type="submit" data-oper='list' id="button_submit">목록</button>
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
var formObj = $("form");

$('button').on("click", function(e){
	e.preventDefault();
	
	var operation= $(this).data("oper");
	
	console.log(operation);
	
	if(operation == 'remove'){
		formObj.attr("action","/PSH/crud/remove");
	}else if(operation == 'list'){
		formObj.attr("action","/PSH/crud/list").attr("method","get");
		var pageNumTag = $("input[name='pageNum']").clone();
		var amountTag = $("input[name='amount']").clone();
		var keywordTag = $("input[name='keyword']").clone();
		var typeTag = $("input[name='type']").clone();
		
		formObj.empty();
		
		formObj.append(pageNumTag);
		formObj.append(amountTag);
		formObj.append(keywordTag);
		formObj.append(typeTag);
	}
	formObj.submit();
	});
});



</script>




</form>
<%@include file="../includes/footer.jsp"%>