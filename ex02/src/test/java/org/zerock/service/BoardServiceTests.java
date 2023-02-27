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
	
	//1. 게시글 목록보여주기
	@Test
	public void testGetList() {
		service.getlist().forEach(vo -> log.info(vo));
	}
	
	//2. 게시글 등록
	@Test
	public void testRegister() {
		BoardVO vo =new BoardVO();
		vo.setTitle("서비스테스트 타이틀");
		vo.setContent("서비스테스트 내용");
		vo.setWriter("서비스테스트 작성자");
		service.register(vo);
	}
	
	//3. 게시글 삭제 (정상동작여부 확인)
	@Test
	public void testRemove() {
		log.info("성공여부"+service.remove(17L));
	}
	
	//4. 게시글 수정 (정상동작여부 확인)
	@Test
	public void testModify() {
		BoardVO vo =new BoardVO();
		vo.setTitle("서비스 수정 타이틀");
		vo.setContent("서비스 수정 내용");
		vo.setWriter("서비스 수정 작성자");
		vo.setBno(12L);
		log.info("성공여부"+service.modify(vo));
	}
	
	//5. 게시글 읽기
	@Test
	public void testGet() {
		log.info("게시판 읽기"+service.get(12L));
	}
	
	//보너스 - 전체글 개수를 알려주는 서비스
	@Test
	public void testCount() {
		log.info("전체 게시글 개수"+service.count());
	}
	
	//보너스 - 오늘의 게시글 목록 가져오기
	@Test
	public void testGetTodayList() {
		service.getTodayList().forEach(vo -> log.info(vo));
	}
	
	//보너스 - 오늘의 게시글 갯수 가져오기
	@Test
	public void testCountTodayList() {
		log.info("오늘의 게시글 개수"+service.countTodayList());
	}
	
	//보너스 - 가장 많이 작성한 작성자 가져오기
	@Test
	public void testManyWriter() {
		log.info("가장 많이 작성한 사람 : "+service.manyWriter());
	}
	
	//23.02.27.월 - 가장 많이 작성한 작성자,갯수 가져오기
	@Test
	public void testManyWirterCount() {
		service.manyWirterCount().forEach(vo -> log.info(vo));
	}
	
	//가장 최근에 작성된 글제목 가져오기
	@Test
	public void testLastTitle() {
		log.info("가장 최근에 작성한 글제목 : "+service.lastTitle());
	}
	
	//조회수 늘리기
	@Test
	public void click() {
		log.info("성공여부 : "+service.click(71L));
	}
	
	//해당 글 조회수 조회
	@Test
	public void clickCount() {
		log.info("해당 글의 조회수 : "+service.clickCount(61L));
	}

}
