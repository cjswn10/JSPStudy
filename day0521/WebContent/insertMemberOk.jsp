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
	<!-- id는 변수이름 class는 데이터타입  -->
	<!-- 태그 맨 끝에 /쓰면 여는태그 닫는태그가 한번에된다. -->
	<jsp:setProperty property="*" name="m"/>
	<!-- property는 vo에 있는 이름 -->
	<!-- 하나씩 입력 가능 <jsp:setProperty property="id" name="m"/>  -->
	
	입력한 회원의 정보 
	<hr>
	<%=m%>
</body>
</html>