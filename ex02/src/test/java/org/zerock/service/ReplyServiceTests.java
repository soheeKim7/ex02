package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyServiceTests {
	
	@Autowired
	ReplyService service;
	
	@Transactional
	@Test
	public void testTx() {
		log.info("테스트가 되고 있나아아아???");
		service.txTest();
		
//		try {
//			service.txTest();
//		}catch(Exception e) {
//			
//		}
	}
	
	@Test
	public void test() {
		log.info("이건 테스트 되지이이이???");
		service.get(116L);
	}
	
}
