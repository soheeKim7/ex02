package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	//페이지 번호
	private int pageNum;
	//한번에 보여줄 양
	private int amount;
	
	//검색조건
	private String type;    //예> 제목T, 작성자W, 내용C, 제목or작성자 TW, 제목or내용 TC ....
	//검색어
	private String keyword;
		
	
//	private int pageNum=1;
//	private int amount=10;
		
	public Criteria() {
		this(1,10);
		//위에서 자체적으로 초기화 1과 10으로 세팅하거나,
		//지금처럼 생성자(밑에)이용해서 1,10 세팅하거나
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {  //type 문자를 한글자씩 분해해서 문자열의 배열로 돌려주는 메소드
//		type.split(",");   //  , 기준으로 분해
	/*
		if(type!=null) {
			String[] strArr=type.split("");    //  한글자씩 분해 
			return strArr;
		}else {
			return new String[] {};       
		}
		//why? 배열객체가 null이면 foreach 돌릴때 에러발생함으로!			
	 */
		
	/*
		if(type!=null) {
			return type.split("");    		
		}else {
			return new String[] {};       
		}			
	 */
		
		return (type!=null)? type.split("") : new String[] {};		
		
	}
	
		
}
