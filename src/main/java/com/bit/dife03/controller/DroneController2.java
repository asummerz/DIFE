//package com.bit.dife03.controller;
//
//import java.util.HashMap;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.bit.dife03.dao.DroneDao;
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//@Controller
//public class DroneController2 {
//
//	@Autowired
//	private DroneDao dao;	
//	public void setDao(DroneDao dao) {
//		this.dao = dao;
//	}
//	/*		
//	@RequestMapping("/sel_droAll")
//	public ModelAndView sel_droAll(@RequestParam(value = "calendar", defaultValue = "")String calendar, 
//			@RequestParam(value = "sub_series_02", defaultValue = "")String sub_series_02,
//			@RequestParam(value = "sub_price", defaultValue = "") String sub_price,
//			HttpSession session) {
//		
//		HashMap map = new HashMap();
//		String keyword = null;
//		
//		if(session.getAttribute(calendar) != null) {
//			keyword = (String)session.getAttribute(calendar);
//		}
//		if(keyword != null && !keyword.equals("")) {
//			map.put("calendar", session.getAttribute(calendar));
//			map.put("sub_series_02",session.getAttribute(sub_series_02));
//			map.put("sub_price", session.getAttribute(sub_price));
//			
//			session.setAttribute("sub_series_02", sub_series_02);
//			session.setAttribute("sub_price", sub_price);
//		}
//		
//		ModelAndView mav = new ModelAndView();
//		
//		return mav;
//	}
//*/		
//
//	// 모델앤뷰로 변경하기
//	@ResponseBody
//	@RequestMapping("/sel_droAll")
//	public String sel_droAll(HashMap map) {
//		String str_dro = "";
//		try {
//			ObjectMapper mapper = new ObjectMapper();
//			str_dro = mapper.writeValueAsString(dao.sel_droAll(map));
//			System.out.println(str_dro);
//		}catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//		return str_dro;
//	}
//
//	// 페이징처리 : 드랍박스.스프링.0904	
//	@ResponseBody
//	@RequestMapping("get_droCount")
//	public String get_droCount(HashMap map) {
//		String str_dro = "";
//		str_dro = dao.get_droCount(map)+"";
//		return str_dro;
//	}
//
///*	
//	@ResponseBody
//	@RequestMapping("get_droCountList")
//	public String get_droCountList(int nowPage, int perPage) {
//		String str_dro = "";
//		int start = (nowPage-1)*perPage+1;
//		int end = start+perPage-1;
//		
//		HashMap map = new HashMap();
//		map.put("start", start);
//		map.put("end", end);
//		ObjectMapper mapper = new ObjectMapper();
//		try {
//			str_dro = mapper.writeValueAsString(dao.droListPage(map));
//		}catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//		return str_dro;
//	}
//	
//	
//	@ResponseBody
//	@RequestMapping()
//	public String sel_droDetail(String pos_no) {
//		String str_drodt = "";
//		try{
//			ObjectMapper mapper = new ObjectMapper();
//			str_drodt = mapper.writeValueAsString(dao.sel_droDetail(pos_no));
//		}catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//		return str_drodt;
//	}
//	
//	
//	
///*	
//	@ResponseBody
//	@RequestMapping()
//	public int in_droOrder() {
//	}
//*/
//}
