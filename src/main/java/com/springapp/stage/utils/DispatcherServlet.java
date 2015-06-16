package com.springapp.stage.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author ningdb
 *         Date: 2012-07-19 11:55
 */
public class DispatcherServlet extends org.springframework.web.servlet.DispatcherServlet {
    public static final String START_TIME = "_start_time";
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);

    protected void doService(HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (logger.isDebugEnabled()) {
            logger.debug("process:http://{}{}", request.getServerName(), request.getRequestURI());
        }

        long time = System.currentTimeMillis();
        request.setAttribute(START_TIME, time);
        ActionContext.setContext(new ActionContext(new ConcurrentHashMap<String, Object>()));
        ActionContext.setRequest(request);
        ActionContext.setResponse(response);
        try {
            super.doService(request, response);
        } catch (FileNotFoundException e) {//对没有找到文件的错误,直接返回404的错误.
            logger.info("404:请求的URL:http://{}{}", request.getServerName(), request.getRequestURI());
            logger.warn(e.getMessage(), e);
            response.setStatus(404);
        } finally {
            ActionContext.getContext().clear();
            time = System.currentTimeMillis() - time;
            if (logger.isInfoEnabled()) {
                logger.info("process in {} ms:http://{}{}", time, request.getServerName(), request.getRequestURI());
            }
        }
    }

    public void destroy() {
        super.destroy();
        ActionContext.stop();
    }
}
