<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
			<span class="red" v-if="question.validateRule && question.validateRule.indexOf('notEmpty') != -1 ">*</span>
			<label class="name-text">
        <span class="label-tips" v-if="question.showOrHide == '1'">[初始隐藏]</span>
        <span class="label-tips" v-if="question.notEdit == '1'">[只读]</span>
        <span class="label-tips" v-if="!!question.defaultValue">[有默认值]</span>
      </label>
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