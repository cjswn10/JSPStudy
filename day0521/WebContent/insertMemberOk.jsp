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
		request.setCharacterEncoding("euc-kr");
		//MemberVO m = MemberVO();
	%>
	<jsp:useBean id="m" class="com.bit.vo.MemberVO"/>
	<!-- id�� �����̸� class�� ������Ÿ��  -->
	<!-- �±� �� ���� /���� �����±� �ݴ��±װ� �ѹ����ȴ�. -->
	<jsp:setProperty property="*" name="m"/>
	<!-- property�� vo�� �ִ� �̸� -->
	<!-- �ϳ��� �Է� ���� <jsp:setProperty property="id" name="m"/>  -->
	
	�Է��� ȸ���� ���� 
	<hr>
	<%=m%>
</body>
</html>