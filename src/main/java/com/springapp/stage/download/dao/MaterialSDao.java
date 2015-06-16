package com.springapp.stage.download.dao;

import com.springapp.stage.download.entity.Material;
import com.springapp.stage.utils.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS on 2015/4/27.
 */
public interface MaterialSDao {
    public List<Material> findMaterials(
            @Param("materialId") Integer materialId,
            @Param("materialName") String materialName,
            @Param("uri") String uri,
            @Param("page") Page page
    );

    public Integer countMaterials(
            @Param("materialId") Integer materialId,
            @Param("materialName") String materialName,
            @Param("uri") String uri
    );

}
