<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.vo.Person"%>
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
		session.setAttribute("msg", "�����ιٺ�");
		session.setAttribute("year", 2018);
		session.setAttribute("height", 179.8);
		Person p = new Person("�ѻ���", 20);
		session.setAttribute("p", p);
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("������ ��ħ");
		list.add("��� �Ķ���");
		list.add("ī��");
		list.add("�Ұ��");
		list.add("��ġ����");
		list.add("�����");
		list.add("��");
		
		session.setAttribute("list", list);
		
	%>
	
	���ǿ� ���� �����Ͽ����ϴ�.
	<hr>
	<a href="test08.jsp">���� �� Ȯ��</a>
	
</body>
</html>