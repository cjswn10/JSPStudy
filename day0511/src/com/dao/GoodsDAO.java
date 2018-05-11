package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.db.ConnectionProvider;
import com.vo.GoodsVO;

public class GoodsDAO {
	
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
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return re;
		
	}
	
	
	
	// �Ű������� GoodsVO�� ���޹޾� ��ǰ�� ����ϱ� ���� �޼ҵ� ���� ��ȯ���� int�� ��ȯȯ��.
	public int insertGoods(GoodsVO g) {

		// �� �޼ҵ尡 ������ �� ��ȯ�ϴ� ���� re�� ��� ��ȯ�ϵ��� �Ѵ�. �⺻�� -1�� �����Ѵ�.
		int re = -1;
		// �� �޼ҵ尡 spl��ɾ ������ �����Ѵ�. ����ڰ� �Է��� ������ ���� �߰��ϱ� ���Ͽ� values�� �׸��� ?�� ��ü�Ѵ�.
		String sql = "INSERT INTO goods VALUES(?,?,?,?,?)";

		try {
			// ConnectionProvider Ŭ������ static �޼ҵ��� getConnection�� ���ؼ� dbServer�� �����Ѵ�.
			Connection conn = ConnectionProvider.getConnection();
			// Connection ��ü�� ���� sql����� �����ϱ� ���� Statement ��ü�� �����Ѵ�.
			// �츮�� ������ sql��ɾ�� ?�� �����ϹǷ� Statement�� �ڽ�Ŭ������(is a ���迡 �ִ�) PreparedStatement ��ü
			// ����
			PreparedStatement pstmt = conn.prepareStatement(sql);
			// sql��ɾ��� 1��° ?�� �Ű������� ���޹��� VO�� no�� �����Ѵ�.
			pstmt.setInt(1, g.getNo());
			pstmt.setString(2, g.getItem());
			pstmt.setInt(3, g.getPrice());
			pstmt.setInt(4, g.getQty());
			pstmt.setString(5, g.getFname());
			// sql����� �����ϰ� ������ ���� ���� ���������� re�� �����Ѵ�.
			// executeUpdate()�� ���������� sql��ɾ ������ ���Ǽ��� ��ȯ�Ѵ�.
			// �׷�, insert�� �����ߴٸ� 1�� ��ȯ�� ���̴�.
			re = pstmt.executeUpdate();
			// sql����� �����ϱ� ���� ����ߴ� �ڿ���(stmt,conn)�� close�Ѵ�.
			ConnectionProvider.close(null, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		// re�� ��ȯ�ϰ� �����Ѵ�.
		return re;

	}

	public GoodsVO detailGoods(int no) {
		GoodsVO g = new GoodsVO();
		String sql = "SELECT * FROM goods WHERE no=?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "madang", "madang");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				// g = new GoodsVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4),
				// rs.getString(5));
				g.setNo(rs.getInt(1));
				g.setItem(rs.getString(2));
				g.setPrice(rs.getInt(3));
				g.setQty(rs.getInt(4));
				g.setFname(rs.getString(5));
			}

			ConnectionProvider.close(rs, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return g;

	}

	public ArrayList<GoodsVO> listGoods() {
		ArrayList<GoodsVO> list = new ArrayList<GoodsVO>();
		String sql = "SELECT * FROM goods";

		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				GoodsVO g = new GoodsVO();
				g.setNo(rs.getInt(1));
				g.setItem(rs.getString(2));
				g.setPrice(rs.getInt(3));
				g.setQty(rs.getInt(4));
				g.setFname(rs.getString(5));

				list.add(g);
			}
			ConnectionProvider.close(rs, stmt, conn);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return list;
	}
}
