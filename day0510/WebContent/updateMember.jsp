<%@page import="com.dao.MemberDAO"%>
<%@page import="com.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		MemberVO mv = dao.selectMember(id);
	%>
	<h2>ȸ������ ����</h2>
	<form action="updateMemberOk.jsp" method="post">
		<table>
			<tr>
				<td>���̵� :</td><td><input type="text" name="id" value="<%=mv.getId()%>"></td>
			</tr>
			<tr>
				<td>��й�ȣ :</td><td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>�̸� :</td><td><input type="text" name="name" value="<%=mv.getName()%>"></td>
			</tr>
			<tr>
				<td>�ּ� :</td><td><input type="text" name="addr" value="<%=mv.getAddr()%>"></td>
			</tr>
			<tr>
				<td>�̸��� :</td><td><input type="email" name="email" value="<%=mv.getEmail()%>"></td>
			</tr>
			<tr>
				<td>���� :</td><td><input type="number" name="age" value="<%=mv.getAge()%>"></td>
			</tr>
			<tr>
			<td>��� :</td><td>
			<input type="checkbox" name="hobby" value="������">������
			<input type="checkbox" name="hobby" value="����">����
			<input type="checkbox" name="hobby" value="ũ�ν���">ũ�ν���
			<input type="checkbox" name="hobby" value="Ŭ���̹�">Ŭ���̹�
			<input type="checkbox" name="hobby" value="�����">�����
			<input type="checkbox" name="hobby" value="�ö��׿䰡">�ö��׿䰡
			</td>
			</tr>
			<tr>
				<td>��ȭ��ȣ :</td><td><input type="tel" name="tel" value="<%=mv.getTel()%>">
			</tr>
		</table>
			<input type="submit" value="���">
			<input type="reset" value="���">
	</form>
</body>
</html>