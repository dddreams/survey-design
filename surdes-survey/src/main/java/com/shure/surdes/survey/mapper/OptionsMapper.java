package com.shure.surdes.survey.mapper;

import com.shure.surdes.survey.domain.Options;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 问卷选项Mapper接口
 *
 * @author Shure
 * @date 2021-10-18
 */
@Mapper
public interface OptionsMapper {
    /**
     * 查询问卷选项
     *
     * @param optionId 问卷选项主键
     * @return 问卷选项
     */
    public Options selectOptionsByOptionId(Long optionId);

    /**
     * 查询问卷选项列表
     *
     * @param options 问卷选项
     * @return 问卷选项集合
     */
    public List<Options> selectOptionsList(Options options);

    /**
     * 新增问卷选项
     *
     * @param options 问卷选项
     * @return 结果
     */
    public int insertOptions(Options options);

    /**
     * 批量新增问卷选项
     *
     * @param optionList 问卷选项列表
     * @return 结果
     */
    public int insertOptionBatch(@Param("optionList") List<Options> optionList);

    /**
     * 修改问卷选项
     *
     * @param options 问卷选项
     * @return 结果
     */
    public int updateOptions(Options options);

    /**
     * 删除问卷选项
     *
     * @param optionId 问卷选项主键
     * @return 结果
     */
    public int deleteOptionsByOptionId(Long optionId);

    /**
     * 批量删除问卷选项
     *
     * @param optionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOptionsByOptionIds(Long[] optionIds);

    /**
     * 根据问卷主键删除选项
     *
     * @param surveyIds 问卷主键
     * @return 结果
     */
    int deleteOptionsBySurveyIds(Long[] surveyIds);

    /**
     * 根据问题主键删除选项
     *
     * @param questionId 问题主键
     * @return 结果
     */
    int deleteOptionsByQuestionId(Long questionId);
}
