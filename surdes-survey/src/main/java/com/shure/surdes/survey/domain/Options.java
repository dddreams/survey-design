package com.shure.surdes.survey.domain;

import com.shure.surdes.common.annotation.Excel;
import com.shure.surdes.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 问卷选项对象 tb_options
 *
 * @author Shure
 * @date 2021-10-18
 */
public class Options extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 选项主键
     */
    private Long optionId;

    /**
     * 问题主键
     */
    @Excel(name = "问题主键")
    private Long questionId;

    /**
     * 选项值
     */
    @Excel(name = "选项值")
    private String optionCode;

    /**
     * 选项文本
     */
    @Excel(name = "选项文本")
    private String optionText;

    /**
     * 选项序号
     */
    @Excel(name = "选项序号")
    private Integer optionNo;

    /**
     * 逻辑隐藏题
     */
    @Excel(name = "逻辑隐藏题")
    private String hideQuestion;

    /**
     * 逻辑显示题
     */
    @Excel(name = "逻辑显示题")
    private String showQuestion;

    /**
     * 是否设置问题（1：是，0：否）
     */
    @Excel(name = "是否设置问题", readConverterExp = "1=：是，0：否")
    private String isWtqd;

    /**
     * 问题清单分类
     */
    @Excel(name = "问题清单分类")
    private String wtqdType;

    /**
     * 比较值
     */
    @Excel(name = "比较值")
    private String wtqdValue;

    /**
     * 比较逻辑（使用字典）
     */
    @Excel(name = "比较逻辑", readConverterExp = "使=用字典")
    private String wtqdSymbol;

    /**
     * 问题清单描述
     */
    @Excel(name = "问题清单描述")
    private String wtqdDesc;

    /**
     * 是否扩展填空（1：是，0：否）
     */
    @Excel(name = "是否扩展填空", readConverterExp = "1=：是，0：否")
    private String isExtend;

    /**
     * 显示逻辑比较符
     */
    @Excel(name = "显示逻辑比较符")
    private String logicSymbol;

    /**
     * 问卷主键
     */
    @Excel(name = "问卷主键")
    private Long surveyId;

    /**
     * 帐套编码
     */
    @Excel(name = "帐套编码")
    private String bookCode;

    public void setOptionId(Long optionId) {
        this.optionId = optionId;
    }

    public Long getOptionId() {
        return optionId;
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

    public void setOptionText(String optionText) {
        this.optionText = optionText;
    }

    public String getOptionText() {
        return optionText;
    }

    public void setOptionNo(Integer optionNo) {
        this.optionNo = optionNo;
    }

    public Integer getOptionNo() {
        return optionNo;
    }

    public void setHideQuestion(String hideQuestion) {
        this.hideQuestion = hideQuestion;
    }

    public String getHideQuestion() {
        return hideQuestion;
    }

    public void setShowQuestion(String showQuestion) {
        this.showQuestion = showQuestion;
    }

    public String getShowQuestion() {
        return showQuestion;
    }

    public void setIsWtqd(String isWtqd) {
        this.isWtqd = isWtqd;
    }

    public String getIsWtqd() {
        return isWtqd;
    }

    public void setWtqdType(String wtqdType) {
        this.wtqdType = wtqdType;
    }

    public String getWtqdType() {
        return wtqdType;
    }

    public void setWtqdValue(String wtqdValue) {
        this.wtqdValue = wtqdValue;
    }

    public String getWtqdValue() {
        return wtqdValue;
    }

    public void setWtqdSymbol(String wtqdSymbol) {
        this.wtqdSymbol = wtqdSymbol;
    }

    public String getWtqdSymbol() {
        return wtqdSymbol;
    }

    public void setWtqdDesc(String wtqdDesc) {
        this.wtqdDesc = wtqdDesc;
    }

    public String getWtqdDesc() {
        return wtqdDesc;
    }

    public void setIsExtend(String isExtend) {
        this.isExtend = isExtend;
    }

    public String getIsExtend() {
        return isExtend;
    }

    public void setLogicSymbol(String logicSymbol) {
        this.logicSymbol = logicSymbol;
    }

    public String getLogicSymbol() {
        return logicSymbol;
    }

    public void setSurveyId(Long surveyId) {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() {
        return surveyId;
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
                .append("optionId", getOptionId())
                .append("questionId", getQuestionId())
                .append("optionCode", getOptionCode())
                .append("optionText", getOptionText())
                .append("optionNo", getOptionNo())
                .append("hideQuestion", getHideQuestion())
                .append("showQuestion", getShowQuestion())
                .append("isWtqd", getIsWtqd())
                .append("wtqdType", getWtqdType())
                .append("wtqdValue", getWtqdValue())
                .append("wtqdSymbol", getWtqdSymbol())
                .append("wtqdDesc", getWtqdDesc())
                .append("isExtend", getIsExtend())
                .append("createTime", getCreateTime())
                .append("logicSymbol", getLogicSymbol())
                .append("surveyId", getSurveyId())
                .append("bookCode", getBookCode())
                .toString();
    }
}
