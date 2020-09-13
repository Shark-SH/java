<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../resources/css/ativity.css"></link>
	
	<script type="text/javascript">
	/*
-webkit-transition-duration: 0.4s;
transition-duration: 0.4s;
	cursor: pointer;
*/
$(document).ready(function(){
	$(".downloadbox a").hover(function(){
		$(this).css("cursor","pointer");
		$(this).css("transition-duration","0.4s");
		$(this).css("-webkit-transition-duration","0.4s");
		$(this).css("color","white");	
		$(this).css("background","#555555");

	},function(){
		$(this).css("cursor","default");
		$(".downloadbox a").css("color","black");
		$(this).css("background","#EEEEEE");
	
	
	
	})
});
	</script>	
<div id="activity_frame">
	<div class="activity_form">
		<img src="../resources/img/Tazo.GIF">
		<p>3학년 1학기 보안주제 프로젝트를 지문인식금고로 선정하여 수행하였습니다.<br>
아두이노 기반으로 제작되었습니다. 코딩을 포기했을때 수행한 프로젝트여서 시행착오가 많았습니다.<br>
하지만 포기하지 않고 끝까지 만들어낸 작품이고, 제가 개발자가 되고싶다는 동기가 되었던 프로젝트입니다.</p>
		<div class='downloadbox'>
			<a href="../resources/file/종합설계_지문인식금고.pptx" download>다운로드</a>
		</div>
	<hr>
	</div>
		<div class="activity_form">
		<img src="../resources/img/business_plan.jpg">
		<p>3학년 2학기 개인사업계획서 주제로 온라인 맞춤정장이라는 컨텐츠로<br>
사업계획서를 작성하였습니다.개인주제였던 만큼 정말 열심히 만들었던 사업계획서 입니다.<br> 
오프라인매출저하 , 온라인정장판매 수요 증가로 커스텀마이즈형태의 정장을 판매라는 아이디어로 작성하였습니다.</p>
			<div class='downloadbox'>
			<a href="../resources/file/business_plan.pptx">다운로드</a>
			</div>	
	<hr>
	</div>
		<div class="activity_form">
		<img src="../resources/img/business_plan2.jpg">
		<p>3학년 2학기 팀별사업계획서 주제로 담배꽁초분쇄기라는 컨텐츠로 작성한 사업계획서 입니다.<br>
			팀별이지만 팀원들이 면접과 취업때문에 대부분 혼자서 만든 사업계획서 입니다.<br>
			무분별하고 처치곤란한 담배꽁초들을 보면서 환경사업으로 추친해보면 어떨까 하는 생각에서 나온 아이디어를 바탕으로 작성하였습니다.</p>
		<div class='downloadbox'>
			<a href="../resources/file/business_plan2.pptx" download>다운로드</a>
		</div>
	<hr>
	</div>
		<div class="activity_form">
		<img src="../resources/img/Myself.GIF">
		<p>현재 포트폴리오의 파워포인트 입니다.</p>
		<div class='downloadbox'>
			<a href="../resources/file/now.pptx" download>다운로드</a>
		</div>
	</div>


</div>









<%@ include file="../includes/footer.jsp"%>
