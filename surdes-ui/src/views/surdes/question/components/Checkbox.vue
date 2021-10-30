<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
		</div>
		<div class="q-option">
			<el-checkbox-group v-model="checkBoxValue" :class="question.optionDisplay">
		    <template v-for="(option, index) in question.options">
		    	<el-checkbox :label="option.optionText" :key="option.optionNo" :class="question.optionDisplay"></el-checkbox>
		    	<label :key="index" v-if="option.isExtend == '1' && checkBoxValue.indexOf(option.optionText) > -1" class="o-extend">
		    		具体为：
	          <el-input size="mini" v-model="extendValue" style="width: 20%;margin-right: 5px;"></el-input>
	        </label>
		    </template>
		  </el-checkbox-group>
		</div>
	</div>
</template>
<script>
export default {
	name: 'Checkbox',
	props: {
		index: Number,
		question: {
			type: Object,
			default: {}
		}
	},
	data(){
		return{
			checkBoxValue: [],
			extendValue:''
		}
	}
}
</script>
<style>
.q-option .el-checkbox.row{
	display:  block;
	margin-bottom: 8px;
}
</style>
