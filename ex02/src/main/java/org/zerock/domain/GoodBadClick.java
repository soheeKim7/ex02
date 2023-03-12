package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GoodBadClick {
	private boolean goodCheck;
	private boolean badCheck;
	
	
	public GoodBadClick() {
		this(false,false);
	}
	
	public GoodBadClick(boolean goodCheck, boolean badCheck) {
		super();
		this.goodCheck = goodCheck;
		this.badCheck = badCheck;
	}

}
