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

상품번호:<input type="number" name="no"><br>
상품명:<input type="text" name="item"><br>
가격:<input type="number" min="1000"name="price"><br>
수량:<input type="number" min="1" name="qty"><br>
상품사진:<input type="file" name="fname">
<input type="submit" value="등록">
<input type="reset" value="취소">
</form>

</body>
</html>