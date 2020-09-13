<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<script type="text/javascript" src="../resources/js/reply.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/action.css"></link>
<link rel="stylesheet" type="text/css" href="../resources/css/crud_get.css"></link>
<style>
.reply_list_frame{
	cursor: pointer;
	border-bottom:1px solid lightgray;
}
</style>



<!-- M -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelled="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글을 작성해주세요</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="replyer"
						value="replyer" required>
						
				</div>
				<div class="form-group">
					<label>댓글</label> <input class="form-control" name="reply"
						value="reply" required>
				</div>
				<div class="form-group">
					<label>Reply Date</label> <input class="form-control"
						name="replydate" value="">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
				<button id="modalClassBtn" type="button" class="btn btn-default"
					data-dismiss="modal">close</button>
			</div>
		</div>
		<!-- modal - content -->
	</div>
	<!-- modal - dialog -->
</div>
<!-- modal - modal -->




<script>
	$(document).ready(function() {
		//var now = $("input[name='pageNum']").val();
		//var num = '${pageMaker.cri.pageNum}'
		//if(now == num){
			//$("#"+'${pageMaker.cri.pageNum}').css("background","gray");
			//$("#"+'${pageMaker.cri.pageNum}').css("color","white");	
			//|| login==""
			//${sessionScope.id}
		//}
						var admin = "admin";
						var login = '${sessionScope.id}'
						var writer = "${board.writer}"
						var operForm = $("#operForm");

					
						$("button[data-oper='modify']").on(
								"click",
								function(e) {
									if(login==""){
										alert("로그인을 하셔야 사용할 수 있습니다.");
										e.preventdefault();
									}
									else if(login != writer && login!= admin){
										alert("작성자가 아닙니다.");
										e.preventdefault();

									}
								
									operForm.attr("action", "/PSH/crud/modify")
											.submit();

								})
						$("button[data-oper='list']").on("click", function(e) {

							operForm.find("#bno").remove();
							operForm.attr("action", "/PSH/crud/list")
							operForm.submit();

						})
						console.log("==========");
						console.log("JS TEST");

						var bnoValue = '<c:out value="${board.bno}"/>';
						var replyUL = $(".chat");

						showList(1);

						function showList(page) {
							console.log("read.jsp getList page 1: " + page);
							replyService.getList({bno : bnoValue,
												page : page || 1},
											function(replyCnt, list) {
												console.log("replycnt :"+ replyCnt);
												console.log("list" + list);
												console.log("read.jsp getList page 1: "+ page);
												if (page == -1) { //전체 페이지 수를 찾아서, 페이징 버튼 	//54/10.0 = 5.4 ceil(5.4) -> 6
													pageNum == Math.ceil(replyCnt / 10.0);
												showList(pageNum);

													return;

												}
												var str = "";

												if (list == null|| list.length == 0) {
													replyUL.html("");
													return;
												}
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li calss= 'left clearfix' data-rno='"+list[i].rno+"'>";
													str += "<div  class='reply_list_frame'><div class='header'><strong class='primary-font'>"
															+ list[i].replyer
															+ "</strong>";
													str += "<small class='pull-right text-muted'>"
															+ replyService
																	.displayTime(list[i].replydate)
															+ "</small></div>";
													str += "		<p>"
															+ list[i].reply
															+ "</p></div></li>";
												}
												replyUL.html(str);

												showReplyPage(replyCnt);

											});
						}//end showlist
						var modal = $(".modal");
						var modalInputReply = modal.find("input[name='reply']");
						var modalInputReplyer = modal.find("input[name='replyer']");
						var modalInputReplyDate = modal.find("input[name='replydate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");

						$("#addReplyBtn").on("click", function(e) {
							if(login==""&& login!=admin){
								alert("로그인을 하셔야 사용할 수 있습니다.");
								e.preventdefault();
							}
							
							modal.find("input").val("");
							modalInputReplyDate.closest("div").hide();
							modal.find("button[id !='modalCloseBtn']").hide();
							modalInputReplyer.val(login).attr("readonly","readonly");
							modalRegisterBtn.show();

							$(".modal").modal("show");
						});
						modalRegisterBtn.on("click", function(e) {
						
							if(modalInputReply.val()==false){
									alert("댓글 내용을 입력해주세요");						
							}
							else if(modalInputReplyer.val()==false){
								alert("작성자를 입력해주세요");
							}
							else{
								var reply = {
										reply : modalInputReply.val(),
										replyer : modalInputReplyer.val(),
										bno : bnoValue
									};
							}
							replyService.add(reply, function(result) {
								//alert("RESULT : " + result);
								modal.find("input").val("");
								modal.modal("hide");
								showList(-1);
							});
							
							//

						
						});
						$(".chat").on("click","li",function(e) {
							if(login=="")
										{
										alert("로그인을 하지 않으면 이용할 수 없습니다.");
										e.preventdefault();
										}
										
											
										var rno = $(this).data("rno");
											//alert("rno"+rno);
											
											replyService.get(rno,function(reply) {
												modalInputReply.val(reply.reply);
												modalInputReplyer.val(reply.replyer).attr("readonly","readonly");
												if(modalInputReplyer.val()!=login && login!=admin){
													alert("작성자가 아닙니다.")
													e.preventdefault();		
														}
												modalInputReplyDate.val(replyService.displayTime(reply.replydate))
																		.attr("readonly","readonly");
																modal.data("rno",reply.rno);
																modal.find("button[id !='modalCloseBtn']").hide();
																modalModBtn.show();
																modalRemoveBtn.show();
																$(".modal").modal("show");
											
															});
										});
						
						modalModBtn.on("click", function(e) {
							var checkreplyer = $("input[name='replyer']").val();
							if(checkreplyer != login && login!=admin){
								alert("작성자가 아닙니다.");
								e.preventdefault();
							}
							var reply = {
								rno : modal.data("rno"),
								reply : modalInputReply.val()
							};
							
							
							replyService.update(reply, function(result) {
								alert("수정되었습니다.");
								modal.modal("hide");
								showList(pageNum);
								/* 새로고침 하는 구문*/
								location.reload(true);
								location.href = location.href;
								history.go(0);
							}); //update end
						});

						modalRemoveBtn.on("click", function(e) {
							var checkreplyer = $("input[name='replyer']").val();
							if(checkreplyer != login && login!=admin){
								alert("작성자가 아닙니다.");									
								e.preventdefault();
							}
							var rno = modal.data("rno");

							replyService.remove(rno, function(result) {
								alert("삭제되었습니다.");
								modal.modal("hide");
								showList(pageNum);
								/* 새로고침 하는 구문*/
								location.reload(true);
								location.href = location.href;
								history.go(0);

							});

						});

				
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer"); // class 이름이 panel-footer인것을 선택해라
	function showReplyPage(replyCnt) {

		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;

		if (endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt / 10.0);
		}

		if (endNum * 10 < replyCnt) {
			next = true;
		}

		var str = "<ul class='pagination pull-right'>";

		if (prev) {
			str += "<li class='page-item'><a class='page-link' href='"
					+ (startNum - 1) + "'>Previous</a></li>";
		}
		for (var i = startNum; i <= endNum; i++) {

			var active = pageNum == i ? "active" : "";

			str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
					+ i + "</a></li>";

		}
		if (next) {
			str += "<li class='page-item'><a class='page-link' href='"
					+ (endNum + 1) + "'>Next</a></li>";
		}

		str += "</ul></div>";

		replyPageFooter.html(str);
		console.log(str);
		
		$(".page-item.active a").css("color","white");
		$(".page-item.active a").css("background","gray");

	}
	replyPageFooter.on("click", "li a", function(e) {
		e.preventDefault();
		console.log("page click");

		var targetPageNum = $(this).attr("href");

		console.log("targetPageNum " + targetPageNum);
		pageNum = targetPageNum;

		showList(pageNum);

	});
					});
	/*
	 replyService.add(
	 {reply:"JS Test",replyer:"tester",bno:bnoValue}
	 ,
	 function(result){
	 alert("Result : " +result);
	 }
	 );
	 replyService.getList({bno:bnoValue,page:1},function(list){
	 for(var i = 0, len=list.length||0; i<len ; i++){
	 console.log(list[i]);
	 }
	 });

	 replyService.remove(23,function(count){
	 console.log(count);
	
	 if(count ==="success"){
	
	 alert("removed");
	 }
	 },function(err){
	 alert("error....");
	 });

	 replyService.update({
	 rno : 22,
	 bno : bnoValue,
	 reply : "modifyed reply....."
	 },function(result){
	 alert("수정완료")
	 });

	 replyService.get(10,function(data){
	 console.log(data);
	 });
	 */
