package com.ssafy.happyhouse.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.service.HouseDealService;

@Controller
//@RequestMapping(value = "/apt")
public class AptController {

		@Autowired
		HouseDealService service;
		
		@RequestMapping(value = "/test", method = RequestMethod.GET)
		public String moveMainmain() {
			System.out.println("실행");
			return "index"; //jsp 파일 이름
		}

		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model) throws Exception {
			return "apt/search";//jsp 호출
		}
		
		@RequestMapping(value = "/searchAll", method = RequestMethod.GET)
		public String allList(Model model) throws Exception {
			List<HouseDeal> list = service.searchAll();
			model.addAttribute("deals", list);
			return "apt/searchList";//jsp 호출
		}
		
		@RequestMapping(value = "/searchAptName", method = RequestMethod.GET)
		public String AptList(Model model,@RequestParam String word) throws Exception {
			System.out.println(word+" -> 아파트 이름");
			List<HouseDeal> list = service.searchAptName(word);
			model.addAttribute("deals", list);
			return "apt/searchList";//jsp 호출
		}
		
		@RequestMapping(value = "/searchDong", method = RequestMethod.GET)
		public String dongList(Model model,@RequestParam String word) throws Exception {
			List<HouseDeal> list = service.searchDong(word);
			model.addAttribute("deals", list);
			return "apt/searchList";
		}
}
