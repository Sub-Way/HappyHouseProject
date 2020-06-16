package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.service.HouseDealService;
import com.ssafy.happyhouse.model.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService service;

	@Autowired
	HouseDealService hservice;
	
	@RequestMapping(value = "/sitemap")
	public String sitemap(Model model, @ModelAttribute NoticeDto dto, HttpSession session) {
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/sitemap";//jsp 호출
	}
	
	@RequestMapping(value = "/notice")
	public String notice(Model model) {
		model.addAttribute("list", service.findAll());
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/list";
	}
	
	@RequestMapping(value = "/mvwrite")
	public String mvwrite(Model model) {
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/write";
	}
	
	@RequestMapping(value = "/writesuccess")
	public String writesuccess(@ModelAttribute NoticeDto dto, Model model) {
		service.write(dto);
		model.addAttribute("list", service.findAll());
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam String no) {
		NoticeDto dto = service.detail(no);
		
		dto.setHit(dto.getHit()+1);
		service.hits(dto);
		
		model.addAttribute("list", dto);
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/show";
	}
	
	@RequestMapping(value = "/rewrite", method = RequestMethod.GET)
	public String rewrite(Model model, @RequestParam String no) {
		NoticeDto dto = service.detail(no);
		model.addAttribute("list", dto);
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/rewrite";
	}
	
	@RequestMapping(value = "/rewritesuccess", method = RequestMethod.POST)
	public String rewritesuccess(Model model, NoticeDto dto, @RequestParam String no) {
		service.modify(dto);
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/rewritesuccess";
	}
	
	@RequestMapping(value = "/remove")
	public String remove(Model model, String no) {
		service.remove(no);
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/deletesuccess";
	}
	
	@RequestMapping(value = "/qna")
	public String qna(Model model) {
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "notice/qna";
	}
	
}
