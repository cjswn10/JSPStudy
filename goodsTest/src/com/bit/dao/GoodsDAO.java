package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.bit.db.ConnectionProvider;
import com.bit.vo.GoodsVO;

public class GoodsDAO {
	public static int pageSIZE = 3;
	//�� ȭ�鿡 ������ ��ǰ�� ��
	public static int totalRecord = 0;
	//��ü ��ǰ�� ���� ������ ����
	public static int totalPage = 1;
	//��ü ���������� ������ ����
	public static int pageGROUP = 5;
	
	//pageó���� ���� ���ڿ��� ��ȯ�ϴ� �޼ҵ� ����
	public String getPageStr(int pageNUM) {
		String str = "";
		
		if(totalPage <= pageGROUP) {
			for(int i = 1; i <= totalPage; i++) {
				str = str +"<a href='listGoods.do?pageNUM=" + i + "'>" + i + "</a> ";
			}
		} else {
			int startPage = ((pageNUM-1)/pageGROUP)*pageGROUP+1;
			int endPage = startPage + pageGROUP - 1;
			if(startPage > pageGROUP)
					str = "<a href='listGoods.do?pageNUM="+(startPage-1)+"'>[����]</a>";
			
			if(totalPage > endPage) {
				for(int i = startPage; i <= endPage; i++) {
					str = str +"<a href='listGoods.do?pageNUM=" + i + "'>" + i + "</a> ";
				}
				str = str +"<a href='listGoods.do?pageNUM="+(endPage+1)+"'>[����]</a>";
				
			} else {
				for(int i = startPage; i <= totalPage; i++) {
					str = str +"<a href='listGoods.do?pageNUM=" + i + "'>" + i + "</a> ";
				}
			}
		}
		
		return str;
	}
	
	public int getTotalCount() {
		int n = 0;
		String sql = "SELECT COUNT(*) FROM goods";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next())
				n = rs.getInt(1);
			
			ConnectionProvider.close(rs, stmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return n;
	}
	
	public ArrayList<GoodsVO> listGoods(int pageNUM) {
		totalRecord = getTotalCount();
		totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		//�ø�����
		System.out.println("totalPage:" + totalPage);
		int start;	//���� �������� ������ ������ġ
		int end;	//���� �������� ������ ������ ��ġ
		
		//�� ȭ�鿡 5���� ��ǰ�� �����ְ��� �Ѵ�.
		//���࿡ ������������ 2���������
		//start = 6; end = 10;
		start = (pageNUM-1) * pageSIZE + 1;
		end = start + pageSIZE - 1;
		
		ArrayList<GoodsVO> list = new ArrayList<GoodsVO>();
		String sql = "SELECT no, item, price, qty, fname FROM " + 
				"(SELECT rownum r,no,item, price, qty, fname FROM " + 
				"(SELECT * FROM goods ORDER BY no)) a " + 
				"WHERE a.r between ? AND ?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new GoodsVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));
			}

			ConnectionProvider.close(rs, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	public GoodsVO getGoods(int no) {
		GoodsVO g = null;
		String sql = "SELECT * FROM goods WHERE no=?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				g = new GoodsVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
			}

			ConnectionProvider.close(rs, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return g;
	}

	public int insertGoods(GoodsVO g) {
		int re = -1;
		String sql = "INSERT INTO goods VALUES(?,?,?,?,?)";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, g.getNo());
			pstmt.setString(2, g.getItem());
			pstmt.setInt(3, g.getPrice());
			pstmt.setInt(4, g.getQty());
			pstmt.setString(5, g.getFname());

			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return re;
	}

	public int updateGoods(GoodsVO g) {
		int re = -1;
		String sql = "UPDATE goods SET item=?,price=?,qty=?,fname=? WHERE no=?";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, g.getItem());
			pstmt.setInt(2, g.getPrice());
			pstmt.setInt(3, g.getQty());
			pstmt.setString(4, g.getFname());
			pstmt.setInt(5, g.getNo());

			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return re;
	}

	public int deleteGoods(int no) {
		int re = -1;
		String sql = "DELETE FROM goods WHERE no=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(null, pstmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return re;
	}
}
