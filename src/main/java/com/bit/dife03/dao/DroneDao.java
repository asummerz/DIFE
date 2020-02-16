package com.bit.dife03.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.dife03.db.DroneManager;
import com.bit.dife03.vo.DroneVo;

@Repository
public class DroneDao {

	public List<DroneVo> sel_droAll(){
		return DroneManager.sel_droAll();
	}

	public DroneVo sel_droDetail(String dro_no) {
		return DroneManager.sel_droDetail(dro_no);
	}

	public int get_droCount(HashMap map) {
		// TODO Auto-generated method stub
		return DroneManager.get_droCount(map);
	}
/*
	public Object sel_droCon(String dro_no) {
		// TODO Auto-generated method stub
		return DroneManager.sel_droCon(dro_no);
	}*/
}
