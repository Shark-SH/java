package org.psh.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class HotelTests {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	
	@Autowired
	private SampleHotel hotel;
	
	
	
	@Test
	public void testExist() {
		
		assertNotNull(hotel);

		logger.info("호텔테스트");
		
		
	}
}
