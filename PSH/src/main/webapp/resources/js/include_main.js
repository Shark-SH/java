/**
 * 
 */
$(document).ready(function(){
	$("#header_main").hover(function(){
		
		
		
		$("#header_main").css("background","white");
		$("#header_main").css("border-bottom","1px solid lightgray");
		$(".top_a").css("color","black");
		$("#header_title a").css("color","black");
		

		$(".top_a").hover(function(){
			
			
			
		$(".header_manual_content").css("display","block");	
		$(".header_manual_content ul li a").css("text-decoration","none");
		$("#header_main").css("height","150px");
	
	
		$(".header_manual_content").hover(function(){		
			$(".header_manual_content").css("display","block");	
			$(".header_manual_content ul li a").css("text-decoration","none");
			$("#header_main").css("height","150px");
		
		
		
		},function(){
			
			$(".header_manual_content").css("display","");	
			$("#header_main").css("height","60px");
		
		
		
		});
		
		
		
		
		},function(){
			$(".header_manual_content").css("display","");	
			$("#header_main").css("height","60px");
			
			
		});
		
		
	},function(){
		$("#header_main").css("background","");
		$(".top_a").css("color","white");
		$("#header_title a").css("color","white");
		$("#header_main").css("border-bottom","");
		
		
		
	})

	
});