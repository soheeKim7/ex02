package org.zerock.di;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;


@Component  // 의존성 주입이 연달아서 되어야한다.
@Data
public class Home {
	
	@Autowired
	student student;
		
	void print() {
		System.out.println(student);
	}
}
