<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="insertGoodsOK.jsp" method="post" enctype="multipart/form-data">

��ǰ��ȣ:<input type="number" name="no"><br>
��ǰ��:<input type="text" name="item"><br>
����:<input type="number" min="1000"name="price"><br>
����:<input type="number" min="1" name="qty"><br>
��ǰ����:<input type="file" name="fname">
<input type="submit" value="���">
<input type="reset" value="���">
</form>

</body>
</html>