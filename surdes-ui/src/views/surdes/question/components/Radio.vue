<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
		</div>
		<div class="q-option">
			<el-radio-group v-model="answerValue" :class="question.optionDisplay">
		    <template v-for="(option, index) in question.options">
		    	<el-radio :label="option.optionText" style="margin-bottom: 10px;" :class="question.optionDisplay"></el-radio>
			    <label v-if="option.isExtend == '1' && answerValue == option.optionText" class="o-extend">
			    	具体为：
	          <el-input size="mini" v-model="extendValue" style="width: 20%;margin-right: 5px;"></el-input>
	        </label>
		    </template>
		  </el-radio-group>
		</div>
	</div>
</template>
<script>
export default{
	name: 'Radio',
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
			extendValue: ''
		}
	},
}
</script>
<style>
.q-option .el-radio.row{
	display: block;
	margin-bottom: 8px;
}
</style>