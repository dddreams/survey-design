<template>
	<div class="app-container">
    <el-form :model="queryParams" ref="queryForm" v-show="showSearch" :inline="true">
      <el-form-item label="问卷名称" prop="surveyName">
        <el-input
          v-model="queryParams.surveyName"
          placeholder="请输入问卷名称"
          clearable
          size="small"
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="问卷类型" prop="surveyType">
        <el-select
          v-model="queryParams.surveyType"
          placeholder="问卷类型"
          clearable
          size="small"
          style="width: 240px"
        >
          <el-option
            v-for="dict in dict.type.survey_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="问卷状态" prop="surveyStatus">
        <el-select
          v-model="queryParams.surveyStatus"
          placeholder="问卷状态"
          clearable
          size="small"
          style="width: 240px"
        >
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
          v-hasPermi="['surdes:survey:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['surdes:survey:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['surdes:survey:remove']"
        >删除</el-button>
      </el-col>
      
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
	</div>
</template>

<script>
export default {
	name: "SurveyList",
	dicts: ['survey_status', 'survey_type'],
	data() { 
		return{
			// 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        roleName: undefined,
        roleKey: undefined,
        status: undefined
      },
      // 显示搜索条件
      showSearch: true,
      open: false
		}
	},
	created() {
    this.getList();
  },
	methods: {
		/** 查询角色列表 */
    getList() {

    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      //this.getMenuTreeselect();
      this.open = true;
      this.title = "创建问卷";
    },
    /** 修改按钮操作 */
    handleUpdate(){

    },
    /** 删除按钮操作 */
    handleDelete(){

    },
		/** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    reset(){

    },
	}
}
</script>