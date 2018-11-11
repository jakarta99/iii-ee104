package team.lala.timebank.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Donation;
import team.lala.timebank.entity.Penalty;

public interface PenaltyDao extends JpaRepository<Penalty, Long> {

	public Collection<Penalty> findByMemberId(Long memberId);

}
