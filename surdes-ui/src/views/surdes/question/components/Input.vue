<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
		</div>
		<div class="q-option">
			<el-input v-model="question.answer.answerValue" style="width:80%"></el-input>
		</div>
		
	</div>
</template>
<script>
export default{
	name: 'Input',
	props: {
		index: Number,
		question: {
			type: Object,
			default: {}
		}
	},
	data(){
		return {}
	},
	methods: {

	}
}
</script>