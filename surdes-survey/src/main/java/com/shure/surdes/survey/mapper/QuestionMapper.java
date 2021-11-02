package com.shure.surdes.survey.mapper;

import com.shure.surdes.survey.domain.Question;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 问卷题目Mapper接口
 *
 * @author Shure
 * @date 2021-10-18
 */
@Mapper
public interface QuestionMapper {
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
     * 删除问卷题目
     *
     * @param questionId 问卷题目主键
     * @return 结果
     */
    public int deleteQuestionByQuestionId(Long questionId);

    /**
     * 批量删除问卷题目
     *
     * @param questionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteQuestionByQuestionIds(Long[] questionIds);

    /**
     * 根据问卷主键删除问题
     *
     * @param surveyIds
     * @return
     */
    public int deleteQuestionBySurveyIds(Long[] surveyIds);

    /**
     * 根据问卷主键查询问题列表
     *
     * @param surveyId
     * @return
     */
    List<Question> selectQuestionListBySurvey(Long surveyId);

    /**
     * 批量更新题目序号
     *
     * @param queNoes
     */
    void updateQuesiotnNo(List<Map<String, Object>> queNoes);
}
