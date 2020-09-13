package org.psh.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.psh.mapper.TimeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TimeMapperTests {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private TimeMapper timemapper;
	
	@Test
	public void testGetTime() {
		logger.info(""+timemapper.getClass().getName());
		logger.info(""+timemapper.getTime());
		
	}
	
	@Test
	public void testGetTime2() {
		logger.info("getTime2");
		logger.info(""+timemapper.getTime2());
	}
	
}
