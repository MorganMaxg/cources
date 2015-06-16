package com.springapp.stage.exam.action;

import ch.qos.logback.classic.Logger;
import com.alibaba.fastjson.JSONObject;
import com.springapp.stage.exam.entity.Exam;
import com.springapp.stage.exam.entity.Question;
import com.springapp.stage.exam.service.ExamManager;
import com.springapp.stage.security.entity.Student;
import com.springapp.stage.utils.Page;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Created by ASUS on 2015/5/30.
 */
@Controller
@RequestMapping(value = "/stage/exam/")
public class ExamAction {

    public static Logger logger = (Logger) LoggerFactory.getLogger(ExamAction.class);

    @Autowired
    private ExamManager examManager;

    /**
     * 考试列表
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "query", method = RequestMethod.GET)
    public String query(
            HttpSession session,
            ModelMap model
    ) {
        try {
            Student student = (Student) session.getAttribute("student");
            if (student == null) {
                return "/login";
            } else {
                List<Exam> exams = examManager.find(student.getId());
                Date now = new Date();
                for (Exam exam : exams) {
                    if (exam.getStartTime().getTime() - now.getTime() > 0)
                        exam.setTime(-1);
                }
                model.addAttribute("exams", exams);
            }
        } catch (Exception e) {
            logger.debug("", e);
        }
        return "/exam/find_exam";
    }

    /**
     * \
     * 考试进行中~
     */
    @RequestMapping(value = "examing")
    public String examing(
            Integer examId,
            HttpServletRequest request,
            HttpSession session,
            ModelMap model) {
        try {
            Student student = (Student) session.getAttribute("student");
            if (student == null) {
                return "/login";
            }
            Integer id = (Integer) session.getAttribute("examId");
            if (examId == null || examId == 0) {
                examId = id;
            } else {
                if (id == null) {
                    session.setAttribute("examId", examId);
                } else {
                    if (examId != id) {
                        return "/login";
                    }
                }
            }
            Exam exam = examManager.findById(examId);
            if (exam == null) {
                return "redirect:/stage/exam/find";
            }
            Page<Question> page = new Page<Question>();
            page.setPageSize(1);
            page.setPageNo(ServletRequestUtils.getIntParameter(request, "pageNo", 1));
            page.setTotalCount(examManager.findCountQuestionsInExam(examId));
            List<Question> questions = examManager.findQuestions(examId, student.getId(), page);
            Date now = new Date();
            int time = (int) ((exam.getDeadline().getTime() - now.getTime()) / 60000);
            exam.setTime(time);
            model.addAttribute("questions", questions);
            model.addAttribute("student", student);
            model.addAttribute("exam", exam);
            model.addAttribute("page", page);
        } catch (Exception e) {
            logger.debug("", e);
        }
        return "/exam/examing";
    }

    /**
     *
     */
    @ResponseBody
    @RequestMapping(value = "/saveStudentAnswer", method = RequestMethod.POST)
    public String saveStudentAnswer(
            Integer examId,
            String studentAnswer,
            Integer questionId,
            HttpSession session,
            HttpServletRequest request
    ) {
        JSONObject data = new JSONObject();
        try {
            Student student = (Student) session.getAttribute("student");
            if (student == null) {
                return "/login";
            }
            examManager.saveStudentAnswer(examId, student.getId(), questionId, studentAnswer);
            data.put("succcess", true);
        } catch (Exception e) {
            logger.debug("", e);
            data.put("success", false);
        }
        return data.toJSONString();
    }

    /**
     *
     */
    @ResponseBody
    @RequestMapping(value = "/newTimeRemain", method = RequestMethod.POST)
    public String newTimeRemain(String deadline) {
        int time = 0;
        try {
            Date end = DateUtils.parseDate(deadline, "yyyy-MM-dd HH:mm:ss");
            Date now = new Date();
            time = (int) ((end.getTime() - now.getTime()) / 60000);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "" + time;
    }

    @ResponseBody
    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String submit(
            Integer examId,
            HttpSession session
    ) {
        JSONObject data = new JSONObject();
        try {
            Student student = (Student) session.getAttribute("student");
            examManager.submitExam(examId, student.getId());
            data.put("success", true);
        } catch (Exception e) {
            data.put("success", false);
            logger.warn("", e);
        }
        return data.toJSONString();
    }
}
