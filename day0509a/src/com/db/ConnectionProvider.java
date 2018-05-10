package com.db;
//데이터베이스의 connection 객체를 반환하는 메소드와 사용했던 자원을 받아주는 메소드를 만들자

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionProvider {

	public static void close(ResultSet rs, Statement stmt, Connection conn) {
			try {
				if(rs != null)
					rs.close();
				
				if(stmt != null)
					stmt.close();
				
				if(conn != null)
					conn.close();
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		
		
	}
	//객체 없이 사용하기 위해 static으로 선언
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang", "madang");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
}
