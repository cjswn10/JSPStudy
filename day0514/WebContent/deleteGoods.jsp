<%@page import="java.io.File"%>
<%@page import="com.vo.GoodsVO"%>
<%@page import="com.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ����</title>
</head>
<body>
<h2>��ǰ ����</h2>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	GoodsDAO dao = new GoodsDAO();
	//�����ϱ� ���� ���ϸ��� �����Ѵ�.
	String oldFname = dao.detailGoods(no).getFname();
	int re = dao.deleteGoods(no);
	GoodsVO g = new GoodsVO();
	
	if(re > 0) {
		//������ �����ߴٸ� �ش������� �����Ѵ�.
		String path = request.getRealPath("/img");
		//������ ���ϰ�ü�� �����Ѵ�.
		File file = new File(path + "/" + oldFname);
		//������ �����Ѵ�.
		file.delete();
		
		response.sendRedirect("listGoods.jsp");
	}
	else {
		%>���� ����
		<a href="listGoods.jsp">��ǰ ���</a>	
		<%
	}

%>

</body>
</html>