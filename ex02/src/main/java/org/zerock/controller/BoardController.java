package org.zerock.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ChartWriterRank;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("board/*")
@AllArgsConstructor
public class BoardController {
//	@Autowired
	BoardService service;
	
	@GetMapping("")
	public void all() {
		
	}
	
//	PageDTO pageDTO =new PageDTO(service.count(), new Criteria());
	//1. 게시글 목록보여주기
	@GetMapping("list")   
	public void list(Model model,Criteria cri) {
		log.info("url list....");
		log.info("현재 amount : "+cri.getAmount());		

//		model.addAttribute("list",service.getlist(cri));
		model.addAttribute("list",service.getListPlusReplyCountWithPaging(cri));
		//페이지 정보 전달
//		PageDTO pageDTO =new PageDTO(service.count(), cri);
//		log.info("페이지 정보"+pageDTO);
//		model.addAttribute(pageDTO);  //이렇게 이름 안실어서 보내면 자동으로 보내지는 객체이름의 소문자로 즉 같은 이름인 pageDTO로 간다	
		model.addAttribute(new PageDTO(service.count(cri), cri));
//		model.addAttribute(new PageDTO(144L, cri));
	}		
	
	//2. 게시글 등록
	@GetMapping("register")
	public void register(Criteria cri,Model model) {
		model.addAttribute("cri",cri);
	}	
	
	@PostMapping("register")  
	public String register(BoardVO vo,RedirectAttributes rttr) {
		log.info("url register....");
		service.register(vo);
		log.info("입력된 글번호"+vo.getBno());
		rttr.addFlashAttribute("bno",vo.getBno()); //입력된 글번호 한번만 전송
		
		//목록으로 돌아가기
		return "redirect:/board/list";  
//		/board/list 이렇게 하면 직접적인 페이지를 여는것!  
//		그래서 리다이렉트로 list인 url을 요청해야 컨트롤러에서 받아서 목록을 가지고 보여준다!
//		model.addAttribute("list",service.getlist());
//		return "/board/list";
		//그렇다고 모델에 실어서 보내면 디스패쳐로 가서 주소가 register로 되어있어 계속 새로고침 누르면 도배되서 리스트에 추가된다!!
	}
	
	//3. 게시글 삭제 (정상동작여부 확인)
	@PostMapping("remove")  //삭제
	public String remove(Long bno,RedirectAttributes rttr,String removeKey,Criteria cri) {
		log.info("url remove.......");
		
		
		if(service.remove(bno,removeKey))    //삭제처리
			rttr.addFlashAttribute("removebno",bno);
		else
			rttr.addFlashAttribute("removebno",-1);
		return "redirect:/board/list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount(); 
	}		
		
	/*
	@PostMapping("remove")  //삭제
	public String remove(Long bno,RedirectAttributes rttr) {
		log.info("url remove.......");
		service.remove(bno);
		log.info("수정된 글번호"+bno);
		rttr.addFlashAttribute("removebno",bno);
		return "redirect:/board/list"; 
	}
	*/		
	
	//4. 게시글 수정 (정상동작여부 확인)
	@GetMapping("modify")
	public void modify(Long bno,Model model,Criteria cri) {
		//수정화면 출력 (글번호 받아서 조회한거 보내기)
		model.addAttribute("board",service.get(bno));
		model.addAttribute("cri",cri);
	}
	
	@PostMapping("modify")  //수정
	public String modify(BoardVO vo,RedirectAttributes rttr,Criteria cri) {
		log.info("url modify.......");
		//db가 정상이니까 이렇게 한건데, 정확하게 하려면, 참일때만 값을 보내야함
		service.modify(vo);
		log.info("수정된 글번호"+vo.getBno());
		rttr.addFlashAttribute("modifybno",vo.getBno());
		
		return "redirect:/board/list?pageNum="+cri.getPageNum()+"&amount="+cri.getAmount(); 
	}
	
