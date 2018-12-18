package team.lala.timebank.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import team.lala.timebank.entity.Member;
import team.lala.timebank.entity.Role;

public class SecurityUser extends Member implements UserDetails {
	
	public SecurityUser(Member member) {
		if (member != null) {
			this.setAccount(member.getAccount());
			this.setPassword(member.getPassword());
			this.setEmail(member.getEmail());
			this.setName(member.getName());
			this.setRoles(member.getRoles());
		}
	}
	
	@Override
	public String toString() {
		return "SecurityUser [getAuthorities()=" + getAuthorities() + ", getUsername()=" + getUsername()
				+ ", getPassword()=" + getPassword() + "]";
	}

	private static final String rolePrefix = "ROLE_";	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<>();
		Set<Role> userRoles = this.getRoles();
		for (Role role : userRoles) {
			authorities.add(new SimpleGrantedAuthority(rolePrefix+ role.getRoleName()));			
		}
		
		return authorities;
	}

	@Override
	public String getUsername() {
		return super.getAccount();
	}
	
	@Override
	public String getPassword() {
		return super.getPassword();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}


	
	

}
