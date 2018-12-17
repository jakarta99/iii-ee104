package team.lala.timebank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lala.timebank.entity.Role;

public interface RoleDao extends JpaRepository<Role, Long> {
	public Role findByRoleName(String roleName);
}
