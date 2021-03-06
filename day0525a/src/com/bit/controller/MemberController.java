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
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	HashMap<String, Action> map;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		//super.init(config);
		//bit.properties를 읽어와서 처리할 action클래스명을 알아냄
		map = new HashMap<String, Action>();
		String path = config.getServletContext().getRealPath("WEB-INF");
		
		try {
			FileReader fr = new FileReader(path + "/bit.properties");
			Properties prop = new Properties();
			prop.load(fr);
			Set keys = prop.keySet();
			Iterator iter = keys.iterator();
			//set을 루프로 돌리기 위한 iterator
			
			while(iter.hasNext()) {
				String svName = (String)iter.next();
				String csName = prop.getProperty(svName);
				
				map.put(svName, (Action)Class.forName(csName).newInstance());
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
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
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
