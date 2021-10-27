<template>
	<div>
		<div class="q-option">
			<h2>
         {{ question.questionName }}
      </h2>
		</div>
	</div>
</template>
<script>
export default{
	name: "Title",
	props: {
		index: Number,
		question:{
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