<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0429.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<meta charset="UTF-8">
	<title>교수목록</title>
	<style>
		.title{text-align: center; background: gray; color: white;}
		.row:hover{background: gray; color: white; cursor: pointer;}
		#slist,#clist{display: none;}
	</style>
</head>
<body>
	<h1>[교수목록]</h1>
	<table id="tbl" border=1 width=700>
		<tr class=title>
			<td>교수번호</td>
			<td>교수이름</td>
			<td>교수학과</td>
			<td>생년월일</td>
			<td>교수직급</td>
			<td>교수급여</td>
		</tr>
		<%
			PDAO dao=new PDAO();
			ArrayList<PVO> list=dao.list();
			for(PVO vo:list){
				out.println("<tr class=row>");
				out.println("<td class=pcode>"+vo.getPcode()+"</td>");
				out.println("<td class=pname>"+vo.getPname()+"</td>");
				out.println("<td>"+vo.getDept()+"</td>");
				out.println("<td>"+vo.getHiredate()+"</td>");
				out.println("<td>"+vo.getTitle()+"</td>");
				out.println("<td>"+vo.getSalary()+"</td>");
				out.println("</td>");
			}
		%>
	</table>
	<div id="slist">
		<h1>[학생목록]</h1>
		<div>담당교수:<span class="pname"></span></div>
		<table id="stbl" border=1 width=700></table>
	    <script id="temp1" type="text/x-handlebars-template">
			<tr class=title>
				<td>학생번호</td>
				<td>학생이름</td>
				<td>학생학과</td>
				<td>학년</td>
				<td>생년월일</td>
			</tr>
    		{{#each slist}}
         	<tr>
            	<td>{{scode}}</td>
           		<td>{{sname}}</td>
           		<td>{{dept}}</td>
           		<td>{{year}}</td>
				<td>{{birthday}}</td>
         	</tr>
        	{{/each}}
      	</script>
	</div>	
	<div id="clist">
		<h1>[강좌목록]</h1>
		<div>담당교수:<span class="pname"></span></div>
		<table id="ctbl" border=1 width=700></table>
	    <script id="temp2" type="text/x-handlebars-template">
			<tr class=title>
				<td>강좌번호</td>
				<td>강좌이름</td>
				<td>강의시간수</td>
				<td>강의실</td>
				<td>수강생인원</td>
			</tr>
    		{{#each clist}}
         	<tr>
            	<td>{{lcode}}</td>
           		<td>{{lname}}</td>
           		<td>{{hours}}</td>
           		<td>{{room}}</td>
				<td>{{persons}}</td>
         	</tr>
        	{{/each}}
      	</script>
	</div>
</body>
<script>
	var pcode;
	$("#tbl").on("click",".row",function(){
		
		pcode=$(this).find(".pcode").html();
		var pname=$(this).find(".pname").html();
		
		$("#slist").show();
		$("#clist").show();
		$("#slist .pname").html(pname);
		$("#clist .pname").html(pname);
		
		getList();
	});
	
	function getList(){
		
	    $.ajax({
	        type:"get",
	        url:"json.jsp",
	        dataType:"json",
	        data:{"pcode":pcode},
	        success:function(data){
	           var temp=Handlebars.compile($("#temp1").html());
	           $("#stbl").html(temp(data));
	           
	           var temp=Handlebars.compile($("#temp2").html());
	           $("#ctbl").html(temp(data));
	        }
	   	});
	}

</script>
</html>