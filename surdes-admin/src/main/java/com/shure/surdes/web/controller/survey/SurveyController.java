package com.shure.surdes.web.controller.survey;

import com.shure.surdes.common.annotation.Log;
import com.shure.surdes.common.core.controller.BaseController;
import com.shure.surdes.common.core.domain.AjaxResult;
import com.shure.surdes.common.core.page.TableDataInfo;
import com.shure.surdes.common.enums.BusinessType;
import com.shure.surdes.common.utils.poi.ExcelUtil;
import com.shure.surdes.survey.domain.Survey;
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
    @Log(title = "问卷", businessType = BusinessType.EXPORT)
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
    @Log(title = "问卷", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Survey survey) {
        return toAjax(surveyService.insertSurvey(survey));
    }

    /**
     * 修改问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:edit')")
    @Log(title = "问卷", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Survey survey) {
        return toAjax(surveyService.updateSurvey(survey));
    }

    /**
     * 删除问卷
     */
    @PreAuthorize("@ss.hasPermi('survey:survey:remove')")
    @Log(title = "问卷", businessType = BusinessType.DELETE)
    @DeleteMapping("/{surveyIds}")
    public AjaxResult remove(@PathVariable Long[] surveyIds) {
        return toAjax(surveyService.deleteSurveyBySurveyIds(surveyIds));
    }
}
