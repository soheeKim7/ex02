package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	//등록
	public int insert(ReplyVO vo);
	//수정
	public int update(ReplyVO vo);
	//삭제
	public int delete(Long rno);
	//하나의 댓글 읽기
	public ReplyVO read(Long rno);
	//하나의 글에 대응하는 댓글 목록 읽기 (등록순)
	public List<ReplyVO> getList(Long bno);
	//하나의 글에 대응하는 댓글 목록 읽기 (최신순)
	public List<ReplyVO> getList2(Long bno);
	
	//해당 댓글의 비밀번호 맞을때 그 데이터들 가져오기
	public ReplyVO replypwCheck(ReplyVO vo);
	
	//2개이상의 파라미터가 들어갈 경우 mybatis에서 처리하는법
	//2개의 글을 읽는 쿼리
//	public List<ReplyVO> testMybatis(ReplyVO reply,Long rno2);  // 이러면 인식 못함 
										//rno
	public List<ReplyVO> testMybatis(@Param("reply")ReplyVO reply, @Param("rno2")Long rno2);
	
	//트랜잭션 처리테스트용
	public void tx1();
	public void tx2();
	
}
