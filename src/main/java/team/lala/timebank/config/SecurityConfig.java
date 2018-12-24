package team.lala.timebank.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import team.lala.timebank.service.TimeBankUserDetailsService;

//@EnableWebSecurity //不知作用為何
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private TimeBankUserDetailsService timeBankUserDetailsService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/", "/home", "/js/**", "/css/**", "/img/**", "/vendor/**").permitAll()
				.antMatchers("/admin/**","/user/**").access("hasRole('ADMIN')")
				.antMatchers("/user/**").access("hasRole('USER')")
				.and().formLogin().loginPage("/login")
				.failureHandler((req, res, exp) -> {
					String errMsg = "";
					if (exp instanceof BadCredentialsException) {
						errMsg = "帳號或密碼錯誤";
					} else {
						errMsg = "Unknown error - " + exp.getMessage();
					}
					req.setAttribute("message", errMsg);
					req.getRequestDispatcher("/WEB-INF/jsp/commons/login.jsp").forward(req, res);
				}).and().logout().logoutSuccessUrl("/")
				.deleteCookies("JSESSIONID")
//				.and().oauth2Login().loginPage("/oauth_login")
				.and().csrf().disable();

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
	// @Override
	// public void configure(WebSecurity web) throws Exception {
	// web
	// .ignoring()
	// .antMatchers("/js/**", "/css/**", "/img/**", "/vendor/**");
	// }
	//

}
