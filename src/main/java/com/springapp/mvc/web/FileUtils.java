package com.springapp.mvc.web;

import com.alibaba.fastjson.JSONObject;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by ASUS on 2015/4/26.
 */
public class FileUtils {
    //批量文件上传
    public static String upload(String uri, String part, MultipartFile[] files, HttpServletRequest request) {
        JSONObject data = new JSONObject();
        try {
            for (MultipartFile file : files) {
                File file1 = new File(request.getSession().getServletContext().getRealPath("/WEB-INF/files/" + part + "/")
                        , "" + uri
                );
                if (!file1.exists()) {
                    file1.createNewFile();
                }
                FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(file1));
            }
            data.put("success", true);
            data.put("message", "上传成功");
        } catch (Exception e) {
            data.put("success", false);
            data.put("message", e.getMessage());
        }

        return data.toJSONString();
    }

    //单文件上传
    public static String upload(String uri, String part, MultipartFile file, HttpServletRequest request) {
        JSONObject data = new JSONObject();
        try {
            File file1 = new File(request.getSession().getServletContext().getRealPath("/WEB-INF/files/" + part + "/")
                    , "" + uri
            );
            if (!file1.exists()) {
                file1.createNewFile();
            }
            FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(file1));
            data.put("success", true);
            data.put("message", "上传成功");
        } catch (Exception e) {
            data.put("success", false);
            data.put("message", e.getMessage());
        }

        return data.toJSONString();
    }

    //下载功能
    public static HttpServletResponse download(String part, String uri, String fileName, HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName="
                + fileName);
        try {
            File downloadFile = new File(request.getSession().getServletContext().getRealPath("/WEB-INF/files/" + part + "/"), uri);
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            InputStream in = new FileInputStream(downloadFile);
            byte[] buffer = new byte[in.available()];
            in.read(buffer);
            in.close();
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

}

