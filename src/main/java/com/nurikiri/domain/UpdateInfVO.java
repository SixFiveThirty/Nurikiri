package com.nurikiri.domain;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateInfVO {
	private String username;	
	
	@NotBlank(message= "필수 항목 입니다.")
	private String orgPassword;
	
	@NotBlank(message= "필수 항목 입니다.")
	private String newPassword;
	
	@NotBlank(message= "필수 항목 입니다.")
	private String newPassword2;
	
	@NotBlank(message= "필수 항목 입니다.")
	private String newName;
	
	@NotBlank(message= "필수 항목 입니다.")
	private String newEmail;
	
	private String encPassword;
}
