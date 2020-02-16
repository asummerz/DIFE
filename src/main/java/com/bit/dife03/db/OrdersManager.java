package com.bit.dife03.db;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bit.dife03.vo.BasketVo;

public class OrdersManager {
	

	public static SqlSessionFactory factory;
	
	static {
		try {
			System.out.println("static 진입");
			Reader reader = Resources.getResourceAsReader("com/bit/dife03/db/dbConfig.xml");
			/* System.out.println("리더생성"+reader); */
			factory = new SqlSessionFactoryBuilder().build(reader);
			/* System.out.println("factory:"+factory); */
			reader.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	//	장바구니 리스트
	public static List<BasketVo> basketList(String mem_id)
	{
		List<BasketVo> list=null;
		SqlSession session = factory.openSession();
		list = session.selectList("orders.selectBasket",mem_id);
		session.close();
		return list;
	}
	//주문 삭제 버튼 삭제시 tr값을 삭제하는 메소드
	public static int delBas(String bas_no)
	{
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.insert("orders.delBas",bas_no);
		session.commit();
		session.close();
		
		
		
		
		
		return re;
	}
}
