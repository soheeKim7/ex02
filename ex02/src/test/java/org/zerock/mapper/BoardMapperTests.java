package org.zerock.mapper;

import java.util.ArrayList;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.WriterRank;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
//	@Autowired
	@Setter(onMethod_ = @Autowired )
	BoardMapper mapper;
	
	//게시물 목록 가져오기
	@Test
	public void testGetList(){		
//		for(BoardVO vo:mapper.getList()) 
//			log.info(vo);		
//		위와 동일한 의미
		mapper.getList().forEach(vo -> log.info(vo));		
	}	
	
	//게시글 등록
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 내용");
		vo.setWriter("newbie");
//		mapper.insert(vo);
		log.info("삽입된 행의 개수 : "+mapper.insert(vo));
	}	
	
	//게시글 등록시 등록된 번호 알아서 글 등록하기
	@Test
	public void testInsertSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 내용");
		vo.setWriter("newbie");
		log.info("삽입된 행의 개수 : "+mapper.insertSelectKey(vo));
		log.info(vo);
		log.info("삽입된 bno : " +vo.getBno());
	}
	
	//bonus 확인된 글번호로 글 등록하기
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
	
	//게시글 수정
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
	
	//게시글 삭제
	@Test
	public void testDelete() {
		log.info("삭제된 행의 개수 : "+mapper.delete(3L));
	}
	
	//체크된거 삭제
	@Test
	public void testCheckDelete() {
		Long[] list=new Long[2];
		list[0]=1127L;
		list[1]=1128L;		
		log.info(list.length);
//		List<Long> list = new ArrayList<>();
//		list.add(1131L);
//		list.add(1130L);
		log.info("삭제된 행의 개수 : "+mapper.checkDelete(list));
	}
	
	//게시글 읽기(조회)
	@Test
	public void testRead() {
		log.info("읽어온 행 : "+mapper.read(4L));
	}
	
	//전체글 개수 확인
	@Test
	public void testcount() {
		Criteria cri=new Criteria();
		log.info("전체 글 개수 : "+mapper.count(cri));
	}
	
	//오늘의 게시글 목록 가져오기
	@Test
	public void testGetTodayList() {
		mapper.getTodayList().forEach(vo -> log.info(vo));
	}
	
	//오늘의 게시글 갯수 가져오기
	@Test
	public void testCountTodayList() {
		Criteria cri=new Criteria();
		log.info("오늘의 게시글 개수 : "+mapper.countTodayList(cri));
	}
	
	//가장 많이 작성한 작성자 가져오기
	@Test
	public void testManyWriter() {
		log.info("가장 많이 작성한 사람 : "+mapper.manyWriter());
	}
	
	//가장 많이 작성한 작성자,글갯수 가져오기
	@Test
	public void testManyWirterCount() {		
		mapper.manyWirterCount().forEach(vo -> log.info(vo));
	}
	
	//가장 최근에 작성된 글제목 가져오기
	@Test
	public void testLastTitle() {
		log.info("가장 최근에 작성한 제목 : " +mapper.lastTitle());
	}
	
	//해당 글의 조회수 읽어오기
	@Test
	public void testClickCount() {
		log.info("해당 글의 조회수 : "+mapper.clickCount(61L));
	}	
	
	//해당 글의 현재 조회수에 +1해서 등록/조회수 늘리기
	@Test
	public void testClick() {
		log.info("등록된 행의 개수 : "+mapper.click(61L));
	}
	
	//게시물 목록 가져오기 + 페이징 처리
	@Test
	public void testGetListWithPaging() {
		mapper.getListWithPaging(new Criteria(2,10)).forEach( vo -> log.info(vo));
	}
	
	//5등까지 글쓴이, 등록글 가져오기
	@Test
	public void testWriterRank() {
		mapper.writerRank().forEach(vo -> log.info(vo));
		log.info(mapper.writerRank());
	}
	
	//댓글수 추가해서 게시글 목록 가져오기
	@Test
	public void testGetListPlusReplyCount() {
		mapper.getListPlusReplyCount().forEach(vo -> log.info(vo));
	}
	
	//댓글수 추가해서 게시글 목록 가져오기 + rownum 이용한 페이징처리 + 검색처리 
	@Test
	public void testGetListPlusReplyCountWithPaging() {
		Criteria cri=new Criteria();
		mapper.getListPlusReplyCountWithPaging(cri).forEach(vo -> log.info(vo));
	}
	
	//해당 글의 좋아요+1 늘리기
	@Test
	public void testGoodclick() {
		log.info("등록된 행의 개수 : "+mapper.goodClick(1244L));
	}
	
	//해당 글의 싫어요+1 늘리기
	@Test
	public void testBadclick() {
		log.info("등록된 행의 개수 : "+mapper.badClick(1244L));
	}
	
	
	
}
