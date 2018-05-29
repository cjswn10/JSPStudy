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
import com.bit.dao.GoodsDAO;

/**
 * Servlet implementation class GoodsController
 */
@WebServlet("*.do")
public class GoodsController extends HttpServlet {
	GoodsDAO dao;
	HashMap<String, Action> map;
	//map�� key���� ����ڰ� ��û�� ���񽺸��� ��� ex)listGoods.do
	//value���� �׿� ���� ��û�� ó���� Ŭ���� ��ü��(Action) ��´� ex)ListGoodsAction
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsController() {
        super();
        // TODO Auto-generated constructor stub
        dao = new GoodsDAO();
    }

    
    //init�� ó�� do������ �Է����� �� �ѹ��� ���� �Ѵ�.
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		//super.init(config);
		map = new HashMap<String, Action>();
		String path = config.getServletContext().getRealPath("WEB-INF");
		//bit.properties ������ �ִ� WEB-INF�� ������θ� �˾ƿ´�.
		
		try {
			FileReader fr = new FileReader(path + "/bit.properties");
			//ȯ�漳�� ������ �޸𸮷� �о� ���̱� ���� ��Ʈ�� ��ü�� �����Ѵ�.
			Properties prop = new Properties();
			//key�� value�� �� ������ �̷����  ������ ������ ó���ϱ� ���� ��ü�� ����
			
			prop.load(fr);
			//Properties ��ü�� prop�� bit.properties ������ ������ �о� ���δ�.
			
			Set key= prop.keySet();
			//Properties ��ü�κ��� key(���񽺸�)�� ��� �̾ƿͼ� ������ ��´�.

			Iterator iter = key.iterator();
			//Set��ü�� loop�� ���ऩ�� �� ����
			//set�� ������ �ϳ��� ������ �ݺ� ������ �� �ִ� Iterator ��ü�� ����
			
			while(iter.hasNext()) {
				//iterator�� �����Ͱ� �ִ¸�ŭ �ݺ�
				
				String serviceName = (String)iter.next();
				//iterator�� ���� ���񽺸��� �ϳ��� �̾ƿ´�.
				String className = prop.getProperty(serviceName);
				//Properties ��ü�κ��� ���񽺸� ���� ��ó���� ���� actionŬ�������� �̾ƿ´�
				
				Action obj = (Action)Class.forName(className).newInstance();
				map.put(serviceName, obj);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
		
		String view = action.proRequest(request, response);
		//Action�� ������ proRequest �޼ҵ� �̸��� ���ǹ� ����. �Ϻη� �Ȱ��� �Ѱ� �ƴ�
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
