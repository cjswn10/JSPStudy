package com.bit.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.BoardDAO;
import com.bit.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;

public class UpdateBoardOkAction implements Action {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardDAO dao = new BoardDAO();
		BoardVO b = new BoardVO();
		
		String ip = request.getRemoteAddr();
		String path = request.getRealPath("upload");
		MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "euc-kr");
		
		int no = Integer.parseInt(multi.getParameter("no"));
		String oldFname = dao.getBoard(no, false).getFname();
		int oldFsize = dao.getBoard(no, false).getFsize();
		
		b.setNo(no);
		b.setTitle(multi.getParameter("title"));
		b.setWriter(multi.getParameter("writer"));
		b.setPwd(multi.getParameter("pwd"));
		b.setContent(multi.getParameter("content"));
		b.setFname(oldFname);
		b.setFsize(oldFsize);
		b.setIp(ip);
		
		String fname = null;
		//���ε��� ������ ������ fname�� �־���
		if(multi.getFile("fname") != null)
			fname = multi.getFile("fname").getName();
		
		if(fname != null && !fname.equals("")) {
			b.setFname(fname);
			b.setFsize((int)multi.getFile("fname").length());
		}
		
		
		int re = dao.updateBoard(b);
		
		if(re > 0) {
			//������ �����߰�
			//���ϵ� �����߰�, ���� �Խù��� ������ �־��ٸ�(oldFsize > 0) ���� ����
			if(fname != null && !fname.equals("") && oldFsize > 0) {
				File file = new File(path + "/" + oldFname);
				file.delete();
			}
			
			request.setAttribute("msg", "���� ����");
		} else
			request.setAttribute("msg", "���� ����");
		
		return "updateBoardOk.jsp";
	}

}
