package com.springapp.stage.inform.action;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.inform.entity.Message;
import com.springapp.stage.inform.service.MessageManager;
import com.springapp.stage.security.entity.Student;
import com.springapp.stage.utils.Page;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ASUS on 2015/4/28.
 */
@Controller
public class MessageAction {
    private static Logger logger = (Logger) LoggerFactory.getLogger(MessageAction.class);
    private final Integer PAGE_SIZE = 2;
    @Autowired
    private MessageManager messageManager;

    @RequestMapping(value = "/stage/inform/message/query")
    public String query(ModelMap model, HttpServletRequest request,HttpSession session) {
        Page page = new Page();
        page.setPageNo(ServletRequestUtils.getIntParameter(request, "pageNo", 1));
        page.setPageSize(ServletRequestUtils.getIntParameter(request, "pageSize", PAGE_SIZE));
        try {
            Student student= (Student) session.getAttribute("student");
            page.setTotalCount(ServletRequestUtils.getIntParameter(request, "totalCount", messageManager.countMessages(student.getId())));
            List<Message> messages = messageManager.findMessages(student.getId(),page);
            model.addAttribute("messages", messages);
            model.addAttribute("page", page);
        } catch (Exception e) {
            logger.warn(e.getMessage(), e);
        }
        return "/inform/find_inform";
    }

    @RequestMapping(value = "/stage/inform/message/more")
    public String more(Integer messageId, ModelMap model) {
        Message message = messageManager.findMessageById(messageId);
        model.addAttribute("message", message);
        return "/inform/more";
    }
}
