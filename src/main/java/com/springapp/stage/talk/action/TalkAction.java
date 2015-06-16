package com.springapp.stage.talk.action;

import ch.qos.logback.classic.Logger;
import com.alibaba.fastjson.JSONObject;
import com.springapp.stage.security.entity.Student;
import com.springapp.stage.talk.entity.Comment;
import com.springapp.stage.talk.entity.Note;
import com.springapp.stage.talk.service.NoteManager;
import com.springapp.stage.utils.Page;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by ASUS on 2015/6/5.
 */
@Controller
@RequestMapping("/stage/talk")
public class TalkAction {
    private static Logger logger = (Logger) LoggerFactory.getLogger(TalkAction.class);


    @Autowired
    NoteManager noteManager;

    /**
     * 查询帖子
     *
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("query")
    public String query(
            Integer type,
            HttpServletRequest request,
            HttpSession session,
            ModelMap model
    ) {
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            return "/login";
        }
        Page<Note> page = new Page<Note>();
        page.setPageSize(10);
        Integer id = 0;
        page.setPageNo(ServletRequestUtils.getIntParameter(request, "pageNo", 1));
        if (type == 1) {
            id = student.getId();
        }
        page.setTotalCount(noteManager.findCount(id));
        List<Note> notes = noteManager.find(id, page);
        model.addAttribute("notes", notes);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        return "/talk/find_talk";
    }

    /**
     * 发帖/修改帖子-页面跳转
     */
    @RequestMapping(value = "modify", method = RequestMethod.GET)
    public String modify(
            Integer id,
            HttpServletRequest request,
            ModelMap model
    ) {
        Note note;
        if (id == null || id == 0) {
            note = new Note();
        } else {
            note = noteManager.findById(id);
        }
        model.addAttribute("note", note);
        return "/talk/modify";
    }

    /**
     *
     */
    @ResponseBody
    @RequestMapping(value = "modify", method = RequestMethod.POST)
    public String modify(
            Note note,
            HttpSession session
    ) {
        JSONObject data = new JSONObject();
        try {
            Student student = (Student) session.getAttribute("student");
            if (note.getNoteId() == null || note.getNoteId() == 0) {
                //保存新帖子
                note.setCreateDate(new Date());
                note.setCreaterId(student.getId());
                note.setCreaterName(student.getName());
                noteManager.save(note);
            } else {
                //更新帖子
                noteManager.update(note);
            }
            data.put("success", true);
        } catch (Exception e) {
            logger.warn("", e);
            data.put("success", false);
        }
        return data.toJSONString();
    }

    @ResponseBody
    @RequestMapping("delete")
    public String delete(Integer id) {
        JSONObject data = new JSONObject();
        if (id == null || id == 0) {
            data.put("success", false);
        } else {
            noteManager.deleteById(id);
            data.put("success", true);
        }
        return data.toJSONString();
    }

    /**
     * 查看回帖
     *
     * @param id
     * @param model
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("view")
    public String view(@RequestParam("id") Integer id, ModelMap model, HttpServletRequest request, HttpSession session) {
        Note note = noteManager.findById(id);
        Page<Comment> page = new Page<Comment>();
        page.setPageNo(ServletRequestUtils.getIntParameter(request, "pageNo", 1));
        page.setPageSize(10);
        page.setTotalCount(noteManager.findCommentCount(id));
        List<Comment> comments = noteManager.findComments(id, page);
        model.addAttribute("note", note);
        model.addAttribute("page", page);
        model.addAttribute("comments", comments);
        return "/talk/view";
    }

    /**
     * 评论弹框
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "comment", method = RequestMethod.GET)
    public String comment(Integer id, ModelMap model) {
        Note note = noteManager.findById(id);
        model.addAttribute("note", note);
        return "/talk/comment";
    }

    /**
     * 保存评论
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "comment", method = RequestMethod.POST)
    public String comment(Comment comment, HttpSession session) {
        JSONObject data = new JSONObject();
        try {
            Student student = (Student) session.getAttribute("student");
            comment.setCreaterId(student.getId());
            comment.setCreateDate(new Date());
            comment.setCreaterName(student.getName());
            Note note = noteManager.findById(comment.getNoteId());
            comment.setFloor(note.getCurrentFloor() + 1);
            noteManager.saveComment(comment);
            data.put("success", true);
        } catch (Exception e) {
            logger.warn("", e);
            data.put("success", false);
        }
        return data.toJSONString();
    }
}
