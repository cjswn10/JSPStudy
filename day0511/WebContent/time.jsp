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
���� : <%= new Date() %><br><!-- DateŬ������ toString()�޼ҵ尡 �ڵ�ȣ��� -->
<% Date today = new Date();
	String[] day={"��", "��", "ȭ", "��", "��", "��", "��"};
%>
<%= (today.getYear()+1900) + "�� " + (today.getMonth()+1) + "�� " + today.getDate() + "�� "%>(<%=day[today.getDay()] + "����"%>)
</body>
</html>