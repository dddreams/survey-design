package com.shure.surdes.survey.controller;

import com.shure.surdes.common.annotation.Log;
import com.shure.surdes.common.core.controller.BaseController;
import com.shure.surdes.common.core.domain.AjaxResult;
import com.shure.surdes.common.core.page.TableDataInfo;
import com.shure.surdes.common.enums.BusinessType;
import com.shure.surdes.common.utils.poi.ExcelUtil;
import com.shure.surdes.survey.domain.Options;
import com.shure.surdes.survey.service.IOptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 问卷选项Controller
 *
 * @author Shure
 * @date 2021-10-18
 */
@RestController
@RequestMapping("/survey/options")
public class OptionsController extends BaseController {
    @Autowired
    private IOptionsService optionsService;

    /**
     * 查询问卷选项列表
     */
    @PreAuthorize("@ss.hasPermi('survey:options:list')")
    @GetMapping("/list")
    public TableDataInfo list(Options options) {
        startPage();
        List<Options> list = optionsService.selectOptionsList(options);
        return getDataTable(list);
    }

    /**
     * 导出问卷选项列表
     */
    @PreAuthorize("@ss.hasPermi('survey:options:export')")
    @Log(title = "问卷选项", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Options options) {
        List<Options> list = optionsService.selectOptionsList(options);
        ExcelUtil<Options> util = new ExcelUtil<Options>(Options.class);
        return util.exportExcel(list, "问卷选项数据");
    }

    /**
     * 获取问卷选项详细信息
     */
    @PreAuthorize("@ss.hasPermi('survey:options:query')")
    @GetMapping(value = "/{optionId}")
    public AjaxResult getInfo(@PathVariable("optionId") Long optionId) {
        return AjaxResult.success(optionsService.selectOptionsByOptionId(optionId));
    }

    /**
     * 新增问卷选项
     */
    @PreAuthorize("@ss.hasPermi('survey:options:add')")
    @Log(title = "问卷选项", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Options options) {
        return toAjax(optionsService.insertOptions(options));
    }

    /**
     * 修改问卷选项
     */
    @PreAuthorize("@ss.hasPermi('survey:options:edit')")
    @Log(title = "问卷选项", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Options options) {
        return toAjax(optionsService.updateOptions(options));
    }

    /**
     * 删除问卷选项
     */
    @PreAuthorize("@ss.hasPermi('survey:options:remove')")
    @Log(title = "问卷选项", businessType = BusinessType.DELETE)
    @DeleteMapping("/{optionIds}")
    public AjaxResult remove(@PathVariable Long[] optionIds) {
        return toAjax(optionsService.deleteOptionsByOptionIds(optionIds));
    }
}
