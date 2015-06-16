package com.springapp.mvc.web;

import com.springapp.mvc.entity.*;
import com.springapp.mvc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by maomao on 2015/5/23.
 */
@Controller
@RequestMapping("/admin")
public class ScoreController {
    @Autowired
    HomeworkService homeworkService;
    @Autowired
    HomeworkStudentsService homeworkStudentsService;
    @Autowired
    StudentService studentService;
    @Autowired
    LessonService lessonService;
    @Autowired
    ExamService examService;
    @Autowired
    ScoreService scoreService;

    @RequestMapping("/score/management")
    public String scoreTempFindByHomeworkJSP(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Homework> homeworks = homeworkService.findAllHomework(teacherID);
        modelMap.addAttribute("homeworks", homeworks);
        return "/admin/score_management";
    }

    @RequestMapping("/score/findHomeworkScoreByHomework")
    public String scoreFindHomeworkScoreByHomeworkJSP(ModelMap modelMap, HttpServletRequest request, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Homework> homeworkList = homeworkService.findAllHomework(teacherID);
        modelMap.addAttribute("homeworks", homeworkList);
        return "/admin/score_homework_find_by_homework";
    }

    @RequestMapping("/score/findHomeworkScoreByHomework/showLessons")
    public String scoreFindHomeworkScoreByHomework(@RequestParam("homeworkID") Integer homeworkID, ModelMap modelMap) {
        List<Homework> lessons = homeworkService.findLessonsByHomeworkID(homeworkID);
        modelMap.addAttribute("lessons", lessons);
        modelMap.addAttribute("homeworkID", homeworkID);
        return "/admin/score_homework_find_by_homework_show_lesson";
    }

    @RequestMapping("/score/findHomeworkScoreByHomework/showStudents")
    public String scoreFindHomeworkScoreByHomeworkShowStudents(@RequestParam("homeworkID") int homeworkID, @RequestParam("lessonID") Integer lessonID, ModelMap modelMap) {
        List<Lesson> lessonStudents = lessonService.findAllStudentsByLessonID(lessonID, homeworkID);
        modelMap.addAttribute("lessonStudents", lessonStudents);
        return "/admin/score_homework_find_by_homework_show_students";
    }

    @RequestMapping("/score/findHomeworkScoreByLesson")
    public String scoreFindHomeworkScoreByLesson(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Lesson> lessonList = lessonService.findAllLessonByTeacherID(teacherID);
        modelMap.addAttribute("lessons", lessonList);
        return "/admin/score_homework_find_by_lesson";
    }

    @RequestMapping("/score/findHomeworkScoreByLesson/showStudents")
    public String scoreFindHomeworkScoreByLessonShowHomeworks(@RequestParam("lessonID") int lessonID, ModelMap modelMap) {
        List<Lesson> lessonStudents = lessonService.findSampleStudentInfoByLessonID(lessonID);
        modelMap.addAttribute("lessonStudents", lessonStudents);
        return "/admin/score_homework_find_by_lesson_show_student";
    }

    @RequestMapping("/score/findHomeworkScoreByLesson/showHomeworks")
    public String scoreFindHomeworkScoreByLessonShowAllHomeworks(@RequestParam("id") int id, ModelMap modelMap) {
        List<Homework> studentHomeworks = homeworkService.findAllHomeworkByID(id);
        modelMap.addAttribute("studentHomeworks", studentHomeworks);
        return "/admin/score_homework_find_by_lesson_show_homework";
    }

    @RequestMapping("/score/findExamScoreByExam")
    public String scoreFindExamScoreByExam(ModelMap modelMap, HttpSession session) {
        //查询出所有的考试
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Exam> exams = examService.findOnlyExams(teacherID);
        modelMap.addAttribute("exams", exams);
        return "/admin/score_exam_find_by_exam";
    }

    @RequestMapping("/score/findExamScoreByExam/showLesson")
    public String scoreFindExamScoreByExamShowLesson(@RequestParam("examID") int examID, ModelMap modelMap) {
        //查询出对应考试下的所有参加的班级
        List<Exam> examLessons = examService.findExamLessonByExamID(examID);
        modelMap.addAttribute("examLessons", examLessons);
        modelMap.addAttribute("examID", examID);
        return "/admin/score_exam_find_by_exam_show_lesson";
    }

