package com.nurikiri.service;

public interface EmailSendService {
	void send(String email, String authCode);
}
