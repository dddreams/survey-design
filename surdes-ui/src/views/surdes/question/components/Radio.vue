<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
		</div>
		<div class="q-option">
			<el-radio-group v-model="answerValue">
		    <template v-for="(option, index) in question.options">
		    	<el-radio :label="option.optionText"></el-radio>
			    <label :key="index" v-if="option.isExtend == '1' && answerValue == option.optionText" >具体为：
	          <el-input style="width: 20%;margin-right: 5px;"></el-input>
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
		}
	},
}
</script>