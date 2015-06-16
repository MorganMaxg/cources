package com.springapp.mvc.web;

import com.springapp.mvc.entity.Lesson;
import com.springapp.mvc.entity.Student;
import com.springapp.mvc.entity.Teacher;
import com.springapp.mvc.service.LessonService;
import com.springapp.mvc.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by maomao on 2015/3/11.
 */
@Controller
@RequestMapping("/admin")
public class StudentController {
    @Autowired
    StudentService studentService;
    @Autowired
    LessonService lessonService;

    @RequestMapping("/studentManage")
    public String findAllStudents(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Lesson> lessonList = lessonService.findAllLessonByTeacherID(teacherID);
        modelMap.addAttribute("lessons", lessonList);
        return "/admin/student_temp_management";
    }

    @RequestMapping("/lesson/students")
    public String showStudentsByLesson(ModelMap modelMap, HttpServletRequest request) {
        int lessonID = Integer.parseInt(request.getParameter("lessonID"));
        List<Lesson> lessonList = lessonService.findSampleStudentInfoByLessonID(lessonID);
        modelMap.addAttribute("lessonStudents", lessonList);
        return "/admin/student_management";
    }

    @RequestMapping("/addStudent")
    public String goToAddStudent(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        List<Lesson> lessons = lessonService.findAllLessonByTeacherID(teacher.getId());
        modelMap.addAttribute("lessons", lessons);
        return "admin/add_student";
    }

    @RequestMapping(value = "/add/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String insertStudent(@RequestParam("") String className, @RequestParam("studentID") String studentID,
                                @RequestParam("studentName") String studentName, ModelMap modelMap, HttpServletRequest request) {
        //保存学生信息到学生表
        int classID = studentService.classIDFindByName(className);
        int id = studentService.insertStudentAndReturnID(classID, studentID, studentName);         //得到添加学生后生成的主键
        //绑定课程学生
        int lessonID = Integer.parseInt(request.getParameter("lessonRadio"));
        lessonService.insertLessonStudnet(lessonID, id);
        return "redirect:/admin/addStudent";
    }

    @RequestMapping(value = "/update/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String updateStudent(ModelMap modelMap, HttpServletRequest request, HttpSession session) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Student student = studentService.findOneStudentByStudentID(id);
        String tempStudentName = request.getParameter("studentName");
        String tempStudentID = request.getParameter("studentID");
        String tempClassName = request.getParameter("className");
        if (tempStudentName != "") {
            student.setStudentName(tempStudentName);
        }
        if (tempStudentID != "") {
            student.setStudentID(tempStudentID);
        }
        if (tempClassName != "") {
            student.setClassName(tempClassName);
            int classID = studentService.classIDFindByName(student.getClassName());
            student.setClassID(classID);
        }
        studentService.updateStudent(student);

        return "redirect:/admin/studentManage";
    }

    @RequestMapping("/deleteStudent")
    public String deleteStudent(Integer id) {
        studentService.deleteStudent(id);
        return "redirect:/admin/studentManage";
    }

    @RequestMapping("/updateStudent")
    public String updateStudentJSP(Integer id, ModelMap modelMap) {
        modelMap.addAttribute("id", id);
        return "admin/student_update";
    }

    @RequestMapping("/findStudent")
    public String findStudent() {
        return "/admin/student_find";
    }

    @RequestMapping("/lesson/add")
    public String addLessonJSP(ModelMap modelMap) {
        return "admin/lesson_add";
    }

    @RequestMapping(value = "/lesson/add/save", method = RequestMethod.POST)
    public String addLesson(HttpSession session, HttpServletRequest request) {
        String lessonName = request.getParameter("lessonName");
        Date date = new Date();
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        lessonService.addLessonByTeacher(lessonName, teacherID, date);
        return "redirect:/admin/lesson/add";
    }
}
