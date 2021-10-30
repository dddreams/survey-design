<template>
	<div>
		<div class="q-title">
			<span class="q-no">{{ question.questionNo }}.</span>
			{{ question.questionName }}
		</div>
		<div class="q-option">
			<el-select v-model="answerValue" placeholder="请选择" @change="changeHandle" style="width:50%">
		    <el-option
		      v-for="(option, index) in question.options"
		      :key="option.optionNo"
		      :label="option.optionText"
		      :value="option.optionText">
		    </el-option>
		  </el-select>
		  <label v-if="isExtend" class="o-extend">具体为：
        <el-input size="mini" v-model="extendValue" style="width: 15%;margin-right: 5px;"></el-input>
      </label>
		</div>
	</div>
</template>
<script>
export default{
	name: 'Select',
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
			isExtend: false,
			extendValue: ''
		}
	},
	methods:{
		changeHandle(value){
			console.log(value);
      for (let option of this.question.options){
      	console.log(option)
        if(option.optionText === value && option.isExtend === '1'){
            this.isExtend = true;
        } else {
            this.isExtend = false;
        }
        break;
      }
    },
	}
}
</script>