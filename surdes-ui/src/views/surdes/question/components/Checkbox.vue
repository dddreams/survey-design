<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
		</div>
		<div class="q-option">
			<el-checkbox-group v-model="checkBoxValue">
		    <template v-for="(option, index) in question.options">
		    	<el-checkbox :label="option.optionText" :key="option.optionNo">{{ option.optionText }}</el-checkbox>
		    	<label :key="index" v-if="option.isExtend == '1' && answerValue == option.optionText" >具体为：
	          <el-input style="width: 20%;margin-right: 5px;"></el-input>
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
		}
	}
}
</script>