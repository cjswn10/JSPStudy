package com.bit.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.BookDAO;
import com.bit.vo.BookVO;

public class UpdateBookOkAction implements Action {

	@Override
	public String getView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		BookDAO dao = new BookDAO();
		BookVO b = new BookVO();
		b.setBookid(Integer.parseInt(request.getParameter("bookid")));
		b.setBookname(request.getParameter("bookname"));
		b.setPublisher(request.getParameter("publisher"));
		b.setPrice(Integer.parseInt(request.getParameter("price")));
		
		int re = dao.updateBook(b);
		if(re > 0)
			request.setAttribute("msg", "���� ����");
		else
			request.setAttribute("msg", "���� ����");
		
		return "updateBookOk.jsp";
	}

}
