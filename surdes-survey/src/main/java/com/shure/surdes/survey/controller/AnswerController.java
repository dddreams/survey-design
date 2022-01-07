package com.shure.surdes.survey.controller;

import com.shure.surdes.common.annotation.Log;
import com.shure.surdes.common.core.controller.BaseController;
import com.shure.surdes.common.core.domain.AjaxResult;
import com.shure.surdes.common.core.page.TableDataInfo;
import com.shure.surdes.common.enums.BusinessType;
import com.shure.surdes.common.utils.poi.ExcelUtil;
import com.shure.surdes.survey.domain.Answer;
import com.shure.surdes.survey.service.IAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 问卷答案结果Controller
 *
 * @author Shure
 * @date 2021-10-18
 */
@RestController
@RequestMapping("/survey/answer")
public class AnswerController extends BaseController {
    @Autowired
    private IAnswerService answerService;

    /**
     * 查询问卷答案结果列表
     */
    @PreAuthorize("@ss.hasPermi('survey:answer:list')")
    @GetMapping("/list")
    public TableDataInfo list(Answer answer) {
        startPage();
        List<Answer> list = answerService.selectAnswerList(answer);
        return getDataTable(list);
    }

    /**
     * 导出问卷答案结果列表
     */
    @PreAuthorize("@ss.hasPermi('survey:answer:export')")
    @Log(title = "问卷答案结果", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Answer answer) {
        List<Answer> list = answerService.selectAnswerList(answer);
        ExcelUtil<Answer> util = new ExcelUtil<Answer>(Answer.class);
        return util.exportExcel(list, "问卷答案结果数据");
    }

    /**
     * 获取问卷答案结果详细信息
     */
    @PreAuthorize("@ss.hasPermi('survey:answer:query')")
    @GetMapping(value = "/{answerId}")
    public AjaxResult getInfo(@PathVariable("answerId") Long answerId) {
        return AjaxResult.success(answerService.selectAnswerByAnswerId(answerId));
    }

    /**
     * 新增问卷答案结果
     */
    @PreAuthorize("@ss.hasPermi('survey:answer:add')")
    @Log(title = "问卷答案结果", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Answer answer) {
        return toAjax(answerService.insertAnswer(answer));
    }

    /**
     * 修改问卷答案结果
     */
    @PreAuthorize("@ss.hasPermi('survey:answer:edit')")
    @Log(title = "问卷答案结果", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Answer answer) {
        return toAjax(answerService.updateAnswer(answer));
    }

    /**
     * 删除问卷答案结果
     */
    @PreAuthorize("@ss.hasPermi('survey:answer:remove')")
    @Log(title = "问卷答案结果", businessType = BusinessType.DELETE)
    @DeleteMapping("/{answerIds}")
    public AjaxResult remove(@PathVariable Long[] answerIds) {
        return toAjax(answerService.deleteAnswerByAnswerIds(answerIds));
    }
}
