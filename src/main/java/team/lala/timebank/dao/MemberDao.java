package team.lala.timebank.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import team.lala.timebank.entity.Member;

public class MemberDao {
	private final static String SERVERNAME = "localhost";
	private final static String PORT = "1433";
	private final static String URL = "jdbc:sqlserver://" + SERVERNAME + ":" + PORT + ";databaseName=timebank";
	private final static String USERNAME = "sa";
	private final static String PASSWORD = "passw0rd";

	Connection connection = null;

	public void getConnection() {
		try {
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("資料庫連線成功");
		} catch (SQLException e) {
			System.out.println("資料庫連線失敗");
			e.printStackTrace();
		}
	}

	public void closeConnection() {
		if (connection != null) {
			try {
				connection.close();
				System.out.println("關閉資料庫連線");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 查出 MEMBER table中所有資料
	private static final String FIND_ALL_STMT = "SELECT * FROM MEMBER";

	public Collection<Member> findAll() {
		Member member = null;
		Collection<Member> memberCollection = new ArrayList<Member>();
		try {
			PreparedStatement ppst = connection.prepareStatement(FIND_ALL_STMT);
			ResultSet rs = ppst.executeQuery();
			while (rs.next()) {
				member = new Member();
				member.setId(rs.getLong("ID"));
				member.setName(rs.getString("NAME"));
				member.setType(rs.getString("TYPE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setTelephone(rs.getString("TEL"));
				member.setMobile(rs.getString("MOBILE"));
				memberCollection.add(member);
			}
			rs.close();
			ppst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberCollection;
	}

	// 透過ID查詢 MEMBER table資料
	private static final String FIND_ONE_STMT = "SELECT * FROM MEMBER WHERE ID=?";

	public Member findOne(Long id) {
		Member member = null;
		try {
			PreparedStatement ppst = connection.prepareStatement(FIND_ONE_STMT);
			ppst.setLong(1, id);
			ResultSet rs = ppst.executeQuery();
			while (rs.next()) {
				member = new Member();
				member.setId(rs.getLong("ID"));
				member.setName(rs.getString("NAME"));
				member.setType(rs.getString("TYPE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setTelephone(rs.getString("TEL"));
				member.setMobile(rs.getString("MOBILE"));
			}
			rs.close();
			ppst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}

	// 新增單筆資料進MEMBER資料表
	private static final String INSERT_STMT = "INSERT INTO MEMBER(NAME,TYPE,EMAIL,TEL,MOBILE) VALUES(?,?,?,?,?)";

	public void insert(Member member) {
		try {
			PreparedStatement ppst = connection.prepareStatement(INSERT_STMT);
			// id流水號
			ppst.setString(1, member.getName());
			ppst.setString(2, member.getType());
			ppst.setString(3, member.getEmail());
			ppst.setString(4, member.getTelephone());
			ppst.setString(5, member.getMobile());
			ppst.executeUpdate();
			ppst.close();
			System.out.println("[MEMBER] INSERT成功");
		} catch (SQLException e) {
			System.out.println("[MEMBER] INSERT失敗");
			e.printStackTrace();
		}
	}

	// 透過ID更新該筆資料
	private static final String UPDATE_STMT = "UPDATE MEMBER SET NAME=?,TYPE=?,EMAIL=?,TEL=?,MOBILE=? WHERE ID=?";

	public void update(Member member) {
		try {
			PreparedStatement ppst = connection.prepareStatement(UPDATE_STMT);
			// id流水號
			ppst.setString(1, member.getName());
			ppst.setString(2, member.getType());
			ppst.setString(3, member.getEmail());
			ppst.setString(4, member.getTelephone());
			ppst.setString(5, member.getMobile());
			ppst.setLong(6, member.getId());
			ppst.executeUpdate();
			ppst.close();
			System.out.println("[MEMBER] UPDATE成功");
		} catch (SQLException e) {
			System.out.println("[MEMBER] UPDATE失敗");
			e.printStackTrace();
		}
	}

	// 透過ID刪除該筆資料
	private static final String DELETE_STMT = "DELETE FROM MEMBER WHERE ID=?";

	public void delete(Long id) {
		try {
			PreparedStatement ppst = connection.prepareStatement(DELETE_STMT);
			ppst.setLong(1, id);
			ppst.executeUpdate();
			ppst.close();
			System.out.println("[MEMBER] DELETE成功");
		} catch (SQLException e) {
			System.out.println("[MEMBER] DELETE失敗");
			e.printStackTrace();
		}
	}

}
