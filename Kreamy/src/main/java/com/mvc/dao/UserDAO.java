package com.mvc.dao;

import java.util.HashMap;
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
	
	

}
