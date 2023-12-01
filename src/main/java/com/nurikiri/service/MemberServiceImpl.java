package com.nurikiri.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.nurikiri.mapper.MemberMapper;

import com.nurikiri.domain.AuthVO;
import com.nurikiri.domain.Criteria;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

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
	
	@Override
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		 DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCSWKFA1W2GPLEKS", "OSUYFY9C4JJWSYXXCOAUTTTMYPN8CQMH", "https://api.coolsms.co.kr");
		 Message message = new Message();
		 message.setFrom("01034020187");
		 message.setTo(phoneNumber); //회원가입 유저 폰번호
		 message.setText("누리끼리 회원가입 인증번호 : " + cerNum);
		 
		 try {
			 //send 메소드로 ArrayList<Message> 객체를 넣어도 동작함.
			 messageService.send(message);
		 } catch(NurigoMessageNotReceivedException exception) {
			 System.out.println(exception.getFailedMessageList());
			 System.out.println(exception.getMessage());
		 } catch (Exception exception) {
			 System.out.println(exception.getMessage());
		 }
	 }
	
	@Override
	public List<MemberVO> getList(Criteria cri, Principal principal) {
		log.info("getList");

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

	@Override
	public boolean remove(String username) {
		log.info("remove");
		return mapper.delete(username) == 1;
	}		
	
	@Override
	public void changeAuth(String username, String auth) {
		log.info("changeAuth");
		mapper.changeAuth(username, auth);
	}

	@Override
	public void changeState(String username, String isDeleted) {
		log.info("changeState");
		mapper.isDeleted(username, isDeleted);
				
	}
}		

