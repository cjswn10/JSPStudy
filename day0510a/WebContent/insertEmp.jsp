<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	EmpDAO dao = new EmpDAO();
	ArrayList<Integer> list = dao.listDno();
	ArrayList<String> listPosition = dao.listPosition();
	ArrayList<Integer> listMgr = dao.listMgr();

%>

<h2>������</h2>
<hr>
	<form action="insertEmpOK.jsp" method="post">
		�����ȣ : <input type="number" name="eno"><br>
		����̸� : <input type="text" name="ename"><br>
		�޿� : <input type="number" min="0" name="sal"><br>
		���� : <input type="number" min="0" name="comm"><br>
		�Ի��� : <input type="date" name="hiredate"><br>
		�ֹι�ȣ : <input type="text" name="jumin"><br>
		�μ���ȣ : 
		<select name="dno">
		<%
			for(Integer n : list ){
			%>
			<option value="<%=n%>"><%=n%></option>
			<%
			}
		%>
		</select><br>
		��å :
		<%
			for(String p : listPosition){
				%>
				<input type="radio" name="position" value="<%=p%>"><%=p%>
				<%
			}
		%>
		<br>
		�ּ� : <input type="text" name="addr"><br>
		�����ڹ�ȣ :
		<select name="mgr">
		<%
			for(Integer m : listMgr){
				
				%>
				<option value="<%=m%>"><%=m%></option>
				<%
			}
		
		%>
		</select><br>
	
		�̸��� : <input type="email" name="email">
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>

</body>
</html>