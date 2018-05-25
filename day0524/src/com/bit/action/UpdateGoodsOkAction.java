package com.bit.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.GoodsDAO;
import com.bit.vo.GoodsVO;
import com.oreilly.servlet.MultipartRequest;

public class UpdateGoodsOkAction implements Action {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path = request.getRealPath("/upload");
		MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "euc-kr");
		int no = Integer.parseInt(multi.getParameter("no"));

		GoodsDAO dao = new GoodsDAO();
		GoodsVO g = new GoodsVO();
		g.setNo(no);
		g.setItem(multi.getParameter("item"));
		g.setPrice(Integer.parseInt(multi.getParameter("price")));
		g.setQty(Integer.parseInt(multi.getParameter("qty")));
		String oldFname = dao.getGoods(no).getFname();
		g.setFname(oldFname);
		
		String fname = "";
		if(multi.getFile("fname") != null)
			fname = multi.getFile("fname").getName();
		
		if(fname != null && !fname.equals(""))
			g.setFname(fname);
		
		int re = dao.updateGoods(g);
		if(re > 0) {
			if(!fname.equals("") && !oldFname.equals("")) {
				File file = new File(path + "/" + oldFname);
				file.delete();
			}
				
			request.setAttribute("msg", "���� ����");
		} else
			request.setAttribute("msg", "���� ����");
			
		
		
		return "updateGoodsOk.jsp";
	}

}
