<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
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