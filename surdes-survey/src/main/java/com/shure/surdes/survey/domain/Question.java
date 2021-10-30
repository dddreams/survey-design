package com.shure.surdes.survey.domain;

import com.shure.surdes.common.annotation.Excel;
import com.shure.surdes.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;

/**
 * 问卷题目对象 tb_question
 *
 * @author Shure
 * @date 2021-10-18
 */
public class Question extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 题目主键
     */
    private Long questionId;

    /**
     * 问卷主键
     */
    @Excel(name = "问卷主键")
    private Long surveyId;

    /**
     * 题目编号
     */
    @Excel(name = "题目编号")
    private String questionNo;

    /**
     * 排序字段
     */
    @Excel(name = "排序字段")
    private Integer questionSort;

    /**
     * 题目名称
     */
    @Excel(name = "题目名称")
    private String questionName;

    /**
     * 题目类型（01：填空题，02：单选题，03：多选题，04：多行文本题）
     */
    @Excel(name = "题目类型", readConverterExp = "0=1：填空题，02：单选题，03：多选题，04：多行文本题")
    private String questionType;

    /**
     * 校验规则
     */
    @Excel(name = "校验规则")
    private String validateRule;

    /**
     * 初始是否隐藏（1：是，0：否）
     */
    @Excel(name = "初始是否隐藏", readConverterExp = "1=：是，0：否")
    private String showOrHide;

    /**
     * 题目属性
     */
    @Excel(name = "题目属性")
    private String questionAttr;

    /**
     * 关联结果字段
     */
    @Excel(name = "关联结果字段")
    private String relationResult;

    /**
     * 只读标识 1 为不能编辑
     */
    @Excel(name = "只读标识 1 为不能编辑")
    private String notEdit;

    /**
     * 默认值
     */
    @Excel(name = "默认值")
    private String defaultValue;

    /**
     * 结果计算公式
     */
    @Excel(name = "结果计算公式")
    private String formula;

    /**
     * 选项显示方向
     */
    @Excel(name = "选项显示方向")
    private String optionDisplay;

    /**
     * 账套
     */
    @Excel(name = "账套")
    private String bookCode;

    /**
     * 题目选项列表
     */
    private List<Options> options;

    /**
     * 题目结果
     */
    private Answer answer;

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setSurveyId(Long surveyId) {
        this.surveyId = surveyId;
    }

    public Long getSurveyId() {
        return surveyId;
    }

    public void setQuestionNo(String questionNo) {
        this.questionNo = questionNo;
    }

    public String getQuestionNo() {
        return questionNo;
    }

    public void setQuestionSort(Integer questionSort) {
        this.questionSort = questionSort;
    }

    public Integer getQuestionSort() {
        return questionSort;
    }

    public void setQuestionName(String questionName) {
        this.questionName = questionName;
    }

    public String getQuestionName() {
        return questionName;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setValidateRule(String validateRule) {
        this.validateRule = validateRule;
    }

    public String getValidateRule() {
        return validateRule;
    }

    public void setShowOrHide(String showOrHide) {
        this.showOrHide = showOrHide;
    }

    public String getShowOrHide() {
        return showOrHide;
    }

    public void setQuestionAttr(String questionAttr) {
        this.questionAttr = questionAttr;
    }

    public String getQuestionAttr() {
        return questionAttr;
    }

    public void setRelationResult(String relationResult) {
        this.relationResult = relationResult;
    }

    public String getRelationResult() {
        return relationResult;
    }

    public void setNotEdit(String notEdit) {
        this.notEdit = notEdit;
    }

    public String getNotEdit() {
        return notEdit;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    public String getFormula() {
        return formula;
    }

    public void setBookCode(String bookCode) {
        this.bookCode = bookCode;
    }

    public String getBookCode() {
        return bookCode;
    }

    public String getOptionDisplay() {
        return optionDisplay;
    }

    public void setOptionDisplay(String optionDisplay) {
        this.optionDisplay = optionDisplay;
    }

    public List<Options> getOptions() {
        return options;
    }

    public void setOptions(List<Options> options) {
        this.options = options;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("questionId", getQuestionId())
                .append("surveyId", getSurveyId())
                .append("questionNo", getQuestionNo())
                .append("questionSort", getQuestionSort())
                .append("questionName", getQuestionName())
                .append("questionType", getQuestionType())
                .append("validateRule", getValidateRule())
                .append("showOrHide", getShowOrHide())
                .append("createTime", getCreateTime())
                .append("questionAttr", getQuestionAttr())
                .append("relationResult", getRelationResult())
                .append("notEdit", getNotEdit())
                .append("defaultValue", getDefaultValue())
                .append("formula", getFormula())
                .append("optionDisplay", getOptionDisplay())
                .append("bookCode", getBookCode())
                .toString();
    }
}
