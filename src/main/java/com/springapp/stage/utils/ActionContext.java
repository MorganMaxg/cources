package com.springapp.stage.utils;

import org.springframework.core.NamedThreadLocal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 存放httprequest和httpresponse.
 */
public class ActionContext implements Serializable {
    public final static String HTTP_REQUEST = "http.request";
    public final static String HTTP_RESPONSE = "http.response";
    public final static String CURRENT_USER = "current.user";
    public final static String CURRENT_MEMBER = "current.member";
    public static final String CURRENT_DEVICE = "currentDevice";
    public final static String CURRENT_COMPANY = "current.company";
    public final static String CURRENT_SITE = "current.site";
    private static ThreadLocal<ActionContext> actionContext = new NamedThreadLocal<ActionContext>("Action Context");
    private Map<String, Object> context;

    public ActionContext(Map<String, Object> context) {
        this.context = context;
    }

    public static ActionContext getContext() {
        if (actionContext.get() == null) {
            ActionContext.setContext(new ActionContext(new ConcurrentHashMap<String, Object>()));
        }
        return actionContext.get();
    }

    public static void setContext(ActionContext context) {
        actionContext.set(context);
    }

    public static HttpServletRequest getRequest() {
        return ActionContext.getContext().getV(HTTP_REQUEST);
    }

    public static void setRequest(HttpServletRequest request) {
        ActionContext.getContext().put(HTTP_REQUEST, request);
    }

    public static HttpServletResponse getResponse() {
        return ActionContext.getContext().getV(HTTP_RESPONSE);
    }

    public static void setResponse(HttpServletResponse response) {
        ActionContext.getContext().put(HTTP_RESPONSE, response);
    }

    public static <T> T getMember() {
        return ActionContext.getContext().getV(CURRENT_MEMBER);
    }

    public static <T> void setMember(T user) {
        ActionContext.getContext().put(CURRENT_MEMBER, user);
    }

    public static <T> T getDevice() {
        return ActionContext.getContext().getV(CURRENT_DEVICE);
    }

    public static <T> void setDevice(T device) {
        ActionContext.getContext().put(CURRENT_DEVICE, device);
    }

    public static <T> T getCompany() {
        return ActionContext.getContext().getV(CURRENT_COMPANY);
    }

    public static <T> void setCompany(T company) {
        ActionContext.getContext().put(CURRENT_COMPANY, company);
    }

    public static <T> T getSite() {
        return ActionContext.getContext().getV(CURRENT_SITE);
    }

    public static <T> void setSite(T site) {
        ActionContext.getContext().put(CURRENT_SITE, site);
    }

    public static <T> T get(String key) {
        return ActionContext.getContext().getV(key);
    }

    public static void stop() {
        if (getContext() != null) {
            getContext().clear();
            actionContext = null;
        }
    }

    public void put(String key, Object value) {
        context.put(key, value);
    }

    public <T> T getV(String key) {
        return (T) context.get(key);
    }

    public void clear() {
        context.clear();
        context = null;
    }
}