package com.bit.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.MemberDAO;
import com.bit.vo.MemberVO;

public class LoginOkAction implements Action {

	@Override
	public String getView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		String msg = "로그인 실패";
		if(dao.isMember(id, pwd)) {
			msg = "로그인 성공";
			request.getSession().setAttribute("id", id);
			//올바른 회원이면(로그인에 성공하면)
			//그 회원의 아이디를 세션변수에 저장한다.
			//브라우저를 닫기 전까지 로그인 정보를 유지시키기 위하여 세션변수에 저장한다.
		}
		request.setAttribute("msg", msg);
		
		return "loginOk.jsp";
	}

}
