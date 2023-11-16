package com.nurikiri.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class StoreAdminController {
	
	/*
	 * @Autowired private StoreAdminService storeAdminservice;
	 */

		@RequestMapping("/managers/store")
	    public String storeAdmin(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate); return "managers/store/list";
	}
	    
	}


/*
 * @RequestMapping("/managers/store")
 *  public String storeAdminList(StoreAdminVO storeAdminVO, Model model) {
	        
	        List<StoreAdminVO> list = storeAdminservice.storeAdminList(storeAdminVO);
	        model.addAttribute("list", list);
	        
	        return "managers/storeAdminList";
 * 
 *
 */
