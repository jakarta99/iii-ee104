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
	@Query(value=
			  "SELECT convert(varchar(6),donate_time,112) as '捐款年月', SUM(donate_value) as '捐款時數' " + 
			  "FROM [timebank].[dbo].[donation]" + 
			  "GROUP BY convert(varchar(6),donate_time,112)" + 
			  "order by convert(varchar(6),donate_time,112)",
			  nativeQuery = true)
	public List<Object[]> countDonateTimeByYearAndMonth();
}
