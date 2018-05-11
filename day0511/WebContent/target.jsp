<%@page import="java.util.ArrayList"%>
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
	<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		int birthYear = 1900 + Integer.parseInt(request.getParameter("jumin1").substring(0, 2));
		char gender = request.getParameter("jumin2").charAt(1);
		String[] g = { "남", "여" };
		int age = 2019 - birthYear;
		String[] cancer = { "위암", "간암", "대장암", "유방암", "자궁암" };
		ArrayList<String> target = new ArrayList<String>();

		Boolean t = false;
		int thisYear = (new Date()).getYear() + 1900;

		if ((thisYear % 2) == (birthYear % 2) && age >= 40)
			t = true;
		
		if (t) {
			if (age >= 40) {
				target.add(cancer[0]);
				target.add(cancer[1]);
			}

			if (age >= 50) {
				target.add(cancer[3]);
			}

			if (gender == 2) {
				target.add(cancer[3]);
				target.add(cancer[4]);
			}
		}
	%>
	<%=name%>님 (<%=age%>세)<br>
	<%
		if (!t) {
	%>
		무료 암검진 대상자가 아닙니다.
	<%
		} else {
	%>
		<%=target%>
	<%
		}
	%>

</body>
</html>