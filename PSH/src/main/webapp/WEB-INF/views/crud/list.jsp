<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="../resources/css/crud_list.css"></link>


<%@include file="../includes/header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){	
	var now = $("input[name='pageNum']").val();
	var num = '${pageMaker.cri.pageNum}'
	if(now == num){
		$("#"+'${pageMaker.cri.pageNum}').css("background","gray");
		$("#"+'${pageMaker.cri.pageNum}').css("color","white");	
	}
	
	
	var result = '<c:out value="${result}"/>';
	
	$('#newRegister').on("click",function(e){
		var login = "${sessionScope.id}";
		if(login == ""|| login!="admin"){
			alert("로그인을 하셔야 사용할 수 있습니다.");
			e.preventdefault();
		}
		else
		self.location='/PSH/crud/register';
	});
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		console.log('click');		
	});
	
	$(".move").on("click",function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/PSH/crud/get");
		actionForm.submit();
	});

var searchForm = $("#searchForm");	
$("#searchForm button").on("click",function(e){
	
	if(!searchForm.find("option:selected").val()){
		alert("검색종류를 선택하세요");
		return false;
	}
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하세요");
		return false;
	}
	searchForm.find("input[name='pageNum']").val("1");
	e.preventDefault();
	
	searchForm.submit();
	
});	

	
});

</script>


<table id="crud_table" border="1">
<tr>
<th class="crud_th" id="crud_th_bno">번호</th>
<th class="crud_th" id="crud_th_title">제목</th>
<th class="crud_th" id="crud_th_writer">작성자</th>
<th class="crud_th" id="crud_th_date">작성일</th>
<th class="crud_th" id="crud_th_date">수정일</th>
</tr>
<c:forEach items="${list}" var="board">
<tr>
<td class="crud_td" id="crud_th_bno"><c:out value="${board.bno}"/></td>
<td class="crud_td" id="crud_th_content"><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/>
<b>[<c:out value="${board.replycnt}"/>]</b>
</a ></td>
<td class="crud_td" id="crud_th_writer"><c:out value="${board.writer}"/></td>
<td class="crud_td" id="crud_th_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
<td class="crud_td" id="crud_th_date"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
</tr>
</c:forEach>

</table>
<div id="page_list">
<div>
	<ul>
	<c:if test="${pageMaker.prev}">
	<li class="paginate_button"><a href="${pageMaker.startPage -1}">Previous</a>
	</li>
	</c:if>
	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	<li class='paginate_button ${pageMaker.cri.pageNum ==num? "active":""}'><a href="${num}" id="${num}">${num}</a>
	</li>
	</c:forEach>
	<c:if test="${pageMaker.next}">
	<li class="paginate_button"><a href="${pageMaker.endPage+1}">Next</a>
	</li>
	</c:if>
	</ul>
	</div>
</div>
<div id="table_footer">
<div id="Register">
<button type="button" id="newRegister" >글쓰기</button>
</div>
<form id='actionForm' action="/PSH/crud/list" method='get'>
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
</form>

<form id='searchForm' action='/PSH/crud/list' method='get'>
<div id="search_div">
<select name="type">
<option value="" <c:out value="${pageMaker.cri.type==null?'selected':''}"/>></option>
<option value="T"<c:out value="${pageMaker.cri.type=='T'?'selected':''}"/>>제목</option>
<option value="C"<c:out value="${pageMaker.cri.type=='C'?'selected':''}"/>>내용</option>
<option value="W"<c:out value="${pageMaker.cri.type=='W'?'selected':''}"/>>작성자</option>
<option value="TC"<c:out value="${pageMaker.cri.type=='TC'?'selected':''}"/>>제목 or 내용</option>
<option value="TW"<c:out value="${pageMaker.cri.type=='TW'?'selected':''}"/>>제목 or 작성자</option>
<option value="TWC"<c:out value="${pageMaker.cri.type=='TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
</select>
<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
<button id="search_button">검색</button>
</div>
</form>
</div>

<%@include file="../includes/footer.jsp"%>
