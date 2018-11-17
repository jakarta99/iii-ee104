package team.lala.timebank.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Penalty;

public interface PenaltyDao extends JpaRepository<Penalty, Long> {

	// 查詢某人的Penalty by Brian
	public List<Penalty> findByMemberId(Long memberId);

}
