package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Member;

public interface DonationDao extends JpaRepository<Donation, Long>, JpaSpecificationExecutor<Donation> {

	public List<Donation> findByDonator(Member memberId);
	
	
	//Jasmine 
	//統計圖表用
	//統計2018年每月TimeBank total捐款時數
	@Query(value=
			  "SELECT convert(varchar(6),donate_time,112) as '捐款年月', SUM(donate_value) as '捐款時數' " + 
			  "FROM [timebank].[dbo].[donation]" + 
			  "where donate_time between '2018-1-1' and '2018-12-31'" +
			  "GROUP BY convert(varchar(6),donate_time,112)" + 
			  "order by convert(varchar(6),donate_time,112)",
			  nativeQuery = true)
	public List<Object[]> countDonateTimeByYearAndMonth();
	
	
	//Jasmine 
	//統計圖表用
	//2018年前三名獲捐機構每月份捐款統計
	@Query(value=
	  "SELECT M.[name] as '機構' ,convert(varchar(6),D.[donate_time],112) as '捐款年月', SUM(D.donate_value) as '捐款時數' " +  
	  "FROM [timebank].[dbo].[donation] as D left outer join member as M " + 
			"on D.[org_donee_id] = M.id " + 
	  "WHERE D.[org_donee_id] in (SELECT TOP 3 dona.[org_donee_id] " + 
								"FROM [timebank].[dbo].[donation] as dona " + 
								"GROUP BY dona.[org_donee_id] " + 
								"order by SUM(dona.donate_value) desc) " + 
			"and D.donate_time between '2018-1-1' and '2018-12-31' " + 
	  "GROUP BY convert(varchar(6),D.donate_time,112),M.[name] " + 
	  "order by M.[name],convert(varchar(6),D.donate_time,112) ",
	  nativeQuery = true)
	public List<Object[]> countTop3OrgDonateTimeByYearAndMonth();
	
	//Jasmine 
		//統計圖表用
		//2018年前三名獲捐機構
	@Query(value=
		"SELECT TOP 3 M.[name] as '機構' " + 
		"FROM [timebank].[dbo].[donation] as D left outer join member as M  " + 
				"on D.[org_donee_id] = M.id " + 
		"where donate_time between '2018-1-1' and '2018-12-31' " + 
		"GROUP BY M.[name] " + 
		"order by SUM(D.donate_value) desc ",
	  nativeQuery = true)
	public List<String> countTop3Org();
	
	
}
