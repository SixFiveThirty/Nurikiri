package com.nurikiri.service;

import java.io.File;
import java.io.IOException;

import com.nurikiri.mapper.MemberMapper;

import com.nurikiri.domain.AuthVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	public static final String AVATAR_UPLOAD_DIR = "c:/upload/avatar";

	@Autowired
	MemberMapper mapper;

	@Autowired
	private PasswordEncoder pwEncoder;

	@Override
	public MemberVO get(String username) {
		MemberVO member = mapper.read(username);
		return member;
	}

	@Override
	public void register(MemberVO member, MultipartFile avatar) throws IOException {
		// 1. 비밀번호 암호화
		String encPassword = pwEncoder.encode(member.getPassword());
		member.setPassword(encPassword);

		// 2. member에 저장
		mapper.insert(member);

		// 3. member_auth에 저장
		AuthVO auth = new AuthVO(member.getUsername(), "ROLE_USER");
		mapper.insertAuth(auth); // 권한부여한거 등록

		// 4. avatar 이미지 저장
		if (!avatar.isEmpty()) {
			File dest = new File(AVATAR_UPLOAD_DIR, member.getUsername() + ".png");

			Thumbnails.of(avatar.getInputStream()).size(250, 250).toFile(dest);

		}

	}

	@Override
	public void modify(MemberVO member, MultipartFile avatar) throws IOException {
		
		// 1. 비밀번호 암호화
		String encPassword = pwEncoder.encode(member.getPassword());
		member.setPassword(encPassword);
		
		
		// 2. member에 저장
		mapper.modify(member);
		
		// 3. avatar 이미지 저장
		if (!avatar.isEmpty()) {
			File dest = new File(AVATAR_UPLOAD_DIR, member.getUsername() + ".png");
			
			Thumbnails.of(avatar.getInputStream()).size(250, 250).toFile(dest);
		}
	}
		
}		

