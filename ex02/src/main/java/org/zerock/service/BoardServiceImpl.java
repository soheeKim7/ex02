package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor //생성자 생성
//@Component //이거 말고 서비스클래스라서 지원을 해줌 Service
@Service
public class BoardServiceImpl implements BoardService {
	
	//생성자 생성했기때문에 @Autowired생략가능(버전 4.3 이상) (단,생성자가 유일해야함!!!)
	BoardMapper mapper;

	@Override
	public List<BoardVO> getlist() {
		log.info("getList ... ");
		mapper.getList().forEach(vo -> log.info(vo));
		return mapper.getList();
	}

	@Override
	public void register(BoardVO vo) {
		log.info("register ..... "+vo);
		mapper.insert(vo);
	}

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
	public boolean modify(BoardVO vo) {
		log.info("modify ..... "+vo);
		return mapper.update(vo)==1;
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get ..... "+bno);
		return mapper.read(bno);
	}

	@Override
	public Long count() {
		log.info("count ..... ");
		return mapper.count();
	}
	

}
