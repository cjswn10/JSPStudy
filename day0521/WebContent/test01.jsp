<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="m" class="com.bit.vo.MemberVO"/>
	<jsp:setProperty property="id" name="m" value="goddess"/>
	<jsp:setProperty property="name" name="m" value="�ӿ���"/>
	�̸� : <jsp:getProperty property="name" name="m"/>
	���̵� : <jsp:getProperty property="id" name="m"/>
</body>
</html>