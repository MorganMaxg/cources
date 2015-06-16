package com.springapp.stage.utils;

import freemarker.core.Environment;
import freemarker.ext.beans.BeanModel;
import freemarker.ext.servlet.FreemarkerServlet;
import freemarker.ext.servlet.HttpRequestHashModel;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.util.Map;

/**
 * @author ningdb
 *         Date: 2012-07-18 16:24
 *         分页调用 .
 */
public class PagerDirective implements TemplateDirectiveModel {
    public static final String ALIGN = "align";
    public static final String PAGE = "page";
    private static final String ACTIVE_PAGE = "<li class=\"active\"><a href=\"#\">%s</a></li>";
    private static final String LINK_PAGE = "<li><a href=\"%s\">%s</a></li>";
    private static final String DISABLE_PAGE = "<li class=\"disabled\"><a href=\"#\">...</a></li>";

    /**
     * //     * <div class="pagination pagination-centered">
     * //     * <ul>
     * <li class="active"><a href="#">1</a></li>
     * <li><a href="#">2</a></li>
     * <li><a href="#">3</a></li>
     * <li><a href="#">4</a></li>
     * <li><a href="#">5</a></li>
     * </ul>
     * </div>
     */
    private long lastIndex;

    private long maxPages;
    private int range = 3;

    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
//        env.getVariable()
        HttpRequestHashModel requestHashModel = (HttpRequestHashModel) env.getVariable(FreemarkerServlet.KEY_REQUEST);
        String queryString = null;
        String pageUrl = "";
        if (requestHashModel != null) {
            queryString = requestHashModel.getRequest().getQueryString();
            pageUrl = requestHashModel.getRequest().getRequestURI();
        } else {
            queryString = ActionContext.getRequest().getQueryString();
            pageUrl = ActionContext.getRequest().getRequestURI();
        }
        TemplateModel p = (TemplateModel) params.get(PAGE);
        Page page = null;
        if (p instanceof BeanModel) {
            page = (Page) ((BeanModel) p).getWrappedObject();
        }
        StringBuilder writer = new StringBuilder();
        if (page != null) {
            beginRender(page, writer, pageUrl, queryString);
        }
//        System.out.println(writer.toString());
        env.getOut().write(writer.toString());
    }

    void beginRender(Page page, StringBuilder writer, String pageUrl, String queryString) {
        long availableRows = page.getTotalCount();

        maxPages = ((availableRows - 1) / page.getPageSize()) + 1;

        if (maxPages < 2) {
            return;
        }

//        writer.append("<div class=\"pagination pagination-centered\">");
//        writer.append("<ul>");

        lastIndex = 0;

        for (int i = 1; i <= 2; i++) {
            writePageLink(writer, i, page, pageUrl, queryString);
        }

        long low = page.getPageNo() - range;
        long high = page.getPageNo() + range;

        if (low < 1) {
            low = 1;
            high = 2 * range + 1;
        } else {
            if (high > maxPages) {
                high = maxPages;
                low = high - 2 * range;
            }
        }

        for (long i = low; i <= high; i++) {
            writePageLink(writer, i, page, pageUrl, queryString);
        }

        for (long i = maxPages - 1; i <= maxPages; i++) {
            writePageLink(writer, i, page, pageUrl, queryString);
        }

        writer.append("</ul>");
        writer.append("</div>");
    }

    private void writePageLink(StringBuilder writer, long pageIndex, Page page, String pageUrl, String queryString) {
        if (pageIndex < 1 || pageIndex > maxPages) {
            return;
        }

        if (pageIndex <= lastIndex) {
            return;
        }

        if (pageIndex != lastIndex + 1) {
            writer.append(DISABLE_PAGE);
        }

        lastIndex = pageIndex;

        if (pageIndex == page.getPageNo()) {
            writer.append(String.format(ACTIVE_PAGE, Long.toString(pageIndex)));
            return;
        }
        String URL;
        if (StringUtils.isNotBlank(queryString)) {
            int index = queryString.indexOf("pageNo");
            if (index > -1) {
                int pos = queryString.indexOf("&", index);
                if (pos == -1) {//说明只有pageNo=1这样的参数
                    pos = queryString.length();
                }
                String pageNo = queryString.substring(index, pos);
                URL = "?" + StringUtils.replace(queryString, pageNo, "pageNo=" + pageIndex);
            } else {
                URL = "?" + queryString + "&pageNo=" + pageIndex;
            }
        } else {
            URL = "?pageNo=" + pageIndex;
        }
        if (StringUtils.isNotBlank(pageUrl)) {
            writer.append(String.format(LINK_PAGE, pageUrl + URL, Long.toString(pageIndex)));
        } else {
            writer.append(String.format(LINK_PAGE, URL, Long.toString(pageIndex)));
        }
    }
}
