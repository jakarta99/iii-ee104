package team.lala.timebank.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import team.lala.timebank.entity.Job;

public class JobDao {
	private final static String SERVERNAME = "localhost";
	private final static String PORT = "1433";
	private final static String URL = "jdbc:sqlserver://" + SERVERNAME + ":" + PORT + ";databaseName=timebank";
	private final static String USERNAME = "sa";
	private final static String PASSWORD = "passw0rd";

	Connection conn = null;

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("連線成功");
		} catch (SQLException e) {
			System.out.println("連線失敗");
			e.printStackTrace();
		}
	}

	public void closeConnection() {
		try {
			conn.close();
			System.out.println("關閉連線成功");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static final String FIND_ALL_STMT = "SELECT * FROM JOB";

	public Collection<Job> findAll() {

		Job job = null;
		Collection<Job> jobs = new ArrayList<Job>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(FIND_ALL_STMT);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				job = new Job();
				job.setId(rs.getLong(1));
				job.setRequester(rs.getString(2));
				job.setJobTitle(rs.getString(3));
				job.setTimeValue(rs.getInt(4));
				jobs.add(job);
			}
			rs.close();
			pstmt.close();
			System.out.println("搜尋成功");
		} catch (SQLException e) {
			System.out.println("搜尋失敗");
			e.printStackTrace();
		}
		return jobs;
	}

	private static final String FIND_ONE_STMT = "SELECT * FROM JOB WHERE JOB_ID=?";

	public Job findOne(Long id) {
		Job job = new Job();

		try {
			PreparedStatement pstmt = conn.prepareStatement(FIND_ONE_STMT);
			pstmt.setLong(1, id);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				job.setId(rs.getLong(1));
				job.setRequester(rs.getString(2));
				job.setJobTitle(rs.getString(3));
				job.setTimeValue(rs.getInt(4));
			}
			rs.close();
			pstmt.close();
			System.out.println("搜尋成功");
		} catch (SQLException e) {
			System.out.println("搜尋失敗");
			e.printStackTrace();
		}

		return job;
	}

	private static final String INSERT_STMT = "INSERT INTO JOB(INSTITUTE_NAME,JOB_TITLE,TIME_VALUE) VALUES(?,?,?,?)";

	public void insert(Job job) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(INSERT_STMT);

			pstmt.setString(1, job.getRequester());
			pstmt.setString(2, job.getJobTitle());
			pstmt.setInt(3, job.getTimeValue());
			int insertCount =pstmt.executeUpdate();
			pstmt.close();
			System.out.println("insert" +insertCount+"筆資料成功");
		} catch (SQLException e) {
			System.out.println("insert失敗");
			e.printStackTrace();
		}

	}

	private static final String UPDATE_STMT = "UPDATE JOB SET INSTITUTE_NAME=?,JOB_TITLE=?,TIME_VALUE=?WHERE JOB_ID=?";

	public void update(Job job) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(UPDATE_STMT);

			pstmt.setString(1, job.getRequester());
			pstmt.setString(2, job.getJobTitle());
			pstmt.setInt(3, job.getTimeValue());
			pstmt.setLong(4, job.getId());
			pstmt.executeUpdate();
			pstmt.close();
			System.out.println("update成功");
		} catch (SQLException e) {
			System.out.println("update失敗");
			e.printStackTrace();
		}

	}

	private static final String DELETE_STMT = "DELETE FROM JOB where JOB_ID=?";

	public void delete(Long id) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);

			pstmt.setLong(1, id);
			pstmt.executeUpdate();
			System.out.println("delete成功");
		} catch (SQLException e) {
			System.out.println("delete失敗");
			e.printStackTrace();
		}

	}

}
