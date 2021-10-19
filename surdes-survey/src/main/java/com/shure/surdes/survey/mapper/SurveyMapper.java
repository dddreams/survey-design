package com.shure.surdes.survey.mapper;

import com.shure.surdes.survey.domain.Survey;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 问卷Mapper接口
 *
 * @author Shure
 * @date 2021-10-18
 */
@Mapper
public interface SurveyMapper {
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
     * 删除问卷
     *
     * @param surveyId 问卷主键
     * @return 结果
     */
    public int deleteSurveyBySurveyId(Long surveyId);

    /**
     * 批量删除问卷
     *
     * @param surveyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 批量发布问卷
     *
     * @param surveyIds 需要发布的问卷主键集合
     * @return 结果
     */
    public int publishSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 永久删除问卷
     *
     * @param surveyId 问卷主键
     * @return 结果
     */
    public int removeSurveyBySurveyId(Long surveyId);

    /**
     * 永久删除问卷
     *
     * @param surveyIds 问卷主键集合
     * @return 结果
     */
    public int removeSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 批量还原问卷
     *
     * @param surveyIds 需要发布的问卷主键集合
     * @return 结果
     */
    int restoreSurveyBySurveyIds(Long[] surveyIds);

    /**
     * 撤销发布问卷
     *
     * @param surveyId 需要发布的问卷主键
     * @return 结果
     */
    int revokeSurveyBySurveyId(Long surveyId);
}
