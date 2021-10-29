<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
		</div>
		<div class="q-option">
			<el-select v-model="answerValue" placeholder="请选择" style="width:50%">
		    <el-option
		      v-for="(option, index) in question.options"
		      :key="option.optionNo"
		      :label="option.optionText"
		      :value="option.optionText">
		    </el-option>
		  </el-select>
		</div>
	</div>
</template>
<script>
export default{
	name: 'Select',
	props: {
		index: Number,
		question: {
			type: Object,
			default: {}
		}
	},
	data(){
		return {
			answerValue: '',
		}
	},
}
</script>