package org.zerock.persistence;

import static org.junit.Assert.fail;


import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	
	static { //초기화 블럭/미리 셋팅됨 한번만, 그래서 메모리가 기본적으로 적재되서 쓰임
				
		try {
			//1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {		
		try {			
			//2. 연결해서 커넥션 객체를 가지고 이후 작업진행
			DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","book_ex","book_ex");
			log.info("DB연결 성공");
		} catch (Exception e) {				
			e.printStackTrace();
			log.error("DB연결 실패");
			fail(); //무조건 junit 테스트 실패( 이후코드는 실행 안됨)
		}
	
		
		
	}
}
