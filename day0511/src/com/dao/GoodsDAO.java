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
	
	
	
	// 매개변수를 GoodsVO를 전달받아 상품을 등록하기 위한 메소드 정의 반환값은 int를 반환환다.
	public int insertGoods(GoodsVO g) {

		// 이 메소드가 수행한 후 반환하는 값을 re에 담아 반환하도록 한다. 기본값 -1을 저장한다.
		int re = -1;
		// 이 메소드가 spl명령어를 변수에 저장한다. 사용자가 입력한 변수의 값을 추가하기 위하여 values의 항목을 ?로 대체한다.
		String sql = "INSERT INTO goods VALUES(?,?,?,?,?)";

		try {
			// ConnectionProvider 클래스의 static 메소드인 getConnection을 통해서 dbServer에 연결한다.
			Connection conn = ConnectionProvider.getConnection();
			// Connection 객체로 부터 sql명령을 수행하기 위한 Statement 객체를 생성한다.
			// 우리가 실행할 sql명령어에는 ?를 포함하므로 Statement의 자식클래스인(is a 관계에 있는) PreparedStatement 객체
			// 생성
			PreparedStatement pstmt = conn.prepareStatement(sql);
			// sql명령어의 1번째 ?에 매개변수로 전달받은 VO의 no를 설정한다.
			pstmt.setInt(1, g.getNo());
			pstmt.setString(2, g.getItem());
			pstmt.setInt(3, g.getPrice());
			pstmt.setInt(4, g.getQty());
			pstmt.setString(5, g.getFname());
			// sql명령을 실행하고 실행한 행의 수를 정수형변수 re에 저장한다.
			// executeUpdate()는 성공적으로 sql명령어를 실행한 행의수를 반환한다.
			// 그럼, insert를 성공했다면 1을 반환할 것이다.
			re = pstmt.executeUpdate();
			// sql명령을 실행하기 위해 사용했던 자원들(stmt,conn)을 close한다.
			ConnectionProvider.close(null, pstmt, conn);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		// re를 반환하고 종료한다.
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
