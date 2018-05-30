package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.bit.db.ConnectionProvider;
import com.bit.vo.BoardVO;

import oracle.net.aso.n;

public class BoardDAO {
	//b.getNo() 0이면		새글
	//b.getNo() 0이 아니면	답글
	public int insertBoard(BoardVO b) {
		int re = -1;

		String sql = "INSERT INTO board VALUES(?,?,?,?,sysdate,0,?,?,?,?,?,?,?)";
		try {
			int no = getNextNo();
			int b_ref = no;
			int b_level = 0;
			int b_step = 0;
			
			//답글이라면
			if(b.getNo() != 0) {
				b_ref = getBoard(b.getNo()).getB_ref();
				b_level = getBoard(b.getNo()).getB_level();
				b_step = getBoard(b.getNo()).getB_step();
				
				updateStep(b_ref, b_step);
				
				//b_level과 b_step을 1씩 증가시킨다
				b_level++;
				b_step++;
			}
			
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getWriter());
			pstmt.setString(4, b.getPwd());
			pstmt.setString(5, b.getContent());
			pstmt.setString(6, b.getFname());
			pstmt.setInt(7, b.getFsize());
			pstmt.setString(8, b.getIp());
			pstmt.setInt(9, b_ref);
			pstmt.setInt(10, b_level);
			pstmt.setInt(11, b_step);
			
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return re;
	}
	
	//이미 달려 있는 답글들의 b_step을 1 증가시킨다.
	private void updateStep(int b_ref, int b_step) {
		String sql = "UPDATE board SET b_step = b_step+1 WHERE b_ref=? and b_step=?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_ref);
			pstmt.setInt(2, b_step);
			pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	public int getNextNo() {
		int no = 0;
		String sql = "SELECT NVL(MAX(no), 0)+1 FROM board";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next())
				no = rs.getInt(1);
			ConnectionProvider.close(rs, stmt, conn);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}		
		return no;
	}
	
	public BoardVO getBoard(int no) {
		BoardVO b = null;
		String sql = "SELECT * FROM board WHERE no=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				b = new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10),
						rs.getInt(11), rs.getInt(12), rs.getInt(13));
			}
			ConnectionProvider.close(rs, pstmt, conn);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return b;
	}
	
	public ArrayList<BoardVO> listBoard() {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = "SELECT * FROM board ORDER BY b_ref DESC,b_step";
	      try {
	         Connection conn = ConnectionProvider.getConnection();
	         Statement stmt = conn.createStatement();
	         ResultSet rs = stmt.executeQuery(sql);

	         while (rs.next()) {
	            list.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
	                  rs.getInt(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getInt(11),
	                  rs.getInt(12), rs.getInt(13)));
	         }

	         ConnectionProvider.close(rs, stmt, conn);

	      } catch (Exception e) {
	         // TODO: handle exception
	         System.out.println(e.getMessage());
	      }
		return list;
	}
}
