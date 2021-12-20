<template>
	<div :class="`q-box ${isEdit ? 'border' : ''}`">
		<Input ref="input" v-if="question.questionType == 'input'" 
					:question="question" :index="index"/>
		<Textarea ref="textarea" v-if="question.questionType == 'textarea'" 
					:question="question" :index="index"/>
		<Radio ref="radio" v-if="question.questionType == 'radio'" 
					:question="question" :index="index"/>
		<Checkbox ref="checkbox" v-if="question.questionType == 'checkbox'" 
					:question="question" :index="index"/>
		<Select ref="select" v-if="question.questionType == 'select'" 
					:question="question" :index="index"/>
		<Title ref="title" v-if="question.questionType == 'title'" 
					:question="question" :index="index"/>
		<QText ref="text" v-if="question.questionType == 'text'" 
					:question="question" :index="index"/>
		
		<div class="q-btn">
  		<el-button
    		type="text"
        icon="el-icon-plus"
        size="mini"
        @click="insertQuestion"
      >新题</el-button>
    	<el-button
        size="mini"
        type="text"
        icon="el-icon-edit"
        @click="editQuestion"
      >编辑</el-button>
      <el-button
        type="text"
        icon="el-icon-copy-document"
        size="mini"
        @click="copyQuestion"
      >复制</el-button>
    	<el-button
        type="text"
        icon="el-icon-delete"
        size="mini"
        @click="delQuestion"
      >删除</el-button>
      <el-button
        type="text"
        icon="el-icon-upload2"
        size="mini"
        @click="upQuestion"
      >上移</el-button>
      <el-button
        type="text"
        icon="el-icon-download"
        size="mini"
        @click="downQuestion"
      >下移</el-button>
		</div>

		<div class="q-config" v-if="isEdit">
			<!-- 标题 -->
			<div class="topic-title">
        <!-- <span>标题：</span> -->
        <el-input v-model="question.questionName" type="textarea" @focus="focusTitle" rows="2" style="width:100%" placeholder="请输入标题"></el-input>
      </div>

      <!-- 规则配置 -->
      <div class="topic-rules">
      	<!-- 题型 -->
      	<template>
          <label>选择题型：</label>
          <el-select v-model="question.questionType" placeholder="请选择题型" size="mini" style="width:20%">
				    <el-option v-for="dict in dict.type.question_type" :key="dict.value" :label="dict.label" :value="dict.value">
				    </el-option>
				  </el-select>
        </template>
        <!-- 方向 -->
        <template v-if="questionClass == 's' && question.questionType != 'select'">
        	<label style="margin-left: 10px;">显示方向：</label>
          <el-select v-model="question.optionDisplay" placeholder="请选择方向" size="mini" style="width:20%">
				    <el-option v-for="dict in dict.type.option_direction" :key="dict.value" :label="dict.label" :value="dict.value">
				    </el-option>
				  </el-select>
        </template>
				<!-- 默认值 -->
        <template v-if="questionClass != 't'">
        	<label style="margin-left: 10px;">默认值：</label>
        	<template v-if="questionClass == 's' && question.questionType != 'checkbox'">
        		<el-select v-model="question.defaultValue" placeholder="请选择默认值" clearable size="mini" style="width:20%">
					    <el-option v-for="(option, oIndex) in question.options" :key="oIndex" :label="option.optionText" :value="option.optionText"></el-option>
					  </el-select>
        	</template>

        	<template v-if="question.questionType == 'checkbox'">
        		<el-select v-model="question.defaultValue" placeholder="请选择默认值" multiple clearable size="mini" style="width:20%">
					    <el-option v-for="(option, oIndex) in question.options" :key="oIndex" :label="option.optionText" :value="option.optionText"></el-option>
					  </el-select>
        	</template>

        	<template v-if="questionClass == 'i'">
        		<el-input v-model="question.defaultValue" placeholder="请输入默认值" size="mini" style="width: 24%;"></el-input>
        	</template>
        </template>
      </div>

      <!-- 选项列表 -->
      <div class="topic-option" v-if="questionClass == 's'">
      	<!-- <div class="option-title">
          选项列表：
        </div> -->
        <ul class="topic-list">
					<li class="topic-item" v-for="(option, optionIndex) in question.options" :key="optionIndex">
					  <el-input v-model="option.optionText" @focus="focusOption" @keyup.enter.native="keyupOption" placeholder="请输入选项" size="mini" ref="optionInput" :maxlength=128 style="width: 30%;" />
					  <i class="el-icon-r-add" @click="addOption" title="添加"></i>
					  <i class="el-icon-r-del" @click="delOption(optionIndex)" title="删除"></i>
					  <i class="el-icon-r-up" @click="upOption(optionIndex)" title="上移"></i>
					  <i class="el-icon-r-down" @click="downOption(optionIndex)" title="下移"></i>
					  <el-checkbox v-model="option.isExtend" true-label="1" false-label="" style="font-size: 14px;margin-left: 10px;">增加备注框</el-checkbox>
					</li>
				</ul>
      </div>

      <div class="topic-finish">
				<el-button class="w-btn" type="warning" @click="saveQuestion">完成编辑</el-button>
			</div>
    </div>

	</div>
