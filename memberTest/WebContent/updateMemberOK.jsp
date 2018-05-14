<%@page import="java.util.Arrays"%>
<%@page import="org.omg.CORBA.portable.Delegate"%>
<%@page import="java.io.File"%>
<%@page import="com.dao.MemberDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.vo.MemberVO"%>
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


		MemberVO m = new MemberVO();
		MemberDAO dao = new MemberDAO();

		String path = request.getRealPath("/img");

		MultipartRequest multi = new MultipartRequest(request, path, "EUC-KR");
		String id = multi.getParameter("id");

		String oldFname = dao.getMember(id).getFname();

		m.setId(multi.getParameter("id"));
		m.setPwd(multi.getParameter("pwd"));
		m.setName(multi.getParameter("name"));
		m.setAddr(multi.getParameter("addr"));
		m.setEmail(multi.getParameter("email"));
		m.setAge(Integer.parseInt(multi.getParameter("age")));
		m.setHobby(Arrays.toString(multi.getParameterValues("hobby")));
		m.setTel(multi.getParameter("tel"));
		m.setFname(oldFname);
		String fname = null;

		if (multi.getFile("fname") != null) {

			fname = multi.getFile("fname").getName();
		}

		if (fname != null && !fname.equals("")) {

			m.setFname(fname);
		}

		int re = dao.updateMember(m);

		if (re > 0) {
			if (fname != null && !fname.equals("")) {

				File file = new File(path + "/" + oldFname);
				file.delete();
			}
			response.sendRedirect("listMember.jsp");

		} else {
	%>
	수정 실패
	<a href="listMember.jsp"></a>
	<%
		}
	%>



</body>
</html>