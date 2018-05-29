package com.bit.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//세 개의 메소드가 공통으로 가져야할 메소드를 인터페이스로 만들어 놓음
public interface Action {
	//어디로 가야할지 view를 반환함
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}
