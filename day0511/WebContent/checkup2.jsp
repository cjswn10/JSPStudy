<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �ϰ��� �����</title>
</head>
<body>
<h2>���� �ϰ��� ����� �Ǻ�</h2>
<form action="checkup2.jsp" method="post">
�̸� : <input type="text" name="name"><br>
�ֹι�ȣ : <input type="text" name="jumin1">-<input type="text" name="jumin2"><br>
<input type="submit" value="Ȯ��">
</form>

<%
	//������� ��û����� ���� �˾Ƴ�
	String method = request.getMethod();

	if(method.equals("POST"))
	{
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		int birthYear = 1900 + Integer.parseInt(request.getParameter("jumin1").substring(0, 2));
		char gender = request.getParameter("jumin2").charAt(1);
		int age = 2019 - birthYear;

		String[] cancer = { "����", "����", "�����", "�����", "�ڱþ�" };
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
	<%=name%>�� (<%=age%>��)<br>
	<%
		if (!t) {
	%>
		���� �ϰ��� ����ڰ� �ƴմϴ�.
	<%
		} else {
	%>
		<%=target%>
	<%
		}
		
	}
%>


	
</body>
</html>