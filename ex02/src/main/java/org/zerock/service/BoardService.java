package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardService {
	//이 메소드는 서비스 측면에서 생각
	
	//1. 게시글 목록보여주기
	List<BoardVO> getlist();

	//2. 게시글 등록
	void register(BoardVO vo);
	
	//3. 게시글 삭제 (정상동작여부 확인)
	boolean remove(Long bno);	
	
	//4. 게시글 수정 (정상동작여부 확인)
	boolean modify(BoardVO vo);
	
	//5. 게시글 읽기
	BoardVO get(Long bno);
	
	//보너스 - 전체글 개수를 알려주는 서비스
	Long count();
	
	//보너스 - 오늘의 게시글 목록 가져오기
	List<BoardVO> getTodayList();
	
	//보너스 - 오늘의 게시글 갯수 가져오기
	long countTodayList();
	
	//보너스 - 가장 많이 작성한 작성자 가져오기
	String manyWriter();
	
}
