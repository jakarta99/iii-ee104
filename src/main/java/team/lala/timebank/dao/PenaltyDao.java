package team.lala.timebank;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.penalty;

public interface PenaltyDao extends JpaRepository<penalty, Long> {

}
