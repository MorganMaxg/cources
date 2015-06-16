package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Material;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by maomao on 2015/4/20.
 */
public interface MaterialDao {
    public void addMaterial(Material material);

    public List<Material> findAllMaterial(@Param("teacherID") int teacherID);

    public Integer teacherIDFindByName(String teacherName);

    public void deleteMaterial(int materialID);

    public Material findMaterialByMaterialID(@Param("materialID") int materialID);
}
