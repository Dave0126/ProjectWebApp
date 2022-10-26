package domain;

import static org.junit.Assert.*;
import org.apache.log4j.Logger;
import org.junit.Test;

import java.util.Date;

public class CommentTest {
    private static  Logger logger = Logger.getLogger(Test.class);

    @Test
    public void commentSettersTest() {
        Comment comment = new Comment();
        comment.setUserName("enzo");
        comment.setMovieName("test");
        comment.setDescription("GOOD!");
        comment.setAddTime(new Date());
        logger.debug(comment.toString());
    }

}