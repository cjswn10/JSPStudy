package com.bit.action;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.BoardDAO;
import com.bit.vo.BoardVO;

public class DetailBoardAction implements Action {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardDAO dao = new BoardDAO();
		int no = Integer.parseInt(request.getParameter("no"));
		BoardVO b = dao.getBoard(no, true);
		request.setAttribute("b", b);
		
		return "detailBoard.jsp";
	}

}
