package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.action.Action;
import com.bit.action.DeleteBoardAction;
import com.bit.action.DeleteBoardOkAction;
import com.bit.action.DetailBoardAction;
import com.bit.action.InsertBoardAction;
import com.bit.action.InsertBoardOkAction;
import com.bit.action.ListBoardAction;
import com.bit.action.UpdateBoardAction;
import com.bit.action.UpdateBoardOkAction;
import com.bit.dao.BoardDAO;
import com.bit.vo.BoardVO;

/**
 * Servlet implementation class BitController
 */
@WebServlet("*.do")
public class BitController extends HttpServlet {
	BoardDAO dao;
	HashMap<String, Action> map;
	// ����� ��û�� ���� ���񽺸��� key�� �ϰ� ó���� ���� Ŭ�������� ��ü�� value�� ó���ϱ� ���� map�� ����

	private static final long serialVersionUID = 1L;

	/*
	 * @see HttpServlet#HttpServlet()
	 */
	public BitController() {
		super();
		// TODO Auto-generated constructor stub
		dao = new BoardDAO();
		map = new HashMap<String, Action>();
		map.put("listBoard.do", new ListBoardAction());
		map.put("insertBoard.do", new InsertBoardAction());
		map.put("insertBoardOk.do", new InsertBoardOkAction());
		map.put("detailBoard.do", new DetailBoardAction());
		map.put("deleteBoard.do", new DeleteBoardAction());
		map.put("deleteBoardOk.do", new DeleteBoardOkAction());
		map.put("updateBoard.do", new UpdateBoardAction());
		map.put("updateBoardOk.do", new UpdateBoardOkAction());
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		proRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		proRequest(request, response);
	}

	// ����ڰ� get������� ��û�ϰų� post�� ��û�ص� �Ȱ��� ó���ϱ� ���� �޼ҵ带 ����� ȣ����
	private void proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		//����ڰ� ��û�� URI�� ������ �����Ѵ�.
		//����ڰ� �۸�Ϻ��⸦ ��û���� ���� uri ������
		// url:http://localhost:8099/day0523a/insertBoard.do
		// uri:/day0523a/insertBoard.do

		String cmd = uri.substring(uri.lastIndexOf("/") + 1);
		// uri���� ���񽺸� �߶� cmd�� ����
		// listBoard.do
		String view = "";
		//view������(����� ������ jsp�̸�)�� ������ ����
		Action action = null;
		//������� ��û�� ���� ��ó���� ���� ��ü(ListBoardAction, InsertBoardAction, InsertBoardOkAction,...)�� �ٶ� ����
		//�������� �ٶ� �� �־�� �ϳ� �̰͵��� ������ Action �������̽����� ������ �����Ѵ�.
		
		action = map.get(cmd);
		//map���κ��� ����ڰ� ��û�� ���񽺸� ���� ��ó���� ���� ��ü�� �̾� �´�.
		//���� ��� ����ڰ� listBoard.do��� ��û�ߴٸ�
		//action�� new ListBoardAction() ��ü�� �ȴ�.
		
		view = action.proRequest(request, response);
		//������ action�� ��ó���� ���� �޼ҵ带 ȣ���Ѵ�.
		//���� ����ڰ� listBoard.do��� ��û�ߴٸ�
		//ListBoardAction�� proRequest�� ȣ���Ѵ�.
		//�� �� ������� ��û������ ����ִ� request, ���������� ���� response�� 
		//�Ű������� �����Ͽ� "��������"�Ѵ�.
		
		//�� �� ������ proRequest�� ������ ��ó���� �����ϰ� 
		//���� ���� �̵��ؾ��� viewpage��(jsp���ϸ�)�� ��ȯ�Ѵ�
		//�̰��� view�� �����Ѵ�.
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		//���� ������� ��û�� ���� ��ó���� action�� ���� ��������
		//����� ������ view�������� �̵���Ű�� ���� 
		//RequestDispatcher��ü�� �����Ѵ�.
		
		dispatcher.forward(request, response);
		//����ڰ� ��û�� ����� �����ֱ� ���� view������(jsp)�� �̵���Ų��.
		//����� ����� request�� response�� �Ȱ� �̵��Ѵ�.
		
	}
}
