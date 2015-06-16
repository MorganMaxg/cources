package com.springapp.stage.security.action;

/**
 * Created by ASUS on 2015/4/20.
 */

import ch.qos.logback.classic.Logger;
import com.springapp.stage.security.entity.Student;
import com.springapp.stage.security.service.StudentManager;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Timer;

//import com.springapp.stage.security.task.StudentTask;

@Controller
public class StudentAction {
    @Autowired
    Timer timer;
    private Logger logger = (Logger) LoggerFactory.getLogger(StudentAction.class);
    @Autowired
    private StudentManager studentManager;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login() {
        return "/login";
    }

    @RequestMapping(value = "/stage/login", method = RequestMethod.POST)
    public String login(
            @RequestParam("id") String id,
            @RequestParam("password") String password,
            ModelMap model,
            HttpSession session
    ) {
        Student student = studentManager.findByStudentId(id);
        if (student != null) {
            if (StringUtils.equals(password, student.getPassword())) {
                session.setAttribute("student", student);
//                timer.schedule(new StudentTask(session, studentManager), 1000*60, 1000*60);
                return "welcome";
            }
        }
        model.addAttribute("ERROR", "学号或密码错误!");
        return "/login";
    }

    @RequestMapping(value = "/stage/security/home.html")
    public String home() {
        return "welcome";
    }
}
