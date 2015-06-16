package com.springapp.mvc.web;

import com.springapp.mvc.entity.Message;
import com.springapp.mvc.entity.Teacher;
import com.springapp.mvc.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by maomao on 2015/4/7.
 */
@Controller
@RequestMapping("/admin")
@SessionAttributes("message")
public class MessageController {
    @Autowired
    MessageService messageService;

    @RequestMapping("/message/management")
    public String findAllMessage(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Message> messageList = messageService.findAllMessage(teacherID);
        modelMap.addAttribute("message", messageList);
        return "/admin/message_management";
    }

    @RequestMapping("/message/oneMessage")
    public void findOneMessage(ModelMap modelMap) {

    }

    @RequestMapping("/message/addMessage")
    public String addMessageJSP() {
        return "/admin/message_release";
    }

    @RequestMapping("/message/deleteMessage")
    public String deleteMessage(HttpServletRequest request) {
        int messageID = Integer.parseInt(request.getParameter("messageID"));
        messageService.deleteMessage(messageID);
        return "redirect:/admin/message/management";
    }

    @RequestMapping("/message/updateMessage")
    public String updateMessageJSP(Integer messageID, ModelMap modelMap) {
        modelMap.addAttribute("messageID", messageID);
        return "/admin/message_update";
    }

    @RequestMapping(value = "/message/addMessage/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    private String addMessage(HttpServletRequest request, HttpSession session) {
        Message message = new Message();
        String title = request.getParameter("title");
        String messageContent = request.getParameter("messageContent");
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        Date date = new Date();
        message.setTeacherID(teacherID);
        message.setCreateDate(date);
        message.setTitle(title);
        message.setMessageContent(messageContent);
        messageService.addMessage(message);
        return "redirect:/admin/message/addMessage";
    }

    @RequestMapping(value = "/message/updateMessage/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String updateMessage(HttpServletRequest request, HttpSession session) {
        Integer messageID = Integer.parseInt(request.getParameter("messageID"));
        Message message = messageService.findOneMessageByMessageID(messageID);
        String tempTitle = request.getParameter("title");
        String tempMessageContent = request.getParameter("messageContent");
        if (tempTitle != "") {
            message.setTitle(tempTitle);
        }
        if (tempMessageContent != "") {
            message.setMessageContent(tempMessageContent);
        }
        messageService.updateMessage(message);
        return "redirect:/admin//message/management";
    }

}
