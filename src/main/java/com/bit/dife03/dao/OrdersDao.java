package com.bit.dife03.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.dife03.db.OrdersManager;
import com.bit.dife03.vo.BasketVo;

@Repository
public class OrdersDao {

	public List<BasketVo> basketList(String mem_id)
	{
		return OrdersManager.basketList(mem_id);
	}
	public int  delBas(String bas_no)
	{
		return OrdersManager.delBas(bas_no);
	}
}
