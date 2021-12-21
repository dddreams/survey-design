<template>
	<div>
		<div class="q-option">
			<div class="q-text">
        {{ question.questionName }}
      </div>
		</div>
	</div>
</template>
<script>
export default{
	name: "Text",
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
<style>
	.q-text{
		text-indent: 2em;
		font-size:.95rem;
		line-height:24px;
	}
</style>