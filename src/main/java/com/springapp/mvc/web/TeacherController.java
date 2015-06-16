package com.springapp.mvc.web;

import com.springapp.mvc.entity.Teacher;
import com.springapp.mvc.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by maomao on 2015/3/11.
 */
@Controller
@RequestMapping("/admin")
//@SessionAttributes("teacher")//将modelmap中的teacher属性放到session，实现跨请求访问。
//// 因为modelmap是request级别的,可以抛弃对servletapi的依赖
public class TeacherController {
    @Autowired
    TeacherService teacherService;

    @RequestMapping("/teacher")
    public String teacherBaseInfo(ModelMap modelMap, HttpSession session) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        modelMap.addAttribute("teacher", teacher);
        return "admin/teacher_base_info";
    }

    @RequestMapping("/teacher/management")
    public String teacherManage(ModelMap modelMap) {
        List<Teacher> teacherList = teacherService.findAllTeachers();
        modelMap.addAttribute("teachers", teacherList);
        return "/admin/teacher_management";
    }

    @RequestMapping("/teacher/add")
    public String addTeacherJSP() {
        return "/admin/teacher_add";
    }

    @RequestMapping("/teacher/update")
    public String updateTeacherJSP(int id, ModelMap modelMap) {
        modelMap.addAttribute("id", id);
        return "/admin/teacher_update";
    }


    @RequestMapping(value = "/teacher/add/save", method = RequestMethod.POST)
    public String addTeacher(HttpServletRequest request) {
        String teacherID = request.getParameter("teacherID");
        String teacherName = request.getParameter("teacherName");
        String basicInfo = request.getParameter("basicInfo");
        teacherService.addTeacher(teacherID, teacherName, basicInfo);
        return "redirect:/admin/teacher/add";
    }

    @RequestMapping("/teacher/update/save")
    public String updateTeacher(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Teacher teacher = teacherService.findOneTeachers(id);
        String teacherID = request.getParameter("teacherID");
        String teacherName = request.getParameter("teacherName");
        String basicInfo = request.getParameter("basicInfo");
        if (teacherID != "") {
            teacher.setTeacherID(teacherID);
        }
        if (teacherName != "") {
            teacher.setTeacherName(teacherName);
        }
        if (basicInfo != "") {
            teacher.setBasicInfo(basicInfo);
        }
        teacherService.updateTeacher(teacher);
        return "redirect:/admin/teacher/management";
    }

    @RequestMapping("/teacher/delete")
    public String deleteTeacher(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        teacherService.deleteTeacher(id);
        return "redirect:/admin/teacher/management";
    }
}
