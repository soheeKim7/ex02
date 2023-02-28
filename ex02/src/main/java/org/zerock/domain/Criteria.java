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
		
}
