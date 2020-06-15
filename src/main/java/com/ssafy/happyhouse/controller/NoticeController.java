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
import com.ssafy.happyhouse.model.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService service;

	@RequestMapping(value = "/sitemap")
	public String sitemap(@ModelAttribute NoticeDto dto, HttpSession session) {
		return "notice/sitemap";//jsp 호출
	}
	
	@RequestMapping(value = "/notice")
	public String notice(Model m) {
		m.addAttribute("list", service.findAll());
		return "notice/list";
	}
	
	@RequestMapping(value = "/mvwrite")
	public String mvwrite(Model m) {
		return "notice/write";
	}
	
	@RequestMapping(value = "/writesuccess")
	public String writesuccess(@ModelAttribute NoticeDto dto, Model m) {
		service.write(dto);
		m.addAttribute("list", service.findAll());
		return "notice/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model m, @RequestParam String no) {
		NoticeDto dto = service.detail(no);
		
		dto.setHit(dto.getHit()+1);
		service.hits(dto);
		
		m.addAttribute("list", dto);
		return "notice/show";
	}
	
	@RequestMapping(value = "/rewrite", method = RequestMethod.GET)
	public String rewrite(Model m, @RequestParam String no) {
		NoticeDto dto = service.detail(no);
		m.addAttribute("list", dto);
		return "notice/rewrite";
	}
	
	@RequestMapping(value = "/rewritesuccess", method = RequestMethod.POST)
	public String rewritesuccess(NoticeDto dto, @RequestParam String no) {
		service.modify(dto);
		return "notice/rewritesuccess";
	}
	
	@RequestMapping(value = "/remove")
	public String remove(String no) {
		service.remove(no);
		return "notice/deletesuccess";
	}
	
	@RequestMapping(value = "/qna")
	public String qna() {
		return "notice/qna";
	}
	
}
