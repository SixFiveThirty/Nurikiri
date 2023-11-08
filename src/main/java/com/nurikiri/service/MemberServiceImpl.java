package com.nurikiri.service;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	public static final String AVATAR_UPLOAD_DIR = "c:/upload/avatar";

	@Override
	public MemberVO get(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(MemberVO member, MultipartFile avatar) throws IOException {
		// TODO Auto-generated method stub
		
	}
	
	
}
