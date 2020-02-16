package com.bit.dife03.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bit.dife03.vo.DroneVo;

public class DroneManager1113 {

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
	
	// 드론 페이지 초기화면 및 검색 카테고리 불러오기
	public static List<DroneVo> sel_droAll(HashMap map) {
		List<DroneVo> list = null;
		SqlSession session = factory.openSession();		
		list =  session.selectList("drone.sel_droAll");
		//System.out.println(list);
		session.close();
		return list;
	}
	
	// 카테고리 검색 후 결과
	public static List<DroneVo> sel_droSch(HashMap map) {
		// TODO Auto-generated method stub
		List<DroneVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("drone.sel_droSch");
		System.out.println(list);
		session.close();
		return list;
	}
	
	// 드론 페이지에서 상세 검색 결과
	public static List<DroneVo> sel_droDetail(String pos_no) {
		List<DroneVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("drone.sel_droDetail", pos_no);
		return list;
	}
	
	// 드론수 카운트
	public static int get_droCount(HashMap map) {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("drone.get_droCount");
		//System.out.println(re);
		session.close();
		return re;
	}
/*
	// 페이징처리
	public static int droListPage(HashMap map) {
		SqlSession session = factory.openSession();
		List<DroneVo> list = session.selectList("drone.page_droList", map);
		session.close();
		return list;
	}
	
	// 보류
	// 바로 주문하기는 따로 페이지 만들어서 제이쿼리로 실행해야됨
	// 드론 상세페이지에서 주문하기
/*	public static int in_droOrder(OrdersVo o) {
		int re = 0;
		SqlSession session = factory.openSession(true);
		
		return re;
	}*/

	public static List<DroneVo> sch_droS() {
		// TODO Auto-generated method stub
		List<DroneVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("drone.sch_droS");
		session.close();
		return list;
	}

	
}
