package com.shure.surdes.survey.service.impl;

import com.shure.surdes.common.utils.DateUtils;
import com.shure.surdes.common.utils.StringUtils;
import com.shure.surdes.survey.domain.Options;
import com.shure.surdes.survey.domain.Question;
import com.shure.surdes.survey.mapper.QuestionMapper;
import com.shure.surdes.survey.service.IOptionsService;
import com.shure.surdes.survey.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 问卷题目Service业务层处理
 *
 * @author Shure
 * @date 2021-10-18
 */
@Service
public class QuestionServiceImpl implements IQuestionService {
    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private IOptionsService optionsService;

    /**
     * 查询问卷题目
     *
     * @param questionId 问卷题目主键
     * @return 问卷题目
     */
    @Override
    public Question selectQuestionByQuestionId(Long questionId) {
        return questionMapper.selectQuestionByQuestionId(questionId);
    }

    /**
     * 查询问卷题目列表
     *
     * @param question 问卷题目
     * @return 问卷题目
     */
    @Override
    public List<Question> selectQuestionList(Question question) {
        return questionMapper.selectQuestionList(question);
    }

    /**
     * 根据问卷主键查询问卷题目列表
     *
     * @param surveyId 问卷主键
     * @return 问卷题目集合
     */
    @Override
    public List<Question> selectQuestionListBySurveyId(Long surveyId) {
        return questionMapper.selectQuestionListBySurvey(surveyId);
    }

    /**
     * 新增问卷题目
     *
     * @param question 问卷题目
     * @return 结果
     */
    @Override
    public Question insertQuestion(Question question) {
        if (StringUtils.isNotNull(question.getQuestionId())) {
            question.setUpdateTime(DateUtils.getNowDate());
            questionMapper.updateQuestion(question);
        } else {
            question.setCreateTime(DateUtils.getNowDate());
            questionMapper.insertQuestion(question);
        }
        List<Options> options = question.getOptions();
        if (!options.isEmpty()) {
            optionsService.deleteOptionsByQuestionId(question.getQuestionId());
            for (Options o : options) {
                o.setCreateTime(DateUtils.getNowDate());
                o.setQuestionId(question.getQuestionId());
            }
            optionsService.insertOptionBatch(options);
        }
        return question;
    }

    /**
     * 修改问卷题目
     *
     * @param question 问卷题目
     * @return 结果
     */
    @Override
    public int updateQuestion(Question question) {
        return questionMapper.updateQuestion(question);
    }

    /**
     * 批量删除问卷题目
     *
     * @param questionIds 需要删除的问卷题目主键
     * @return 结果
     */
    @Override
    public int deleteQuestionByQuestionIds(Long[] questionIds) {
        return questionMapper.deleteQuestionByQuestionIds(questionIds);
    }

    /**
     * 删除问卷题目信息
     *
     * @param questionId 问卷题目主键
     * @return 结果
     */
    @Override
    public int deleteQuestionByQuestionId(Long questionId) {
        optionsService.deleteOptionsByQuestionId(questionId);
        return questionMapper.deleteQuestionByQuestionId(questionId);
    }

    /**
     * 根据问卷主键删除问题
     *
     * @param surveyIds
     * @return
     */
    @Override
    public int deleteQuestionBySurveyIds(Long[] surveyIds) {
        optionsService.deleteOptionsBySurveyIds(surveyIds);
        return questionMapper.deleteQuestionBySurveyIds(surveyIds);
    }

    /**
     * 批量更新题目序号
     *
     * @param queNoes
     */
    @Override
    public void updateQuesiotnNo(List<Map<String, Object>> queNoes) {
        questionMapper.updateQuesiotnNo(queNoes);
    }
}
