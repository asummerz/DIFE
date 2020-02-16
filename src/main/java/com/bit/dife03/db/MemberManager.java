package com.bit.dife03.db;

import java.io.Reader;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bit.dife03.vo.MemberVo;

public class MemberManager {

	public static SqlSessionFactory factory;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/bit/dife03/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	// 회원가입
	public static int in_member(MemberVo vo) {
		int re = 0;
		SqlSession session = factory.openSession(true);
		re = session.insert("member.in_member", vo);
		session.close();
		return re;
	}
	// 아이디 중복확인
	public static int memberIdCheck(String mem_id) {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("member.checkId", mem_id);
		System.out.println(re);
		session.close();
		return re;
	}
	// 로그인
	public static int isMember(String mem_id, String mem_pwd) {
		int re = 0;
		HashMap map = new HashMap();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		SqlSession session = factory.openSession();
		re = session.selectOne("member.isMember", map);
		session.close();
		return re;
	}
}
