package com.springapp.stage.security.action;

import ch.qos.logback.classic.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by Administrator on 15-1-27.
 */
public class StuNotLoginException extends Exception {
    private static Logger logger = (Logger) LoggerFactory.getLogger(StuNotLoginException.class);

    public StuNotLoginException() {
        logger.debug("no login exception -please login");
    }
}
