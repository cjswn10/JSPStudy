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
//����ڰ� �Է��� ���ڿ��� �ѱ����� ����
request.setCharacterEncoding("EUC-KR");

//Ŭ���̾�Ʈ�� ������ ������ ����������Ʈ�� �������� img������ �����Ϸ��Ѵ�
//==>���Ͼ��ε�
//���Ͼ��ε� ����� ���� �ִ� Ŭ����
//cos.jar�� MultipartRequest Ŭ������ �̿��Ѵ�.

//���Ͼ��ε带 �Ϸ���
//<input type="file">�� �±׸� �̿��Ѵ�.
//��, <form>�±��� method�� �ݵ�� "post"���� �ϰ�
//��, <form>�±׿� encodingType="multipart/form-data"�� �ݵ�� �߰��ؾ��Ѵ�.


//���� ���ε带 ���� ���� ������Ʈ�� ��������
//������ img������ ������θ� �˾ƿ´�.
String path = request.getRealPath("/img");
System.out.println("path:"+path);


MultipartRequest multi = new MultipartRequest(request, path,"EUC-KR");


//����ڰ� �Է��� ��ǰ�� ������ ��� ���� �ڹ� ��ü GoodsVO�� ����
GoodsVO g = new GoodsVO();
//����ڰ� �Է��� ��ǰ��ȣ�� VO��ü�� g�� ����
g.setNo(Integer.parseInt(multi.getParameter("no")));
g.setItem(multi.getParameter("item"));
g.setPrice(Integer.parseInt(multi.getParameter("price")));
g.setQty(Integer.parseInt(multi.getParameter("qty")));
//<input type="file">�� ���� ���� ���� �̸��� ���� ���� �ƴ϶�
//���� ������ ���� ������ �̰����κ��� �����̸��� �����Ͽ�
//VO�� �����ؾ� �Ѵ�.
//g.setFname(request.getParameter("fname"));
g.setFname(multi.getFile("fname").getName());




// ����ڰ� �Է��� ��ǰ�� ������ insert�ϱ� ���� DAO��ü ����
GoodsDAO dao = new GoodsDAO();
// dao�� insertFoods�޼ҵ带 ȣ���Ͽ� ��ǰ�� ����� insertGoods �޼ҵ�� insert �������ο� ���� ������ ��ȯ��
int re = dao.insertGoods(g);

if(re>0){
	//re�� 1���� �Ǻ�(����� �����ߴٸ�) listGoods.jsp�� �̵���
	response.sendRedirect("listGoods.jsp");
	
}else{
	
	// ��ǰ��Ͽ� �����Ͽ��ٸ� �����Ͽ����� �޼����� ������Ѵ�.
	%>
	����
	<a href="insertGoods.jsp">��ǰ���</a>
	<%
	
}

%>

</body>
</html>