package com.nurikiri.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class StoreVO {
	
	private int sno;
	
	@NotBlank(message = "���������� �ʼ� ����?�׸�?�Դϴ�.")
	private String title;
	
	@NotBlank(message = "������ ������ �ʼ� ����?�׸�?�Դϴ�.")
	private String content; //Description?
	
	@NotBlank(message = "�������� �̸��� �ʼ� ����?�׸�?�Դϴ�.")
	private String owner;
	
	@NotBlank(message = "������ �ּҴ� ����?�׸�?�Դϴ�.")
	private String address;
	
	// ������� ��ȭ �ʼ��ΰ�?
	//@NotBlank(message = "������ ��ȭ��ȣ�� ����?�׸�?�Դϴ�.")
	private String phone; // Tel?
	
	@NotBlank(message = "������ ������� ����?�׸�?�Դϴ�.")
	private Date regDate; 
	
	private Date updataDate; // ���� ��¥
	
	

}
