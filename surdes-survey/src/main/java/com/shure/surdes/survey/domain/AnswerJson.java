package com.shure.surdes.survey.domain;

import com.shure.surdes.common.annotation.Excel;
import com.shure.surdes.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 问卷答案结果json对象 tb_answer_json
 *
 * @author Shure
 * @date 2021-10-18
 */
public class AnswerJson extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 答案主键
     */
    private Long anId;

    /**
     * 问卷主键
     */
    @Excel(name = "问卷主键")
    private Long surveyId;

    /**
     * 答案结果，json格式存储
     */
    @Excel(name = "答案结果，json格式存储")
    private String answerJson;

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

    public void setAnId(Long anId) {
        this.anId = anId;
    }

    public Long getAnId() {
        return anId;
    }

    public void setSurveyId(Long surveyId) {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() {
        return surveyId;
    }

    public void setAnswerJson(String answerJson) {
        this.answerJson = answerJson;
    }

    public String getAnswerJson() {
        return answerJson;
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
                .append("anId", getAnId())
                .append("surveyId", getSurveyId())
                .append("answerJson", getAnswerJson())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("createTime", getCreateTime())
                .append("bookCode", getBookCode())
                .toString();
    }
}
