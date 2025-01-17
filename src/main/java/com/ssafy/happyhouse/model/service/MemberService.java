package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.*;

public interface MemberService {
	public MemberDto login(MemberDto dto);
	public int loginCheck(MemberDto dto);
	public int join(MemberDto dto);
	public void update(MemberDto dto);
	public void delete(MemberDto dto);
	public MemberDto find(MemberDto dto);
}
