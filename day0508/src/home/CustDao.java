package home;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CustDao {
	public ArrayList<CustVo> selectAll(){
		ArrayList<CustVo> list=new ArrayList<CustVo>();
		Connection conn =ConnectionProvider.getConnection();
		try {
			String sql = "select * from customer";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CustVo v = new CustVo();
				v.setCustid(rs.getInt(1));
				v.setName(rs.getString(2));
				v.setAddress(rs.getString(3));
				v.setPhone(rs.getString(4));
				list.add(v);
			}
			ConnectionProvider.close(rs, stmt, conn);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	public CustVo oneCustInfo(int custid) {
		CustVo cv = new CustVo();
		Connection conn =ConnectionProvider.getConnection();
		try {
			String sql = "select * from customer where custid="+custid;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				cv.setCustid(rs.getInt(1));
				cv.setName(rs.getString(2));
				cv.setAddress(rs.getString(3));
				cv.setPhone(rs.getString(4));
			}
			ConnectionProvider.close(rs, stmt, conn);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return cv;
	}
}
