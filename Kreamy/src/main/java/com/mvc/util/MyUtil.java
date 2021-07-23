package com.mvc.util;

//페이징 처리 클래스
public class MyUtil {

	//전체 페이지수 구하기
	//numPerPage : 한 화면에 표시할 데이터의 갯수
	//dataCount : 전체 데이터의 갯수
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;
		
	}
	
	//페이징 처리 메소드
	//currentPage : 현재 표시할 페이지
	//totalPage : 전체 페이지수
	//listUrl : 링크를 설정할 url
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; // 화면 하단에 표시되는 페이지 갯수  ◀이전 6 7 8 9 10 ▶다음
		int currentPageSetup; //표시할 첫 페이지에서 -1 한 값
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			return "";
		}
		
		// url 들어오는 경우 두가지 1.list.jsp -> 물음표를 붙이고 value 어쩌구저쩌구 쓰면되고
		//list.jsp?searchKey=subject&searchValue=1 -> 물음표가 이미 있으니 & 하고 value 
		if(listUrl.indexOf("?")!=-1) {
			listUrl += "&";
		}else {
			listUrl += "?";
		}
		
		//이전페이지 번호 구하기
		// ◀이전 6 7 8 9 10 ▶다음
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;//0,5,10,15 ......
		
		if(currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		// ◀이전
		// ◀이전 6 7 8 9 10 ▶다음 -> 이 경우는 currentPageSetup=5 이므로 이전 버튼 생김
		// 1 2 3 4 5 ▶다음 -> 이 경우는 currentPageSetup=0이므로 이전 버튼 없음
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">◀이전</a>&nbsp;"); 
			// 역슬러쉬는 앞에있는게 문자다~ 임을 알려준다!!
			//<a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
		}
		
		//바로가기 페이지
		// ◀이전 6 7 8 9 10 ▶다음
		// 1 2 3 4 5 ▶다음
		page = currentPageSetup + 1; //currentPageSetup - 이전이 있을때 현재 페이지
		
		while(page<=totalPage && page <= (currentPageSetup + numPerBlock)) { // 페이지 찍기 (page는 페이지 목록중 첫번째부터 시작)
			
			if(page==currentPage) {
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				//<font color="Fuchsia">2</font>&nbsp;
			}else {
				
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				//<a href="list.jsp?pageNum=9">9</a>&nbsp;
			}
			page++;
		}
		
		//▶다음
		//◀이전 6 7 8 9 10 ▶다음
		//◀이전 11 12
		if(totalPage - currentPageSetup > numPerBlock) {//다음이 있으면 다음버튼!
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">▶다음</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">▶다음</a>&nbsp;
		}
		return sb.toString();
	}
	
	
	
	
	
	
	
}
