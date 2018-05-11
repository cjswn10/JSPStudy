<%@page import="com.dao.GoodsDAO"%>
<%@page import="com.vo.GoodsVO"%>
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
//사용자가 입력한 문자열이 한글임을 설정
request.setCharacterEncoding("EUC-KR");
//사용자가 입력한 상품의 정보를 담기 위한 자바 객체 GoodsVO를 생성
GoodsVO g = new GoodsVO();
//사용자가 입력한 상품번호를 VO객체인 g에 설정
g.setNo(Integer.parseInt(request.getParameter("no")));
g.setItem(request.getParameter("item"));
g.setPrice(Integer.parseInt(request.getParameter("price")));
g.setQty(Integer.parseInt(request.getParameter("qty")));
g.setFname(request.getParameter("fname"));
// 사용자가 입력한 상품의 정보를 insert하기 위한 DAO객체 생성
GoodsDAO dao = new GoodsDAO();
// dao의 insertFoods메소드를 호출하여 상품을 등록한 insertGoods 메소드는 insert 성공여부에 따른 정수를 반환함
int re = dao.insertGoods(g);

if(re>0){
	//re가 1인지 판별(등록을 성공했다면) listGoods.jsp로 이동함
	response.sendRedirect("listGoods.jsp");
	
}else{
	
	// 상품등록에 실패하였다면 실패하였음을 메세지를 출려력한다.
	%>
	실패
	<a href="insertGoods.jsp">상품목록</a>
	<%
	
}

%>

</body>
</html>