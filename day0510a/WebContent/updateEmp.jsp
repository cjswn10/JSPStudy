<%@page import="com.bit.vo.EmpVO"%>
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
		int eno = Integer.parseInt(request.getParameter("eno"));

		EmpDAO dao = new EmpDAO();
		ArrayList<Integer> list = dao.listDno();
		ArrayList<String> listPosition = dao.listPosition();
		ArrayList<Integer> listMgr = dao.listMgr();
		EmpVO e = dao.getEmp(eno);
	%>

	<h2>�������</h2>
	<hr>
	<form action="updateEmpOK.jsp" method="post">
		�����ȣ : <input type="number" name="eno" value="<%=e.getEno()%>"><br>
		����̸� :
		<input type ="text" name="ename" value="<%=e.getEname()%>">
		<br>
		�޿� : <input type="number" min="0" name="sal" value="<%=e.getSal()%>">
		<br>
		���� : <input type="number" min="0" name="comm" value="<%=e.getComm()%>">
		<br>
		�Ի��� : <input type="date" name="hiredate" value="<%=e.getHiredate()%>">
		<br>
		�ֹι�ȣ : <input type="text" name="jumin" value="<%=e.getJumin()%>">
		<br>
		�μ���ȣ : <select name="dno" value="<%=e.getDno()%>">
			<%
				for (Integer n : list) {

					if (n == e.getDno()) {
			%>
			<option selected="selected " value="<%=n%>"><%=n%></option>
			<%
				} else {
			%>
			<option value="<%=n%>"><%=n%></option>
			<%
				}
				}
			%>
		</select> <br>
		��å : 
		<%
 			for (String p : listPosition) {

 				if (p.equals(e.getPosition())) {
 					%> <input type="radio" checked="checked" name="position" value="<%=p%>"><%=p%> <%
 				} else {
					 %> <input type="radio" name="position" value="<%=p%>"><%=p%> <%
 				}

 				}
 %> <br>
		�ּ� : <input type="text" name="addr" value="<%=e.getAddr()%>">
		<br>
		�����ڹ�ȣ : <select name="mgr">
			<%
				for (Integer m : listMgr) {

					if (m == e.getMgr()) {
						%>
						<option selected="selected" value="<%=m%>"><%=m%></option>
						<%
				} else {
						%>
						<option value="<%=m%>"><%=m%></option>
						<%
				}

				}
			%>
		</select> <br>
		�̸��� : <input type="email" name="email" value="<%=e.getEmail()%>">
		<input type="submit" value="���"> <input type="reset"
			value="���">
	</form>

</body>
</html>