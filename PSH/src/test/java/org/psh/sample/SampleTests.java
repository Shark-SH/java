package org.psh.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SampleTests {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private Restaurant restaurant;
	
	@Test
	public void testExist() {
		logger.info(""+restaurant);
		logger.info("아령하세여");
	}
	
}
