package com.springapp.mvc.web;

import com.springapp.mvc.entity.Homework;
import com.springapp.mvc.entity.HomeworkStudents;
import com.springapp.mvc.entity.Lesson;
import com.springapp.mvc.entity.Teacher;
import com.springapp.mvc.service.HomeworkService;
import com.springapp.mvc.service.HomeworkStudentsService;
import com.springapp.mvc.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by maomao on 2015/5/3.
 */
@Controller
@RequestMapping("/admin")
public class HomeworkController {
    @Autowired
    HomeworkService homeworkService;
    @Autowired
    HomeworkStudentsService homeworkStudentsService;
    @Autowired
    LessonService lessonService;

    @RequestMapping("/homework/tempManagement")
    public String findAllHomeworkTempJSP(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Lesson> lessonList = lessonService.findAllLessonByTeacherID(teacherID);
        modelMap.addAttribute("lessons", lessonList);
        return "/admin/homework_temp_management";
    }

    @RequestMapping("/homework/management")
    public String findAllHomework(ModelMap modelMap, HttpServletRequest request) {
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        List<Homework> homeworkList = homeworkService.findAllHomeworkByLessonID(lessonID);
        modelMap.addAttribute("homeworks", homeworkList);
        return "/admin/homework_management";
    }

    @RequestMapping("/homework/addHomework")
    public String addHomeworkJSP(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Lesson> lessonList = lessonService.findAllLessonByTeacherID(teacherID);
        modelMap.addAttribute("lessons", lessonList);
        return "/admin/homework_add";
    }

    @RequestMapping("/checkHomework/tempCheckManagement")
    public String checkHomeworkTempManagementJSP(HttpSession session, ModelMap modelMap) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Lesson> lessonList = lessonService.findAllLessonByTeacherID(teacherID);
        modelMap.addAttribute("lessons", lessonList);
        return "/admin/homework_checking_temp_management";
    }

    @RequestMapping("/checkHomework/showHomeworkName")
    public String checkHomeworkJSP(ModelMap modelMap, HttpServletRequest request) {
        //查询一个课程里面的上交的所有学生的作业
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        List<Homework> homeworkList = homeworkService.findAllHomeworkByLessonID(lessonID);
        modelMap.addAttribute("homeworks", homeworkList);
        modelMap.addAttribute("lessonID", lessonID);
        return "/admin/homework_checking_show_name";
    }

    @RequestMapping("/homework/score/save")
    public String saveStudentHomeworkScore(HttpServletRequest request) {
        String[] arrScore = request.getParameterValues("score"); //学生成绩
        String[] arrID = request.getParameterValues("id");//作业学生表主键
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        int score;
        int id;
        for (int i = 0; i < arrScore.length; i++) {
            try {
                score = Integer.parseInt(arrScore[i]);
                id = Integer.parseInt(arrID[i]);
                homeworkStudentsService.updateScore(score, id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        String tempUrl = "redirect:/admin/checkHomework/showHomeworkName?lessonID=" + lessonID;
        return tempUrl;
    }

    @RequestMapping("/checkHomework/management")
    public String checkHomeworkManagement(@RequestParam("homeworkID") Integer homeworkID, @RequestParam("lessonID") Integer lessonID, ModelMap modelMap, HttpServletRequest request) {
        List<HomeworkStudents> homeworkStudentList = homeworkStudentsService.findAllHomeworkStudentsByHomeworkID(homeworkID, lessonID);
        modelMap.addAttribute("homeworkStudents", homeworkStudentList);
        modelMap.addAttribute("homeworkID", homeworkID);
        modelMap.addAttribute("lessonID", lessonID);
        return "/admin/homework_checking_management";
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request,
                              ServletRequestDataBinder binder) throws Exception {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        CustomDateEditor editor = new CustomDateEditor(df, false);
        binder.registerCustomEditor(Date.class, editor);
    }

    @RequestMapping(value = "/homework/uploadHomework/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String addHomework(@RequestParam("files") MultipartFile[] files, ModelMap modelMap, Homework homework,
                              HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        try {
            //先保存HOMEWORK信息到HOMEWORK表
            String[] lessonCheckBox = request.getParameterValues("lessonCheckBox");
            String part = "homework";
            String content = request.getParameter("content");
            String tempDeadline = request.getParameter("deadline");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date deadline = df.parse(tempDeadline);
            String fileName = files[0].getOriginalFilename();
            long uri = System.currentTimeMillis();
            homework.setTeacherUri("" + uri);
            homework.setTeacherFileName(fileName);
            homework.setContent(content);
            homework.setDeadline(deadline);
            //保存HOMEWORK信息并且返回刚插入数据的ID
            int homeworkID = homeworkService.addHomeworkAndReturnHomeworkID(homework);
            //保存每个班级对应的作业信息
            for (int i = 0; i < lessonCheckBox.length; i++) {
                int lessonID = Integer.parseInt(lessonCheckBox[i]);
                //绑定HOMEWORK和LESSON的属性
                int homeworkLessonID = homeworkService.addHomeworkAndLessonAndReturnHomeworkLessonID(homeworkID, lessonID);
                //同时绑定HOMEWORK和STUDENT的属性
                homeworkService.addHomeworkAndAddStudents(homeworkLessonID, homeworkID, lessonID);
            }
            FileUtils.upload("" + uri, part, files, request);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/homework/tempManagement";
    }

    @RequestMapping(value = "/homework/download", produces = "text/html;charset=GBK")
    public HttpServletResponse downloadTeacherHomework(String uri, String fileName, HttpServletRequest request, HttpServletResponse response) {
        String part = "homework";
        return FileUtils.download(part, uri, fileName, request, response);
    }
}
