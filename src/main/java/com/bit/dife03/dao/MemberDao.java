package com.bit.dife03.dao;

import org.springframework.stereotype.Repository;

import com.bit.dife03.db.MemberManager;
import com.bit.dife03.vo.MemberVo;

@Repository
public class MemberDao {

	// 회원가입
	public int in_member(MemberVo vo) {
		return MemberManager.in_member(vo);
	}
	// 아이디 중복확인
	public int idCheck(String mem_id) {
		return MemberManager.memberIdCheck(mem_id);
	}
	// 로그인
	public int isMember(String mem_id, String mem_pwd) {
		return MemberManager.isMember(mem_id, mem_pwd);
	}
}