	//5. 게시글 읽기
	@GetMapping("get") 
	public void get(Long bno,Model model,Criteria cri) {
		log.info("url get.......");
		model.addAttribute("cri",cri);                          //페이지 정보를 유지하기 위해 보냄
		service.click(bno);    //db에 현재 조회수+1 수정등록해줌
		model.addAttribute("board",service.get(bno));		
	}
//		if(goodCheck==null)		//좋아요,싫어요체크 값이 없다는건, 좋아요,싫어요 버튼은 누른것이 아니기때문에  false값으로 셋팅해준다.
//			goodCheck=false;
//		if(badCheck==null)
//			badCheck=false;
		
//		Cookie[] allCookie=request.getCookies();
//		if(allCookie!=null) { 
//			for( Cookie temp  : allCookie) {				
//				log.info("쿠키값들 읽어온거 봐보자~~"+temp.getName() + " : " + temp.getValue());	
//				if(temp.getName().equals("good"+bno)) 		//좋아요 쿠키(클릭했을때 만들었던) 존재할때
//					goodCheck=true;				
//				if(temp.getName().equals("bad"+bno)) 		//싫어요 쿠키(클릭했을때 만들었던) 존재할때
//					badCheck=true;				
//			}
//		}
		
//		model.addAttribute("goodCheck",goodCheck);
//		model.addAttribute("badCheck",badCheck);
		
