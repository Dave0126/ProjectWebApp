package domain;

import org.junit.Test;
import org.apache.log4j.Logger;

public class MovieTest {
    private static Logger logger = Logger.getLogger(Test.class);

    @Test
    public void movieSettersTest() {
        Movie movie = new Movie();
        movie.setId(1);
        movie.setName("test");
        movie.setCountry("cn");
        movie.setType("comedy");
        movie.setActor("enzo");
        movie.setDirector("enzo");
        movie.setScriptwriter("enzo");
        movie.setDes("nothing");
        movie.setScore(7);
        movie.setYears("2022");
        movie.setLanguages("zh");
        movie.setLength("120");
        movie.setUrl("www.imdb.com");
        movie.setImage("/images/1.jpg");
        logger.debug(movie.toString());
    }
}