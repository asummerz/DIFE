package com.bit.dife03.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import com.bit.dife03.vo.BoardVo;

public class BoardManager {
	public static SqlSessionFactory factory;

    static {        
        try {
            Reader reader = Resources.getResourceAsReader("com/bit/dife03/db/dbConfig.xml");
            factory = new SqlSessionFactoryBuilder().build(reader);
            reader.close();
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println("예외발생"+e.getMessage());
        }
    }
    
    public static List<BoardVo> listBoard(String boa_sort){
    	List<BoardVo> list = null;
    	SqlSession session = factory.openSession();
    	list = session.selectList("board.selectAll", boa_sort);
    	session.close();
    	return list;	
    }
    
    public static int getNextNo() {
    	SqlSession session = factory.openSession();
    	int boa_no = session.selectOne("board.nextNo");
    	session.close();
    	return boa_no;
    }
    
    public static int insert(BoardVo vo) {
    	int re = 0;
    	SqlSession session = factory.openSession(true);
    	re = session.insert("board.insert", vo);
    	session.close();
    	return re;
    }
    
    public static BoardVo getBoard(int boa_no) {
    	BoardVo vo = null;
    	HashMap map = new HashMap();
    	map.put("boa_no", boa_no);
    	SqlSession session = factory.openSession();
    	vo = session.selectOne("board.getBoard", map);
    	session.close();
    	return vo;
    }
    
    //댓글
    public static void updateStep(int boa_ref, int boa_step) {
    	HashMap map = new HashMap();
    	map.put("boa_ref", boa_ref);
    	map.put("boa_step", boa_step);
    	SqlSession session = factory.openSession(true);
    	session.update("board.updateStep", map);
    	session.close();
    	return;
    }
    
    public static int updateBoard(BoardVo vo) {
    	int re = 0;
    	SqlSession session = factory.openSession(true);
    	re = session.update("board.updateBoard", vo);
    	session.close();
    	return re;
    }
    
    public static int deleteBoard(int boa_no) {
    	int re = 0;
    	SqlSession session = factory.openSession(true);
    	HashMap map = new HashMap();
    	map.put("boa_no", boa_no);
    	re = session.delete("board.deleteBoard", map);
    	session.close();
    	return re;
    }
    
    public static void answerUpdate(int boa_no) {
    	HashMap map = new HashMap();
    	map.put("boa_no", boa_no);
    	//map.put("boa_answer", boa_answer);
    	SqlSession session = factory.openSession(true);
    	session.update("board.answerUpdate", map);
    	session.close();
    	return;
    }
    
    public static int updateBoa_view(int boa_no) {
    	int re = 0;
    	SqlSession session = factory.openSession(true);
    	HashMap map = new HashMap();
    	map.put("boa_no", boa_no);
    	re = session.update("board.updateBoa_view", map);
    	session.close();
    	return re;
    }
}