package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.db.ConnectionProvider;
import com.vo.MemberVO;

public class MemberDAO {
	public ArrayList<MemberVO> selectAll() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		String sql = "SELECT * FROM member";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberVO mv = new MemberVO();
				mv.setId(rs.getString(1));
				mv.setPwd(rs.getString(2));
				mv.setName(rs.getString(3));
				mv.setAddr(rs.getString(4));
				mv.setEmail(rs.getString(5));
				mv.setAge(rs.getInt(6));
				mv.setHobby(rs.getString(7));
				mv.setTel(rs.getString(8));
				
				list.add(mv);
				
			}
			
			ConnectionProvider.close(rs, stmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
	
	public MemberVO selectMember(String id) {
		MemberVO mv = new MemberVO();

		String sql = "SELECT * FROM member WHERE id=?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mv.setId(rs.getString(1));
				mv.setPwd(rs.getString(2));
				mv.setName(rs.getString(3));
				mv.setAddr(rs.getString(4));
				mv.setEmail(rs.getString(5));
				mv.setAge(rs.getInt(6));
				mv.setHobby(rs.getString(7));
				mv.setTel(rs.getString(8));
			}
			ConnectionProvider.close(rs, pstmt, conn);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mv;
	}
	
	public int updateMember(MemberVO mv) {
		int re = -1;
		
		String sql = "UPDATE member SET pwd=?,name=?,addr=?,email=?,age=?,hobby=?,tel=? WHERE id=?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mv.getPwd());
			pstmt.setString(2, mv.getName());
			pstmt.setString(3, mv.getAddr());
			pstmt.setString(4, mv.getEmail());
			pstmt.setInt(5, mv.getAge());
			pstmt.setString(6, mv.getHobby());
			pstmt.setString(7, mv.getTel());
			pstmt.setString(8, mv.getId());
			
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return re;
	}
	
	public int deleteMember(String id) {
		int re = -1;
		
		String sql="DELETE FROM member WHERE id=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			re = pstmt.executeUpdate();

			ConnectionProvider.close(null, pstmt, conn);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return re;
	}
	
	public int insertMember(MemberVO mv) {
		int re = -1;

		String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,?)";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mv.getId());
			pstmt.setString(2, mv.getPwd());
			pstmt.setString(3, mv.getName());
			pstmt.setString(4, mv.getAddr());
			pstmt.setString(5, mv.getEmail());
			pstmt.setInt(6, mv.getAge());
			pstmt.setString(7, mv.getHobby());
			pstmt.setString(8, mv.getTel());
			
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return re;
	}
}
