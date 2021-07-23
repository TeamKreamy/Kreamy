package com.mvc.util;

//����¡ ó�� Ŭ����
public class MyUtil {

	//��ü �������� ���ϱ�
	//numPerPage : �� ȭ�鿡 ǥ���� �������� ����
	//dataCount : ��ü �������� ����
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;
		
	}
	
	//����¡ ó�� �޼ҵ�
	//currentPage : ���� ǥ���� ������
	//totalPage : ��ü ��������
	//listUrl : ��ũ�� ������ url
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; // ȭ�� �ϴܿ� ǥ�õǴ� ������ ����  ������ 6 7 8 9 10 ������
		int currentPageSetup; //ǥ���� ù ���������� -1 �� ��
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			return "";
		}
		
		// url ������ ��� �ΰ��� 1.list.jsp -> ����ǥ�� ���̰� value ��¼����¼�� ����ǰ�
		//list.jsp?searchKey=subject&searchValue=1 -> ����ǥ�� �̹� ������ & �ϰ� value 
		if(listUrl.indexOf("?")!=-1) {
			listUrl += "&";
		}else {
			listUrl += "?";
		}
		
		//���������� ��ȣ ���ϱ�
		// ������ 6 7 8 9 10 ������
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;//0,5,10,15 ......
		
		if(currentPage % numPerBlock == 0) {
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		// ������
		// ������ 6 7 8 9 10 ������ -> �� ���� currentPageSetup=5 �̹Ƿ� ���� ��ư ����
		// 1 2 3 4 5 ������ -> �� ���� currentPageSetup=0�̹Ƿ� ���� ��ư ����
		if(totalPage>numPerBlock && currentPageSetup>0) {
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">������</a>&nbsp;"); 
			// ���������� �տ��ִ°� ���ڴ�~ ���� �˷��ش�!!
			//<a href="list.jsp?pageNum=5">������</a>&nbsp;
		}
		
		//�ٷΰ��� ������
		// ������ 6 7 8 9 10 ������
		// 1 2 3 4 5 ������
		page = currentPageSetup + 1; //currentPageSetup - ������ ������ ���� ������
		
		while(page<=totalPage && page <= (currentPageSetup + numPerBlock)) { // ������ ��� (page�� ������ ����� ù��°���� ����)
			
			if(page==currentPage) {
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				//<font color="Fuchsia">2</font>&nbsp;
			}else {
				
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				//<a href="list.jsp?pageNum=9">9</a>&nbsp;
			}
			page++;
		}
		
		//������
		//������ 6 7 8 9 10 ������
		//������ 11 12
		if(totalPage - currentPageSetup > numPerBlock) {//������ ������ ������ư!
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">������</a>&nbsp;
		}
		return sb.toString();
	}
	
	
	
	
	
	
	
}
