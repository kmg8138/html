<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0416.*, java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품목록</title>
	<link rel="styleSheet" href="home.css">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		.del{cursor: pointer;}
		.del:hover{color: red;}
	</style>
</head>
<body>
	<h1>[상품목록]</h1>
	<div id="content">
		<div id="menu">
			<button class="btn">1</button>
			<button class="btn">2</button>
			<button class="btn">3</button>
			<button class="btn">4</button>
			<a href="insert.html">[상품등록]</a>
		</div>
		<!--라이트 박스-->
		<div id="darken-background">
			<div id="lightbox">
				<img src="http://placehold.it/600x750"/>		
				<div id="txtName">상품명</div>
				<div id="txtPrice">가격</div>
				<div><button id="btnClose">닫기</button></div>
			</div>
		</div>
		<%
			productDAO dao=new productDAO();
			ArrayList<productVO> list=dao.list();
			
			for(int i=0; i<list.size(); i++){
				productVO vo=list.get(i);
				DecimalFormat df=new DecimalFormat();
				String strPrice=df.format(vo.getPrice());
				out.println("<div class='box'>");
				out.println("<img src='http://placehold.it/150x150'>");
				out.println("<div class='pname'>"+vo.getPname()+"</div>");
				out.println("<div class='price'>"+strPrice+"</div>");
				out.println("<div class='del' pno='"+vo.getPno()+"'>삭제</div>");
				out.println("</div>");
			};
		%>
	</div>
</body>
<script>
	$(".box").on("click",".del",function(){
		var pno=$(this).attr("pno");
		if(!confirm(pno+"번 상품을 삭제 하시겠습니까?")) return;
		location.href="delete.jsp?pno="+pno;
	})

	$(".box").on("click","img",function(){
		var box=$(this).parent();
		var pname=box.find(".pname").html();
		var price=box.find(".price").html();
		$("#txtName").html("상품명: "+pname);
		$("#txtPrice").html("가격: "+price);
		$("#darken-background").show();
	})

	$(".box").on("click","img",function(){
		$("#darken-background").show();
	})
	
	$("#btnClose").on("click",function(){
		$("#darken-background").hide();
	})

	$("#menu").on("click",".btn",function(){
		var num=$(this).html();
		$("#content").css("width",190*num);
	});
</script>
</html>