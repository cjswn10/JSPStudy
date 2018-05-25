<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>상품 등록</h2>
	<hr>
	<form action="insertGoodsOk.do" method="post" enctype="multipart/form-data">
	상품번호 : <input type="number" name="no"><br>
	상품이름 : <input type="text" name="item"><br>
	상품가격 : <input type="number" name="price"><br>
	상품수량 : <input type="number" name="qty"><br>
	상품사진 : <input type="file" name="fname"><br>
	<input type="submit" value="등록">
	<input type="reset" value="취소">
	</form>
</body>
</html>