    @RequestMapping("/score/findExamScoreByExam/showStudents")
    public String scoreFindExamScoreByExamShowStudentsAndScore(@RequestParam("examID") int examID, @RequestParam("lessonID") int lessonID, ModelMap modelMap) {
        //查询出对应课程下所有的学生以及考试成绩
        List<Exam> examStudentScores = examService.findExamScoreByExamIDAndStudentID(lessonID, examID);
        modelMap.addAttribute("examStudentScores", examStudentScores);
        return "/admin/score_exam_find_by_exam_show_student";
    }

    @RequestMapping("/score/findExamScoreByLesson")
    public String scoreFindExamScoreByLesson(ModelMap modelMap, HttpSession session) {
        //查询出老师名字下面所有的课程
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        List<Lesson> lessons = lessonService.findAllLessonByTeacherID(teacher.getId());
        modelMap.addAttribute("lessons", lessons);
        return "/admin/score_exam_find_by_lesson";
    }

    @RequestMapping("/score/findExamScoreByLesson/showStudents")
    public String scoreFindExamScoreByLessonShowStudents(ModelMap modelMap, @RequestParam("lessonID") int lessonID) {
        //查询出课程下面所有的学生
        List<Lesson> lessonStudents = lessonService.findSampleStudentInfoByLessonID(lessonID);
        modelMap.addAttribute("lessonStudents", lessonStudents);
        return "/admin/score_exam_find_by_lesson_show_student";
    }

    @RequestMapping("/score/findExamScoreByLesson/showExamsAndScore")
    public String scoreFindExamScoreByLessonShowExamsAndScore(@RequestParam("studentID") int studentID, ModelMap modelMap) {
        //查询出学生下面对应的所有的考试以及考试成绩
        List<Exam> examAndExamScoreList = examService.findExamAndExamScoreByStudentID(studentID);
        modelMap.addAttribute("examAndExamScores", examAndExamScoreList);
        return "/admin/score_exam_find_by_lesson_show_exam_and_score";
    }

    @RequestMapping("/score/findByStudent")
    public String scoreTempFindByHomeworkStudentJSP(ModelMap modelMap, HttpServletRequest request) {
        List<Student> studentList = studentService.findAllStudents();
        modelMap.addAttribute("students", studentList);
        return "/admin/score_temp_find_by_student";
    }

    @RequestMapping("/score/findByStudent/show")
    public String scoreFindByHomeworkStudent(ModelMap modelMap, HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<HomeworkStudents> homeworkStudentsList = homeworkStudentsService.findHomeworkAndScoreByID(id);
        Student student = studentService.findOneStudentByID(id);
        modelMap.addAttribute("homeworkStudents", homeworkStudentsList);
        modelMap.addAttribute("student", student);
        return "/admin/score_find_by_student";
    }

    @RequestMapping("/score/setHomeworkProportion/showLesson")
    public String setHomeworkProportionShowLesson(ModelMap modelMap, HttpSession session) {
        //查询出老师名字下面所有的课程
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        List<Lesson> lessons = lessonService.findAllLessonByTeacherID(teacher.getId());
        modelMap.addAttribute("lessons", lessons);
        return "/admin/score_set_homework_proportion_show_lesson";
    }

    @RequestMapping("/score/setExamProportion/showLesson")
    public String setExamProportionShowLesson(ModelMap modelMap, HttpSession session) {
        //查询出老师名字下面所有的课程
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        List<Lesson> lessons = lessonService.findAllLessonByTeacherID(teacher.getId());
        modelMap.addAttribute("lessons", lessons);
        return "/admin/score_set_exam_proportion_show_lesson";
    }

    @RequestMapping("/score/setHomeworkProportion/showHomeworkAndProportion")
    public String setHomeworkProportionShowHomeworkAndProportion(@RequestParam("lessonID") int lessonID, ModelMap modelMap) {
        List<Homework> lessonHomeworks = homeworkService.findAllHomeworkByLessonID(lessonID);
        modelMap.addAttribute("lessonHomeworks", lessonHomeworks);
        modelMap.addAttribute("lessonID", lessonID);
        return "/admin/score_set_homework_proportion_show_homework_and_proportion";
    }

