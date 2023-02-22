package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
//	@Autowired
	@Setter(onMethod_ = @Autowired )
	BoardMapper mapper;
	
	@Test
	public void testGetList(){		
//		for(BoardVO vo:mapper.getList()) 
//			log.info(vo);		
//		위와 동일한 의미
		mapper.getList().forEach(vo -> log.info(vo));
		
	}
}
