package com.bit.dife03.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.dife03.dao.PilotDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PilotController {
	//한페이지 당 게시글 수
	int pageRecord = 5;
	
	//총 게시글 수
	int totalRecord = 0;
	
	//전체페이지수 (default=1)
	int totalPage = 1;
	
	@Autowired
	private PilotDao dao;

	public void setDao(PilotDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/pilot")
	public ModelAndView paging(@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
								@RequestParam(value = "category", defaultValue = "2") String category,
								@RequestParam(value = "location", defaultValue = "선택") String location,
								HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		HashMap map = new HashMap();
		
		System.out.println("지역:"+location);
		System.out.println("카테고리:"+category);
		
		mav.addObject("category", category);
		mav.addObject("location", location);
		session.setAttribute("category", category);
		session.setAttribute("location", location);
		
		map.put("category", category);
		map.put("location", location);
		
		totalRecord = dao.sel_pil_cnt(map);
		totalPage = (int) Math.ceil(totalRecord/(double)pageRecord);
		System.out.println("전체 페이지수"+totalPage);
		
		//해당페이지의 시작글번호, 끝번호
		int start = (pageNUM-1)*pageRecord+1;
		int end = start+pageRecord-1;
		
		System.out.println("start: "+start);
		System.out.println("end: "+end);
		
		map.put("start", start);
		map.put("end", end);
		
		mav.addObject("list", dao.sel_pil(map));
		
		//보고있는 페이지의 번호가 전체 페이지보다 클 떄
		if(totalPage < pageNUM) {
			pageNUM = totalPage;
		}
		//시작페이지 및 끝페이지 번호 구하기(1~5/6~10/... 5단위로 보여주기)
		int pageCount = 5;
		int startPage = ((pageNUM-1)/pageCount)*pageCount+1;
		int endPage = startPage+pageCount-1;
		//끝페이지가 총페이지 수보다 크게 계산될 때
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	
		String page = "";
		
		if(startPage > 1) {
			page = page +"<a href='pilot?category="+category+"&location="+location+"&pageNUM="+(pageNUM-1)+"' class='link-page-prev'>이전</a>";
		}
		for (int i = startPage; i <= endPage; i++) {
			page = page + "<a href='pilot?category="+category+"&location="+location+"&pageNUM="+i+"' class='link-page'>"+i+"</a>";
		}
		if (endPage < totalPage) {
			page = page + "<a href='pilot?category="+category+"&location="+location+"&pageNUM="+(endPage+1)+"' class='link-page-next'>다음</a>";
		}
		mav.addObject("page", page);
		
		return mav;
	}
	
//	@ResponseBody
//	@RequestMapping("/sel_pil")
//	public String sel_pil(String category, String location) {
//		String str = "";
//		try {
//			ObjectMapper mapper = new ObjectMapper();
//			str = mapper.writeValueAsString(dao.sel_pil(category, location));
//			System.out.println("select: "+str);
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//		return str;
//	}
	
//	@ResponseBody
//	@RequestMapping("/selectPil_list")
//	public String selectPil_info(@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
//		totalRecord = dao.sel_pil_cnt();
//		totalPage = (int) Math.ceil(totalRecord/(double)pageRecord);
//		System.out.println("전체 페이지수"+totalPage);
//		//해당페이지의 시작글번호, 끝번호
//		int start = (pageNUM-1)*pageRecord+1;
//		int end = start+pageRecord-1;
//		
//		System.out.println("start: "+start);
//		System.out.println("end: "+end);
//		
//		HashMap map = new HashMap();
//		map.put("start", start);
//		map.put("end", end);
//		
//		String str = "";
//		try {
//			ObjectMapper mapper = new ObjectMapper();
//			str = mapper.writeValueAsString(dao.selectPil_list(map));
//			System.out.println("controller"+str);
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println("예외발생"+e.getMessage());
//		}
//		return str;
//	}
	
	@RequestMapping("/pilotDetail")
	public ModelAndView pilotDetail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int info = Integer.parseInt(request.getParameter("info"));
		mav.addObject("info",dao.sel_pil_detail(info));
		//System.out.println("번호:"+info);
		return mav;
	}
}
