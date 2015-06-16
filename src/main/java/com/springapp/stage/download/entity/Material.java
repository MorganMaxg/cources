package com.springapp.stage.download.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by ASUS on 2015/4/16.
 */
public class Material implements Serializable {
    private Integer materialId;
    private String materialName;//上传的文件名
    private String uri;//服务器上的文件名(时间戳)
    private String teacherName;
    private Integer teacherId;
    private Date createDate;

    public Integer getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
