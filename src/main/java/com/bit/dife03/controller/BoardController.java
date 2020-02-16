package com.bit.dife03.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.dife03.dao.BoardDao;
import com.bit.dife03.vo.BoardVo;
import com.bit.dife03.vo.MemberVo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao dao;
	
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public ModelAndView list(String boa_sort) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listAll(boa_sort));
		return mav;
	}
	
	@RequestMapping(value = "/board_insert", method = RequestMethod.GET)
	public ModelAndView insertForm(@RequestParam(value = "boa_no", defaultValue = "0") int boa_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boa_no", boa_no);
		return mav;
	}
	
	@RequestMapping(value = "/board_insert", method = RequestMethod.POST)
	public ModelAndView insertSubmit(BoardVo vo, HttpServletRequest request, HttpSession session) {
		ModelAndView mav= new ModelAndView("redirect:/board");
		String path = request.getRealPath("img");

		if(vo.getBoa_sort().equals("문의게시판")) {
			vo.setBoa_answer("미답변");
		}else if(vo.getBoa_sort().equals("후기게시판")) {
			vo.setBoa_answer(" ");
		}
		
		int boa_no = dao.getNextNo();
		int boa_ref = boa_no;
		int boa_level = 0;
		int boa_step = 0;

		int pno = vo.getBoa_no();
	
		if(pno != 0) {
			BoardVo b = dao.getBoard(pno);
			boa_ref = b.getBoa_ref();
			boa_step = b.getBoa_step();
			boa_level = b.getBoa_level();
			dao.updateStep(boa_ref, boa_step);
			boa_step++;
			boa_level++;
			dao.answerUpdate(pno);
			
			vo.setBoa_title("댓글");
			vo.setBoa_pwd("0000");
			vo.setBoa_answer("");
		}

		vo.setBoa_no(boa_no);
		vo.setBoa_ref(boa_ref);
		vo.setBoa_level(boa_level);
		vo.setBoa_step(boa_step);
		
		System.out.println(vo.toString());
//		MultipartFile multi = vo.getUpload();
		
//		String boa_fname = multi.getOriginalFilename();
		MultipartFile multi = null;
		String boa_fname;
		if(vo.getUpload() == null) {
			boa_fname = "";
		}else {
			multi = vo.getUpload();
			boa_fname = multi.getOriginalFilename();
		}
		vo.setBoa_fname(boa_fname);
		
		System.out.println(boa_fname);
		
		try {
			byte [] data = multi.getBytes();			
			FileOutputStream fos = new FileOutputStream(path +"/"+boa_fname);
			fos.write(data);
			fos.close();
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		String mem_no = (String) session.getAttribute("mem_no");
		vo.setMem_no(mem_no);
		int re = dao.insert(vo);
		System.out.println(vo.toString());
		String msg = "";
		if(re != 1) {
			msg = "게시물 등록에 실패하였습니다.";
			mav.addObject("msg", msg);
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/board_detail", method = RequestMethod.GET)
	public ModelAndView detail(int boa_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("b", dao.getBoard(boa_no));
		dao.updateBoa_view(boa_no);
		return mav;
	}
	
	@RequestMapping(value = "/board_update", method = RequestMethod.GET)
	public ModelAndView updateForm(int boa_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("b", dao.getBoard(boa_no));
		return mav;
	}
	
	@RequestMapping(value = "/board_update", method = RequestMethod.POST)
	public ModelAndView updateSubmit(BoardVo vo, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/board");
		
		String path = request.getRealPath("img");
		String oldFname= vo.getBoa_fname();
		String boa_fname = null;
		
		MultipartFile upload = vo.getUpload();
		
		if(upload != null) {
			System.out.println("사진수정");
			try {
				byte []data = upload.getBytes();
				boa_fname = upload.getOriginalFilename();
				vo.setBoa_fname(boa_fname);
				
				FileOutputStream fos = new FileOutputStream(path+"/"+boa_fname);
				fos.write(data);
				fos.close();
				
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}
		
		int re = dao.update(vo);
		String msg = "";
		System.out.println("수정결과:"+re);
		if(re != 1) {
			msg = "게시판 수정에 실패하였습니다.";
		}
		else {
			if(boa_fname != null && !boa_fname.equals("")) {
				File file = new File(path+"/"+oldFname);
				file.delete();
			}
		}
		mav.addObject("msg", msg);
		return mav;
	}
	
	@RequestMapping(value = "/board_delete", method = RequestMethod.GET)
	public ModelAndView delete(int boa_no, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/board");
		
		String path = request.getRealPath("img");
		String oldFname = dao.getBoard(boa_no).getBoa_fname();
		String msg = "";
		
		int re = dao.delete(boa_no);
		
		if(re != 1) {
			msg = "게시물 삭제에 실패하였습니다.";
		}
		else {
			File file = new File(path+"/"+oldFname);
			file.delete();
		}
		mav.addObject("msg", msg);
		return mav;
	}
}