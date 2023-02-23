package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@Log4j
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class BoardControllerTests {
	
	@Autowired
	WebApplicationContext ctx;
	
	MockMvc mockMvc; //Controller를 테스트 하기 위한 객체 //자동주입이 안되기 때문에, WebApplicationContext 위에꺼 필요!
	
	@Before  //모든 메소드 하기전에 자동으로 먼저 수행하게 함! junit에서 제공하는 거!!
	public void setup() {
		mockMvc=MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//1. 게시글 목록보여주기
	@Test
	public void testlist() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
		//여기서 getModelMap 은 컨트롤러에서 list메소드에서 model에 실어서 보낸 그 데이터를 읽어오는것!
		//그래서 여기선 model에 실은게 있어서 데이터가 뜨고 밑에선 보낸게 없어서 안뜸!
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getViewName()); //열리는 페이지이름		
	}
	
	//2. 게시글 등록
	@Test
	public void testRegister() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
//				.param("title", "test title").param("content", "test content").param("writer", "test writer"))
//		.andReturn().getModelAndView().getModelMap());
		//여기서는 model에 실어 보낸게 없어서 안나올거라 이거를 하는 의미가 없고! 
		//url테스트를 해서 보낸걸 잘 되는지 하는거라서 열리는 페이지이름이라도 받아온거다!
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "test title").param("content", "test content").param("writer", "test writer"))
				.andReturn().getModelAndView().getViewName());
	}	
	
	//3. 게시글 삭제 (정상동작여부 확인)
	@Test
	public void testRemove() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "18"))
				.andReturn().getModelAndView().getViewName());
	}
	
	//4. 게시글 수정 (정상동작여부 확인)
	@Test
	public void testModify() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("title", "modify title").param("content", "modify content").param("writer", "modify writer").param("bno", "19"))
				.andReturn().getModelAndView().getViewName());
	}
	
	//5. 게시글 읽기
	@Test
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get?bno=1")).andReturn().getModelAndView().getModelMap());	
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "25"))
				.andReturn().getModelAndView().getModelMap());	
	}
	
	//보너스 - 전체글 개수를 알려주는 서비스
	@Test
	public void testCount() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/count")).andReturn().getModelAndView().getModelMap());	
	}
	
	//보너스 - 오늘의 게시글 목록 가져오기
	@Test
	public void testTodaylist() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/todaylist")).andReturn().getModelAndView().getModelMap());		
	}
	
	//보너스 - 오늘의 게시글 갯수 가져오기
	@Test
	public void testCountTodayList() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/counttodaylist")).andReturn().getModelAndView().getModelMap());	
	}
	
	//보너스 - 가장 많이 작성한 작성자 가져오기
	@Test
	public void testManyWriter() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/manywriter")).andReturn().getModelAndView().getModelMap());	
	}	
}
