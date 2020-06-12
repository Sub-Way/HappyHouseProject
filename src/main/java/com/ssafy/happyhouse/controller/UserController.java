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

@Controller
public class UserController {

	@Autowired
	MemberService service;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String mvlogin() {
		return "user/login";// jsp 호출
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDto dto, HttpSession session) {
		int loginCnt = service.loginCheck(dto);
		System.out.println(loginCnt);
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
	public String logout(HttpSession session) {
		session.removeAttribute("userinfo");
		session.invalidate();
		return "index";// jsp 호출
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String mvjoin() {
		return "user/join";//jsp 호출
	}
	
	@RequestMapping(value = "/joinsuccess", method = RequestMethod.POST)
	public String joinSuccess(@ModelAttribute MemberDto dto) {
		int successCnt = service.join(dto);
		System.out.println(dto.getName());
		System.out.println(dto.getId());
		System.out.println(dto.getPhone());
		return "user/joinsuccess";//jsp 호출
	}
	
	@RequestMapping(value = "/info")
	public String info(@ModelAttribute MemberDto dto) {
		System.out.println(dto.getName());
		System.out.println(dto.getId());
		System.out.println(dto.getPhone());
		return "user/info";//jsp 호출
	}
	
	@RequestMapping(value = "/modify")
	public String modify() {
		return "user/modify";//jsp 호출
	}
	
	@RequestMapping(value = "/modifysuccess", method = RequestMethod.POST)
	public String modifysuccess(@ModelAttribute MemberDto dto, HttpSession session) {
		service.update(dto);
		System.out.println(dto.getName());
		System.out.println(dto.getId());
		System.out.println(dto.getPhone());
		session.setAttribute("userinfo", service.login(dto));
		return "user/modifysuccess";//jsp 호출
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@ModelAttribute MemberDto dto, HttpSession session) {
		System.out.println(dto.getId());
		return "user/delete";//jsp 호출
	}
	
	@RequestMapping(value = "/deletesuccess")
	public String deletesuccess(@ModelAttribute MemberDto dto, HttpSession session) {
		System.out.println(dto.getId());
		service.delete(dto);
		session.removeAttribute("userinfo");
		session.invalidate();
		return "user/deletesuccess";//jsp 호출
	}
	
	@RequestMapping(value = "/findpwd")
	public String findpwd(@ModelAttribute MemberDto dto, HttpSession session) {
		return "user/findpwd";//jsp 호출
	}
	
	@RequestMapping(value = "/findsuccess")
	public String findsuccess(@ModelAttribute MemberDto dto, HttpSession session) {
		session.setAttribute("findinfo",service.find(dto));
		return "user/findsuccess";//jsp 호출
	}

}
