package com.mvc.kreamy;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mvc.dao.UserDAO;
import com.mvc.dto.UserDTO;
import com.mvc.util.Email;
import com.mvc.util.EmailSender;
import com.mvc.util.GenerateCertPwd;

@Controller("login.controller")
public class LoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	private boolean flag = false;

	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email authEmail;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	UserDAO dao;

	@Autowired
	GenerateCertPwd generateCertPwd;
	
	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public String login(Model model, HttpSession session, HttpServletRequest request) throws Exception {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		model.addAttribute("url", naverAuthUrl);

		return "login/login";
	}

	@RequestMapping(value = "/login_ok", method = { RequestMethod.POST, RequestMethod.GET })
	public String login_ok(UserDTO dto, String pwd, HttpServletRequest request,HttpSession session) throws Exception {

		dto = dao.getEmail(dto.getEmail());
		
		if (dto == null || bcryptPasswordEncoder.matches(pwd, dto.getPwd())==false) {
			return "redirect:login";
		}
		session.setAttribute("userNum", dto.getUserNum());
		
		return "redirect:myPage";
	}

	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		apiResult = naverLoginBO.getUserProfile(oauthToken); 

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		String email = (String) response_obj.get("email");
		
		UserDTO dto = dao.getEmail(email);

		session.setAttribute("naverId", email);
		
		model.addAttribute("result", apiResult);
		
		if(dto==null) {
			flag = true;
			return "login/join";
		}else {
			
			session.setAttribute("userNum", dto.getUserNum());
			return "redirect:myPage";
		}
		
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {

		session.invalidate();

		return "redirect:login";
	}

	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String signup(HttpServletRequest request, HttpSession session) throws Exception {
		
		if(flag==true) {
			String email = (String) session.getAttribute("naverId");

			request.setAttribute("email", email);
			flag = false;
		}
		
		session.invalidate();

		return "login/join";
	}

	//이메일 중복검사
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST)
	@ResponseBody
	public String emailChkPOST(String email) throws Exception{

		int result = dao.checkEmail(email);
		
		if(result!=0) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	
	//전화번호 중복검사
	@RequestMapping(value = "/phoneChk", method = RequestMethod.POST)
	@ResponseBody
	public String phoneChkPOST(String phone) throws Exception{
		if(phone.length()==10) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 6) + "-" + phone.substring(6);
		}
		if(phone.length()==11) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
		}
		
		int result = dao.checkPhone(phone);
		
		if(result!=0) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	
	//비밀번호 확인
	@RequestMapping(value = "/pwdChk", method = RequestMethod.POST)
	@ResponseBody
	public String pwdChkPost(String email, String pwd) throws Exception{
		
		UserDTO dto = dao.getReadData(email, bcryptPasswordEncoder.encode(pwd));
		
		if(dto==null) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	@RequestMapping(value = "/join_ok", method = { RequestMethod.GET, RequestMethod.POST })
	public String signup_ok(UserDTO dto, HttpServletRequest request) throws Exception {

		int maxNum = dao.getMaxNum();
	
		String phone =dto.getPhone();
		
		if(phone.length()==10) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 6) + "-" + phone.substring(6);
		}
		if(phone.length()==11) {
			phone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
		}
		dto.setPhone(phone);
		dto.setUserNum(maxNum + 1);
	
		dto.setPwd(bcryptPasswordEncoder.encode(dto.getPwd()));
		
		dao.insertData(dto);

		return "redirect:login";
	}

	@RequestMapping(value = "/find_email", method = { RequestMethod.GET, RequestMethod.POST })
	public String emailFind(HttpServletRequest request) throws Exception {

		return "login/find_email";
	}

	@RequestMapping(value = "/find_email_ok", method = { RequestMethod.GET, RequestMethod.POST })
	public String emailFindOk(String phone, HttpServletRequest request) throws Exception {

		String email = dao.findEmail(phone);

		int endIndex = email.indexOf("@");
		
		String idArea = email.substring(0,1);
		String emailArea = email.substring(endIndex);
		String masking = email.substring(1, endIndex);
		
		for(int i=0; i<masking.length(); i++) {
			idArea += '*';
		}
		
		email = idArea + emailArea;
		
		request.setAttribute("email", email);
		
		return "login/find_email_ok";
	}
	
	@RequestMapping(value = "/find_password", method = { RequestMethod.GET, RequestMethod.POST })
	public String passwordFind(HttpServletRequest request) throws Exception {
		
		return "login/find_password";
	}
	
	@RequestMapping(value = "/find_password_ok", method = { RequestMethod.GET, RequestMethod.POST })
	public String passwordFindOk(String email) throws Exception {
		
		String newPwd = "";
		
		while(true) {
			newPwd = generateCertPwd.excuteGenerate();
			if(newPwd!=null) {
				break;
			}
		}

		System.out.println(newPwd);
		dao.updatePwd(email, bcryptPasswordEncoder.encode(newPwd));
	
		authEmail.setSubject("Kreamy 임시 비밀번호입니다.");
		authEmail.setContent("비밀번호는 " + newPwd + "입니다");
		authEmail.setReceiver(email);
		
		emailSender.SendEmail(authEmail);
		
		return "login/find_password_ok";
	}
	
	
}
