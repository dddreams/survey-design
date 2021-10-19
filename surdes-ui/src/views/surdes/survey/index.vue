<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="问卷名称" prop="surveyName">
        <el-input
          v-model="queryParams.surveyName"
          placeholder="请输入问卷名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="问卷类型" prop="surveyType">
        <el-select v-model="queryParams.surveyType" placeholder="请选择问卷类型" clearable size="small">
          <el-option
            v-for="dict in dict.type.survey_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="问卷状态" prop="surveyStatus">
        <el-select v-model="queryParams.surveyStatus" placeholder="请选择问卷状态" clearable size="small">
          <el-option
            v-for="dict in dict.type.survey_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['survey:survey:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-s-promotion"
          size="mini"
          :disabled="multiple"
          @click="handlePublish"
          v-hasPermi="['survey:survey:publish']"
        >发布</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['survey:survey:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['survey:survey:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="surveyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="问卷名称" align="center" prop="surveyName" />
      <el-table-column label="问卷说明描述" align="center" prop="surveyDesc" />
      <el-table-column label="问卷类型" align="center" prop="surveyType" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.survey_type" :value="scope.row.surveyType"/>
        </template>
      </el-table-column>
      <el-table-column label="问卷状态" align="center" prop="surveyStatus" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.survey_status" :value="scope.row.surveyStatus"/>
        </template>
      </el-table-column>
      
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope"> 
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit-outline"
            @click="handleDesign(scope.row)"
            v-hasPermi="['survey:survey:design']"
            v-if="scope.row.surveyStatus == '0'"
          >设计</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-preview"
            @click="handlePreview(scope.row)"
            v-hasPermi="['survey:survey:preview']"
          >预览</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-promotion"
            @click="handlePublish(scope.row)"
            v-hasPermi="['survey:survey:publish']"
            v-if="scope.row.surveyStatus == '0'"
          >发布</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-revoke"
            @click="handleRevoke(scope.row)"
            v-hasPermi="['survey:survey:revoke']"
            v-if="scope.row.surveyStatus == '1'"
          >撤销发布</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['survey:survey:edit']"
            v-if="scope.row.surveyStatus == '0'"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['survey:survey:remove']"
            v-if="scope.row.surveyStatus == '0'"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改问卷对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="问卷名称" prop="surveyName">
          <el-input v-model="form.surveyName" placeholder="请输入问卷名称" />
        </el-form-item>
        <el-form-item label="问卷说明描述" prop="surveyDesc">
          <el-input v-model="form.surveyDesc" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="问卷类型" prop="surveyType">
          <el-select v-model="form.surveyType" placeholder="请选择问卷类型">
            <el-option
              v-for="dict in dict.type.survey_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSurvey, getSurvey, removeSurvey, addSurvey, updateSurvey, publishSurvey, exportSurvey, revokeSurvey } from "@/api/survey/survey";

export default {
  name: "Survey",
  dicts: ['survey_status', 'survey_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 问卷表格数据
      surveyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        surveyName: null,
        surveyDesc: null,
        surveyType: null,
        surveyStatus: null,
        userId: null,
        status: '1',
        bookCode: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        surveyName: [
          { required: true, message: "问卷名称不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询问卷列表 */
    getList() {
      this.loading = true;
      listSurvey(this.queryParams).then(response => {
        this.surveyList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        surveyId: null,
        surveyName: null,
        surveyDesc: null,
        surveyType: null,
        surveyStatus: null,
        createTime: null,
        userId: null,
        status: "1",
        bookCode: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.surveyId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加问卷";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const surveyId = row.surveyId || this.ids
      getSurvey(surveyId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改问卷";
      });
    },
    /** 发布按钮操作 */
    handlePublish(row){
      //this.reset();
      const surveyId = row.surveyId || this.ids
      publishSurvey(surveyId).then(response => {
        this.$modal.msgSuccess("发布成功");
        this.getList()
      });
    },
    /** 撤销发布按钮操作 */
    handleRevoke(row){
      const surveyId = row.surveyId
      revokeSurvey(surveyId).then(response => {
        this.$modal.msgSuccess("撤销成功");
        this.getList()
      });
    },
    /** 设计按钮操作 */
    handleDesign(row){

    },
    /** 预览按钮操作 */
    handlePreview(row){

    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.surveyId != null) {
            updateSurvey(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSurvey(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const surveyIds = row.surveyId || this.ids;
      this.$modal.confirm('是否确认删除问卷编号为"' + surveyIds + '"的数据项？').then(function() {
        return removeSurvey(surveyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有问卷数据项？').then(() => {
        this.exportLoading = true;
        return exportSurvey(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
