package sqlGroupHW;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class Procedure1 {

	public static void main(String[] args) {
		String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=DB01";
		String pTime = "2016-12-25 13:00";
		int movie = 1;
		String room_id = "AÆU";
		
		try (
				Connection conn = DriverManager.getConnection(connUrl,"sa","passw0rd");				
				){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String sqlstmt = "insert into playlist values (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlstmt);
			pstmt.setString(1, pTime); //setTimeStamp
			pstmt.setInt(2, movie);
			pstmt.setString(3, room_id);
			int updateCount = pstmt.executeUpdate();
			System.out.println("update count = "+ updateCount);
			
			
			String qrystmt = "select roomid, seat_row, seat_col from m_room where roomid = ?";
			pstmt = conn.prepareStatement(qrystmt);
			pstmt.setString(1, room_id);
			ResultSet rs = pstmt.executeQuery();
			int seat_row = 0;
			int seat_col = 0;
			if (rs.next()) {
				seat_row = rs.getInt(2);
				seat_col = rs.getInt(3);
//				System.out.println(seat_row);
//				System.out.println(seat_col);
			}
			sqlstmt = "insert into seats values (?,?, ?, '0', null)";
			pstmt = conn.prepareStatement(sqlstmt);
			for (int i = 1; i <= seat_row; i++) {
				for (int j = 1; j <= seat_col; j++) {
					pstmt.setString(1,pTime);
					pstmt.setInt(2, movie);
					pstmt.setString(3, String.format("%02d-%02d", i, j));
					pstmt.executeUpdate();
				}
			}
			
			sqlstmt = "select * from seats";
			pstmt = conn.prepareStatement(sqlstmt);
			rs = pstmt.executeQuery();
			System.out.printf("%-12s%-7s%-10s%-6s%-7s", "pTime","movie","seat_num" , "sold", "ordid");
			System.out.println();
			while (rs.next()) {			
				System.out.printf("%-12s%-7s%-10s%-6s%-7s",rs.getDate(1),
					rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5));
				System.out.println();		
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(IllegalArgumentException e) {
			e.printStackTrace();
		}

	}

}
