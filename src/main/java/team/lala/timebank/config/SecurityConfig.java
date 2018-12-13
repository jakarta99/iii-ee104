package team.lala.timebank.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

import team.lala.timebank.service.TimeBankUserDetailsService;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private TimeBankUserDetailsService timeBankUserDetailsService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/", "/home", "/js/**", "/css/**", "/img/**", "/vendor/**").permitAll()
				.antMatchers("/admin/**").access("hasRole('ADMIN')")
				.and().formLogin().loginPage("/login")
				.and().csrf()
				.disable();

	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(timeBankUserDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
	}
		
}
