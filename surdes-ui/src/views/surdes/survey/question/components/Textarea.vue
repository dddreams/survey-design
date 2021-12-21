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
			<el-input v-model="answerValue" type="textarea" style="width:80%"></el-input>
		</div>
	</div>
</template>
<script>
export default{
	name: 'Textarea',
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
	methods: {
		
	}
}
</script>