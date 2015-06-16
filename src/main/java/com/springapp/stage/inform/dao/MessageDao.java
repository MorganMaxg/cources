package com.springapp.stage.inform.dao;

import com.springapp.stage.inform.entity.Message;
import com.springapp.stage.utils.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS on 2015/4/28.
 */
public interface MessageDao {
    public List<Message> findMessages(@Param("page") Page page);

    public Integer countMessages();

    public Message findMessageById(@Param("id") Integer messageId);
}
