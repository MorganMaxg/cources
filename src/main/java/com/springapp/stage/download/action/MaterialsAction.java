package com.springapp.stage.download.action;

/**
 * Created by ASUS on 2015/4/23.
 */

import ch.qos.logback.classic.Logger;
import com.springapp.stage.download.entity.Material;
import com.springapp.stage.download.service.MaterialManager;
import com.springapp.stage.utils.FileUtils;
import com.springapp.stage.utils.Page;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MaterialsAction {
    private static Logger logger = (Logger) LoggerFactory.getLogger(MaterialsAction.class);
    private final Integer PAGE_SIZE = 2;
    private final String PART = "materials";
    @Autowired
    private MaterialManager materialManager;

    @RequestMapping("/stage/download/material/query")
    public String query(Integer materialId, String materialName, String uri, ModelMap model, HttpServletRequest request) {
        Page page = new Page();
        page.setPageNo(ServletRequestUtils.getIntParameter(request, "pageNo", 1));
        page.setPageSize(ServletRequestUtils.getIntParameter(request, "pageSize", PAGE_SIZE));
        List<Material> materials = new ArrayList<Material>();
        try {
            page.setTotalCount(ServletRequestUtils.getIntParameter(request, "totalCount",
                    materialManager.countMaterials(materialId, materialName, uri)));
            materials = materialManager.findMaterials(materialId, materialName, uri, page);
            model.addAttribute("materials", materials);
            model.addAttribute("page", page);
        } catch (Exception e) {
            logger.warn(e.getMessage(), e);
        }
        return "/download/find_materials";
    }

    @RequestMapping(value = "/stage/download/material/download")
    public HttpServletResponse download(String uri, String fileName, HttpServletRequest request, HttpServletResponse response) {
        return FileUtils.download(PART, uri, fileName, request, response);
    }
}
