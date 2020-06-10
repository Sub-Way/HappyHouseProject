package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.service.MemberService;
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
	public String writesuccess(@ModelAttribute NoticeDto dto) {
		service.write(dto);
		return "notice/writesuccess";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model m, @RequestParam String no) {
		NoticeDto dto = service.detail(no);
		m.addAttribute("list", dto);
		return "notice/show";
	}
	
	@RequestMapping(value = "/rewrite", method = RequestMethod.GET)
	public String rewrite(Model m, @RequestParam String no) {
		return "notice/rewrite";
	}
	
	@RequestMapping(value = "/rewritesuccess", method = RequestMethod.POST)
	public String rewritesuccess(NoticeDto dto, @RequestParam String no) {
		System.out.println(dto.getNo());
		service.modify(dto);
		return "notice/rewritesuccess";
	}
	
	@RequestMapping(value = "/remove")
	public String remove(String no) {
		service.remove(no);
		return "notice/deletesuccess";
	}
	
}
