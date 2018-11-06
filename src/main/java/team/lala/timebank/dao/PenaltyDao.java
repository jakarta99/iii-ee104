package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Penalty;

public interface PenaltyDao extends JpaRepository<Penalty, Long> {

}
