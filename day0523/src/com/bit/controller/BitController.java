package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.action.Action;
import com.bit.action.DetailBoardAction;
import com.bit.action.InsertBoardAction;
import com.bit.action.InsertBoardOkAction;
import com.bit.action.ListBoardAction;
import com.bit.dao.BoardDAO;
import com.bit.vo.BoardVO;

/**
 * Servlet implementation class BitController
 */
@WebServlet("*.do")
public class BitController extends HttpServlet {
	BoardDAO dao;
	
	private static final long serialVersionUID = 1L;
       
    /*
     * @see HttpServlet#HttpServlet()
     */
    public BitController() {
        super();
        // TODO Auto-generated constructor stub
        dao = new BoardDAO();        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		proRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		proRequest(request, response);
	}

	//사용자가 get방식으로 요청하거나 post로 요청해도 똑같이 처리하기 위해 메소드를 만들고 호출함
	private void proRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		//String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		//url:http://localhost:8099/day0523/InsertBoard.do
		//uri:/day0523/InsertBoard.do
		
		
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		//uri에서 서비스명만 잘라서 cmd에 넣음
		String view = "";
		
		Action action = null;
		if(cmd.equals("listBoard.do")) {
			action = new ListBoardAction();
		}
		else if(cmd.equals("detailBoard.do")) {
			action = new DetailBoardAction();
		}
		else if(cmd.equals("insertBoard.do")) {
			action = new InsertBoardAction();
			
		}
		else if(cmd.equals("updateBoard.do")) {
//			action = new UpdateBoardAction();
		}
		else if (cmd.equals("insertBoardOk.do")) {
			action = new InsertBoardOkAction();
		}
		
		view = action.proRequest(request, response);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
