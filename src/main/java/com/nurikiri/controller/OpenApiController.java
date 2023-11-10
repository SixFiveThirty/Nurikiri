package com.nurikiri.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nurikiri.service.OpenApiService;

@Controller("OpenApiController")
public class OpenApiController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired 
	private OpenApiService openApiService;
	
	@RequestMapping(value= "openApi/getOpenApiInfo")
	@ResponseBody
	public Map<String, Object> getOpenApiInfo(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
		
		log.info(this.getClass().getName());
		
		//처리 결과를 전달하기 위한 변수
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		//가맹점명, 소속시장, 소재지, 취급품목, 온누리상품권 종류 여부
		String title = CmmUtil.nvl(request.getParameter("title"));
		String market= CmmUtil.nvl(request.getParameter(""));
		String address= CmmUtil.nvl(request.getParameter(""));
		String item= CmmUtil.nvl(request.getParameter(""));
		Boolean use_recharge_card= CmmUtil.nvl(request.getParameter(""));
		Boolean use_bill= CmmUtil.nvl(request.getParameter(""));
		Boolean use_mobile= CmmUtil.nvl(request.getParameter(""));
		
		
		return rMap;
		
		//
		
		
		
		
	}
	
	
}