</template>
<script>
import Input from './components/Input.vue';
import Title from './components/Title.vue';
import Textarea from './components/Textarea.vue';
import Radio from './components/Radio.vue';
import Checkbox from './components/Checkbox.vue';
import Select from './components/Select.vue';
import QText from './components/Text.vue';
import { ArrayUtil } from "@/utils/arrayUtil";
import { addQuestion } from '@/api/survey/question';
export default{
	name: 'Question',
	dicts: ['question_type','option_direction'],
	components: {Input, Title, Textarea, Radio, Checkbox, Select, QText},
	props: {
		index: Number,
		surveyId: [String],
		question: {
			type: Object,
			default: {}
		}
	},
	data(){
		return {
			isEdit: false,
			questionClass: '',
		}
	},
	mounted(){
		this.initClass();
		this.refreshOption();
	},
	methods: {
		initClass(){
			switch(this.question.questionType){
				case 'input':
				case 'textarea':
				default:
					this.questionClass = 'i';
					break;
				case 'radio':
				case 'checkbox':
				case 'select':
					this.questionClass = 's';
					break;
				case 'text':
				case 'title':
					this.questionClass = 't'
					break;
			}
		},
		insertQuestion(){this.$emit('insertQuestion', this.index)},
		editQuestion(){
			this.isEdit = true
		},
		saveQuestion(){
			this.$emit('saveQuestion', this.question, (res)=>{
				this.isEdit = false
			})
		},
		copyQuestion(){this.$emit('copyQuestion', this.index)},
		delQuestion(){this.$emit('delQuestion', this.index)},
		upQuestion(){this.$emit('upQuestion', this.index)},
		downQuestion(){this.$emit('downQuestion', this.index)},
		addOption(){
			let option = {
				optionId: '',
				questionId: this.question.questionId,
				optionCode: this.question.options.length + 1,
				optionText: '选项' + (this.question.options.length + 1)*1,
				optionNo: this.question.options.length + 1,
				hideQuestion: '',
				showQuestion: '',
				isWtqd: '',
				wtqdType: '',
				wtqdValue: '',
				wtqdSymbol: '',
				wtqdDesc: '',
				isExtend: '',
				logicSymbol: '',
				surveyId: this.surveyId,
			};
			this.question.options.push(option);
			if(this.isEdit){
				setTimeout(() => {
					this.$refs['optionInput'][this.question.options.length-1].focus() 
				}, 50)
			}
		},
		keyupOption(){
			this.addOption();
		},
		delOption(index){
		  if(this.question.options.length === 1) {
        this.$message({
          type: 'warning',
          message: '至少得留一项吧!'
        });
        return;
      }
      let optionId = this.question.options[index].optionId;
      if(optionId) {
        this.$confirm('确定要删除吗?', '确认提醒', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$message({
            type: 'success',
            message: '删除成功!'
          });
          this.question.options.splice(index, 1);
        });
      } else {
        this.question.options.splice(index, 1);
      }
		},
		upOption(index){
			if (this.question.options.length == 0 || index === 0) {
        return;
      }
		  this.question.options = ArrayUtil.moveUp(this.question.options, index);
		},
		downOption(index){
			if (this.question.options.length == 0 || index === this.question.options.length - 1) {
        return;
      }
		  this.question.options = ArrayUtil.moveDown(this.question.options, index);
		},
		refreshOption(){
			if(this.question.questionId){
				return;
			}
      if(this.question.options.length == 0 && this.questionClass == 's') {
        this.addOption();
        this.addOption();	
      }
      if(this.questionClass != 's'){
      	this.question.options.length == 0
      }
    },
		focusTitle(){
			if(this.question.questionName == '请输入标题'){
				this.question.questionName = '';
			}
		},
		focusOption(obj){
		  let val = obj.target.value;
		  if(val.indexOf('选项') > -1){
		      obj.target.value = '';
		  }
		},
	},
	watch: {
		'question.questionType':{
      handler: function (val) {
        this.question.questionType = val
        this.initClass();
        this.refreshOption();
      },
    }
	}
}
</script>
<style>
	.topic-list .el-checkbox__label{
		padding-left: 4px;
	}
</style>