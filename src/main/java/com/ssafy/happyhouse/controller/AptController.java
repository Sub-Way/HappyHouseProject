package com.ssafy.happyhouse.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.PageDTO;
import com.ssafy.happyhouse.model.service.HouseDealService;

@Controller
//@RequestMapping(value = "/apt")
public class AptController {
		@Autowired
		HouseDealService service;
	
		
		@RequestMapping(value = "/search", method = RequestMethod.GET)
		public String moveList(@ModelAttribute PageDTO page, Model model) throws Exception {
			System.out.println("search controller 도착 : "+page.getKey()+" "+page.getWord()+" "+page.getReqPageNo());
			
			int reqPageNoInt = 1;
			if(page.getReqPageNo() != null && Integer.parseInt(page.getReqPageNo()) != 0)
				reqPageNoInt = Integer.parseInt(page.getReqPageNo());
			
			int startNo = reqPageNoInt * 10 - 10;
			page.setStartNo(startNo);
			
			int totCnt;
			if(page.getKey().equals("aptname")) totCnt = service.AptTotalCnt(page.getWord());
			else if(page.getKey().equals("dongname")) totCnt = service.DongTotalCnt(page.getWord());
			else totCnt = service.TotalCnt();
			
			
			int viewPageTo = totCnt/10;
			if(totCnt%10 > 0) {
				viewPageTo = viewPageTo + 1;
			}
			int startPage = 1;
			int lastPage = reqPageNoInt + 5;
			if(reqPageNoInt >= 5) startPage = reqPageNoInt - 4;
			if(lastPage > viewPageTo) lastPage = viewPageTo;
//			model.addAttribute("viewPageTo", viewPageTo);
			model.addAttribute("startPage", startPage);
			model.addAttribute("lastPage", lastPage);
			
			List<HouseDeal> list;
			if(page.getKey().equals("aptname")) list = service.searchAptName(page);
			else if(page.getKey().equals("dongname")) list = service.searchDong(page);
			else list = service.searchAll(page);
			model.addAttribute("deals", list);
			
			if(page.getWord().charAt(0)=='%') {
				String tmp = page.getWord().substring(1, page.getWord().length()-1);
				page.setWord(tmp);
			}
			model.addAttribute("pagedto", page);
			
			return "apt/search";
		}
		@RequestMapping(value = "/pagemv", method = RequestMethod.GET)
		public String pagemv(String key, String word, String reqPageNo, Model model) throws Exception {
			System.out.println("search controller 도착 : "+key+" "+word+" "+reqPageNo);
			PageDTO page = new PageDTO();
			page.setKey(key);
			page.setWord(word);
			page.setReqPageNo(reqPageNo);
			
			int reqPageNoInt = 1;
			if(page.getReqPageNo() != null && Integer.parseInt(page.getReqPageNo()) != 0)
				reqPageNoInt = Integer.parseInt(page.getReqPageNo());
			
			int startNo = reqPageNoInt * 10 - 10;
			page.setStartNo(startNo);
			
			int totCnt;
			if(page.getKey().equals("aptname")) totCnt = service.AptTotalCnt(page.getWord());
			else if(page.getKey().equals("dongname")) totCnt = service.DongTotalCnt(page.getWord());
			else totCnt = service.TotalCnt();
			
			int viewPageTo = totCnt/10;
			if(totCnt%10 > 0) {
				viewPageTo = viewPageTo + 1;
			}
//			model.addAttribute("viewPageTo", viewPageTo);
			int startPage = 1;
			int lastPage = reqPageNoInt + 5;
			if(reqPageNoInt >= 5) startPage = reqPageNoInt - 4;
			if(lastPage > viewPageTo) lastPage = viewPageTo;
//			model.addAttribute("viewPageTo", viewPageTo);
			model.addAttribute("startPage", startPage);
			model.addAttribute("lastPage", lastPage);
			List<HouseDeal> list;
			if(page.getKey().equals("aptname")) list = service.searchAptName(page);
			else if(page.getKey().equals("dongname")) list = service.searchDong(page);
			else list = service.searchAll(page);
			model.addAttribute("deals", list);
			
			if(page.getWord().charAt(0)=='%') {
				String tmp = page.getWord().substring(1, page.getWord().length()-1);
				page.setWord(tmp);
			}
			model.addAttribute("pagedto", page);
			
			return "apt/search";
		}

		@RequestMapping(value = "/test", method = RequestMethod.GET)
		public String moveMainmain() {
			System.out.println("실행");
			return "index"; 
		}
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model) throws Exception {
			return "apt/search";
		}
		
		@RequestMapping(value = "/showDetail", method = RequestMethod.GET)
		public String detail(Model model, @RequestParam int no) throws Exception {
			HouseDeal detail = service.show(no);
			
			HouseDeal locationTmp = service.location(detail.getAptName());
			if(locationTmp.getLng() != null && locationTmp.getLat() != null) {
				detail.setLat(locationTmp.getLat());
				detail.setLng(locationTmp.getLng());
			}
			model.addAttribute("deal", detail);
			return "apt/showApt";
		}
		
		@RequestMapping(value = "/error", method = RequestMethod.GET)
		public String error() throws Exception {
			return "error/error";
		}
}
