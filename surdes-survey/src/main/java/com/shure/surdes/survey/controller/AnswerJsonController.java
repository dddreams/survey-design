package com.shure.surdes.survey.controller;

import com.shure.surdes.common.annotation.Log;
import com.shure.surdes.common.core.controller.BaseController;
import com.shure.surdes.common.core.domain.AjaxResult;
import com.shure.surdes.common.core.page.TableDataInfo;
import com.shure.surdes.common.enums.BusinessType;
import com.shure.surdes.common.utils.poi.ExcelUtil;
import com.shure.surdes.survey.domain.AnswerJson;
import com.shure.surdes.survey.service.IAnswerJsonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 问卷答案结果jsonController
 *
 * @author Shure
 * @date 2021-10-18
 */
@RestController
@RequestMapping("/survey/json")
public class AnswerJsonController extends BaseController {
    @Autowired
    private IAnswerJsonService answerJsonService;

    /**
     * 查询问卷答案结果json列表
     */
    @PreAuthorize("@ss.hasPermi('survey:json:list')")
    @GetMapping("/list")
    public TableDataInfo list(AnswerJson answerJson) {
        startPage();
        List<AnswerJson> list = answerJsonService.selectAnswerJsonList(answerJson);
        return getDataTable(list);
    }

    /**
     * 导出问卷答案结果json列表
     */
    @PreAuthorize("@ss.hasPermi('survey:json:export')")
    @Log(title = "问卷答案结果json", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AnswerJson answerJson) {
        List<AnswerJson> list = answerJsonService.selectAnswerJsonList(answerJson);
        ExcelUtil<AnswerJson> util = new ExcelUtil<AnswerJson>(AnswerJson.class);
        return util.exportExcel(list, "问卷答案结果json数据");
    }

    /**
     * 获取问卷答案结果json详细信息
     */
    @PreAuthorize("@ss.hasPermi('survey:json:query')")
    @GetMapping(value = "/{anId}")
    public AjaxResult getInfo(@PathVariable("anId") Long anId) {
        return AjaxResult.success(answerJsonService.selectAnswerJsonByAnId(anId));
    }

    /**
     * 新增问卷答案结果json
     */
    @PreAuthorize("@ss.hasPermi('survey:json:add')")
    @Log(title = "问卷答案结果json", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AnswerJson answerJson) {
        return toAjax(answerJsonService.insertAnswerJson(answerJson));
    }

    /**
     * 修改问卷答案结果json
     */
    @PreAuthorize("@ss.hasPermi('survey:json:edit')")
    @Log(title = "问卷答案结果json", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AnswerJson answerJson) {
        return toAjax(answerJsonService.updateAnswerJson(answerJson));
    }

    /**
     * 删除问卷答案结果json
     */
    @PreAuthorize("@ss.hasPermi('survey:json:remove')")
    @Log(title = "问卷答案结果json", businessType = BusinessType.DELETE)
    @DeleteMapping("/{anIds}")
    public AjaxResult remove(@PathVariable Long[] anIds) {
        return toAjax(answerJsonService.deleteAnswerJsonByAnIds(anIds));
    }
}
