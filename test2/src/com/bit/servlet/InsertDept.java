package com.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.DeptDAO;
import com.bit.vo.DeptVO;

/**
 * Servlet implementation class InsertDept
 */
@WebServlet("/InsertDept")
public class InsertDept extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertDept() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("euc-kr");

		String str = "<h2>�μ����</h2><hr>";
		str += "<form action='InsertDept' method='post'>";

		str += "�μ���ȣ:<input type='text' name='dno'><br>";
		str += "�μ��̸�:<input type='text' name='dname'><br>";
		str += "�μ���ġ<input type='text' name='dloc'><br>";
		str += "<input type='submit' value='���'>";
		str += "<input type='reset' value='���'>";
		str += "</form>";

		PrintWriter out = response.getWriter();
		out.println(str);
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		DeptVO d = new DeptVO();
		d.setDno(Integer.parseInt(request.getParameter("dno")));
		d.setDname(request.getParameter("dname"));
		d.setDloc(request.getParameter("dloc"));

		DeptDAO dao = new DeptDAO();
		int re = dao.insertDept(d);

		response.setContentType("text/html");
		response.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();

		if (re > 0) {
			out.print("����");
		} else {
			out.print("����");
		}

	}

}
