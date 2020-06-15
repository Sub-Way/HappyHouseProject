package com.ssafy.happyhouse.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.HouseDealService;
import com.ssafy.happyhouse.model.service.MemberService;

@Controller
public class UserController {

	@Autowired
	MemberService service;

	@Autowired
	HouseDealService hservice;
	
	/*
	 * @RequestMapping(value = "/main", method = RequestMethod.GET) public String
	 * main(Model model) { model.addAttribute("topdong", hservice.topDong());
	 * model.addAttribute("topapt", hservice.topApt()); return "index"; }
	 */

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String mvlogin(Model model) {
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/login";// jsp 호출
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDto dto, HttpSession session, Model model) {
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		int loginCnt = service.loginCheck(dto);
		if(loginCnt > 0) {
			session.setAttribute("userinfo", service.login(dto));
			return "index";
		}
		else {
			session.setAttribute("msg", "아이디 또는 비밀번호를 확인해주세요!");
			return "user/login";// jsp 호출
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("userinfo");
		session.invalidate();
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "index";// jsp 호출
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String mvjoin(Model model) {
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/join";//jsp 호출
	}
	
	@RequestMapping(value = "/joinsuccess", method = RequestMethod.POST)
	public String joinSuccess(Model model, @ModelAttribute MemberDto dto) {
		int successCnt = service.join(dto);
		System.out.println(dto.getName());
		System.out.println(dto.getId());
		System.out.println(dto.getPhone());
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/joinsuccess";//jsp 호출
	}
	
	@RequestMapping(value = "/info")
	public String info(Model model, @ModelAttribute MemberDto dto) {
		System.out.println(dto.getName());
		System.out.println(dto.getId());
		System.out.println(dto.getPhone());
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/info";//jsp 호출
	}
	
	@RequestMapping(value = "/modify")
	public String modify(Model model) {
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/modify";//jsp 호출
	}
	
	@RequestMapping(value = "/modifysuccess", method = RequestMethod.POST)
	public String modifysuccess(Model model, @ModelAttribute MemberDto dto, HttpSession session) {
		service.update(dto);
		System.out.println(dto.getName());
		System.out.println(dto.getId());
		System.out.println(dto.getPhone());
		session.setAttribute("userinfo", service.login(dto));
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/modifysuccess";//jsp 호출
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, @ModelAttribute MemberDto dto, HttpSession session) {
		System.out.println(dto.getId());
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/delete";//jsp 호출
	}
	
	@RequestMapping(value = "/deletesuccess")
	public String deletesuccess(Model model, @ModelAttribute MemberDto dto, HttpSession session) {
		System.out.println(dto.getId());
		service.delete(dto);
		session.removeAttribute("userinfo");
		session.invalidate();
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/deletesuccess";//jsp 호출
	}
	
	@RequestMapping(value = "/findpwd")
	public String findpwd(Model model, @ModelAttribute MemberDto dto, HttpSession session) {
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/findpwd";//jsp 호출
	}
	
	@RequestMapping(value = "/findsuccess")
	public String findsuccess(Model model, @ModelAttribute MemberDto dto, HttpSession session) {
		session.setAttribute("findinfo",service.find(dto));
		model.addAttribute("topdong", hservice.topDong());
		model.addAttribute("topapt", hservice.topApt());
		return "user/findsuccess";//jsp 호출
	}

}
