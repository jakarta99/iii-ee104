package team.lala.timebank.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.TimeZone;
import team.lala.timebank.entity.TimeLedger;

public class TimeLedgerDao {
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
			System.out.println("連結資料庫失敗");
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
	
	//查出TIME_LEDGER資料表中所有資料
	private static final String FIND_ALL_STMT = "SELECT * FROM TIME_LEDGER";
	public Collection<TimeLedger> findAll() {
		TimeLedger timeLedger = null;
		Collection<TimeLedger> timeLedgerCollection = new ArrayList<TimeLedger>();
		try {
			PreparedStatement ppst = connection.prepareStatement(FIND_ALL_STMT);
			ResultSet rs = ppst.executeQuery();
			while(rs.next()) {
				timeLedger = new TimeLedger();
				timeLedger.setId(rs.getLong("ID"));
				timeLedger.setMemberId(rs.getLong("MEMBER_ID"));  
				timeLedger.setTransactionTime(rs.getTimestamp("TRANSACTION_TIME").toLocalDateTime());
				timeLedger.setDepositValue(rs.getInt("DEPOSIT_VALUE"));
				timeLedger.setWithdrawlValue(rs.getInt("WITHDRAWAL_VALUE"));
				timeLedger.setBalanceValue(rs.getInt("BALANCE_VALUE"));
				timeLedger.setDescription(rs.getString("DISCRIPTION"));
				timeLedgerCollection.add(timeLedger);
			}
			rs.close();
			ppst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return timeLedgerCollection;
	}
	
	//透過ID查尋TIME_LEDGER資料表資料
	private static final String FIND_ONE_STMT = "SELECT * FROM TIME_LEDGER WHERE ID=?";
	public TimeLedger findOne(Long id) {
		TimeLedger timeLedger = new TimeLedger();
		try {
			PreparedStatement ppst = connection.prepareStatement(FIND_ONE_STMT);
			ppst.setLong(1, id);
			ResultSet rs = ppst.executeQuery();
			while(rs.next()) {
				timeLedger.setId(rs.getLong("ID"));;
				timeLedger.setMemberId(rs.getLong("MEMBER_ID"));
				timeLedger.setTransactionTime(rs.getTimestamp("TRANSACTION_TIME").toLocalDateTime());
				timeLedger.setDepositValue(rs.getInt("DEPOSIT_VALUE"));
				timeLedger.setWithdrawlValue(rs.getInt("WITHDRAWAL_VALUE"));
				timeLedger.setBalanceValue(rs.getInt("BALANCE_VALUE"));
				timeLedger.setDescription(rs.getString("DISCRIPTION"));
			}
			rs.close();
			ppst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return timeLedger;
	}
	
	//新增單筆資料進TIME_LEDGER資料表
	private static final String INSERT_STMT = "INSERT INTO "
											+ "TIME_LEDGER(MEMBER_ID,TRANSACTION_TIME,DEPOSIT_VALUE,WITHDRAWAL_VALUE,BALANCE_VALUE,DISCRIPTION) "
											+ "VALUES(?,?,?,?,?,?)";
	public void insert(TimeLedger timeLedger) {
		try {
			PreparedStatement ppst = connection.prepareStatement(INSERT_STMT);
			//id屬性由資料庫自動產生
			ppst.setLong(1, timeLedger.getMemberId());  
			ppst.setTimestamp(2, Timestamp.valueOf(timeLedger.getTransactionTime()));
			ppst.setInt(3, timeLedger.getDepositValue());
			ppst.setInt(4, timeLedger.getWithdrawlValue());
			ppst.setInt(5, timeLedger.getBalanceValue());
			ppst.setString(6, timeLedger.getDescription());
			ppst.executeUpdate();
			ppst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//透過ID更新該筆資料
	private static final String UPDATE_STMT = "UPDATE TIME_LEDGER "
											+ "SET MEMBER_ID=?,TRANSACTION_TIME=?,DEPOSIT_VALUE=?,WITHDRAWAL_VALUE=?,BALANCE_VALUE=?,DISCRIPTION=? "
											+ "WHERE ID=?";
	public void update(TimeLedger timeLedger) {
		try {
			PreparedStatement ppst = connection.prepareStatement(UPDATE_STMT);
			//id屬性由資料庫自動產生
			ppst.setLong(1, timeLedger.getMemberId());  
			ppst.setTimestamp(2, Timestamp.valueOf(timeLedger.getTransactionTime()));
			ppst.setInt(3, timeLedger.getDepositValue());
			ppst.setInt(4, timeLedger.getWithdrawlValue());
			ppst.setInt(5, timeLedger.getBalanceValue());
			ppst.setString(6, timeLedger.getDescription());
			ppst.setLong(7, timeLedger.getId());
			ppst.executeUpdate();
			ppst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	//透過ID刪除資料
	private static final String DELETE_STMT = "DELETE FROM TIME_LEDGER "
											+ "WHERE ID=?";
	public void delete(Long id) {
		try {
			PreparedStatement ppst = connection.prepareStatement(DELETE_STMT);
			ppst.setLong(1, id);
			ppst.executeUpdate();
			ppst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	//透過MemberId，找出會員最近一筆的交易資料
	private static final String FIND_TOP1_MEMID_BY_TRASACTIME_STMT = "SELECT TOP 1 * "
																	+ "FROM TIME_LEDGER "
																	+ "WHERE MEMBER_ID=? ORDER BY TRANSACTION_TIME DESC";
	public TimeLedger findTop1ByMemberIdOrderByTransactionTime(Long memberId) {
		TimeLedger timeLedger = new TimeLedger();
		try {
			PreparedStatement ppst = connection.prepareStatement(FIND_TOP1_MEMID_BY_TRASACTIME_STMT);
			ppst.setLong(1, memberId);
			ResultSet rs = ppst.executeQuery();
			while(rs.next()) {
				timeLedger.setId(rs.getLong("ID"));
				timeLedger.setMemberId(rs.getLong("MEMBER_ID"));
				timeLedger.setTransactionTime(rs.getTimestamp("TRANSACTION_TIME").toLocalDateTime());
				timeLedger.setDepositValue(rs.getInt("DEPOSIT_VALUE"));
				timeLedger.setWithdrawlValue(rs.getInt("WITHDRAWAL_VALUE"));
				timeLedger.setBalanceValue(rs.getInt("BALANCE_VALUE"));
				timeLedger.setDescription(rs.getString("DISCRIPTION"));
			}
			rs.close();
			ppst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return timeLedger;
	}
}
