package com.mvc.util;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GenerateCertPwd {

	private int pwdLength = 8;
    private final char[] passwordTable =  { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
                                            'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                                            'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                                            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 
                                            'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*',
                                            '(', ')', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
    
    private final String regex = "^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{8,16}$";

    
    public String excuteGenerate() {
		Random random = new Random(System.currentTimeMillis());
		int tablelength = passwordTable.length;
		
		StringBuffer buf = new StringBuffer();
		
		for(int i = 0; i < pwdLength; i++) {
		    buf.append(passwordTable[random.nextInt(tablelength)]);
		}
		
		String newPwd = buf.toString();
		Matcher matcher = Pattern.compile(regex).matcher(newPwd);
        
        if(!newPwd.matches(regex)) {
        	return null;
        }
        
        return newPwd;
    }

    public int getPwdLength() {
        return pwdLength;
    }

    public void setPwdLength(int pwdLength) {
        this.pwdLength = pwdLength;
	    }


}
