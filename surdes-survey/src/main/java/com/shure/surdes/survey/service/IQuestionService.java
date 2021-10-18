package com.shure.surdes.survey.service;

import java.util.List;
import com.shure.surdes.survey.domain.Question;

/**
 * 问卷题目Service接口
 * 
 * @author Shure
 * @date 2021-10-18
 */
public interface IQuestionService 
{
    /**
     * 查询问卷题目
     * 
     * @param questionId 问卷题目主键
     * @return 问卷题目
     */
    public Question selectQuestionByQuestionId(Long questionId);

    /**
     * 查询问卷题目列表
     * 
     * @param question 问卷题目
     * @return 问卷题目集合
     */
    public List<Question> selectQuestionList(Question question);

    /**
     * 新增问卷题目
     * 
     * @param question 问卷题目
     * @return 结果
     */
    public int insertQuestion(Question question);

    /**
     * 修改问卷题目
     * 
     * @param question 问卷题目
     * @return 结果
     */
    public int updateQuestion(Question question);

    /**
     * 批量删除问卷题目
     * 
     * @param questionIds 需要删除的问卷题目主键集合
     * @return 结果
     */
    public int deleteQuestionByQuestionIds(Long[] questionIds);

    /**
     * 删除问卷题目信息
     * 
     * @param questionId 问卷题目主键
     * @return 结果
     */
    public int deleteQuestionByQuestionId(Long questionId);
}