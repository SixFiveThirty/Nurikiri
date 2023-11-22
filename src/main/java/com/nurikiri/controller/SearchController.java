package com.nurikiri.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/search")
public class SearchController {
    
    @ModelAttribute("searchTypes")
    public Map<String, String> searchTypes() {
        Map<String, String> map = new LinkedHashMap<String, String>();
        map.put("", "별점순");
        map.put("", "즐겨찾기순");
        map.put("", "리뷰순");
        map.put("", "지역별");
        
        return map;
    }

}
