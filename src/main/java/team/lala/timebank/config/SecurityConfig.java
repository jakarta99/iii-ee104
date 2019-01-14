package team.lala.timebank.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import team.lala.timebank.commons.handler.MySimpleUrlAuthenticationSuccessHandler;
import team.lala.timebank.service.TimeBankUserDetailsService;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private TimeBankUserDetailsService timeBankUserDetailsService;

	@Autowired
	private MySimpleUrlAuthenticationSuccessHandler authenticationSuccessHandler;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/", "/home","/commons").permitAll()
			.antMatchers("/admin/**","/image/admin/**").access("hasRole('ADMIN')")
			.antMatchers("/user/**").hasAnyRole("USER, ORG_USER")
			.and().formLogin().loginPage("/login")
			.successHandler(authenticationSuccessHandler)
			.failureHandler((req, res, exp) -> {
				String errMsg = "";
				if (exp instanceof BadCredentialsException) {
					errMsg = "帳號或密碼錯誤";
				} else {
					errMsg = "Unknown error - " + exp.getMessage();
				}
				req.setAttribute("message", errMsg);
				req.getRequestDispatcher("/WEB-INF/jsp/basic/commons/login.jsp").forward(req, res);
			}).and().logout().logoutSuccessUrl("/")
			.deleteCookies("JSESSIONID")
//				.and().oauth2Login().loginPage("/oauth_login")
			.and().csrf().disable();
		 http.sessionManagement().maximumSessions(20);
	}


	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(timeBankUserDetailsService).passwordEncoder(passwordEncoder());
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}

	// 設定不需檢查的static檔案路徑，
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/js/**", "/css/**","/css2/**", "/img/**", "/vendor/**","/vendor2/**","/indexPicture/**");
	}
	
	

}
