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

import com.bit.dife03.vo.AdminVo;
import com.bit.dife03.vo.BoardVo;
import com.bit.dife03.vo.PilListVo;

public class AdminManager {
	public static SqlSessionFactory factory;
	public static SqlSession session;
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
    
    public static List<AdminVo> listAdmin(){
    	List<AdminVo> list = null;
    	SqlSession session = factory.openSession();
    	list = session.selectList("admin.selectAll");
    	session.close();
    	HashMap map = null;
    	String id = "";
//    	sqlTest(map, id);
    	return list;	
    }
    
    public static int mem_cnt(){
    	int cnt = 0;
		SqlSession session = factory.openSession();
		cnt = session.selectOne("admin.mem_cnt");
		session.close();
		System.out.println(cnt);
		return cnt;
	}
    
//  	쿼리문 콘솔 출력 메소드
//  	public static void sqlTest(Map map, String id) {
//  		session = factory.openSession();
//  		BoundSql sql = session.getConfiguration().getMappedStatement(id).getBoundSql(map);
//  		String sql2 = sql.getSql();
//  		List<ParameterMapping> paramMapping = sql.getParameterMappings();
//  		String value = "";
//  			for (ParameterMapping mapping : paramMapping) {
//  				String propValue = mapping.getProperty();
//  				value = map.get(propValue).toString();
//  				System.out.println("value값:"+value);
//  				sql2 = sql2.replaceFirst("\\?", "'"+value+"'");
//  				
//  			}
//  		System.out.println("sql:"+sql2);
//  	}

}
