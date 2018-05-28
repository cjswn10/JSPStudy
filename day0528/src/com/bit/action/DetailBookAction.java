package com.bit.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.BookDAO;
import com.sun.corba.se.impl.ior.NewObjectKeyTemplateBase;

public class DetailBookAction implements Action {

	@Override
	public String getView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookDAO dao = new BookDAO();
		request.setAttribute("b", dao.getBook(bookid));
		
		return "detailBook.jsp";
	}

}
