<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ū �� ã��</title>
</head>
<body>
<h2>ū��ã��</h2>
<!-- �� ó�� �������� �ҷ�����  �����  GET����̴� -->
<!-- ���� �� �������ȿ��� �θ��� ���ؼ��� post�� ��û�ؾ� �Ķ���͸� ���� �� �ִ�.-->
<form action="maxTest.jsp" method="POST">
����1 : <input type="text" name="num1">
����2 : <input type="text" name="num2">
<input type="submit" value="ã��">
</form>

<%
	if(request.getMethod().equals("POST")) {
		int n1 = Integer.parseInt(request.getParameter("num1"));	
		int n2 = Integer.parseInt(request.getParameter("num2"));
		int max = n1;
		if(n1 < n2) {
			max = n2;
		}

		%>
			ū ���� <%=max%>
		<%
	}

%>


</body>
</html>