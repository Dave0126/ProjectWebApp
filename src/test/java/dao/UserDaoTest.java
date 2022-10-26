package dao;

import static org.junit.Assert.*;

import domain.User;
import org.apache.log4j.Logger;
import org.junit.Test;

import java.sql.SQLException;

public class UserDaoTest {
    private static  Logger logger = Logger.getLogger(Test.class);
    UserDao userDao = new UserDao();

    @Test
    public void findUserByUsernameAndPassword() throws SQLException {
        User user = userDao.findUserByUsernameAndPassword("gdai", "1111");
        logger.debug(user.toString());
    }

    @Test
    public void findUserByUserName() throws SQLException {
        User user = userDao.findUserByUserName("gdai");
        logger.debug(user.toString());
    }
}