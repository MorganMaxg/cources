package com.springapp.stage.grade.action;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.exam.entity.Exam;
import com.springapp.stage.exam.entity.Question;
import com.springapp.stage.exam.service.ExamManager;
import com.springapp.stage.grade.service.GradeManager;
import com.springapp.stage.homework.entity.Homework;
import com.springapp.stage.security.entity.Lesson;
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
 * Created by ASUS on 2015/6/3.
 */
@Controller
@RequestMapping("/stage/grade")
public class GradeAction {
    private static final Logger logger = (Logger) LoggerFactory.getLogger(GradeAction.class);
    private final int GRADE_PAGE_SIZE = 10;

    @Autowired
    private GradeManager gradeManager;

    @Autowired
    private ExamManager examManager;

    @RequestMapping("/query")
    public String query(Integer type, ModelMap model, HttpSession session, HttpServletRequest request) {
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            return "/login";
        }
        if (type == 0) {
            //参训总成绩
            List<Lesson> lessons = gradeManager.findLessonGrade(student.getId());
            model.addAttribute("lessons", lessons);
        }
        if (type == 1) {
            //参训考试成绩
            List<Exam> exams = gradeManager.findExamGrade(student.getId());
            model.addAttribute("exams", exams);
        }
        if (type == 2) {
            //查询作业成绩
            Page<Homework> page = new Page();
            page.setPageNo(ServletRequestUtils.getIntParameter(request, "pageNo", 1));
            page.setPageSize(GRADE_PAGE_SIZE);
            page.setTotalCount(page.getAutoCount());
            model.addAttribute("page", page);
            List<Homework> homeworks = gradeManager.findHomeworkGrade(student.getId(), page);
            model.addAttribute("homeworks", homeworks);
        }
        return "/grade/find_grade";
    }

    @RequestMapping("view")
    public String view(
            Integer examId,
            HttpServletRequest request,
            HttpSession session,
            ModelMap model
    ) {
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
                    session.setAttribute("examId", examId);
                }
            }
        }
        Exam exam = examManager.findById(examId);
        Page<Question> page = new Page<Question>();
        page.setPageSize(1);
        page.setPageNo(ServletRequestUtils.getIntParameter(request, "pageNo", 1));
        page.setTotalCount(examManager.findCountQuestionsInExam(examId));
        List<Question> questions = examManager.findQuestions(examId, student.getId(), page);
        model.addAttribute("page", page);
        model.addAttribute("questions", questions);
        model.addAttribute("exam", exam);
        return "/grade/view";
    }
}
