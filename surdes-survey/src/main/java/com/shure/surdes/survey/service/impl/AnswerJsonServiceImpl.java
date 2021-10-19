package com.shure.surdes.survey.service.impl;

import com.shure.surdes.common.utils.DateUtils;
import com.shure.surdes.survey.domain.AnswerJson;
import com.shure.surdes.survey.mapper.AnswerJsonMapper;
import com.shure.surdes.survey.service.IAnswerJsonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 问卷答案结果jsonService业务层处理
 *
 * @author Shure
 * @date 2021-10-18
 */
@Service
public class AnswerJsonServiceImpl implements IAnswerJsonService {
    @Autowired
    private AnswerJsonMapper answerJsonMapper;

    /**
     * 查询问卷答案结果json
     *
     * @param anId 问卷答案结果json主键
     * @return 问卷答案结果json
     */
    @Override
    public AnswerJson selectAnswerJsonByAnId(Long anId) {
        return answerJsonMapper.selectAnswerJsonByAnId(anId);
    }

    /**
     * 查询问卷答案结果json列表
     *
     * @param answerJson 问卷答案结果json
     * @return 问卷答案结果json
     */
    @Override
    public List<AnswerJson> selectAnswerJsonList(AnswerJson answerJson) {
        return answerJsonMapper.selectAnswerJsonList(answerJson);
    }

    /**
     * 根据问卷主键查询问卷采集内容
     *
     * @param surveyId 问卷ID
     * @return 问卷答案结果json集合
     */
    @Override
    public List<AnswerJson> answerJsonBySurvey(Long surveyId) {
        return answerJsonMapper.answerJsonBySurvey(surveyId);
    }

    /**
     * 新增问卷答案结果json
     *
     * @param answerJson 问卷答案结果json
     * @return 结果
     */
    @Override
    public int insertAnswerJson(AnswerJson answerJson) {
        answerJson.setCreateTime(DateUtils.getNowDate());
        return answerJsonMapper.insertAnswerJson(answerJson);
    }

    /**
     * 修改问卷答案结果json
     *
     * @param answerJson 问卷答案结果json
     * @return 结果
     */
    @Override
    public int updateAnswerJson(AnswerJson answerJson) {
        return answerJsonMapper.updateAnswerJson(answerJson);
    }

    /**
     * 批量删除问卷答案结果json
     *
     * @param anIds 需要删除的问卷答案结果json主键
     * @return 结果
     */
    @Override
    public int deleteAnswerJsonByAnIds(Long[] anIds) {
        return answerJsonMapper.deleteAnswerJsonByAnIds(anIds);
    }

    /**
     * 删除问卷答案结果json信息
     *
     * @param anId 问卷答案结果json主键
     * @return 结果
     */
    @Override
    public int deleteAnswerJsonByAnId(Long anId) {
        return answerJsonMapper.deleteAnswerJsonByAnId(anId);
    }

    /**
     * 根据问卷主键删除答案结果
     *
     * @param surveyIds
     * @return
     */
    @Override
    public int deleteAnswerJsonBySurveyIds(Long[] surveyIds) {
        return answerJsonMapper.deleteAnswerJsonBySurveyIds(surveyIds);
    }
}
