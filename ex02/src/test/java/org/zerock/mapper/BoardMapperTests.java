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
	
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 내용");
		vo.setWriter("newbie");
//		mapper.insert(vo);
		log.info("삽입된 행의 개수 : "+mapper.insert(vo));
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 내용");
		vo.setWriter("newbie");
		log.info("삽입된 행의 개수 : "+mapper.insertSelectKey(vo));
		log.info(vo);
	}
	
	@Test
	public void testmyInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 내용");
		vo.setWriter("newbie");
		vo.setBno(mapper.mySelectKey());
		log.info("삽입된 행의 개수 : "+mapper.myInsert(vo));
		log.info(vo);
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setTitle("수정 작성하는 글");
		vo.setContent("수정 작성하는 내용");
		vo.setWriter("수정~");
		vo.setBno(2L); //뒤에 붙은 L은 Long을 의미!
		log.info("수정된 행의 개수 : "+mapper.update(vo));
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		log.info("삭제된 행의 개수 : "+mapper.delete(3L));
	}
	
	@Test
	public void testRead() {
		log.info("읽어온 행 : "+mapper.read(4L));
	}
	
}
