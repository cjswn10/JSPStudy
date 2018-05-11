<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
지금 : <%= new Date() %><br><!-- Date클래스의 toString()메소드가 자동호출됨 -->
<% Date today = new Date();
	String[] day={"일", "월", "화", "수", "목", "금", "토"};
%>
<%= (today.getYear()+1900) + "년 " + (today.getMonth()+1) + "월 " + today.getDate() + "일 "%>(<%=day[today.getDay()] + "요일"%>)
</body>
</html>