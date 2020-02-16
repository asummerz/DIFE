package com.bit.dife03.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.dife03.db.AdminManager;
import com.bit.dife03.db.PilotManager;
import com.bit.dife03.vo.AdminVo;
import com.bit.dife03.vo.BoardVo;
import com.bit.dife03.vo.PilListVo;

@Repository
public class AdminDao {

	public List<AdminVo> listAll() {
		// TODO Auto-generated method stub
		return AdminManager.listAdmin();
	}
	
	public int mem_cnt() {
		return AdminManager.mem_cnt();
	}

}
