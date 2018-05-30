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
		String msg = "�α��� ����";
		if(dao.isMember(id, pwd)) {
			msg = "�α��� ����";
			request.getSession().setAttribute("id", id);
			//�ùٸ� ȸ���̸�(�α��ο� �����ϸ�)
			//�� ȸ���� ���̵� ���Ǻ����� �����Ѵ�.
			//�������� �ݱ� ������ �α��� ������ ������Ű�� ���Ͽ� ���Ǻ����� �����Ѵ�.
		}
		request.setAttribute("msg", msg);
		
		return "loginOk.jsp";
	}

}
