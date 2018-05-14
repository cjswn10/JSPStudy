<%@page import="java.io.File"%>
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
request.setCharacterEncoding("EUC-KR");


//파일업로드를 위한 현재 어플리케이션을 기준으로
//img 폴더의 실제경로를 알아온다.
String path = request.getRealPath("/img");
System.out.println(path);

MultipartRequest multi = new MultipartRequest(request, path, "euc-kr");
//파일업로드만, multi ==> 사용자가 요청한 입력정보와
//파일을 복사하는 기능
//수정에 대한 기능을 완료하고
//기존의 파일을 삭제하도록 합니다.

int no = Integer.parseInt(multi.getParameter("no"));
GoodsDAO dao = new GoodsDAO();
String oldFname = dao.detailGoods(no).getFname();
//원래의 상품파일이름을 변수에 저장한다.
//상품수정이 성공하면 원래의 파일은
//삭제하기 위하여 미리 변수에 담아둔다.

GoodsVO g = new GoodsVO();
g.setNo(no);
g.setItem(multi.getParameter("item"));
g.setPrice(Integer.parseInt(multi.getParameter("price")));
g.setQty(Integer.parseInt(multi.getParameter("qty")));

//상품파일을 수정하지 않을때의 처리
g.setFname(oldFname);


String fname = null;
if(multi.getFile("fname") != null)
	fname = multi.getFile("fname").getName();
//업로드한 파일이 있다면 그 파일명으로 전환
if(fname != null && !fname.equals(""))
	g.setFname(fname);

int re = dao.updateGoods(g);

if(re>0){
	//수정에 성공했고, 파일도 수정했다면
	//원래의 파일을 삭제한다
	if(fname != null && !fname.equals("")) {
		File file = new File(path + "/" + oldFname);
		file.delete();
	}
	response.sendRedirect("listGoods.jsp");
}else{
	%>
	수정 실패
	<a href="insertGoods.jsp">상품목록</a>
	<%
}
%>
</body>
</html>