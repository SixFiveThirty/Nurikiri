package com.nurikiri.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
@Service
@AllArgsConstructor
public class EmailSenderServiceImpl implements EmailSendService {
//	private final MailProperties properties;
//	private final JavaMailSender javaMailSender;
	
	
	@Override
	public void send(String email, String authCode) {
		// TODO Auto-generated method stub

	}

}
