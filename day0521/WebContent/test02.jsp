<%@page import="com.bit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	MemberVO mb = new MemberVO();
	mb.setName("�ӿ���");
	mb.setAge(23);
	mb.setHobby("������");
%>

�̸�  : <%= mb.getName() %><br>
����  : <%= mb.getAge() %><br>
���  : <%= mb.getHobby() %><br>
<hr>

</body>
</html>