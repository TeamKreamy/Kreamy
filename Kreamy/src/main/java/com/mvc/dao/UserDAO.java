package com.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mvc.dto.UserDTO;

public class UserDAO {
		
	private SqlSessionTemplate sessionTemplate;
		
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		this.sessionTemplate = sessionTemplate;
	}
	
	public int getMaxNum() {
		
		int maxNum = 0;
		maxNum = sessionTemplate.selectOne("com.userMapper.maxNum");
		
		return maxNum;
	}
	
	public UserDTO getReadData(String email, String pwd){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		params.put("pwd", pwd);
		
		UserDTO dto = sessionTemplate.selectOne("com.userMapper.getReadData", params);
		
		return dto;
	}
	
	public UserDTO getEmail(String email) {
		
		UserDTO dto = sessionTemplate.selectOne("com.userMapper.getEmail", email);
		
		return dto;
	}
	
	public void insertData(UserDTO dto) {
		
		sessionTemplate.insert("com.userMapper.insertData", dto);
	}
	
	public int checkEmail(String email) {
		
		int result = sessionTemplate.selectOne("com.userMapper.checkEmail", email);
		
		return result;
	}
	
	public int checkPhone(String phone) {
		
		int result = sessionTemplate.selectOne("com.userMapper.checkPhone", phone);
		
		return result;
	}
	
	public String findEmail(String phone) {
		
		String email = sessionTemplate.selectOne("com.userMapper.findEmail", phone);
		
		return email;
	}
	
	public void updatePwd(String email, String newPwd) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		params.put("pwd", newPwd);
		
		sessionTemplate.update("com.userMapper.updatePwd", params);
	}

	
}
