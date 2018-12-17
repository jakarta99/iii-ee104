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

@Transactional //沒寫會有InternalAuthenticationServiceException(spring security可處理的exception)
@Service
public class TimeBankUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		return memberDao.findByAccount(username);
		
		//若帳號不存在，沒檢查會丟出InternalAuthenticationServiceException
		//檢查後，SecurityConfig可用BadCredentialsException來判斷		
		Member user = memberDao.findByAccount(username);
		if (user == null) {
			throw new UsernameNotFoundException("UsernameNotFound");
		}
		System.out.println("user=" + user);
//		return user;
		
		//另建一SecurityUser繼承member，負責處理authority問題，
		//可避免發生org.hibernate.LazyInitializationException(系統直接發生500)		
		UserDetails userDetail = new SecurityUser(user);
		System.out.println("userDetail=" +userDetail);
		return userDetail;
		
	}

}
