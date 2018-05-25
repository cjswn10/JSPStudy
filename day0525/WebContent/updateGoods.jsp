<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>상품 정보 수정</h2>
	<hr>
	<form action="updateGoodsOk.do" method="post" enctype="multipart/form-data">
	상품번호 : ${g.no}<input type="hidden" name="no" value="${g.no}"><br>
	상품이름 : <input type="text" name="item" value="${g.item}"><br>
	상품가격 : <input type="number" name="price" value="${g.price}"><br>
	상품수량 : <input type="number" name="qty" value="${g.qty}"><br>
	상품사진 : <input type="file" name="fname" value="${g.fname}"><br>
	<input type="submit" value="등록">
	<input type="reset" value="취소">
	</form>
</body>
</html>