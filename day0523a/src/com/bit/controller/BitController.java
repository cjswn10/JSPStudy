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
	// 사용자 요청에 따른 서비스명을 key로 하고 처리를 위한 클래스형의 객체를 value로 처리하기 위한 map을 선언

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

	// 사용자가 get방식으로 요청하거나 post로 요청해도 똑같이 처리하기 위해 메소드를 만들고 호출함
	private void proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		//사용자가 요청한 URI를 변수에 저장한다.
		//사용자가 글목록보기를 요청했을 떄의 uri ↓↓↓↓↓
		// url:http://localhost:8099/day0523a/insertBoard.do
		// uri:/day0523a/insertBoard.do

		String cmd = uri.substring(uri.lastIndexOf("/") + 1);
		// uri에서 서비스명만 잘라서 cmd에 넣음
		// listBoard.do
		String view = "";
		//view페이지(결과를 보여줄 jsp이름)을 저장할 변수
		Action action = null;
		//사용자의 요청에 따라 일처리를 위한 객체(ListBoardAction, InsertBoardAction, InsertBoardOkAction,...)를 바라볼 변수
		//누구든지 바라볼 수 있어야 하나 이것들의 조상인 Action 인터페이스형의 변수로 선언한다.
		
		action = map.get(cmd);
		//map으로부터 사용자가 요청한 서비스명에 따른 일처리를 위한 객체를 뽑아 온다.
		//예를 들어 사용자가 listBoard.do라고 요청했다면
		//action은 new ListBoardAction() 객체가 된다.
		
		view = action.proRequest(request, response);
		//각각의 action이 일처리를 위한 메소드를 호출한다.
		//만약 사용자가 listBoard.do라고 요청했다면
		//ListBoardAction의 proRequest를 호출한다.
		//이 때 사용자의 요청정보가 담겨있는 request, 응답정보를 위한 response를 
		//매개변수로 전달하여 "상태유지"한다.
		
		//이 때 각각의 proRequest는 맡은바 일처리를 수행하고 
		//어디로 갈지 이동해야할 viewpage명(jsp파일명)을 반환한다
		//이것을 view에 저장한다.
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		//이제 사용자의 요청에 대한 일처리를 action에 의해 끝냈으니
		//결과를 보여줄 view페이지로 이동시키기 위한 
		//RequestDispatcher객체를 생성한다.
		
		dispatcher.forward(request, response);
		//사용자가 요청한 결과를 보여주기 위한 view페이지(jsp)로 이동시킨다.
		//결과가 담겨진 request와 response를 안고 이동한다.
		
	}
}
