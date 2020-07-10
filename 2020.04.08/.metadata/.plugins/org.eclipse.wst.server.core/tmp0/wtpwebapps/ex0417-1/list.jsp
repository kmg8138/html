<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0417.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		.box{background: #F6F6F6; border-bottom: 1px solid #D5D5D5; width: 1000px; margin: auto;
			 text-align: left; padding: 10px;}
		#page{text-align: center; width: 1200px; margin: auto;}
		#head{font-size: 30px;}
		#img{margin: 50px;}
		#content{width: 500px;}
		.title{margin-bottom: 20px;}
		.content{margin-bottom: 10px;}
		.likeDiv{text-align: right;}
		.img2{width: 20px; height: 20px;}
		#insert{margin-bottom: 20px;}
	</style>
</head>
<body>
	<div id="page">
		<div id="head">
			<h1>전세계 코로나 현황</h1>
		</div>
		<hr>
		<div id="img">
			<img src="dd.JPG" width=500 height=700>
		</div>
		<hr>
		<h1>[댓글관리]</h1>
		<div id="insert">
			<input type="text" id="content">
			<input type="button" value="저장" id="btnInsert">
		</div>
		<div class="box">
			<div class="title">
				<span><img class="img2" src="1.jpg"></span>
				<span class="date">2020/04/17 13:00:00</span>
			</div>
			<div class="content">
				유렵의 경우와 비교하면, 사망자는 최소한 30만명 이상을 예상한다.
			</div>
			<div>
				<div class="likeDiv" rno="1">
					<button class="delete">삭제</button>
					<input class="update" type="button" value="♥">
					<span class="cnt">120</span>
				</div>
			</div>	
		</div>
		<%
			ReplayDAO dao=new ReplayDAO();
			ArrayList<ReplayVO> list=dao.list();
			
			for(int i=0; i<list.size(); i++){
				ReplayVO vo=list.get(i);
				int rno=vo.getRno();
				String content=vo.getContent();
				Date wdate=vo.getWdate();
				int cnt=vo.getCnt();
				out.print("<div class=box>");
				out.print("<div class=title>");
				out.print("<span><img class=img2 src=1.jpg></span>");
				out.print("<span class=date>"+wdate+"</span>");
				out.print("</div>");
				out.print("<div class=content>");
				out.print(content);
				out.print("</div>");
				out.print("<div>");
				out.print("<div class=likeDiv rno="+rno+">");
				out.print("<button class=delete>삭제</button>");
				out.print("<input class=update type=button value=♥>");
				out.print("<span class=cnt>"+cnt+"</span>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
				
			}
		%>
	</div>
</body>
<script>
	$(".box").on("click",".delete",function(){
		var rno=$(this).parent().attr("rno");
		if(confirm(rno+"번을 삭제하시겠습니까?")==false) return;
		location.href="sqlDelete.jsp?rno="+rno;
	});
	
	$(".box").on("click",".update",function(){
		var rno=$(this).parent().attr("rno");
		if(confirm(rno+"번을 좋아요 하시겠습니까?")==false) return;
		location.href="sqlUpdate.jsp?rno="+rno;
	});
	
	$("#btnInsert").on("click",function(){
		if(confirm("댓글을 저장하시겠습니까?")==false) return;
		var content=$("#content").val();
		if(confirm==""){
			alert("내용을 입력하세요")
		}else{
			location.href="sqlInsert.jsp?content="+content;
		}
	});
</script>
</html>