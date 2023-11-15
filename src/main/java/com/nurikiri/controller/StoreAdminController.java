package com.nurikiri.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nurikiri.domain.StoreAdminVO;
import com.nurikiri.service.StoreAdminService;

@Controller
public class StoreAdminController {
	
	@Autowired
	private StoreAdminService storeAdminservice;

	@RequestMapping("/managers/store")
	    public ModelAndView storeAdminList() throws Exception{
	        ModelAndView mv = new ModelAndView("store/list");
	        
	        List<StoreAdminVO> list = storeAdminservice.storeAdminList();
	        mv.addObject("list", list);
	        
	        return mv;
	    
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
