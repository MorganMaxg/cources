package com.springapp.stage.talk.dao;

import com.springapp.stage.talk.entity.Comment;
import com.springapp.stage.utils.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS on 2015/6/6.
 */
public interface CommentDao {
    /**
     *
     */
    void save(Comment comment);

    /**
     *
     */
    List<Comment> find(
            @Param("noteId") Integer noteId,
            @Param("page") Page<Comment> page
    );

    /**
     *
     */
    Integer finfCount(@Param("noteId") Integer noteId);
}
