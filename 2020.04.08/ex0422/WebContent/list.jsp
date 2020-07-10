<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex0422.*, java.util.*, org.json.simple.*" %>
<%
	MovieDAO dao=new MovieDAO();
	ArrayList<MovieVO> list=dao.list();
	
	//ArrayList JSON데이터로 변환
	JSONArray jArray=new JSONArray();
	
	for(MovieVO vo:list){	
		JSONObject obj=new JSONObject();
		obj.put("mno", vo.getMno());
		obj.put("title", vo.getTitle());
		obj.put("actor", vo.getActor());
		
		jArray.add(obj);
	}
	out.println(jArray);
%>