<template>
	<div class="q-box">
		<Input v-if="question.questionType == 'input'" :question="question" :index="index" />
		
		<div class="q-btn">
  		<el-button
    		plain
    		type="text"
        icon="el-icon-plus"
        size="mini"
        @click="insertQuestion"
      >新增</el-button>
    	<el-button
    		plain
        size="mini"
        type="text"
        icon="el-icon-edit"
      >编辑</el-button>
      <el-button
        plain
        type="text"
        icon="el-icon-copy-document"
        size="mini"
      >复制</el-button>
    	<el-button
        plain
        type="text"
        icon="el-icon-delete"
        size="mini"
      >删除</el-button>
		</div>

		<div class="q-config">
			
		</div>
	</div>
</template>
<script>
import Input from './components/Input.vue';
export default{
	name: 'Question',
	components: {Input},
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
			
		}
	},
	methods: {
		insertQuestion(){
			this.$emit('insertQuestion', this.index)
		}
	}
}
</script>