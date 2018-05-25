<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
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
	<!-- 쿠키를 이용하여 두번째 이후에 방문하면 마지막 방문했던 날짜와 시간의 정보를 출력 -->
	<%
		String lastVisit = "첫방문입니다.";
		Cookie[] arr = request.getCookies();
		if(arr != null) {
			for(Cookie c : arr) {
				if(c.getName().equals("lastVisit"))
					lastVisit = "마지막 방문시간은 " + URLDecoder.decode(c.getValue(), "euc-kr");
			}
		}
	%>
		고객님, <%= lastVisit %>	
	<%
	
		Date date = new Date();
		int year = date.getYear()+1900;
		int month = date.getMonth()+1;
		int day = date.getDate();
		int hour = date.getHours();
		int minutes = date.getMinutes();
		int seconds = date.getSeconds();
		
//		String str = year+"년"+month+"월"+day+"일"+hour+":"+minutes+":"+seconds;
		String str = year+"년"+month+"월"+day+"일 "+hour+":"+minutes+":"+seconds;
		
		str = URLEncoder.encode(str, "euc-kr");
		
		Cookie c = new Cookie("lastVisit", str);
		response.addCookie(c);
	%>
	
	
</body>
</html>