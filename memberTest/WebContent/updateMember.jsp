<%@page import="com.vo.MemberVO"%>
<%@page import="com.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>ȸ������ ����</h2>
<hr>
<%
String id = request.getParameter("id");


MemberDAO dao = new MemberDAO();
MemberVO m = dao.getMember(id);

%>
<form action="updateMemberOK.jsp" method="post" enctype="multipart/form-data">
���̵�:<input type="text" name="id" value="<%=m.getId()%>"><br>
��й�ȣ:<input type="password" name="pwd" value="<%=m.getPwd()%>"><br>
�̸�:<input type="text" name="name" value="<%=m.getName()%>"><br>
�ּ�:<input type="text" name="addr" value="<%=m.getAddr()%>"><br>
�̸���:<input type="email" name="email" value="<%=m.getEmail()%>"><br>
����:<input type="number" name="age" value="<%=m.getAge()%>"><br>
���:
<input type="checkbox" name="hobby" value="������" <%if(m.getHobby().contains("������")){%>checked<%}%>>������
<input type="checkbox" name="hobby" value="����" <%if(m.getHobby().contains("����")){%>checked<%}%>>����
<input type="checkbox" name="hobby" value="ũ�ν���" <%if(m.getHobby().contains("ũ�ν���")){%>checked<%}%>>ũ�ν���
<input type="checkbox" name="hobby" value="Ŭ���̹�" <%if(m.getHobby().contains("Ŭ���̹�")){%>checked<%}%>>Ŭ���̹�
<input type="checkbox" name="hobby" value="�����" <%if(m.getHobby().contains("�����")){%>checked<%}%>>�����
<input type="checkbox" name="hobby" value="�ö��׿䰡" <%if(m.getHobby().contains("�ö��׿䰡")){%>checked<%}%>>�ö��׿䰡
<br>
��ȭ��ȣ:<input type="text" name="tel" value="<%=m.getTel()%>"><br>
ȸ������:<img src="img/<%=m.getFname() %>" width="50" height="50"><br>
<input type="file" name="fname" value="<%=m.getFname()%>"><br>

<input type="submit" value="����">
<input type="reset" value="���">
</form>
</body>
</html>