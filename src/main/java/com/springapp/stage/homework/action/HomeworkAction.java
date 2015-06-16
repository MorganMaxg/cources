package com.springapp.stage.homework.action;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.homework.entity.Homework;
import com.springapp.stage.homework.service.HomeworkManager;
import com.springapp.stage.security.entity.Student;
import com.springapp.stage.utils.FileUtils;
import com.springapp.stage.utils.Page;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ASUS on 2015/5/12.
 */
@Controller
@RequestMapping("/stage/homework/")
public class HomeworkAction {

    private static Logger logger = (Logger) LoggerFactory.getLogger(HomeworkAction.class);
    private final Integer HOMEWORK_PAGE_SIZE = 10;
    private final String PART = "homework";
    @Autowired
    private HomeworkManager homeworkManager;


    @RequestMapping("query")
    public String find(Integer finish, HttpServletRequest request, ModelMap model, HttpSession session) {
        try {
            if (finish == null)
                finish = 0;
            Page<Homework> page = new Page(HOMEWORK_PAGE_SIZE);
            page.setPageNo(ServletRequestUtils.getIntParameter(request, "pageNo", 1));
            page.setTotalCount(page.getAutoCount());
            Student student = (Student) session.getAttribute("student");
            List<Homework> homeworks = homeworkManager.find(student.getId(), finish, page);
            model.addAttribute("homeworks", homeworks);
            model.addAttribute("page", page);
            model.addAttribute("finish", finish);
        } catch (Exception e) {
            logger.warn("", e);
        }
        return "/homework/find_homework";
    }

    @RequestMapping(value = "view", method = RequestMethod.GET)
    public String view(Integer id, Integer finish, ModelMap model, HttpSession session) {
        try {
            Homework homework = homeworkManager.findById(id);
            Student student = (Student) session.getAttribute("student");
            Homework studentHomework = homeworkManager.findStudentHomework(student.getId(), id);
            model.addAttribute("stuHomework", studentHomework);
            model.addAttribute("homework", homework);
            model.addAttribute("finish", finish);
        } catch (Exception e) {
            logger.debug("", e);
        }
        return "/homework/view";
    }

    @RequestMapping(value = "/download")
    public HttpServletResponse download(String uri, String fileName, HttpServletRequest request, HttpServletResponse response) {
        return FileUtils.download(PART, uri, fileName, request, response);
    }

    /**
     * 提交作业
     *
     * @param homeworkId
     * @param studentFile
     * @param request
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/finish", method = RequestMethod.POST)
    public String submit(
            Integer homeworkId,
            MultipartFile studentFile,
            HttpServletRequest request,
            HttpSession session,
            ModelMap model
    ) {
        try {
            Student student = (Student) session.getAttribute("student");
            FileUtils.upload(PART, studentFile, request);
            homeworkManager.submitHomework(homeworkId, student.getLessonId(), student.getId(), studentFile.getOriginalFilename());
        } catch (Exception e) {
            logger.debug("", e);
        }
        return "redirect:/stage/homework/query";
    }

}
