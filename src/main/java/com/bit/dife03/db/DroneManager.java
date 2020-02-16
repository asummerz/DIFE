package com.bit.dife03.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bit.dife03.vo.DroneVo;

public class DroneManager {

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
	
	/* 드론 페이지 초기화면 및 검색 카테고리 불러오기 */
	public static List<DroneVo> sel_droAll() {
		List<DroneVo> list = null;
		SqlSession session = factory.openSession();		
		list =  session.selectList("drone.sel_droAll");
		//System.out.println(list);
		session.close();
		return list;
	}
	
	/* 드론수 카운트 */
	public static int get_droCount(HashMap map) {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("drone.get_droCount");
		//System.out.println(re);
		session.close();
		return re;
	}

	/* 드론 상세정보
	public static Object sel_droCon(String dro_no) {
		// TODO Auto-generated method stub
		List<DroneVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("drone.sel_droDetail", dro_no);
		session.close();
		return list;
	} */

	/* 드론 페이지에서 상세 검색 결과 */
	public static DroneVo sel_droDetail(String dro_no) {
		// TODO Auto-generated method stub
		DroneVo droInfo = null;
		SqlSession session = factory.openSession();
		droInfo = session.selectOne("drone.sel_droDetail", dro_no);
		session.close();
		return droInfo;
	}

/*	public static int in_droOrder(OrdersVo o) {
		int re = 0;
		SqlSession session = factory.openSession(true);
		
		return re;
	}*/
}
