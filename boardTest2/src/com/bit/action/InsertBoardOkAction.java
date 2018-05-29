package com.bit.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.BoardDAO;
import com.bit.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;

public class InsertBoardOkAction implements Action {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String ip = request.getRemoteAddr();
		String path = request.getRealPath("/upload");
		MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "euc-kr");
		
		BoardDAO dao = new BoardDAO();
		BoardVO b = new BoardVO();
		b.setNo(Integer.parseInt(multi.getParameter("no")));
		b.setTitle(multi.getParameter("title"));
		b.setWriter(multi.getParameter("writer"));
		b.setPwd(multi.getParameter("pwd"));
		b.setFname("");
		b.setFsize(0);
		b.setContent(multi.getParameter("content"));
		b.setIp(ip);
		
		String fname = "";
		if(multi.getFile("fname") != null)
			fname = multi.getFile("fname").getName();
		
		if(fname != null && !fname.equals("")) {
			b.setFname(fname);
			b.setFsize((int)multi.getFile("fname").length());
		}
		
		int re = dao.insertBoard(b);
		
		if(re > 0) 
			request.setAttribute("msg", "ㄱㅔ시물 등록 성공");
		else
			request.setAttribute("msg", "ㄱㅔ시물 등록 실패");
			
		return "insertBoardOk.jsp";
	}

}
