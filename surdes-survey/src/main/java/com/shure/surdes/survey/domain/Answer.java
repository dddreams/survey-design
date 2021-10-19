package com.shure.surdes.survey.domain;

import com.shure.surdes.common.annotation.Excel;
import com.shure.surdes.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 问卷答案结果对象 tb_answer
 *
 * @author Shure
 * @date 2021-10-18
 */
public class Answer extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 答案主键
     */
    private Long answerId;

    /**
     * 问卷主键
     */
    @Excel(name = "问卷主键")
    private Long surveyId;

    /**
     * 问题主键
     */
    @Excel(name = "问题主键")
    private Long questionId;

    /**
     * 选项编码
     */
    @Excel(name = "选项编码")
    private String optionCode;

    /**
     * 答案结果
     */
    @Excel(name = "答案结果")
    private String answerValue;

    /**
     * 扩展填空值
     */
    @Excel(name = "扩展填空值")
    private String extendValue;

    /**
     * 答题人唯一标识
     */
    @Excel(name = "答题人唯一标识")
    private String userId;

    /**
     * 答题人姓名
     */
    @Excel(name = "答题人姓名")
    private String userName;

    /**
     * 账套
     */
    @Excel(name = "账套")
    private String bookCode;

    public void setAnswerId(Long answerId) {
        this.answerId = answerId;
    }

    public Long getAnswerId() {
        return answerId;
    }

    public void setSurveyId(Long surveyId) {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() {
        return surveyId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setOptionCode(String optionCode) {
        this.optionCode = optionCode;
    }

    public String getOptionCode() {
        return optionCode;
    }

    public void setAnswerValue(String answerValue) {
        this.answerValue = answerValue;
    }

    public String getAnswerValue() {
        return answerValue;
    }

    public void setExtendValue(String extendValue) {
        this.extendValue = extendValue;
    }

    public String getExtendValue() {
        return extendValue;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setBookCode(String bookCode) {
        this.bookCode = bookCode;
    }

    public String getBookCode() {
        return bookCode;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("answerId", getAnswerId())
                .append("surveyId", getSurveyId())
                .append("questionId", getQuestionId())
                .append("optionCode", getOptionCode())
                .append("answerValue", getAnswerValue())
                .append("extendValue", getExtendValue())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("createTime", getCreateTime())
                .append("bookCode", getBookCode())
                .toString();
    }
}
