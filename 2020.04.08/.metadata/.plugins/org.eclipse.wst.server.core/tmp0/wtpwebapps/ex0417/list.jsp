<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0417.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		h1,h3{text-align: center;}
		#content{width: 700px; background: lime; margin: auto; padding: 20px;}
		#tbl{margin: auto; text-align: center;}
		input{text-align: right;}
	</style>
</head>
<body>
	<h1>[성적처리]</h1>
		<div id="content">
			이름: <input type="text" id="txtName">
			<hr>
			국어: <input type="text" id="txtKor">
			<hr>
			영어: <input type="text" id="txtEng">
			<hr>
			수학: <input type="text" id="txtMat">
			<hr>
			<input type="button" value="등록" id="btnInsert">
			
			<h3>[성적목록]</h3>
			<table id="tbl" border=1 width=700px>
				<tr id="title">
					<td>No.</td>
					<td>이름</td>
					<td>국어</td>
					<td>영어</td>
					<td>수학</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				<tr class="row">
					<td>1</td>
					<td>이송현</td>
					<td class="kor"><input class="kor" type="text" size="2" value="90"></td>
					<td class="eng"><input class="eng" type="text" size="2" value="90"></td>
					<td class="mat"><input class="mat" type="text" size="2" value="90"></td>
					<td><button class="update">수정</button></td>
					<td><button class="delete">삭제</button></td>
				</tr>
				<%
					GradeDAO dao=new GradeDAO();
					ArrayList<GradeVO> list=dao.list();
					
					for(int i=0; i<list.size(); i++){
						GradeVO vo=list.get(i);
						int gno=vo.getGno();
						String gname=vo.getGname();
						int kor=vo.getKor();
						int eng=vo.getEng();
						int mat=vo.getMat();
						out.print("<tr class=row>");
						out.print("<td class=gno>"+gno+"</td>");
						out.print("<td class=gname>"+gname+"</td>");
						out.print("<td><input type=text class=kor size=2 value="+kor+"></td>");
						out.print("<td><input type=text class=eng size=2 value="+eng+"></td>");
						out.print("<td><input type=text class=mat size=2 value="+mat+"></td>");
						out.print("<td><button class=update>수정</button></td>");
						out.print("<td><button class=delete>삭제</button></td>");
						out.print("</td>");
					}
				%>
			</table>
		</div>
</body>
<script>
	$("#tbl").on("click",".row .delete",function(){
		var row=$(this).parent().parent();
		var gno=row.find(".gno").html();
		location.href="sqlDelete.jsp?gno="+gno;
		alert(gno);
	});
	
	$("#tbl").on("click",".row .update",function(){
		var row=$(this).parent().parent();
		var gno=row.find(".gno").html();
		var kor=row.find(".kor").val();
		var eng=row.find(".eng").val();
		var mat=row.find(".mat").val();
		if(confirm(gno+"번을 수정하시겠습니까?")==false) return;
		location.href="sqlUpdate.jsp?gno="+gno+"&kor="+kor+"&eng="+eng+"&mat="+mat;
	});
	
	$("#btnInsert").on("click",function(){
		if(confirm("저장하시겠습니까?")==false) return;
		var gname=$("#txtName").val();
		var kor=$("#txtKor").val();
		var eng=$("#txtEng").val();
		var mat=$("#txtMat").val();
		if(gname==""){
			alert("이름을 입력하세요.");
			$("#txtName").val("");
			$("#txtName").focus();
		}else if(kor==""|| kor.replace(/[0-9]/g,'')){
			alert("점수를 숫자로 입력하세요");
			$("#txtKor").val("");
			$("#txtKor").focus();
		}else if(eng==""|| eng.replace(/[0-9]/g,'')){
			alert("점수를 숫자로 입력하세요");
			$("#txtEng").val("");
			$("#txtEng").focus();
		}else if(mat==""|| mat.replace(/[0-9]/g,'')){
			alert("점수를 숫자로 입력하세요");
			$("#txtMat").val("");
			$("#txtMat").focus();
		}else{
			location.href="sqlInsert.jsp?gname="+gname+"&kor="+kor+"&eng="+eng+"&mat="+mat;
		}
	});
</script>
</html>