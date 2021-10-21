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
          icon="el-icon-refresh-right"
          size="mini"
          :disabled="multiple"
          @click="handleRestore"
          v-hasPermi="['survey:survey:publish']"
        >还原</el-button>
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
        >永久删除</el-button>
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
            icon="el-icon-preview2"
            @click="handlePreview(scope.row)"
            v-hasPermi="['survey:survey:preview']"
          >预览</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-refresh-right"
            @click="handleRestore(scope.row)"
            v-hasPermi="['survey:survey:edit']"
            v-if="scope.row.surveyStatus == '0'"
          >还原</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['survey:survey:remove']"
            v-if="scope.row.surveyStatus == '0'"
          >永久删除</el-button>
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
  </div>
</template>

<script>
import { listSurvey, delSurvey, restoreSurvey } from "@/api/survey/survey";

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
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        surveyName: null,
        surveyDesc: null,
        surveyType: null,
        surveyStatus: null,
        userId: null,
        status: '0',
        bookCode: null
      },
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

    /** 还原按钮操作 */
    handleRestore(row){
    	const surveyIds = row.surveyId || this.ids;
    	restoreSurvey(surveyIds);
    	this.getList();
      this.$modal.msgSuccess("还原成功");
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const surveyIds = row.surveyId || this.ids;
      this.$modal.confirm('确认要删除问卷编号为"' + surveyIds + '"的数据项吗？这将会删除所有数据！').then(function() {
        return delSurvey(surveyIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 预览按钮操作 */
    handlePreview(row){

    }
  }
};
</script>
