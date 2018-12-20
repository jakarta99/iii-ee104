package team.lala.timebank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.lala.timebank.config.SecurityUser;
import team.lala.timebank.dao.MemberDao;
import team.lala.timebank.entity.Member;


@Service
public class TimeBankUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
//	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//若帳號不存在，沒檢查會丟出InternalAuthenticationServiceException
		//檢查後，SecurityConfig可用BadCredentialsException來判斷		
		Member user = memberDao.findByAccount(username);
		if (user == null) {
			throw new UsernameNotFoundException("UsernameNotFound");
		}
//		user.getAuthorities().size();
		
		System.out.println("user=" + user);
		return user;
		

		
	}

}
