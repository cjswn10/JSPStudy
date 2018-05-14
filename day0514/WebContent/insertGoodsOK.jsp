<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

//클라이언트가 선택한 파일을 현재프로젝트를 기준으로 img폴더에 복사하려한다
//==>파일업로드
//파일업로드 기능을 갖고 있는 클래스
//cos.jar에 MultipartRequest 클래스를 이용한다.

//파일업로드를 하려면
//<input type="file">를 태그를 이용한다.
//또, <form>태그의 method는 반드시 "post"여야 하고
//또, <form>태그에 encodingType="multipart/form-data"를 반드시 추가해야한다.


//파일 업로드를 위한 현재 프로젝트를 기준으로
//생성한 img폴더의 실제경로를 알아온다.
String path = request.getRealPath("/img");
System.out.println("path:"+path);


MultipartRequest multi = new MultipartRequest(request, path,"EUC-KR");


//사용자가 입력한 상품의 정보를 담기 위한 자바 객체 GoodsVO를 생성
GoodsVO g = new GoodsVO();
//사용자가 입력한 상품번호를 VO객체인 g에 설정
g.setNo(Integer.parseInt(multi.getParameter("no")));
g.setItem(multi.getParameter("item"));
g.setPrice(Integer.parseInt(multi.getParameter("price")));
g.setQty(Integer.parseInt(multi.getParameter("qty")));
//<input type="file">로 오는 것은 파일 이름이 오는 것이 아니라
//파일 내용이 오기 때문에 이것으로부터 파일이름을 추출하여
//VO에 설정해야 한다.
//g.setFname(request.getParameter("fname"));
g.setFname(multi.getFile("fname").getName());




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