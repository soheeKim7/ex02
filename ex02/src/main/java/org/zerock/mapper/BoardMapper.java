package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.RankVO;

public interface BoardMapper {
	
	//게시물 목록 가져오기
	//@Select("select * from tbl_board")
	List<BoardVO> getList();  //게시물 목록 가져오기
	//인터페이스는 생략해도 기본적으로 메소드 public!!
	
	//게시물 목록 가져오기 + 페이징 처리
	List<BoardVO> getListWithPaging(Criteria cri);
		
	//게시글 등록            // return int 등록된 글의 개수
//	void insert(BoardVO vo);
	int insert(BoardVO vo); //삽입된 행의 개수!
	
	//게시글 수정            // return int 수정된 글의 개수
	int update(BoardVO vo);
	
	//게시글 삭제            // return int 삭제된 글의 개수
	int delete(Long bno);
	
	//체크된거 삭제
	int checkDelete(Long[] aaa);
	
	//게시글 읽기(조회)
	BoardVO read(Long bno);
	
	//게시글 등록시 등록된 번호 알아서 글 등록하기  //return int 등록된 글의 개수
	int insertSelectKey(BoardVO vo);
	
	//bonus 등록할 글번호 확인하기  //return long 등록할 글번호
	long mySelectKey(); 
	
	//bonus 확인된 글번호로 글 등록하기  //return int 등록된 글의 개수
	int myInsert(BoardVO vo);
	
	//전체글 개수 확인
//	long count();
	long count(Criteria cri);
	
	//오늘의 게시글 목록 가져오기
	List<BoardVO> getTodayList();
	
	//오늘의 게시글 갯수 가져오기
	long countTodayList();
	
	//가장 많이 작성한 작성자 가져오기
	String manyWriter();
	
	//가장 많이 작성한 작성자,글갯수 가져오기
	List<RankVO> manyWirterCount();
	
	//가장 최근에 작성된 글제목 가져오기
	String lastTitle();
	
	//해당 글의 조회수 읽어오기
	Long clickCount(Long bno);
	
	//해당 글의 조회수 읽어와서 조회수를 +1해서 등록해준다
	int click(Long bno);
}
