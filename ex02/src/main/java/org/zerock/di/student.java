package org.zerock.di;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class student {
	private String no;   //번호
	private String name; //이름
}
