package com.shure.surdes.survey.service.impl;

import java.util.List;
import com.shure.surdes.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shure.surdes.survey.mapper.AnswerMapper;
import com.shure.surdes.survey.domain.Answer;
import com.shure.surdes.survey.service.IAnswerService;

/**
 * 问卷答案结果Service业务层处理
 *
 * @author Shure
 * @date 2021-10-18
 */
@Service
public class AnswerServiceImpl implements IAnswerService
{
    @Autowired
    private AnswerMapper answerMapper;

    /**
     * 查询问卷答案结果
     *
     * @param answerId 问卷答案结果主键
     * @return 问卷答案结果
     */
    @Override
    public Answer selectAnswerByAnswerId(Long answerId)
    {
        return answerMapper.selectAnswerByAnswerId(answerId);
    }

    /**
     * 查询问卷答案结果列表
     *
     * @param answer 问卷答案结果
     * @return 问卷答案结果
     */
    @Override
    public List<Answer> selectAnswerList(Answer answer)
    {
        return answerMapper.selectAnswerList(answer);
    }

    /**
     * 新增问卷答案结果
     *
     * @param answer 问卷答案结果
     * @return 结果
     */
    @Override
    public int insertAnswer(Answer answer)
    {
        answer.setCreateTime(DateUtils.getNowDate());
        return answerMapper.insertAnswer(answer);
    }

    /**
     * 修改问卷答案结果
     *
     * @param answer 问卷答案结果
     * @return 结果
     */
    @Override
    public int updateAnswer(Answer answer)
    {
        return answerMapper.updateAnswer(answer);
    }

    /**
     * 批量删除问卷答案结果
     *
     * @param answerIds 需要删除的问卷答案结果主键
     * @return 结果
     */
    @Override
    public int deleteAnswerByAnswerIds(Long[] answerIds)
    {
        return answerMapper.deleteAnswerByAnswerIds(answerIds);
    }

    /**
     * 删除问卷答案结果信息
     *
     * @param answerId 问卷答案结果主键
     * @return 结果
     */
    @Override
    public int deleteAnswerByAnswerId(Long answerId)
    {
        return answerMapper.deleteAnswerByAnswerId(answerId);
    }
}
