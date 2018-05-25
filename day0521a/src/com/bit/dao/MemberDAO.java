package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bit.db.ConnectionProvider;

public class MemberDAO {

	
	public Boolean isMember(String id, String pwd) {
		Boolean r = false;
		String sql = "SELECT id FROM member WHERE id=? AND pwd=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			int re = pstmt.executeUpdate();
			
			if(re > 0) {
				r = true;
			}
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return r;
	}
}
