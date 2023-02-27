package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.RankVO;
import org.zerock.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
//@AllArgsConstructor //생성자 생성
//String removeKey를 만들어주면 이것두 같이 생성자를 만들기때문에 mapper만 생성자 되게 @RequiredArgsConstructor이걸로
//@RequiredArgsConstructor
//@Component //이거 말고 서비스클래스라서 지원을 해줌 Service
@Service
public class BoardServiceImpl implements BoardService {
	
//	@NonNull //생성자 생성했기때문에 @Autowired생략가능(버전 4.3 이상) (단,생성자가 유일해야함!!!)
	@Autowired
	BoardMapper mapper;
	
	@Value("${removeKey}")
	String removeKey;
	
	//1. 게시글 목록보여주기
	@Override
	public List<BoardVO> getlist() {
		log.info("getList ... ");
		mapper.getList().forEach(vo -> log.info(vo));
		return mapper.getList();
	}
	
	//2. 게시글 등록 (게시글 번호 알아오려고 번호 알아오는 메소드로 이용)
	@Override
	public void register(BoardVO vo) {
		log.info("register ..... "+vo);
//		mapper.insert(vo);
		mapper.insertSelectKey(vo);   //입력한 글의 글번호가 vo의 bno에 들어온다
	}
	
	//3. 게시글 삭제 (정상동작여부 확인) 
	@Override
	public boolean remove(Long bno) {
		log.info("remove ..... "+bno);
//		if(mapper.delete(bno)==1)
//			return true;
//		else
//			return false;
// or		
//		return (mapper.delete(bno)==1) ?  true : false;   //mapper.delete(bno)==1 이거 자체가 true false
// or		
		return mapper.delete(bno)==1;
	}
	
	@Override
	public boolean remove(Long bno, String removeKey) {
		log.error("에러아님 확인된값 : "+this.removeKey);
		if(removeKey.equals(this.removeKey))
			return mapper.delete(bno)==1;
		else		
			return false;
	}
	//두가지 경우밖에 안되서, false에서 abc와 틀릴때, db오류일때 2가지 경우 발생!
	
		
	//4. 게시글 수정 (정상동작여부 확인)
	@Override
	public boolean modify(BoardVO vo) {
		log.info("modify ..... "+vo);
		return mapper.update(vo)==1;
	}
	
	//5. 게시글 읽기
	@Override
	public BoardVO get(Long bno) {
		log.info("get ..... "+bno);
		return mapper.read(bno);
	}
	
	//보너스 - 전체글 개수를 알려주는 서비스
	@Override
	public Long count() {
		log.info("count ..... ");
		return mapper.count();
	}
	
	//보너스 - 오늘의 게시글 목록 가져오기
	@Override
	public List<BoardVO> getTodayList() {
		log.info("getTodayList ..... ");
		mapper.getTodayList().forEach(vo -> log.info(vo));
		return mapper.getTodayList();
	}
	
	//보너스 - 오늘의 게시글 갯수 가져오기
	@Override
	public long countTodayList() {
		log.info("countTodayList ..... ");
		return mapper.countTodayList();
	}
	
	//보너스 - 가장 많이 작성한 작성자 가져오기
	@Override
	public String manyWriter() {
		log.info("manyWriter ..... ");
		return mapper.manyWriter();
	}
	
	//23.02.27.월 - 가장 많이 작성한 작성자,갯수 가져오기
	@Override
	public List<RankVO> manyWirterCount() {
		log.info("manyWirterCount ... ");
		mapper.manyWirterCount().forEach(vo -> log.info(vo));
		return mapper.manyWirterCount();
	}
	
	//가장 최근에 작성된 글제목 가져오기
	@Override
	public String lastTitle() {
		log.info("lastTitle ... ");
		return mapper.lastTitle();
	}
	
	//조회수 늘리기
	@Override
	public boolean click(Long bno) {
		log.info("click......");
		return mapper.click(bno)==1;
	}

	@Override
	public Long clickCount(Long bno) {
		log.info("clickCount....");
		return mapper.clickCount(bno);
	}


	

}
