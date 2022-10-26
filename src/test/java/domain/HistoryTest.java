package domain;

import static org.junit.Assert.*;
import org.apache.log4j.Logger;
import org.junit.Test;

import java.util.Date;

public class HistoryTest {
    private static  Logger logger = Logger.getLogger(Test.class);

    @Test
    public void historySettersTest() {
        History history = new History();
        history.setUserId(1);
        history.setMovieName("test");
        history.setAddTime(new Date());
        logger.debug(history.toString());
    }

}