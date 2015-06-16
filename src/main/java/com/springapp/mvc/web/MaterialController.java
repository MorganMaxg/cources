package com.springapp.mvc.web;

import com.springapp.mvc.entity.Material;
import com.springapp.mvc.entity.Teacher;
import com.springapp.mvc.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by maomao on 2015/4/20.
 */
@Controller
@RequestMapping("/admin")
public class MaterialController {
    @Autowired
    MaterialService materialService;

    @RequestMapping("/material/management")
    public String findAllMaterial(HttpSession session, ModelMap modelMap) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        List<Material> materialList = materialService.findAllMaterial(teacherID);
        modelMap.addAttribute("material", materialList);
        return "/admin/material_management";
    }

    @RequestMapping("/material/uploadMaterial")
    public String goToUploadMaterial() {
        return "/admin/material_upload";
    }

    @RequestMapping("/material/deleteMaterial")
    public String deleteMaterial(Integer materialID) {
        materialService.deleteMaterial(materialID);
        return "redirect:/admin/material/management";
    }

    @RequestMapping("/material/updateMaterial")
    public String goToUpdateMaterial() {
        return "/admin/material_update";
    }

    @RequestMapping(value = "/material/uploadMaterial/save", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
    public String uploadMaterial(MultipartFile file, Material material,
                                 HttpServletRequest request, HttpSession session) {
        //将多文件信息存入数据库
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        int teacherID = teacher.getId();
        material.setTeacherID(teacherID);
        Date date = new Date();
        material.setMaterialName(file.getOriginalFilename());
        material.setCreateDate(date);
        long uri = System.currentTimeMillis();
        material.setUri("" + uri);
        materialService.addMaterial(material);
        //上传文件
        String part = "materials";//设置文件路径
        FileUtils.upload("" + uri, part, file, request);

        return "redirect:/admin/material/management";
    }

    @RequestMapping(value = "/material/download")
    public HttpServletResponse downloadMaterial(String uri, String materialName, HttpServletRequest request, HttpServletResponse response) {
        String part = "materials";
        return FileUtils.download(part, uri, materialName, request, response);
    }
}
