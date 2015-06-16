package com.springapp.mvc.service;

import com.springapp.mvc.dao.MaterialDao;
import com.springapp.mvc.entity.Material;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by maomao on 2015/4/20.
 */
@Service
@Transactional
public class MaterialService {
    @Autowired
    MaterialDao materialDao;

    public void addMaterial(Material material) {
        materialDao.addMaterial(material);
    }

    public List<Material> findAllMaterial(int teacherID) {
        return materialDao.findAllMaterial(teacherID);
    }

    public Integer teacherIDFindByName(String teacherName) {
        return materialDao.teacherIDFindByName(teacherName);
    }

    public void deleteMaterial(int materialID) {
        materialDao.deleteMaterial(materialID);
    }

    @Transactional
    public Material findMaterialByMaterialID(int materialID) {
        return materialDao.findMaterialByMaterialID(materialID);
    }
}
