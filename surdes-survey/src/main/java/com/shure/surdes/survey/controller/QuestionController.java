package com.shure.surdes.survey.controller;

import com.shure.surdes.common.annotation.Log;
import com.shure.surdes.common.core.controller.BaseController;
import com.shure.surdes.common.core.domain.AjaxResult;
import com.shure.surdes.common.core.page.TableDataInfo;
import com.shure.surdes.common.enums.BusinessType;
import com.shure.surdes.common.utils.poi.ExcelUtil;
import com.shure.surdes.survey.domain.Question;
import com.shure.surdes.survey.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 问卷题目Controller
 *
 * @author Shure
 * @date 2021-10-18
 */
@RestController
@RequestMapping("/survey/question")
public class QuestionController extends BaseController {
    @Autowired
    private IQuestionService questionService;

    /**
     * 查询问卷题目列表
     */
    @PreAuthorize("@ss.hasPermi('survey:question:list')")
    @GetMapping("/list")
    public TableDataInfo list(Question question) {
        startPage();
        List<Question> list = questionService.selectQuestionList(question);
        return getDataTable(list);
    }

    /**
     * 根据问卷主键查询问卷题目列表
     */
    @PreAuthorize("@ss.hasPermi('survey:question:list')")
    @GetMapping("/list/{surveyId}")
    public AjaxResult list(@PathVariable("surveyId") Long surveyId) {
        List<Question> list = questionService.selectQuestionListBySurveyId(surveyId);
        return AjaxResult.success(list);
    }

    /**
     * 导出问卷题目列表
     */
    @PreAuthorize("@ss.hasPermi('survey:question:export')")
    @Log(title = "问卷题目", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Question question) {
        List<Question> list = questionService.selectQuestionList(question);
        ExcelUtil<Question> util = new ExcelUtil<Question>(Question.class);
        return util.exportExcel(list, "问卷题目数据");
    }

    /**
     * 获取问卷题目详细信息
     */
    @PreAuthorize("@ss.hasPermi('survey:question:query')")
    @GetMapping(value = "/{questionId}")
    public AjaxResult getInfo(@PathVariable("questionId") Long questionId) {
        return AjaxResult.success(questionService.selectQuestionByQuestionId(questionId));
    }

    /**
     * 新增问卷题目
     */
    @PreAuthorize("@ss.hasPermi('survey:question:add')")
    @Log(title = "问卷题目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Question question) {
        return AjaxResult.success(questionService.insertQuestion(question));
    }

    /**
     * 修改问卷题目
     */
    @PreAuthorize("@ss.hasPermi('survey:question:edit')")
    @Log(title = "问卷题目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Question question) {
        return toAjax(questionService.updateQuestion(question));
    }

    /**
     * 删除问卷题目
     */
    @PreAuthorize("@ss.hasPermi('survey:question:remove')")
    @Log(title = "问卷题目", businessType = BusinessType.DELETE)
    @DeleteMapping("/{questionIds}")
    public AjaxResult remove(@PathVariable Long[] questionIds) {
        return toAjax(questionService.deleteQuestionByQuestionIds(questionIds));
    }

    /**
     * 更新问题序号和排序
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:edit')")
    @Log(title = "更新问题序号和排序", businessType = BusinessType.UPDATE)
    @PutMapping("/updateQueNo")
    public AjaxResult updateQueNo(@RequestBody List<Map<String, Object>> queNoes) {
        questionService.updateQuesiotnNo(queNoes);
        return AjaxResult.success();
    }
}
