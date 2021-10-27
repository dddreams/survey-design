<template>
	<div :class="`q-box ${isEdit ? 'border' : ''}`">
		<Input ref="que" v-if="question.questionType == 'input'" 
					:question="question" :index="index"
					 />
		<Title ref="que" v-if="question.questionType == 'title'" 
					:question="question" :index="index"
					 />
		
		<div class="q-config" v-if="isEdit">
			<div class="topic-title">
        <span>标题：</span>
        <el-input v-model="question.questionName" type="textarea" @focus="onFocus" rows="2" style="width:100%" placeholder="请输入标题"></el-input>
      </div>

      <div class="topic-finish">
				<el-button class="w-btn" type="warning" @click="saveQuestion">完成编辑</el-button>
			</div>
    </div>

		<div class="q-btn">
  		<el-button
    		type="text"
        icon="el-icon-plus"
        size="mini"
        @click="insertQuestion"
      >新增</el-button>
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
      >复制</el-button>
    	<el-button
        type="text"
        icon="el-icon-delete"
        size="mini"
      >删除</el-button>
      <el-button
        type="text"
        icon="el-icon-upload2"
        size="mini"
      >上移</el-button>
      <el-button
        type="text"
        icon="el-icon-download"
        size="mini"
      >下移</el-button>
		</div>
	</div>
</template>
<script>
import Input from './components/Input.vue';
import Title from './components/Title.vue';
export default{
	name: 'Question',
	components: {Input, Title},
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
		onFocus(){
			if(this.question.questionName == '请输入标题'){
				this.question.questionName = '';
			}
		},
	}
}
</script>