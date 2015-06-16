package com.springapp.mvc.web;

import com.springapp.mvc.entity.Teacher;
import com.springapp.mvc.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by maomao on 2015/6/3.
 */
@Controller
@RequestMapping("/admin")
public class LoginController {
    @Autowired
    TeacherService teacherService;

    @RequestMapping("/login")
    public String loginTeacher() {
        return "/admin/teacher_login";
    }

    @RequestMapping(value = "/login/checkLogin")
    public String checkLoginTeacher(HttpServletRequest request, HttpSession session) {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String correctPassword = teacherService.findPasswordByTeacherID(username);
            if (correctPassword.equals(password)) {
                String teacherID = username;
                Teacher teacher = teacherService.findByTeacherID(teacherID);
                session.setAttribute("teacher", teacher);
                String tempUrl = "redirect:/admin/teacher?teacherID=" + username;
                return tempUrl;
            } else {
                return "redirect:/admin/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/login";
        }

    }
}
