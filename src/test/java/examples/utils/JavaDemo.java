package examples.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JavaDemo {

    private static final Logger logger = LoggerFactory.getLogger(JavaDemo.class);

    public static String getNameSong(String name) {
        logger.debug("java got a name: {}", name);
        return "Hi !"+ name;
    }



}
