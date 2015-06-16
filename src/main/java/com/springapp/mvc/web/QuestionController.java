package com.springapp.mvc.web;

import com.alibaba.fastjson.JSON;
import com.springapp.mvc.entity.Question;
import com.springapp.mvc.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by maomao on 2015/4/24.
 */
@Controller
@RequestMapping("/admin")
public class QuestionController {
    @Autowired
    QuestionService questionService;

    @RequestMapping("/question/management")
    public String findQuestions() {
        return "/admin/question_management";
    }

    @RequestMapping("/singleChoiceQuestion/management")
    public String findSingleChoiceQuestion(ModelMap modelMap) {
        List<Question> questionList = questionService.findSingleChoiceQuestion();
        modelMap.addAttribute("questions", questionList);
        return "/admin/question_single_choice_management";
    }

    @RequestMapping("/checkingQuestion/management")
    public String findCheckingQuestion(ModelMap modelMap) {
        List<Question> questionList = questionService.findCheckingQuestion();
        modelMap.addAttribute("questions", questionList);
        return "/admin/question_checking_management";
    }

    @RequestMapping("/subjectiveItemQuestion/management")
    public String findSubjectiveItemQuestion(ModelMap modelMap) {
        List<Question> questionList = questionService.findSubjectiveItemQuestion();
        modelMap.addAttribute("questions", questionList);
        return "/admin/question_subjective_item_management";
    }

    @RequestMapping("/shortAnswerQuestion/management")
    public String findShortAnswerQuestion(ModelMap modelMap) {
        List<Question> questionList = questionService.findShortAnswerQuestion();
        modelMap.addAttribute("questions", questionList);
        return "/admin/question_short_answer_management";
    }

    @RequestMapping("/question/addSingleChoice")
    public String addSingleChoiceQuestionJSP() {
        return "/admin/question_add_single_choice";
    }

    @RequestMapping("/question/addChecking")
    public String addSubjectiveItemQuestionJSP() {
        return "/admin/question_add_checking";
    }

    @RequestMapping("/question/addShortAnswer")
    public String addShortAnswerQuestionJSP() {
        return "/admin/question_add_short_answer";
    }

    @RequestMapping("/question/addSubjectiveItem")
    public String addCheckingQuestionJSP() {
        return "/admin/question_add_subjective_item";
    }

    @RequestMapping(value = "/question/addSingleChoice/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String addSingleChoiceQuestion(ModelMap modelMap, HttpServletRequest request) {
        Map<String, String> map = new HashMap();
        Question question = new Question();
        question.setQuestionType("单选题");
        String content = request.getParameter("content");
        question.setContent(content);
        String[] answerArray = request.getParameterValues("answer");
        if (answerArray[0].equals("1")) {
            question.setAnswer("A");
        } else if (answerArray[0].equals("2")) {
            question.setAnswer("B");
        } else if (answerArray[0].equals("3")) {
            question.setAnswer("C");
        } else if (answerArray[0].equals("4")) {
            question.setAnswer("D");
        }
        map.put("A", request.getParameter("map['choiceA']"));
        map.put("B", request.getParameter("map['choiceB']"));
        map.put("C", request.getParameter("map['choiceC']"));
        map.put("D", request.getParameter("map['choiceD']"));
        String choices = JSON.toJSONString(map);
        question.setChoices(choices);
        questionService.addSingleChoiceQuestion(question);
        return "redirect:/admin/singleChoiceQuestion/management";
    }

    @RequestMapping(value = "/question/addChecking/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String addCheckingQuestion(HttpServletRequest request) {
        Map<String, String> map = new HashMap();
        Question question = new Question();
        question.setQuestionType("判断题");
        String content = request.getParameter("content");
        question.setContent(content);
        String[] answerArray = request.getParameterValues("answer");
        if (answerArray[0].equals("1")) {
            question.setAnswer("Y");
        } else if (answerArray[0].equals("2")) {
            question.setAnswer("N");
        }
        map.put("Y", "对");
        map.put("N", "错");
        String choices = JSON.toJSONString(map);
        question.setChoices(choices);
        questionService.addCheckingQuestion(question);
        return "redirect:/admin/checkingQuestion/management";
    }

    @RequestMapping(value = "/question/addSubjectiveItem/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String addSubjectiveItemQuestion(HttpServletRequest request) {
        Question question = new Question();
        question.setQuestionType("主观题");
        String content = request.getParameter("content");
        question.setContent(content);
        String answer = request.getParameter("answer");
        question.setAnswer(answer);
        question.setChoices("");
        questionService.addSubjectiveItemQuestion(question);
        return "redirect:/admin/subjectiveItemQuestion/management";
    }

    @RequestMapping(value = "/question/addShortAnswer/save", method = RequestMethod.POST, produces = "text/html;charset=GBK")
    public String addShortAnswerQuestion(ModelMap modelMap, HttpServletRequest request) {
        Question question = new Question();
        question.setQuestionType("简答题");
        String content = request.getParameter("content");
        question.setContent(content);
        String answer = request.getParameter("answer");
        question.setAnswer(answer);
        question.setChoices("");
        questionService.addShortAnswerQuestion(question);
        return "redirect:/admin/shortAnswerQuestion/management";
    }
}