	/*
	//좋아요 늘리기
	@RequestMapping("goodclick")
	public String goodclick(Long bno,Criteria cri,HttpServletRequest request, HttpServletResponse response) {
		Cookie[] allCookie=request.getCookies();
//		goodCheck=false;
		if(allCookie!=null) { 
			int Existcount=0;	//좋아요쿠키가 존재할때 카운팅
			for( Cookie temp  : allCookie) {				
				log.info("좋아요 버튼 눌렀을때!!! 쿠키값들 읽어온거 봐보자~~"+temp.getName() + " : " + temp.getValue());					
				if(!temp.getName().equals("good"+bno)) {	//good+bno 라는 쿠키가 없을때, 쿠키 만들어준다
					Cookie goodCookie=new Cookie("good"+bno, "good"+bno);
//					goodCookie.setPath("/");
					log.info("쿠키들 not null일때!! 좋아요 쿠키이름 제대로 설정이 되었나??"+goodCookie.getName()+" : "+goodCookie.getValue());
					log.info("쿠기 path가 어떻게 만들어지나 보자 기본값이 어딘지!!!!"+goodCookie.getPath());
					log.info("쿠기 도메인이 어떻게 만들어지나 보자 기본값이 어딘지!!!!"+goodCookie.getDomain());
					goodCookie.setPath("/");
					response.addCookie(goodCookie);		//좋아요 쿠키 만든거 보내주기
//					service.goodClick(bno);		//좋아요 수 늘리기
				}else  	//좋아요 쿠키가 있을때
					Existcount++;
			}		
			log.info("for문 끝났다~~~쿠키들 중에서 좋아요 존재안할때, 경우 카운트 한 값좀 보자 : "+Existcount);
			if(Existcount==0) 	//쿠키들중에서 좋아요가 존재하지 않았을때, 이때에만 좋아요수를 늘려준다. 
				service.goodClick(bno);	//좋아요 수 늘리기						
		}else {		//가지고 있는 쿠키가 아예 없을때도, 좋아요 쿠키 없는거니까 만들어주고, 좋아요 수 늘려준다.
			log.info("좋아요 때 흠 그런데 쿠키들이 아예 없을 수가 있나???? 이런상황이 오긴 하나??? 이게 맞나????");
			Cookie goodCookie=new Cookie("good"+bno, "good"+bno);
			log.info("쿠키 자체가 없을때!!!! 쿠키 노!!!! 좋아요 쿠키이름 제대로 설정이 되었나??"+goodCookie.getName()+" : "+goodCookie.getValue());
			goodCookie.setPath("/");
			response.addCookie(goodCookie);		//좋아요 쿠키 만든거 보내주기
			service.goodClick(bno);		//좋아요 수 늘리기
		}
//		log.info("일단 지금 goodCheck 값을 제대로 읽어오고 잇는건가? 어떻게 쓰고 잇니??"+goodCheck);
//		goodCheck=true;	
		
//		return "redirect:/board/get?bno="+bno+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount()+"&goodCheck="+goodCheck+"&badCheck="+badCheck;
		return "redirect:/board/get?bno="+bno+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}	
	
	//싫어요 늘리기
	@RequestMapping("badclick")
	public String badclick(Long bno,Criteria cri,HttpServletRequest request, HttpServletResponse response) {
		Cookie[] allCookie=request.getCookies();
//		badCheck=false;
		if(allCookie!=null) { 
			int Existcount=0; 	//싫어요 쿠키가 존재할때 카운팅
			for( Cookie temp  : allCookie) {				
				log.info("싫어요 버튼 눌렀을때!! 쿠키값들 읽어온거 봐보자~~"+temp.getName() + " : " + temp.getValue());	
				if(!temp.getName().equals("bad"+bno)) {	//bad+bno 라는 쿠키가 없을때, 쿠키 만들어준다
					Cookie badCookie=new Cookie("bad"+bno, "bad"+bno);
					log.info("not null일때!!! 싫어요 쿠키이름 제대로 설정이 되었나??"+badCookie.getName()+" : "+badCookie.getValue());
					badCookie.setPath("/");
					response.addCookie(badCookie);		//싫어요 쿠키 만든거 보내주기
//					service.badClick(bno);	//싫어요 수 늘리기
				}else 	//싫어요 쿠키가 있을때
					Existcount++;				
			}
			log.info("for문 끝났다~~~쿠키들 중에서 좋아요 존재안할때, 경우 카운트 한 값좀 보자 : "+Existcount);

			if(Existcount==0)   	//쿠키들중에서 싫어요가 존재하지 않았을때, 이때에만 싫어요수를 늘려준다. 
				service.badClick(bno);	//싫어요 수 늘리기			
		}else {		//가지고 있는 쿠키가 아예 없을때도, 싫어요 쿠키 없는거니까 만들어주고, 싫어요 수 늘려준다.
			log.info("싫어요 때 흠 그런데 쿠키들이 아예 없을 수가 있나???? 이런상황이 오긴 하나??? 이게 맞나????");
			Cookie badCookie=new Cookie("bad"+bno, "bad"+bno);
			log.info("쿠키 자체가 없을때!! 싫어요 쿠키이름 제대로 설정이 되었나??"+badCookie.getName()+" : "+badCookie.getValue());
			badCookie.setPath("/");
			response.addCookie(badCookie);		//싫어요 쿠키 만든거 보내주기
			service.badClick(bno);		//싫어요 수 늘리기
		}
//		log.info("일단 지금 badCheck 값을 제대로 읽어오고 잇는건가? 어떻게 쓰고 잇니??"+badCheck);
//		badCheck=true;					
		
//		return "redirect:/board/get?bno="+bno+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount()+"&goodCheck="+goodCheck+"&badCheck="+badCheck;
		return "redirect:/board/get?bno="+bno+"&pageNum="+cri.getPageNum()+"&amount="+cri.getAmount();
	}
	*/
		
	//보너스 - 전체글 개수를 알려주는 서비스
//	@GetMapping("count")   
//	public void count(Model model) {
//		log.info("url count.......");
//		model.addAttribute("count",service.count());
//	}
	
	@GetMapping("count")   
	public void count(Model model,Criteria cri) {
		log.info("url count.......");
		model.addAttribute("count",service.count(cri));
	}
	
	
	//보너스 - 오늘의 게시글 목록 가져오기
	@GetMapping("todaylist")   
	public void todaylist(Model model,Criteria cri) {
		log.info("url todaylist....");
		model.addAttribute("todaylist",service.getTodayList());
		model.addAttribute(new PageDTO(service.countTodayList(cri), cri));
	}
	
	
	//보너스 - 오늘의 게시글 갯수 가져오기
	@GetMapping("counttodaylist")   
	public void countTodayList(Model model,Criteria cri) {
		log.info("url counttodaylist.......");
		model.addAttribute("counttodaylist",service.countTodayList(cri));
	}
	
