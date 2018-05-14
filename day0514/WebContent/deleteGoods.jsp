<%@page import="java.io.File"%>
<%@page import="com.vo.GoodsVO"%>
<%@page import="com.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품 삭제</title>
</head>
<body>
<h2>상품 삭제</h2>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	GoodsDAO dao = new GoodsDAO();
	//삭제하기 전에 파일명을 저장한다.
	String oldFname = dao.detailGoods(no).getFname();
	int re = dao.deleteGoods(no);
	GoodsVO g = new GoodsVO();
	
	if(re > 0) {
		//삭제에 성공했다면 해당파일을 삭제한다.
		String path = request.getRealPath("/img");
		//삭제할 파일객체를 생성한다.
		File file = new File(path + "/" + oldFname);
		//파일을 삭제한다.
		file.delete();
		
		response.sendRedirect("listGoods.jsp");
	}
	else {
		%>삭제 실패
		<a href="listGoods.jsp">상품 목록</a>	
		<%
	}

%>

</body>
</html>