package com.shure.surdes.survey.controller;

import com.shure.surdes.common.annotation.Log;
import com.shure.surdes.common.core.controller.BaseController;
import com.shure.surdes.common.core.domain.AjaxResult;
import com.shure.surdes.common.core.page.TableDataInfo;
import com.shure.surdes.common.enums.BusinessType;
import com.shure.surdes.common.utils.poi.ExcelUtil;
import com.shure.surdes.survey.domain.AnswerJson;
import com.shure.surdes.survey.domain.Survey;
import com.shure.surdes.survey.service.IAnswerJsonService;
import com.shure.surdes.survey.service.IAnswerService;
import com.shure.surdes.survey.service.IQuestionService;
import com.shure.surdes.survey.service.ISurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 问卷Controller
 *
 * @author Shure
 * @date 2021-10-18
 */
@RestController
@RequestMapping("/survey/survey")
public class SurveyController extends BaseController {

    @Autowired
    private ISurveyService surveyService;
    @Autowired
    private IQuestionService questionService;
    @Autowired
    private IAnswerJsonService answerJsonService;
    @Autowired
    private IAnswerService answerService;


    /**
     * 查询问卷列表
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:list')")
    @GetMapping("/list")
    public TableDataInfo list(Survey survey) {
        startPage();
        List<Survey> list = surveyService.selectSurveyList(survey);
        return getDataTable(list);
    }

    /**
     * 导出问卷列表
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:export')")
    @Log(title = "问卷导出", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Survey survey) {
        List<Survey> list = surveyService.selectSurveyList(survey);
        ExcelUtil<Survey> util = new ExcelUtil<Survey>(Survey.class);
        return util.exportExcel(list, "问卷数据");
    }

    /**
     * 获取问卷详细信息
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:query')")
    @GetMapping(value = "/{surveyId}")
    public AjaxResult getInfo(@PathVariable("surveyId") Long surveyId) {
        return AjaxResult.success(surveyService.selectSurveyBySurveyId(surveyId));
    }

    /**
     * 新增问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:add')")
    @Log(title = "问卷新增", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Survey survey) {
        survey.setUserId(getUserId());
        return toAjax(surveyService.insertSurvey(survey));
    }

    /**
     * 修改问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:edit')")
    @Log(title = "问卷修改", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Survey survey) {
        return toAjax(surveyService.updateSurvey(survey));
    }

    /**
     * 删除问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:remove')")
    @Log(title = "问卷删除", businessType = BusinessType.UPDATE)
    @PutMapping("/remove/{surveyIds}")
    public AjaxResult remove(@PathVariable Long[] surveyIds) {
        return toAjax(surveyService.removeSurveyBySurveyIds(surveyIds));
    }

    /**
     * 还原问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:restore')")
    @Log(title = "问卷还原", businessType = BusinessType.DELETE)
    @PutMapping("/restore/{surveyIds}")
    public AjaxResult restore(@PathVariable Long[] surveyIds) {
        return toAjax(surveyService.restoreSurveyBySurveyIds(surveyIds));
    }

    /**
     * 永久删除问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:delete')")
    @Log(title = "问卷删除", businessType = BusinessType.DELETE)
    @DeleteMapping("/{surveyIds}")
    public AjaxResult delete(@PathVariable Long[] surveyIds) {
        questionService.deleteQuestionBySurveyIds(surveyIds);
        answerJsonService.deleteAnswerJsonBySurveyIds(surveyIds);
        answerService.deleteAnswerBySurveyIds(surveyIds);
        return toAjax(surveyService.deleteSurveyBySurveyIds(surveyIds));
    }

    /**
     * 发布问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:publish')")
    @Log(title = "问卷发布", businessType = BusinessType.DELETE)
    @PutMapping("/publish/{surveyIds}")
    public AjaxResult publish(@PathVariable Long[] surveyIds) {
        return toAjax(surveyService.publishSurveyBySurveyIds(surveyIds));
    }

    /**
     * 撤销发布问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:revoke')")
    @Log(title = "问卷撤销发布", businessType = BusinessType.DELETE)
    @PutMapping("/revoke/{surveyId}")
    public AjaxResult revoke(@PathVariable Long surveyId) {
        List<AnswerJson> answerJsons = answerJsonService.answerJsonBySurvey(surveyId);
        if (!answerJsons.isEmpty()) {
            return AjaxResult.error("数据已采集，不能撤销");
        }
        return toAjax(surveyService.revokeSurveyBySurveyId(surveyId));
    }


}
