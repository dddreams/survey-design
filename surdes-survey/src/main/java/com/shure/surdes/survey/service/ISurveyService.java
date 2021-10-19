package com.shure.surdes.survey.service;

import com.shure.surdes.survey.domain.Survey;

import java.util.List;

/**
 * 问卷Service接口
 *
 * @author Shure
 * @date 2021-10-18
 */
public interface ISurveyService {
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
     * 批量永久删除问卷
     *
     * @param surveyIds 需要删除的问卷主键集合
     * @return 结果
     */
    public int deleteSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 永久删除问卷信息
     *
     * @param surveyId 问卷主键
     * @return 结果
     */
    public int deleteSurveyBySurveyId(Long surveyId);

    /**
     * 删除问卷信息
     *
     * @param surveyId 问卷主键
     * @return 结果
     */
    public int removeSurveyBySurveyId(Long surveyId);

    /**
     * 批量删除问卷
     *
     * @param surveyIds 需要删除的问卷主键集合
     * @return 结果
     */
    public int removeSurveyBySurveyIds(Long[] surveyIds);


    /**
     * 批量发布问卷
     *
     * @param surveyIds 需要发布的问卷主键集合
     * @return 结果
     */
    public int publishSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 批量还原问卷
     *
     * @param surveyIds 需要发布的问卷主键集合
     * @return 结果
     */
    public int restoreSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 撤销发布问卷
     *
     * @param surveyId 需要发布的问卷主键
     * @return 结果
     */
    public int revokeSurveyBySurveyId(Long surveyId);
}
