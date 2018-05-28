package com.bit.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.action.Action;

/**
 * Servlet implementation class BookController
 */
@WebServlet("*.do")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HashMap<String, Action> map;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		//super.init(config);
		map = new HashMap<String, Action>();
		String path = config.getServletContext().getRealPath("WEB-INF");
		
		try {
			FileReader fr = new FileReader(path + "/bit.properties");
			Properties prop = new Properties();
			prop.load(fr);
			Set keys = prop.keySet();
			Iterator iter = keys.iterator();
			//set을 뽑아내기 위한iterator
			while(iter.hasNext()) {
				String serviceName = (String)iter.next();
				String className = prop.getProperty(serviceName);
				Action obj = (Action)Class.forName(className).newInstance();
				//객체 생성--> new ListBookAction()
				map.put(serviceName, obj);
			}
			fr.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
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

	private void proRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		
		Action action = map.get(cmd);
		String view = action.getView(request, response);
		
		request.setAttribute("viewPage", view);
		//template.jsp에서 쓸 상태유지한 변수
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("template.jsp");
		dispatcher.forward(request, response);
	}

}