	//보너스 - 가장 많이 작성한 작성자 가져오기
	@GetMapping("manywriter")
	public void manyWriter(Model model) {
		log.info("url manywriter.......");
		model.addAttribute("manywriter",service.manyWriter());
	}
	
	//23.02.27.월 - 가장 많이 작성한 작성자,갯수 가져오기
	@GetMapping("rank")
	public void manyWirterCount(Model model) {
		log.info("url manywritercount.......");
		model.addAttribute("rank",service.manyWirterCount());
	}
	
	//가장 최근에 작성된 글제목 가져오기
	@GetMapping("last")
	public void lastTitle(Model model) {
		log.info("url last.......");
		model.addAttribute("last", service.lastTitle());
	}
	
	//관리자 모드 처리
	@PostMapping("adminCheck")
	public String adminCheck(RedirectAttributes rttr,String adminKey) {
		log.info("url adminCheck.......");
		if(service.adminCheck(adminKey))
			rttr.addFlashAttribute("adminKey",adminKey);
		else
			rttr.addFlashAttribute("adminKey",-1);
				
		return "redirect:/board/admin"; 
	}
	
	//관리자 페이지 열기
	@GetMapping("admin")   
	public void admin(Model model,Criteria cri) {
		log.info("url admin....");
		model.addAttribute("list",service.getlist(cri));
		model.addAttribute(new PageDTO(service.count(cri), cri));
		model.addAttribute("checkbno","checkbno");
	}
	
//	//관리자 편집페이지 열기
//	@GetMapping("adminEdit")
//	public void adminEdit(Model model,Criteria cri) {
//		log.info("url adminEdit....");
//		model.addAttribute("list",service.getlist(cri));
//		model.addAttribute("checkbno","checkbno");
//	}
	
	//관리자 삭제!
//	@PostMapping("adminRemove")
	@RequestMapping("adminRemove")
	public String adminRemove(Long[] checkbno,RedirectAttributes rttr,Criteria cri) {
		log.info("url adminRemove.......");
		log.info("삭제된 bno들 봐보자 배열이 어떻게 찍히려나?"+checkbno);
		String checkbnos="";
		for(int i=0;i<checkbno.length-1;i++) {
			checkbnos+=checkbno[i]+", ";
		}
		log.info("마지막 합치기 전 : "+checkbnos);
		checkbnos+=checkbno[checkbno.length-1];
		log.info("마지막 합체한 후! : "+checkbnos);		
				
		service.checkRemove(checkbno);
		rttr.addFlashAttribute("checkbnoRemove",checkbnos);
		
		return "redirect:/board/admin";
	}
	
	@GetMapping("chart")   // board/chart 요청
	public void chart(Model model) {
		ChartWriterRank chartWriterRank=service.chartWriterRank();
		String mylabels="[";
		for(String labels : chartWriterRank.getMylabels()) {
			mylabels += "\""+labels+"\",";
		}
		mylabels=mylabels.substring(0, mylabels.length()-1)+"]";
		log.info("잘 만들어 졌나? : "+mylabels);
		
		model.addAttribute("mylabels",mylabels);
		model.addAttribute("mydata", Arrays.toString(chartWriterRank.getMydata()));
				
//		model.addAttribute("chartdata",service.chartWriterRank());
		//  /views/board/chart.jsp		
	}
	
	@GetMapping("chart2")  //기본화면만 보내고 ajax로 처리하기
	public void chart2(Model model) {
//		ChartWriterRank chartWriterRank=service.chartWriterRank();
//		String orginlabels="[";
//		for(String labels : chartWriterRank.getMylabels()) {
//			orginlabels += "\""+labels+"\",";
//		}
//		orginlabels=orginlabels.substring(0, orginlabels.length()-1)+"]";
//		log.info("잘 만들어 졌나? : "+orginlabels);
//		
//		model.addAttribute("orginlabels",orginlabels);
//		model.addAttribute("orgindata", Arrays.toString(chartWriterRank.getMydata()));		
//		log.info("잘 만들어 졌나? : "+Arrays.toString(chartWriterRank.getMydata()));
	}
	
	@GetMapping("barChart")
	public void barChart() {
		
	}
	
	
	
}
