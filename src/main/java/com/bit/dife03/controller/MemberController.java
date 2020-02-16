package com.bit.dife03.controller;

import java.io.FileOutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.dife03.CEncrypt;
import com.bit.dife03.dao.MemberDao;
import com.bit.dife03.vo.MemberVo;

import kr.co.youiwe.webservice.ServiceSMSSoapProxy;


@Controller
public class MemberController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	@RequestMapping("/main.do")
	public void main() {
		
	}
	@RequestMapping(value = "/signIn.do", method = RequestMethod.GET)
	public void signInInsertForm() {
		
	}
	@RequestMapping(value = "/signIn.do", method = RequestMethod.POST)
	public ModelAndView signInSubmit(String mem_id, String mem_pwd, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/main");

		int re = dao.isMember(mem_id, mem_pwd);
		
		if(re != 1) {
			mav.setViewName("redirect:/signIn");
		}
		else {
			session.setAttribute("mem_id", mem_id);
			session.setAttribute("mem_pwd", mem_pwd);
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public void signUpinsertForm() {
		
	}

	// 이용약관 이동
	@RequestMapping("/policy.do")
	public void policy() {
		
	}
	// 아이디 중복 컨트롤러
	@ResponseBody
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	public int idCheck(@RequestParam("mem_id") String mem_id) {
		return dao.idCheck(mem_id);
	}
	// 회원가입
	@ResponseBody
	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public ModelAndView signUpInsertSubmit(MemberVo vo, HttpSession session, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("redirect:/signIn");
		
		String path = request.getRealPath("img");
		System.out.println(path);
		MultipartFile file = vo.getUpload();
		String mem_fname = file.getOriginalFilename();
		vo.setMem_fname(mem_fname);

		try {
			byte data[] = file.getBytes();
			FileOutputStream fos = new FileOutputStream(path+"/"+mem_fname);
			fos.write(data);
			fos.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		String msg = "";
		int re = dao.in_member(vo);
		if(re != 1) {
			msg = "회원 등록에 실패했습니다.";
		}
		session.setAttribute("msg", msg);
		return mav;
	}
	
	// 문자 인증
	@ResponseBody
	@RequestMapping("/sendAuthNumber")
	public String sendAuthNumber(String mem_tel) {
		String str = "";
		
		Random random = new Random();
		for(int i = 1; i <= 6; i++) {
			str += random.nextInt(10)+"";
		}
		System.out.println(str);
		
		String smsID= "rola";	
		String smsPW="bit123400";
		
		ServiceSMSSoapProxy sendsms = new ServiceSMSSoapProxy();
		try{
		
		String senderPhone= "01025598279";
		String receivePhone= mem_tel;
		String smsContent= "다음의 인증번호를 입력해주세요.["+str+"]";
		String test1 = (smsID+smsPW+receivePhone);
		CEncrypt encrypt = new CEncrypt("MD5",test1);
		java.lang.String send=sendsms.sendSMS(smsID,encrypt.getEncryptData(), senderPhone, receivePhone, smsContent);
 		System.out.println("결과코드:"+send);
		}catch(Exception e){
		System.out.println("Exception in main:" +e);
		}

		return str;
	}
}
