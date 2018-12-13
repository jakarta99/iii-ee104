package team.lala.timebank.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		 	.antMatchers("/", "/home","/js/**","/css/**","/img/**","/vendor/**").permitAll()
		 	.antMatchers("/admin/**").access("hasRole('ADMIN')")
			.and().formLogin();
			
	}

}
