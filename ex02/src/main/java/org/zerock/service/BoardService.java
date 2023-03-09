package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.ChartWriterRank;
import org.zerock.domain.Criteria;
import org.zerock.domain.RankVO;
import org.zerock.domain.WriterRank;

public interface BoardService {
	//이 메소드는 서비스 측면에서 생각
	
	//1. 게시글 목록보여주기
//	List<BoardVO> getlist();
	List<BoardVO> getlist(Criteria cri);

	//2. 게시글 등록
	void register(BoardVO vo);
	
	//3. 게시글 삭제 (정상동작여부 확인)
	boolean remove(Long bno);	
	
	boolean remove(Long bno,String removeKey);
	
	//체크된거 삭제
	int checkRemove(Long[] list);
	
	//4. 게시글 수정 (정상동작여부 확인)
	boolean modify(BoardVO vo);
	
	//5. 게시글 읽기
	BoardVO get(Long bno);
	
	//보너스 - 전체글 개수를 알려주는 서비스
//	Long count();
	Long count(Criteria cri);
	
	//보너스 - 오늘의 게시글 목록 가져오기
	List<BoardVO> getTodayList();
	
	//보너스 - 오늘의 게시글 갯수 가져오기
//	long countTodayList();
	long countTodayList(Criteria cri);
	
	//보너스 - 가장 많이 작성한 작성자 가져오기
	String manyWriter();
	
	//23.02.27.월 - 가장 많이 작성한 작성자,갯수 가져오기
	List<RankVO> manyWirterCount();
	
	//가장 최근에 작성된 글제목 가져오기
	String lastTitle();
	
	//조회수 늘리기
	boolean click(Long bno);
	
	//조회수 읽어오기
	Long clickCount(Long bno);
	
	//관리자 모드 비밀번호 체크
	boolean adminCheck(String adminKey);
	
	//5등까지 글쓴이, 등록글 가져오기
	ChartWriterRank chartWriterRank();
	
	//댓글수 추가해서 게시판 목록 가져오기
	List<BoardVO> getListWithReplyCount();
	
	//댓글수 추가해서 게시글 목록 가져오기 + rownum 이용한 페이징처리 + 검색처리 
	List<BoardVO> getListPlusReplyCountWithPaging(Criteria cri);
	
}
