package com.shure.surdes.survey.service;

import java.util.List;
import com.shure.surdes.survey.domain.Survey;

/**
 * 问卷Service接口
 * 
 * @author Shure
 * @date 2021-10-18
 */
public interface ISurveyService 
{
    /**
     * 查询问卷
     * 
     * @param surveyId 问卷主键
     * @return 问卷
     */
    public Survey selectSurveyBySurveyId(Long surveyId);

    /**
     * 查询问卷列表
     * 
     * @param survey 问卷
     * @return 问卷集合
     */
    public List<Survey> selectSurveyList(Survey survey);

    /**
     * 新增问卷
     * 
     * @param survey 问卷
     * @return 结果
     */
    public int insertSurvey(Survey survey);

    /**
     * 修改问卷
     * 
     * @param survey 问卷
     * @return 结果
     */
    public int updateSurvey(Survey survey);

    /**
     * 批量删除问卷
     * 
     * @param surveyIds 需要删除的问卷主键集合
     * @return 结果
     */
    public int deleteSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 删除问卷信息
     * 
     * @param surveyId 问卷主键
     * @return 结果
     */
    public int deleteSurveyBySurveyId(Long surveyId);
}
