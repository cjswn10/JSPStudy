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
	public String getView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardVO b = new BoardVO();
		b.setIp(request.getRemoteAddr());
		
		String path = request.getRealPath("upload");
		MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "euc-kr");
		b.setNo(Integer.parseInt(multi.getParameter("no")));
		b.setTitle(multi.getParameter("title"));
		b.setWriter(multi.getParameter("writer"));
		b.setPwd(multi.getParameter("pwd"));
		b.setContent(multi.getParameter("content"));
		
		String fname = "";
		int fsize = 0;
		
		if(multi.getFile("fname") != null) {
			fname = multi.getFile("fname").getName();
		}

		//���ε��� ������ ��� null�� �ƴ� ������ ������ ���� ����
		if(!fname.equals("")) {
			fsize = (int)multi.getFile("fname").length();
		}
		b.setFname(fname);
		b.setFsize(fsize);
		
		BoardDAO dao = new BoardDAO();
		int re = dao.insertBoard(b);
		
		String msg = "�Խù��� ����Ͽ����ϴ�.";
		if(re < 0)
			msg = "�Խù� ��� ����";
		request.setAttribute("msg", msg);
		
		return "insertBoardOk.jsp";
	}

}
