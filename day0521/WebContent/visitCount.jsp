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
		int count = 1;
		Cookie[] arr = request.getCookies();
		if (arr != null) {
			for (Cookie ck : arr) {
				String name = ck.getName();
				if (name.equals("visitCnt")) {
					count = Integer.parseInt(ck.getValue());
				}
			}
		}
	%>
	<%=count%>번째 방문입니다.
	<%
		count++;
		Cookie c = new Cookie("visitCnt", count + "");
		response.addCookie(c);
	%>

</body>
</html>