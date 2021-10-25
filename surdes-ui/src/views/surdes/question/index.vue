<template>
	<div>
		{{ question.questionType }}
	</div>
</template>
<script>
export default{
	name: 'Question',
	props: {
		surveyId: [String],
		question: {
			type: Object,
			default: {}
		}
	},
	data(){
		return {

		}
	}
}
</script>