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
		Cookie[] arr = request.getCookies();
		//getCookies()는 쿠키형 배열을 반환함
		String str="";
		for(Cookie c : arr) {
			String name = c.getName();
			if(name.equals("msg")) {
				str = c.getValue();
			}
		}
		
	%>
	쿠키쿠키	:	<%= str %>
</body>
</html>