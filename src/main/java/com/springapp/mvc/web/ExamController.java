package com.springapp.mvc.web;

import com.springapp.mvc.entity.Exam;
import com.springapp.mvc.entity.Lesson;
import com.springapp.mvc.entity.Question;
import com.springapp.mvc.entity.Teacher;
import com.springapp.mvc.service.ExamService;
import com.springapp.mvc.service.LessonService;
import com.springapp.mvc.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by maomao on 2015/4/30.
 */
@Controller
@RequestMapping("/admin")
public class ExamController {
    @Autowired
    QuestionService questionService;
    @Autowired
    ExamService examService;
    @Autowired
    LessonService lessonService;

    @RequestMapping("/exam/management")
    public String examManagement() {
        return "/admin/exam_management";
    }

    @RequestMapping("/exam/add")
    public String addExamJSP() {
        return "/admin/exam_add";
    }

    @RequestMapping("/exam/showTitle")
    public String findTitleJSP(ModelMap modelMap, HttpSession session) {
//        Teacher teacher = (Teacher) session.getAttribute("teacher");
//        int teacherID = teacher.getId();
        List<Exam> findAllExamTitleLists = examService.findAllExams();
        modelMap.addAttribute("findAllExamTitles", findAllExamTitleLists);
        return "/admin/exam_show_title";
    }

    @RequestMapping("/exam/examControl/releaseExam")
    public String releaseExamJSP(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Exam> findAllExamTitleLists = examService.findAllExams();
        modelMap.addAttribute("findAllExamTitles", findAllExamTitleLists);
        List<Lesson> lessonList = lessonService.findAllLessonByTeacherID(teacherID);
        modelMap.addAttribute("lessons", lessonList);
        return "/admin/exam_release";
    }

    @RequestMapping("/exam/checking")
    public String checkingExamJSP(ModelMap modelMap, HttpSession session) {
        //查询出所有的考试
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Exam> examLessonList = examService.findAllExamsLessons(teacherID);
        modelMap.addAttribute("exams", examLessonList);
        return "/admin/exam_check_find_exam";
    }

    @RequestMapping("/exam/checking/findLesson")
    public String checkingExamFindStudentsExam(ModelMap modelMap, HttpServletRequest request) {
        int examID = Integer.parseInt(request.getParameter("examID"));
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        List<Exam> examList = examService.findStudentByExamIDAndLessonID(examID, lessonID);
        modelMap.addAttribute("examLessonStudents", examList);
        return "/admin/exam_check_find_student_exam";
    }

