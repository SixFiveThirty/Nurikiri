package com.nurikiri.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	
	@Bean
	public JavaMailSender GoogleMailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setHost("smtp.gmail.com"); // SMTP 서버명
		javaMailSender.setUsername("kjklove0701"); //gmail 아이디
		javaMailSender.setPassword("vret ddtn qvug staa"); //gmail smtp 비밀번호
		
		javaMailSender.setPort(587); //SMTP포트
		
		javaMailSender.setJavaMailProperties(getMailProperties());//메일 인증 서버 가져오기
		
		return javaMailSender;
	}
	
	//메일 인증서버 정보 가져오기
	private Properties getMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport.protocol", "smtp"); //프로토콜 설정
		properties.setProperty("mail.smtp.auth", "true"); //smtp 인증
		properties.setProperty("mail.smtp.starttls.enable", "true"); //smtp starttls 사용
		properties.setProperty("mail.debug", "true"); //디버그 사용
		properties.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com"); //ssl 인증 서버 (smtp 서버명)
		properties.setProperty("mail.smtp.ssl.enable", "true"); //ssl 사용
		
		return properties;
	}
}
