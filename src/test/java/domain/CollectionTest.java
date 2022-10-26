package domain;

import static org.junit.Assert.*;
import org.apache.log4j.Logger;
import org.junit.Test;

import java.util.Date;

public class CollectionTest {
    private static  Logger logger = Logger.getLogger(Test.class);

    @Test
    public void collectionSettersTest() {
        Collection collection = new Collection();
        collection.setUserName("enzo");
        collection.setMovieName("test");
        collection.setAddTime(new Date());
        logger.debug(collection.toString());
    }
}