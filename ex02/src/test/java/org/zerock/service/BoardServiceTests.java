package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	
	@Autowired
	BoardService service;
	
	@Test
	public void testGetList() {
		service.getlist().forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testRegister() {
		BoardVO vo =new BoardVO();
		vo.setTitle("서비스테스트 타이틀");
		vo.setContent("서비스테스트 내용");
		vo.setWriter("서비스테스트 작성자");
		service.register(vo);
	}
	
	@Test
	public void testRemove() {
		log.info("성공여부"+service.remove(17L));
	}
	
	@Test
	public void testModify() {
		BoardVO vo =new BoardVO();
		vo.setTitle("서비스 수정 타이틀");
		vo.setContent("서비스 수정 내용");
		vo.setWriter("서비스 수정 작성자");
		vo.setBno(12L);
		log.info("성공여부"+service.modify(vo));
	}
	
	@Test
	public void testGet() {
		log.info("게시판 읽기"+service.get(12L));
	}
	
	@Test
	public void testCount() {
		log.info("전체 게시글 개수"+service.count());
	}
	
	
	

}
