package com.nurikiri.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nurikiri.service.OpenApiService;

@Controller("OpenApiController")
public class OpenApiController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired 
	private OpenApiService openApiService;
	
	
}
