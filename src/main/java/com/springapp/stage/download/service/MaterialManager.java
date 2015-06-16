package com.springapp.stage.download.service;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.download.dao.MaterialDao;
import com.springapp.stage.download.entity.Material;
import com.springapp.stage.utils.Page;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ASUS on 2015/4/27.
 */
@Service
@Transactional
public class MaterialManager {
    private static Logger logger = (Logger) LoggerFactory.getLogger(MaterialManager.class);

    @Autowired
    private MaterialDao materialDao;

    public List<Material> findMaterials(Integer materialId, String materialName, String uri, Page page) throws Exception {
        return materialDao.findMaterials(materialId, materialName, uri, page);
    }

    public Integer countMaterials(Integer materialId, String materialName, String uri) throws Exception {
        return materialDao.countMaterials(materialId, materialName, uri);
    }
}
