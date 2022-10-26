package domain;

import org.junit.Test;
import org.apache.log4j.Logger;

import java.util.Date;

public class UserTest {
    private static Logger logger = Logger.getLogger(Test.class);

    @Test
    public void userTest() {
        User user1 = new User();
        user1.setId(1);
        user1.setUsername("enzo");
        user1.setPassword("enzo");
        user1.setGender("male");
        user1.setEmail("enzo@example.com");
        user1.setTelephone("0000");
        user1.setIntroduce("Nothing");
        user1.setActiveCode("0000");
        user1.setState(1);
        user1.setRole("admin");
        user1.setRegistTime(new Date());
        logger.debug(user1.toString());
    }



}