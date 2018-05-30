package com.bit.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.PostDAO;
import com.bit.vo.PostVO;

public class InsertPostOkAction implements Action {

	@Override
	public String getView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		PostDAO dao = new PostDAO();
		
		PostVO p = new PostVO();
		p.setTitle(request.getParameter("title"));
		p.setWriter(request.getParameter("writer"));
		p.setPwd(request.getParameter("pwd"));
		p.setContent(request.getParameter("content"));
		
		int re = dao.insertPost(p);
		String msg = "����Ͽ����ϴ�.";
		if(re < 1) {
			msg = "��Ͽ� �����Ͽ����ϴ�.";
		}
		
		request.setAttribute("msg", msg);
		return "insertPostOk.jsp";
	}

}
