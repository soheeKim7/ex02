package org.zerock.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	ReplyMapper mapper;
	
	@Test
	public void testInsert() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(1L);
		vo.setReply("댓글내용~");
		vo.setReplyer("나는 댓글맨");
//		mapper.insert(vo);
		log.info("삽입된 행의 개수 : "+mapper.insert(vo));
	}
	
	@Test
	public void testInsert2() {
		//5개의 게시글에 2개씩 리플을 달고 싶다!
		Long[] bnoArr = {1201L,1185L,1184L,1183L,1182L };
		
		for(int i=0; i<10;i++) {
			ReplyVO vo =new ReplyVO();
			vo.setBno(bnoArr[i%5]);  //글번호 선택
			vo.setReply("댓글내용~"+(i+1));
			vo.setReplyer("나는 댓글맨"+(i+1));
			log.info("삽입된 행의 개수 : "+mapper.insert(vo));
		}
		
		IntStream.rangeClosed(0, 9).forEach(i->{
			ReplyVO vo =new ReplyVO();
			vo.setBno(bnoArr[i%5]);  //글번호 선택
			vo.setReply("댓글내용~"+(i+1));
			vo.setReplyer("나는 댓글맨"+(i+1));
			mapper.insert(vo);			
		});		
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(2L);
		vo.setReply("내용수정해보자~");
		vo.setReplyer("댓글맨 수정한다아~~");
		log.info("수정된 행의 개수 : "+mapper.update(vo));
	}
	
	@Test
	public void testDelete() {
		log.info("삭제된 행의 개수 : "+mapper.delete(39L));
	}
	
	@Test
	public void testReadgetList() {
		log.info("읽은 댓글 내용 : "+mapper.read(26L));		//하나의 댓글 읽기
		mapper.getList(1183L).forEach(vo->log.info(vo));	//하나의 글에 대응하는 댓글 목록 읽기		
	}
	
	@Test
	public void testMyBatis() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(10L);
		mapper.testMybatis(vo, 11L);
	}
	

}
