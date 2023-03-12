package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ChartWriterRank;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping
@AllArgsConstructor
public class ApiController {
	
	BoardService service;
	
	@GetMapping("api/board/bno/{num}")
	public BoardVO bnoInfo(@PathVariable("num") Long bno) {
				
		return service.get(bno);			
	}
	
	@GetMapping("api/board/{type}/{keyword}/{amount}")
	public List<BoardVO> searchlist(@PathVariable("type") String type,@PathVariable("keyword") String keyword,@PathVariable("amount") int amount){
//		Criteria cri = new Criteria();
//		cri.setAmount(amount);		
		Criteria cri = new Criteria(1,amount);
		cri.setKeyword(keyword);
		cri.setType(type);		
		
		return service.getlist(cri);		
	}
	
	@GetMapping(value="api/board/count", produces="text/plain;")  
	//이렇게 produces="text/plain;" 표기 안해주고 보내면 헤더에 content-type이 기본값이 html! 그래서 html로 읽음!
	//그래서 순수한 텍스트를 보내주고 싶으면 produces="text/plain;" 표기
	// 예를 들어서 <h1>테스트</h1> 쓰고, produces="text/plain;" 로 보내면 저거 그대로 읽고!
	// 저기서 html로 보내면 h1을 해석해서 큰 글씨 테스트 를 보여준다!!
	public String count() {
		
		return service.count(new Criteria())+"";
	}
	
	
	@GetMapping("api/board/count")
	public ResponseEntity<String> countkey(Integer key) {
				
		ResponseEntity<String> result=null;
		if(key!=null) {
			if(key==1234)
				result = ResponseEntity.status(HttpStatus.OK).body(service.count(new Criteria())+"");   //200
			else
				result = ResponseEntity.status(HttpStatus.NOT_FOUND).body("0");  //404
		}		
		return result;		
	}
	//이렇게 String로 보내면 객체가 아니기때문에 변환이 안된다!! 그래서 그냥 html text로 인식 됨!!
	
	// 하지만 아래처럼 Long으로 보내면 String이 아니라 다 객체로 봄!! 그래서 json으로 변환되서 감!!! 그래서 타입 보면 json!
/*
	@GetMapping("api/board/count")
	public ResponseEntity<Long> countkey(Integer key) {
		
		ResponseEntity<Long> result=null;
		if(key!=null) {
			if(key==1234)
				result = ResponseEntity.status(HttpStatus.OK).body(service.count(new Criteria()));   //200
			else
				result = ResponseEntity.status(HttpStatus.NOT_FOUND).body(0L);  //404
		}		
		return result;		
	}	
*/
/*
	@GetMapping("api/board/count?key={key}")
	public ResponseEntity<String> countkey(@PathVariable("key")Integer key) {
				
		ResponseEntity<String> result=null;
		if(key!=null) {
			if(key==1234) {
				result = ResponseEntity.status(HttpStatus.OK).body(service.count(new Criteria())+"");   //200
			}else {
				result = ResponseEntity.status(HttpStatus.NOT_FOUND).body("0");  //404
			}
		}		
		return result;		
	}
	//{}중괄호는 url을 뜻함!! ?이렇게 뒤에 가는건 파라미터로!! 파라미터로 가야함!!  
	//그리고 출제의도가 api/board/count 여기까지 url이 출제의도!!! 
	//그래서 {}말고 파라미터로 그냥 보내면 됨!! 
*/
	@GetMapping("api/board/new/{bno1}/{bno2}/{bno3}")
	public List<BoardVO> get3list(@PathVariable long bno1,@PathVariable long bno2,@PathVariable long bno3){
		//@PathVariable("bno1")long bno1,@PathVariable("bno2")long bno2,@PathVariable("bno3")long bno3
		List<BoardVO> list = new ArrayList<>();			
		list.add(service.get(bno1));
		list.add(service.get(bno2));
		list.add(service.get(bno3));
		
		return list;			
	}
/*
	@GetMapping("api/board/new/**")  
	// api/board/new/     /까지 적어야 되고, 그뒤에 암거나 받으려면 /*  근데 폴더 한개만 
	// 여기서 ** 두개로 처리하면 위에 폴더까지 /444/3434/343434/343 여러개 가능!!
 	public String getlists(){
		
		return "gogo";			
	}
*/
	
	@GetMapping("api/board/new/**")  
	public List<BoardVO> getlists(HttpServletRequest request){
//		System.out.println(request.getRequestURI());   //   /api/board/new/5/6/7/8/9
		String url = request.getRequestURI();
		String bnoStr=url.substring(15);  //beginindex 0부터 시작, ~14까지 new/  그래서 5부터시작 부분 15부터 시작!  => 5/6/7/8/9
		String[] bnoArr=bnoStr.split("/");
		List<BoardVO> list = new ArrayList<BoardVO>();
		for(String bno:bnoArr) {
			list.add(service.get(Long.parseLong(bno)));
		}				
		return list;			
	}
	
	@GetMapping("api/board/chart")
	public ChartWriterRank chart() {
		return service.chartWriterRank();
	}
	
	
	//좋아요 늘리기
	@RequestMapping("/api/board/goodclick/{bno}")
	public boolean goodclick(@PathVariable Long bno,HttpServletRequest request, HttpServletResponse response) {
		Cookie[] allCookie=request.getCookies();
		boolean goodCheck=false;
		if(allCookie!=null) { 
			int Existcount=0;	//좋아요쿠키가 존재할때 카운팅
			for( Cookie temp  : allCookie) {				
				log.info("좋아요 버튼 눌렀을때!!! 쿠키값들 읽어온거 봐보자~~"+temp.getName() + " : " + temp.getValue());					
				if(!temp.getName().equals("good"+bno)) {	//good+bno 라는 쿠키가 없을때, 쿠키 만들어준다
					Cookie goodCookie=new Cookie("good"+bno, "good"+bno);
					goodCookie.setPath("/");
					log.info("쿠키들 not null일때!! 좋아요 쿠키이름 제대로 설정이 되었나??"+goodCookie.getName()+" : "+goodCookie.getValue());
					log.info("경로 잘 세팅 되었나?? "+goodCookie.getPath());					
					response.addCookie(goodCookie);		//좋아요 쿠키 만든거 보내주기
//						service.goodClick(bno);		//좋아요 수 늘리기
				}else  	//좋아요 쿠키가 있을때
					Existcount++;
			}			
			if(Existcount==0) { 	//쿠키들중에서 좋아요가 존재하지 않았을때, 이때에만 좋아요수를 늘려준다. 
				service.goodClick(bno);	//좋아요 수 늘리기
				goodCheck=true;
			}			
		}else {		//가지고 있는 쿠키가 아예 없을때도, 좋아요 쿠키 없는거니까 만들어주고, 좋아요 수 늘려준다.
			log.info("좋아요 때 흠 그런데 쿠키들이 아예 없을 수가 있나???? 이런상황이 오긴 하나??? 이게 맞나????");
			Cookie goodCookie=new Cookie("good"+bno, "good"+bno);
			log.info("쿠키 자체가 없을때!!!! 쿠키 노!!!! 좋아요 쿠키이름 제대로 설정이 되었나??"+goodCookie.getName()+" : "+goodCookie.getValue());
			response.addCookie(goodCookie);		//좋아요 쿠키 만든거 보내주기
			service.goodClick(bno);		//좋아요 수 늘리기
			goodCheck=true;
		}		
		return goodCheck;
	}
	
	
	
		
	

}
