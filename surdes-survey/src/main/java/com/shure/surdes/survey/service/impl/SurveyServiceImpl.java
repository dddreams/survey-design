package com.shure.surdes.survey.service.impl;

import com.shure.surdes.common.utils.DateUtils;
import com.shure.surdes.survey.domain.Survey;
import com.shure.surdes.survey.mapper.SurveyMapper;
import com.shure.surdes.survey.service.ISurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 问卷Service业务层处理
 *
 * @author Shure
 * @date 2021-10-18
 */
@Service
public class SurveyServiceImpl implements ISurveyService {
    @Autowired
    private SurveyMapper surveyMapper;

    /**
     * 查询问卷
     *
     * @param surveyId 问卷主键
     * @return 问卷
     */
    @Override
    public Survey selectSurveyBySurveyId(Long surveyId) {
        return surveyMapper.selectSurveyBySurveyId(surveyId);
    }

    /**
     * 查询问卷列表
     *
     * @param survey 问卷
     * @return 问卷
     */
    @Override
    public List<Survey> selectSurveyList(Survey survey) {
        return surveyMapper.selectSurveyList(survey);
    }

    /**
     * 新增问卷
     *
     * @param survey 问卷
     * @return 结果
     */
    @Override
    public int insertSurvey(Survey survey) {
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
    public int updateSurvey(Survey survey) {
        return surveyMapper.updateSurvey(survey);
    }

    /**
     * 批量永久删除问卷
     *
     * @param surveyIds 需要永久删除的问卷主键
     * @return 结果
     */
    @Override
    public int deleteSurveyBySurveyIds(Long[] surveyIds) {
        return surveyMapper.deleteSurveyBySurveyIds(surveyIds);
    }

    /**
     * 永久删除问卷信息
     *
     * @param surveyId 问卷主键
     * @return 结果
     */
    @Override
    public int deleteSurveyBySurveyId(Long surveyId) {
        return surveyMapper.deleteSurveyBySurveyId(surveyId);
    }

    /**
     * 批量删除问卷
     *
     * @param surveyIds 需要删除的问卷主键
     * @return 结果
     */
    @Override
    public int removeSurveyBySurveyIds(Long[] surveyIds) {
        return surveyMapper.removeSurveyBySurveyIds(surveyIds);
    }

    /**
     * 删除问卷信息
     *
     * @param surveyId 问卷主键
     * @return 结果
     */
    @Override
    public int removeSurveyBySurveyId(Long surveyId) {
        return surveyMapper.removeSurveyBySurveyId(surveyId);
    }

    /**
     * 批量发布问卷
     *
     * @param surveyIds 需要发布的问卷主键集合
     * @return 结果
     */
    @Override
    public int publishSurveyBySurveyIds(Long[] surveyIds) {
        return surveyMapper.publishSurveyBySurveyIds(surveyIds);
    }

    /**
     * 批量还原问卷
     *
     * @param surveyIds 需要发布的问卷主键集合
     * @return 结果
     */
    @Override
    public int restoreSurveyBySurveyIds(Long[] surveyIds) {
        return surveyMapper.restoreSurveyBySurveyIds(surveyIds);
    }

    /**
     * 撤销发布问卷
     *
     * @param surveyId 需要发布的问卷主键
     * @return 结果
     */
    @Override
    public int revokeSurveyBySurveyId(Long surveyId) {
        return surveyMapper.revokeSurveyBySurveyId(surveyId);
    }
}
