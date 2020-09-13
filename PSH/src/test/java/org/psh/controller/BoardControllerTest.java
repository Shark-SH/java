package org.psh.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class BoardControllerTest {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private WebApplicationContext ctx;
	//가짜 mvc
	private MockMvc mockmvc;
	@Before
	public void setup() {
		this.mockmvc=MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		
		logger.info(""+mockmvc.perform(MockMvcRequestBuilders.get("/crud/list")
				.param("pageNum", "2")
				.param("amount", "50"))
		.andReturn()
		.getModelAndView()
		.getModelMap());
	}
	/*
	@Test
	public void testregister() throws Exception{
		String resultpage = mockmvc.perform(MockMvcRequestBuilders.post("/crud/register")
				.param("title", "테스트글제목")
				.param("content","테스트 새글 내용")
				.param("writer", "user00")
				).andReturn().getModelAndView().getViewName();
		
		
		logger.info("result 절트절트"+resultpage);
		
	}
	
	@Test
	public void testGet() throws Exception{
		
		logger.info("testtest"+mockmvc.perform(MockMvcRequestBuilders
		.get("/board/get")
		.param("bno","5")).andReturn().getModelAndView().getModelMap());
		
	}
	
	@Test
	public void testModify() throws Exception{
		String resultpage = mockmvc.perform(MockMvcRequestBuilders.post("/crud/modify")
				.param("title", "mockmvc로 수정")
				.param("content","mockmvc로 수정")
				.param("writer", "mockmvc")
				.param("bno","5")
				).andReturn().getModelAndView().getViewName();
		
		logger.info("resultPage : "+resultpage);
	}
	
	@Test
	public void testremove() throws Exception{
		String resultpage = mockmvc.perform(MockMvcRequestBuilders.post("/crud/remove")
				.param("bno", "7")
				).andReturn().getModelAndView().getViewName();
		logger.info(""+resultpage);
		
	}
	*/
	

}
