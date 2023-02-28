package org.zerock.domain;

import lombok.Data;

@Data
public class PageDTO {
	// 페이지바정보  (10개씩 보여준다고 정했을때)
	// 시작번호, 끝번호
	private int startPage, endPage;
	// 이전, 다음 표시유무
	private boolean prev, next;
	// 맨 앞 페이지, 맨 끝 페이지
	private int firstPage, lastPage;
//	// 바로 이전, 바로 다음 표시
//	private boolean rightPrev, rightNext;
	// 전체글개수
	private long total;
	// 현재페이지와 보여줄 글개수
	private Criteria cri;
		
	public PageDTO(Long total,Criteria cri) {
		this.total=total;
		this.cri=cri;
		//시작번호 ((x-1)/10)*10+1
		//끝번호 (x/10)올림*10
		
		endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
		startPage=endPage-9;
			
		//진짜 마지막 페이지  (전체
		lastPage=(int)(Math.ceil((total*1.0)/cri.getAmount()));
		firstPage=1;
		
		if(lastPage<endPage) //계산된 마지막 페이지가 실제 마지막 페이지보다 크면 변환 해줘야함
			endPage=lastPage;  //즉 진짜 마지막 페이지가 94페이지면 100이 아니라 94까지 보이게!! 설정!
		
//		if(startPage==1) 
//			prev=false;
//		else
//			prev=true;		
//		prev = (startPage==1) ? false : true;		
//		prev=(startPage!=1);
		prev=(startPage > 1);     //(startPage != 1) 첫 페이지만 prev 표시 X
		next=(endPage < lastPage); //(endPage != realEnd)  마지막 페이지만 next 표시 X	 
		
//		rightPrev=(startPage > 1);  //첫페이지만 이전으로 넘기지 말고
//		rightNext=(endPage < lastPage);  //마지막 페이지만 다음으로 넘기지 말고
	}

}
