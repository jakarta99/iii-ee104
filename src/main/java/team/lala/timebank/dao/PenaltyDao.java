package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.penalty;

public interface PenaltyDao extends JpaRepository<penalty, Long> {

}
