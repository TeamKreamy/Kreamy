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

		//System.out.println("네이버:" + naverAuthUrl);

		model.addAttribute("url", naverAuthUrl);

		return "login/login";
	}

	@RequestMapping(value = "/login_ok", method = { RequestMethod.POST, RequestMethod.GET })
	public String login_ok(UserDTO dto, String pwd, HttpServletRequest request,HttpSession session) throws Exception {

		//dto = dao.getReadData(dto.getEmail(), dto.getPwd());
		dto = dao.getEmail(dto.getEmail());
		
		System.out.println(dto.getPwd());
		
		if (dto == null || bcryptPasswordEncoder.matches(pwd, dto.getPwd())==false) {
			return "redirect:login";
		}
		System.out.println(dto.getUserNum());
		session.setAttribute("userNum", dto.getUserNum());
		
		return "login/login_ok";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {

		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		/*
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M"
		 * ,"email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 */

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		System.out.println(nickname);
		
		String email = (String) response_obj.get("email");
		System.out.println(email);
		
		UserDTO dto = dao.getEmail(email);

		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", nickname); // 세션 생성
		session.setAttribute("naverId", email);
		model.addAttribute("result", apiResult);
		
		if(dto==null) {
			flag = true;
			return "login/join";
		}
		
		return "login/login_ok";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {

		System.out.println("여기는 logout");
		session.invalidate();

		return "redirect:login";
	}

	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String signup(HttpServletRequest request, HttpSession session) throws Exception {
		
		if(flag==true) {
			String email = (String) session.getAttribute("naverId");
			System.out.println(email);
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

		System.out.println("이메일 중복검사");
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

		System.out.println("전화번호 중복검사");
		int result = dao.checkPhone(phone);
		
		if(result!=0) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	
	@RequestMapping(value = "/join_ok", method = { RequestMethod.GET, RequestMethod.POST })
	public String signup_ok(UserDTO dto, HttpServletRequest request) throws Exception {

		int maxNum = dao.getMaxNum();
		String email = dto.getEmail();

		int index = email.indexOf("@");
		String id = email.substring(0, index);
		
		dto.setUserNum(maxNum + 1);
		dto.setId(id);
	
		System.out.println("암호화 전 비번 : " + dto.getPwd());
		dto.setPwd(bcryptPasswordEncoder.encode(dto.getPwd()));
		System.out.println("암호화 후 비번 : " + dto.getPwd());
		
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
		
		System.out.println(email);
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
