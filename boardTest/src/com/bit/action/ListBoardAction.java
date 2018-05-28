package com.bit.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.BoardDAO;
import com.bit.vo.BoardVO;

public class ListBoardAction implements Action {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pageNUM = 1;
		if(request.getParameter("pageNUM") != null)
			pageNUM = Integer.parseInt(request.getParameter("pageNUM"));
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list = dao.listBoard(pageNUM);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", dao.totalPage);
		
		return "listBoard.jsp";
	}

}