    @RequestMapping("/exam/examControl/releaseExam/release")
    public String releaseExam(HttpServletRequest request) {
        int examID = Integer.parseInt(request.getParameter("examTitle"));
        String[] arrLessonID = request.getParameterValues("lessonName");
        //保存考试时间(开始时间和截止时间)
        String stringDate = request.getParameter("deadline");
        try {
            //保存开始时间
            Date startTime = new Date();
            examService.updateStartTime(startTime, examID);
            //保存截止时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date deadline = df.parse(stringDate);
            examService.updateDeadline(deadline, examID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //先绑定课程到考试课程表
        for (int i = 0; i < arrLessonID.length; i++) {
            int lessonID = Integer.parseInt(arrLessonID[i]);
            examService.addExamLesson(examID, lessonID);
        }
        //保存考试试卷和考试学生到EXAMS_STUDENTS数据库表
        examService.addExamStudentToExam(examID);
        //保存考试信息（考试试卷，试卷题目，考试学生）到数据库表
        examService.addReleaseExam(examID);
        return "redirect:/admin/exam/examControl/findExam";
    }

    @RequestMapping("/exam/examControl/findExam")
    public String findExam(ModelMap modelMap, HttpSession session) {
        //查询出所有的考试
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Exam> examLessonList = examService.findAllExamsLessons(teacherID);
        modelMap.addAttribute("exams", examLessonList);
        return "/admin/exam_find";
    }

    @RequestMapping(value = "/exam/add/examSave", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String addExam(ModelMap modelMap, HttpServletRequest request, HttpSession session) {
        Exam exam = new Exam();
        int limitNum;//题目数目
        String questionType;//题目类型
        String examTitle = request.getParameter("examTitle");
        int singleChoiceNum = Integer.parseInt(request.getParameter("singleChoiceNum"));
        int checkingNum = Integer.parseInt(request.getParameter("checkingNum"));
        int shortAnswerNum = Integer.parseInt(request.getParameter("shortAnswerNum"));
        int subjectiveNum = Integer.parseInt(request.getParameter("subjectiveNum"));
        //进行加1操作，使用户输入的题目数=数据库查询的题目数
        singleChoiceNum = singleChoiceNum + 1;
        checkingNum = checkingNum + 1;
        shortAnswerNum = shortAnswerNum + 1;
        subjectiveNum = subjectiveNum + 1;
        //保存exam属性到数据库
        exam.setExamTitle(examTitle);
        //保存Exam信息并且返回刚插入数据的ID
        int examID = examService.addExamTitleAndReturnCurrentExamID(exam);

        //读取examID,将题目保存到试卷题目表
//        int examID=examService.findExamIDByExamTitle(examTitle);
        //查询单选题
        questionType = "单选题";
        limitNum = singleChoiceNum;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("type", questionType);
        map.put("num", limitNum);
        System.out.print(map);
        List<Question> singleChoiceQuestionList = questionService.findByRandomAndLimitNum(map);
        for (Question singleChoiceQuestion : singleChoiceQuestionList) {
            int singleChoiceQuestionID = singleChoiceQuestion.getQuestionID();
            examService.addQuestionsToExam(examID, singleChoiceQuestionID);
        }
        //查询判断题
        questionType = "判断题";
        limitNum = checkingNum;
        map.put("type", questionType);
        map.put("num", limitNum);
        List<Question> checkingQuestionList = questionService.findByRandomAndLimitNum(map);
        for (Question checkingQuestion : checkingQuestionList) {
            int checkingQuestionID = checkingQuestion.getQuestionID();
            examService.addQuestionsToExam(examID, checkingQuestionID);
        }
        //查询简答题
        questionType = "简答题";
        limitNum = shortAnswerNum;
        map.put("type", questionType);
        map.put("num", limitNum);
        List<Question> shortAnswerQuestionList = questionService.findByRandomAndLimitNum(map);
        for (Question shortAnswerQuestion : shortAnswerQuestionList) {
            int shortAnswerQuestionID = shortAnswerQuestion.getQuestionID();
            examService.addQuestionsToExam(examID, shortAnswerQuestionID);
        }
        //查询主观题
        questionType = "主观题";
        limitNum = subjectiveNum;
        map.put("type", questionType);
        map.put("num", limitNum);
        List<Question> subjectiveQuestionList = questionService.findByRandomAndLimitNum(map);
        for (Question subjectiveQuestion : subjectiveQuestionList) {
            int subjectiveQuestionID = subjectiveQuestion.getQuestionID();
            examService.addQuestionsToExam(examID, subjectiveQuestionID);
        }
        return "redirect:/admin/exam/showTitle";
    }

    @RequestMapping("/exam/find")
    public String findExam(ModelMap modelMap, HttpServletRequest request) {
        int examID = Integer.parseInt(request.getParameter("examID"));
        List<Exam> allQuestionsList = examService.findAllQuestionsByExamID(examID);
        String tempExamTitle = examService.findExamTitleByExamID(examID);
        modelMap.addAttribute("tempExamTitle", tempExamTitle);
        modelMap.addAttribute("allQuestions", allQuestionsList);
        return "/admin/exam_paper_find";
    }

    @RequestMapping("/exam/checking/findAnswerAndSetScore")//试卷批阅
    public String checkingFindAnswerAndSetScore(int currentPage, int examID, int studentID, int studentScore, int questionID, int lessonID,
                                                ModelMap modelMap) {
        int totalCount = examService.findCountByExamIDAndStudntID(examID, studentID);//总记录数
        int totalCountPlusOne = totalCount + 1;
        if (currentPage == 0) {
            currentPage = 1;
        }
        if (currentPage < totalCountPlusOne) {
            //找到当前页数的题目
            List<Exam> examQuestionStudentList = examService.findOneByOneRecordByExamIDAndStudntID(currentPage, examID, studentID);//查询题目
            //更新学生成绩
            if (currentPage >= 2) {
                examService.updateStudentScoreByExamIDAndStudntID(studentScore, questionID, examID, studentID);
            }
            modelMap.addAttribute("examQuestionStudents", examQuestionStudentList);
            modelMap.addAttribute("totalCount", totalCount);
            modelMap.addAttribute("examID", examID);
            modelMap.addAttribute("studentID", studentID);
            modelMap.addAttribute("currentPage", currentPage);
            modelMap.addAttribute("lessonID", lessonID);
            return "/admin/exam_check_find_student_answer_set_score";
        }
        if (currentPage == totalCountPlusOne) {
            //找到当前页数的题目
            List<Exam> examQuestionStudentList = examService.findOneByOneRecordByExamIDAndStudntID(currentPage, examID, studentID);//查询题目
            //更新学生成绩
            if (currentPage >= 2) {
                examService.updateStudentScoreByExamIDAndStudntID(studentScore, questionID, examID, studentID);
            }
            modelMap.addAttribute("examQuestionStudents", examQuestionStudentList);
            modelMap.addAttribute("totalCount", totalCount);
            modelMap.addAttribute("examID", examID);
            modelMap.addAttribute("studentID", studentID);
            modelMap.addAttribute("currentPage", currentPage);
            modelMap.addAttribute("lessonID", lessonID);
            String returnUrl = "redirect:/admin/exam/checking/findLesson?examID=" + examID + "&lessonID=" + lessonID;
            return returnUrl;
        }
        return null;
    }

    @RequestMapping("/exam/checking/findAnswerAndSetScore/nextSave")//保存分数
    public String checkingFindAnswerAndSetScoreNextSave(@RequestParam("questionID") int questionID, @RequestParam("examQuestionCount") int examQuestionCount,
                                                        @RequestParam("examID") int examID, @RequestParam("studentID") int studentID,
                                                        ModelMap modelMap, HttpServletRequest request) {
        //更新分数
        int studentScore = Integer.parseInt(request.getParameter("studentScore"));
        examService.updateStudentScoreByExamIDAndStudntID(studentScore, questionID, examID, studentID);
        //总记录数
        int totalCount = examService.findCountByExamIDAndStudntID(examID, studentID);
        //查询题目
        List<Exam> examQuestionStudentList = examService.findOneByOneRecordByExamIDAndStudntID(examQuestionCount, examID, studentID);
        modelMap.addAttribute("examQuestionStudents", examQuestionStudentList);
        modelMap.addAttribute("totalCount", totalCount);
        modelMap.addAttribute("examID", examID);
        modelMap.addAttribute("studentID", studentID);
        modelMap.addAttribute("examQuestionCount", examQuestionCount);
        return "/admin/exam_check_find_student_answer_set_score";
    }

    @RequestMapping("/exam/checking/findAnswerAndSetScore/upSave")//保存分数
    public String checkingFindAnswerAndSetScoreUpSave(@RequestParam("questionID") int questionID, @RequestParam("examQuestionCount") int examQuestionCount,
                                                      @RequestParam("examID") int examID, @RequestParam("studentID") int studentID,
                                                      ModelMap modelMap, HttpServletRequest request) {
        //更新分数
        int studentScore = Integer.parseInt(request.getParameter("studentScore"));
        examService.updateStudentScoreByExamIDAndStudntID(studentScore, questionID, examID, studentID);
        //总记录数
        int totalCount = examService.findCountByExamIDAndStudntID(examID, studentID);
        //查询题目
        List<Exam> examQuestionStudentList = examService.findOneByOneRecordByExamIDAndStudntID(examQuestionCount, examID, studentID);
        modelMap.addAttribute("examQuestionStudents", examQuestionStudentList);
        modelMap.addAttribute("totalCount", totalCount);
        modelMap.addAttribute("examID", examID);
        modelMap.addAttribute("studentID", studentID);
        modelMap.addAttribute("examQuestionCount", examQuestionCount);
        return "/admin/exam_check_find_student_answer_set_score";
    }
}
