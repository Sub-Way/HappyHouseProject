package com.ssafy.happyhouse.model.dao;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface MemberRepo {

	public MemberDto login(MemberDto dto);
	public int loginCheck(MemberDto dto);
	public int join(MemberDto dto);
	public void update(MemberDto dto);
	public void delete(MemberDto dto);
	public MemberDto find(MemberDto dto);
}
