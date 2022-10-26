package domain;

import static org.junit.Assert.*;
import org.apache.log4j.Logger;
import org.junit.Test;

public class ScoreTest {
    private static  Logger logger = Logger.getLogger(Test.class);

    @Test
    public void scoreSettersTest() {
        Score score = new Score();
        score.setUserId(1);
        score.setMovieId(1);
        score.setScore(7);
        logger.debug(score.toString());
    }

}