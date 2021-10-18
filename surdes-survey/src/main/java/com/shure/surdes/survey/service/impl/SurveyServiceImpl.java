package com.shure.surdes.survey.service.impl;

import java.util.List;
import com.shure.surdes.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shure.surdes.survey.mapper.SurveyMapper;
import com.shure.surdes.survey.domain.Survey;
import com.shure.surdes.survey.service.ISurveyService;

/**
 * 问卷Service业务层处理
 *
 * @author Shure
 * @date 2021-10-18
 */
@Service
public class SurveyServiceImpl implements ISurveyService
{
    @Autowired
    private SurveyMapper surveyMapper;

    /**
     * 查询问卷
     *
     * @param surveyId 问卷主键
     * @return 问卷
     */
    @Override
    public Survey selectSurveyBySurveyId(Long surveyId)
    {
        return surveyMapper.selectSurveyBySurveyId(surveyId);
    }

    /**
     * 查询问卷列表
     *
     * @param survey 问卷
     * @return 问卷
     */
    @Override
    public List<Survey> selectSurveyList(Survey survey)
    {
        return surveyMapper.selectSurveyList(survey);
    }

    /**
     * 新增问卷
     *
     * @param survey 问卷
     * @return 结果
     */
    @Override
    public int insertSurvey(Survey survey)
    {
        survey.setCreateTime(DateUtils.getNowDate());
        return surveyMapper.insertSurvey(survey);
    }

    /**
     * 修改问卷
     *
     * @param survey 问卷
     * @return 结果
     */
    @Override
    public int updateSurvey(Survey survey)
    {
        return surveyMapper.updateSurvey(survey);
    }

    /**
     * 批量删除问卷
     *
     * @param surveyIds 需要删除的问卷主键
     * @return 结果
     */
    @Override
    public int deleteSurveyBySurveyIds(Long[] surveyIds)
    {
        return surveyMapper.deleteSurveyBySurveyIds(surveyIds);
    }

    /**
     * 删除问卷信息
     *
     * @param surveyId 问卷主键
     * @return 结果
     */
    @Override
    public int deleteSurveyBySurveyId(Long surveyId)
    {
        return surveyMapper.deleteSurveyBySurveyId(surveyId);
    }
}
