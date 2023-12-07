package com.nurikiri.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import com.nurikiri.security.CustomUserDetailsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource datasource; // RootConfig 히카리

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
	     return super.authenticationManagerBean();
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {

		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);

		http.addFilterBefore(filter, CsrfFilter.class); // csrfFilter 앞 필터 설정

		http.csrf().ignoringAntMatchers("/api/**", "/security/modify"); // csrf 설정

		http.authorizeRequests()
				.antMatchers(
						"/security/profile",
						"/security/check_pwd",
						"/security/modify",
						"/security/mypage", 
						"/security/review", 
						"/security/favorites",
						/* "/security/avatar/**", */
						/*"/store/review/**",*/
						"/store/popup_test"
						).authenticated() // 프로필 화면 로그인시에만 입장 가능
				.antMatchers(
						"/managers/managers_list",
						"/managers/review/get",
						"/managers/review/list",
						"/managers/store/get",
						"/managers/store/list",
						"/managers/store/modify",
						"/managers/store/register",
						"/recommend/editor/list",
						"/store/modify",
						"/board/modify",
						"/board/register",
						"/recommend/editor/modify").access("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')")
				.antMatchers(
						"/managers/member/list").access("hasRole('ROLE_ADMIN')");

		http.formLogin()
			.loginPage("/security/login?error=login_required") // 로그인 안 했을 시 리다이렉트
			.loginProcessingUrl("/security/login")
			.defaultSuccessUrl("/")
			.failureUrl("/security/login?error=true"); // 로그인 실패시 리다이렉트
		
		http.logout()
			.logoutUrl("/security/logout")
			.invalidateHttpSession(true)
			.deleteCookies("remember-me", "JSESSION-ID")
			.logoutSuccessUrl("/");																						// 리다이렉트

		http.rememberMe()
				.key("Nurikiri")
				.tokenRepository(persistentTokenRepository())
				.tokenValiditySeconds(7 * 24 * 60 * 60);
	}

	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(datasource);

		return repo;

	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.userDetailsService(customUserService()).passwordEncoder(passwordEncoder());

	}
}
