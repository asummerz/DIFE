package com.bit.dife03.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.bit.dife03.db.BoardManager;
import com.bit.dife03.vo.BoardVo;

@Repository
public class BoardDao {


	public List<BoardVo> listAll(String boa_sort) {
		// TODO Auto-generated method stub
		return BoardManager.listBoard(boa_sort);
	}
	
	public int insert(BoardVo vo) {
		return BoardManager.insert(vo);
	}
	
	public int getNextNo() {
		return BoardManager.getNextNo();
	}
	
	public BoardVo getBoard(int boa_no) {
		return BoardManager.getBoard(boa_no);
	}

	public void updateStep(int boa_ref, int boa_step) {
		BoardManager.updateStep(boa_ref, boa_step);
	}
	
	public int update(BoardVo vo) {
		return BoardManager.updateBoard(vo);
	}
	
	public int delete(int boa_no) {
		return BoardManager.deleteBoard(boa_no);
	}
	
	public void answerUpdate(int boa_no) {
		BoardManager.answerUpdate(boa_no);
	}
	
	public int updateBoa_view(int boa_no) {
		return BoardManager.updateBoa_view(boa_no);
	}
}