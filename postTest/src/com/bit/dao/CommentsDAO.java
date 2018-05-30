package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bit.db.ConnectionProvider;
import com.bit.vo.CommentsVO;

public class CommentsDAO {
	public ArrayList<CommentsVO> listComments(int no) {
		ArrayList<CommentsVO> list = new ArrayList<CommentsVO>();
		String sql = "SELECT * FROM comments WHERE no=?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new CommentsVO(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getInt(4), rs.getDate(5)));
			}
			ConnectionProvider.close(rs, pstmt, conn);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return list;
	}

	public int insertComments(CommentsVO c) {
		int re = -1;
		String sql = "INSERT INTO comments VALUES(seq_comments.nextval,?,?,?,sysdate)";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getWriter());
			pstmt.setString(2, c.getContent());
			pstmt.setInt(3, c.getNo());

			re = pstmt.executeUpdate();

			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return re;
	}
	
	public int deleteComments(int cno) {
		int re = -1;
		String sql = "DELETE FROM comments WHERE cno=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return re;
	}
}
