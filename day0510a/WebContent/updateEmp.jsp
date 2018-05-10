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

	<h2>사원수정</h2>
	<hr>
	<form action="updateEmpOK.jsp" method="post">
		사원번호 : <input type="number" name="eno" value="<%=e.getEno()%>"><br>
		사원이름 :
		<input type ="text" name="ename" value="<%=e.getEname()%>">
		<br>
		급여 : <input type="number" min="0" name="sal" value="<%=e.getSal()%>">
		<br>
		수당 : <input type="number" min="0" name="comm" value="<%=e.getComm()%>">
		<br>
		입사일 : <input type="date" name="hiredate" value="<%=e.getHiredate()%>">
		<br>
		주민번호 : <input type="text" name="jumin" value="<%=e.getJumin()%>">
		<br>
		부서번호 : <select name="dno" value="<%=e.getDno()%>">
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
		직책 : 
		<%
 			for (String p : listPosition) {

 				if (p.equals(e.getPosition())) {
 					%> <input type="radio" checked="checked" name="position" value="<%=p%>"><%=p%> <%
 				} else {
					 %> <input type="radio" name="position" value="<%=p%>"><%=p%> <%
 				}

 				}
 %> <br>
		주소 : <input type="text" name="addr" value="<%=e.getAddr()%>">
		<br>
		관리자번호 : <select name="mgr">
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
		이메일 : <input type="email" name="email" value="<%=e.getEmail()%>">
		<input type="submit" value="등록"> <input type="reset"
			value="취소">
	</form>

</body>
</html>