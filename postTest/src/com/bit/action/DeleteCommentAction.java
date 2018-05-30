package com.bit.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.CommentsDAO;

public class DeleteCommentAction implements Action {

	@Override
	public String getView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cno = Integer.parseInt(request.getParameter("cno"));
		CommentsDAO dao = new CommentsDAO();
		dao.deleteComments(cno);

		request.setAttribute("no", request.getParameter("no"));

		//return "deleteCommentOk.do";
		return "insertCommentOk.jsp";
		//같은 역할을 하기때문에 일로 보내줌
	}

}