    @RequestMapping("/score/setExamProportion/showExamAndProportion")
    public String seExamtProportionShowExamAndProportion(@RequestParam("lessonID") int lessonID, ModelMap modelMap) {
        List<Exam> lessonExams = examService.findExamsByLessonID(lessonID);
        modelMap.addAttribute("lessonExams", lessonExams);
        modelMap.addAttribute("lessonID", lessonID);
        return "/admin/score_set_exam_proportion_show_exam_and_proportion";
    }

    @RequestMapping(value = "/score/setExamProportion/showExamAndProportion/save", method = RequestMethod.POST)
    public String saveScoreSetExamProportion(@RequestParam("lessonID") int lessonID, HttpServletRequest request) {
        String[] arrProportion = request.getParameterValues("arrProportion");
        String[] arrExamID = request.getParameterValues("arrExamID");
        int proportion;
        int examID;
        for (int i = 0; i < arrProportion.length; i++) {
            proportion = Integer.parseInt(arrProportion[i]);
            examID = Integer.parseInt(arrExamID[i]);
            examService.updateExamSetProportion(proportion, examID, lessonID);
        }
        return "redirect:/admin/score/setExamProportion/showLesson";
    }

    @RequestMapping(value = "/score/setHomeworkProportion/showHomeworkAndProportion/save", method = RequestMethod.POST)
    public String saveScoreSetHomeworkProportion(@RequestParam("lessonID") int lessonID, HttpServletRequest request) {
        String[] arrProportion = request.getParameterValues("arrProportion");
        String[] arrHomeworkID = request.getParameterValues("arrHomeworkID");
        int proportion;
        int homeworkID;
        for (int i = 0; i < arrProportion.length; i++) {
            proportion = Integer.parseInt(arrProportion[i]);
            homeworkID = Integer.parseInt(arrHomeworkID[i]);
            homeworkService.updateSetHomeworkProportion(proportion, homeworkID, lessonID);
        }
        return "redirect:/admin/score/setHomeworkProportion/showLesson";
    }

    @RequestMapping("/score/findFinalScore/showLesson")
    public String scoreFinalScoreShowLesson(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        List<Lesson> lessons = lessonService.findAllLessonByTeacherID(teacher.getId());
        modelMap.addAttribute("lessons", lessons);
        return "/admin/score_final_score_show_lesson";
    }

    @RequestMapping("/score/findFinalScore/showStudentsAndFinalScore")
    public String scoreFinalScore(@RequestParam("lessonID") int lessonID, ModelMap modelMap) {
        List<Lesson> lessonStudentsAndFinalScores = lessonService.findAllStudentsAndLessonFinalScoreByLessonID(lessonID);
        modelMap.addAttribute("lessonStudentsAndFinalScores", lessonStudentsAndFinalScores);
        modelMap.addAttribute("lessonID", lessonID);
        return "/admin/score_final_score_show_student_and_final_score";
    }

    @RequestMapping("/score/findFinalScore/showStudentsAndFinalScore/find")
    public String scoreFinalScoreFind(ModelMap modelMap, @RequestParam("lessonID") int lessonID) {
        List<Lesson> lessonStudentList = lessonService.findSampleStudentInfoByLessonID(lessonID);
        double tempExamScoreSum = 0.0;
        double tempHomeworkScoreSum = 0.0;
        for (Lesson examLessonStudent : lessonStudentList) {
            int id = examLessonStudent.getId();
            //得到考试总成绩
            List<Score> examScores = scoreService.findExamProportionAndScoreByStudentID(id);
            for (Score examScore : examScores) {
                tempExamScoreSum = tempExamScoreSum + examScore.getScore() * examScore.getProportion() / 100;
            }
            int examScoreSum = (int) tempExamScoreSum;

            //得到作业总成绩
            List<Score> homeworkScores = scoreService.findHomeworkProportionAndScoreByStudentID(id);
            for (Score homeworkScore : homeworkScores) {
                tempHomeworkScoreSum = tempHomeworkScoreSum + homeworkScore.getProportion() * homeworkScore.getScore() / 100;
            }
            int homeworkScoreSum = (int) tempHomeworkScoreSum;
            //得到总成绩
            int finalScore = homeworkScoreSum + examScoreSum;
            //将总成绩更新到表格中
            lessonService.updateFinalScore(finalScore, lessonID, id);
        }
        String returnUrl = "redirect:/admin/score/findFinalScore/showStudentsAndFinalScore?lessonID=" + lessonID;
        return returnUrl;
    }
}
