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
			<div class="topic-title">
        <span>标题：</span>
        <el-input v-model="question.questionName" type="textarea" @focus="onFocus" rows="2" style="width:100%" placeholder="请输入标题"></el-input>
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
export default{
	name: 'Question',
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
			defaultOption: {
				optionId: '',
				questionId: '',
				optionCode: '',
				optionText: '',
				optionNo: '',
				hideQuestion: '',
				showQuestion: '',
				isWtqd: '',
				wtqdType: '',
				wtqdValue: '',
				wtqdSymbol: '',
				wtqdDesc: '',
				isExtend: '',
				logicSymbol: '',
				surveyId: '',
			}
		}
	},
	mounted(){
		console.log(this.question.questionType)
		if(this.question.options.length <= 0){
			if(this.question.questionType == 'radio' || this.question.questionType == 'checkbox' || this.question.questionType == 'select'){
				this.addOption();
				this.addOption();
			}
		}
	},
	methods: {
		insertQuestion(){
			this.$emit('insertQuestion', this.index)
		},
		editQuestion(){
			this.isEdit = true
		},
		saveQuestion(){
			this.isEdit = false
		},
		copyQuestion(){this.$emit('copyQuestion', this.index)},
		delQuestion(){this.$emit('delQuestion', this.index)},
		upQuestion(){this.$emit('upQuestion', this.index)},
		downQuestion(){this.$emit('downQuestion', this.index)},
		addOption(){
			let option = {
				...this.defaultOption,
				questionId: this.question.questionId,
				surveyId: this.surveyId,
				optionText: '选项' + (this.question.options.length + 1)*1,
				optionNo: this.question.options.length + 1
			}
			this.question.options.push(option);
		},
		onFocus(){
			if(this.question.questionName == '请输入标题'){
				this.question.questionName = '';
			}
		},
	}
}
</script>