<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
	String addr = "서울시 마포구 신수동";
	public int updateAge(int age) {
		return ++age;
	}
%>

<%
	String name = "홍길동";
	int age = 20;
%>
이름 : <%=name %><br>
나이 : <%=age %><br>
주소 : <%=addr %><br>
<%
	age = updateAge(age);
%>
<hr>
이름 : <%=name %><br>
나이 : <%=age %><br>
주소 : <%=addr %><br>
</body>
</html>