</script>


<form id="operForm" action="/PSH/crud/modify" method="get">
	<input type='hidden' id='bno' name='bno'
		value='<c:out value="${board.bno}"/>'> <input type='hidden'
		id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' id='amount' name='amount'
		value='<c:out value="${cri.amount}"/>'> <input type="hidden"
		name="type" value='<c:out value="${cri.type}"/>'> <input
		type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>

</form>
<div id="get_frame">
<div id="get_subframe">
<div id="title_div">
<input name="title"value='<c:out value="${board.title}"/>' readonly="readonly">
	</div>

<div id="content_div">
	<textarea rows="3" name="content" readonly="readonly"><c:out value="${board.content}" />
	</textarea>
</div>
<div id="writer_div">
<input name="Writer"value='<c:out value="${board.writer}"/>' readonly="readonly">
</div>
<button data-oper='modify' id="button_modify">수정</button>
<button data-oper="list" id="button_list">목록</button>
</div>
</div>
<!-- reply -->
<div id="reply_frame">
<div class="col-lg-12">
	<div class="panel panel-default">
		<div class="panel-hading">
			<i class="fa fa-coments fa-fw"></i>댓글
			<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글달기</button>
		</div>
		<div></div>
		<div class="panel-body">
			<ul class="chat">
				<li class="left clearfix" data-rno="12">
					<div>
						<div class="header">
							<strong class="primary-font"></strong> <small
								class="pull-right text-muted"></small>
						</div>
					</div>
				</li>
			</ul>
		</div>
			<!-- panelbody -->
		<div id="reply_page_frame">	
			<div class="panel-footer">

			</div>
		</div>	
		<!-- panel-footer end -->
	</div>
</div>
</div>
<%@include file="../includes/footer.jsp"%>