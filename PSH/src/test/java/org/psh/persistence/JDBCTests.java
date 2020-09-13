package org.psh.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JDBCTests {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Test
	public void testConnection() {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myself?serverTimezone=Asia/Seoul",
					"root", "ASDzxc!@34");
			logger.info("연결상태"+con);
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	
	
	
	
	
}