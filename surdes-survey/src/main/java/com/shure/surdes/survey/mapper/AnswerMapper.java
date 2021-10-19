package com.shure.surdes.survey.mapper;

import com.shure.surdes.survey.domain.Answer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 问卷答案结果Mapper接口
 *
 * @author Shure
 * @date 2021-10-18
 */
@Mapper
public interface AnswerMapper {
    /**
     * 查询问卷答案结果
     *
     * @param answerId 问卷答案结果主键
     * @return 问卷答案结果
     */
    public Answer selectAnswerByAnswerId(Long answerId);

    /**
     * 查询问卷答案结果列表
     *
     * @param answer 问卷答案结果
     * @return 问卷答案结果集合
     */
    public List<Answer> selectAnswerList(Answer answer);

    /**
     * 新增问卷答案结果
     *
     * @param answer 问卷答案结果
     * @return 结果
     */
    public int insertAnswer(Answer answer);

    /**
     * 修改问卷答案结果
     *
     * @param answer 问卷答案结果
     * @return 结果
     */
    public int updateAnswer(Answer answer);

    /**
     * 删除问卷答案结果
     *
     * @param answerId 问卷答案结果主键
     * @return 结果
     */
    public int deleteAnswerByAnswerId(Long answerId);

    /**
     * 批量删除问卷答案结果
     *
     * @param answerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAnswerByAnswerIds(Long[] answerIds);

    /**
     * 根据问卷主键删除结果
     *
     * @param surveyIds
     * @return
     */
    int deleteAnswerBySurveyIds(Long[] surveyIds);
}
