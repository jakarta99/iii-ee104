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

	public void getConnection() throws SQLException {
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}

	public void closeConnection() throws SQLException {
		conn.close();

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
				job.setJobId(rs.getLong(1));
				job.setRequester(rs.getString(2));
				job.setJobTitle(rs.getString(3));
				job.setTimeValue(rs.getInt(4));
				jobs.add(job);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jobs;
	}

	private static final String FIND_ONE_STMT = "SELECT * FROM JOB WHERE JOB_ID=?";

	public Job findOne(Long jobId) {
		Job job = new Job();

		try {
			PreparedStatement pstmt = conn.prepareStatement(FIND_ONE_STMT);
			pstmt.setLong(1, jobId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				job.setJobId(rs.getLong(1));
				job.setRequester(rs.getString(2));
				job.setJobTitle(rs.getString(3));
				job.setTimeValue(rs.getInt(4));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
			pstmt.setLong(4, job.getJobId());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private static final String DELETE_STMT = "DELETE FROM JOB where JOB_ID=?";

	public void delete(Long jobId) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);

			pstmt.setLong(1, jobId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
