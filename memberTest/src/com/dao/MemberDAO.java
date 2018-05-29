package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.db.ConnectionProvider;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.vo.MemberVO;

import oracle.net.aso.e;

public class MemberDAO {
	
	public int deleteMember(String id) {
		int re = -1;
		String sql = "DELETE member WHERE id=?";
		
		try {
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return re;
	}

	
	
	public int updateMember(MemberVO m) {

		int re = -1;
		String sql = "UPDATE member SET pwd=?,name=?,addr=?,email=?,age=?,hobby=?,tel=?,fname=? WHERE id=?";

		try {

			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getPwd());
			pstmt.setString(2, m.getName());
			pstmt.setString(3, m.getAddr());
			pstmt.setString(4, m.getEmail());
			pstmt.setInt(5, m.getAge());
			pstmt.setString(6, m.getHobby());
			pstmt.setString(7, m.getTel());
			pstmt.setString(8, m.getFname());
			pstmt.setString(9, m.getId());

			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return re;
	}

	public int insertMember(MemberVO m) {
		int re = -1;
		String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,?,?)";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getAddr());
			pstmt.setString(5, m.getEmail());
			pstmt.setInt(6, m.getAge());
			pstmt.setString(7, m.getHobby());
			pstmt.setString(8, m.getTel());
			pstmt.setString(9, m.getFname());

			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return re;
	}

	public MemberVO getMember(String id) {
		MemberVO m = new MemberVO();
		String sql = "SELECT * FROM member WHERE id=?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				m.setId(rs.getString(1));
				m.setPwd(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAddr(rs.getString(4));
				m.setEmail(rs.getString(5));
				m.setAge(rs.getInt(6));
				m.setHobby(rs.getString(7));
				m.setTel(rs.getString(8));
				m.setFname(rs.getString(9));
			}

			ConnectionProvider.close(rs, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return m;
	}

	public ArrayList<MemberVO> listMember() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = "SELECT * FROM member";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				MemberVO m = new MemberVO();
				m.setId(rs.getString(1));
				m.setPwd(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAddr(rs.getString(4));
				m.setEmail(rs.getString(5));
				m.setAge(rs.getInt(6));
				m.setHobby(rs.getString(7));
				m.setTel(rs.getString(8));
				m.setFname(rs.getString(9));

				list.add(m);
			}

			ConnectionProvider.close(rs, stmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return list;
	}
}
