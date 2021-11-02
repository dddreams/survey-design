package com.shure.surdes.survey.service.impl;

import com.shure.surdes.common.utils.DateUtils;
import com.shure.surdes.survey.domain.Options;
import com.shure.surdes.survey.mapper.OptionsMapper;
import com.shure.surdes.survey.service.IOptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 问卷选项Service业务层处理
 *
 * @author Shure
 * @date 2021-10-18
 */
@Service
public class OptionsServiceImpl implements IOptionsService {
    @Autowired
    private OptionsMapper optionsMapper;

    /**
     * 查询问卷选项
     *
     * @param optionId 问卷选项主键
     * @return 问卷选项
     */
    @Override
    public Options selectOptionsByOptionId(Long optionId) {
        return optionsMapper.selectOptionsByOptionId(optionId);
    }

    /**
     * 查询问卷选项列表
     *
     * @param options 问卷选项
     * @return 问卷选项
     */
    @Override
    public List<Options> selectOptionsList(Options options) {
        return optionsMapper.selectOptionsList(options);
    }

    /**
     * 新增问卷选项
     *
     * @param options 问卷选项
     * @return 结果
     */
    @Override
    public int insertOptions(Options options) {
        options.setCreateTime(DateUtils.getNowDate());
        return optionsMapper.insertOptions(options);
    }

    @Override
    public int insertOptionBatch(List<Options> optionsList) {
        return optionsMapper.insertOptionBatch(optionsList);
    }

    /**
     * 修改问卷选项
     *
     * @param options 问卷选项
     * @return 结果
     */
    @Override
    public int updateOptions(Options options) {
        return optionsMapper.updateOptions(options);
    }

    /**
     * 批量删除问卷选项
     *
     * @param optionIds 需要删除的问卷选项主键
     * @return 结果
     */
    @Override
    public int deleteOptionsByOptionIds(Long[] optionIds) {
        return optionsMapper.deleteOptionsByOptionIds(optionIds);
    }

    /**
     * 删除问卷选项信息
     *
     * @param optionId 问卷选项主键
     * @return 结果
     */
    @Override
    public int deleteOptionsByOptionId(Long optionId) {
        return optionsMapper.deleteOptionsByOptionId(optionId);
    }

    /**
     * 根据问卷主键删除选项
     *
     * @param surveyIds 问卷主键
     * @return 结果
     */
    @Override
    public int deleteOptionsBySurveyIds(Long[] surveyIds) {
        return optionsMapper.deleteOptionsBySurveyIds(surveyIds);
    }

    /**
     * 根据问题主键删除选项
     *
     * @param questionId 问题主键
     * @return 结果
     */
    @Override
    public int deleteOptionsByQuestionId(Long questionId) {
        return optionsMapper.deleteOptionsByQuestionId(questionId);
    }
}
