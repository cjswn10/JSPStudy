package com.bit.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//�� ���� �޼ҵ尡 �������� �������� �޼ҵ带 �������̽��� ����� ����
public interface Action {
	//���� �������� view�� ��ȯ��
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}
