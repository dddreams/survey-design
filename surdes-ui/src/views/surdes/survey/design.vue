<template>
	<div class="app-container">
    <el-row :gutter="20">
    	<el-col :span="5" :xs="24">
    		<div class="de-left">
    			<el-tabs v-model="activeName" type="card" stretch @tab-click="handleClick">
						<el-tab-pane label="题型" name="first">
							<ul class="q-type-module" v-for="item in queModule" :kei="item.title">
								<span class="q-type-title">{{item.title}}</span>
								<li v-for="sub in item.value" @click="addQuestion(sub.value)"><i :class="`el-icon-${sub.raw.cssClass}`"></i>{{ sub.label }}</li>
							</ul>
						</el-tab-pane>
						<el-tab-pane label="大纲" name="second">
							<label :class="`q-label ${q.questionType=='title' ? 'p-l-10' : ''}`" v-for="q in questionList" :key="q.questionNo">
								{{ q.questionNo }}.{{ q.questionName }}
							</label>
						</el-tab-pane>
					</el-tabs>
    		</div>
    	</el-col>

    	<el-col :span="19" :xs="24" style="height: calc(100vh - 89px);overflow-y: auto;">
    		<div class="de-main">
    			<div class="s-box">
    				<h2 class="s-title">{{ survey.surveyName }}</h2>
    				<div class="s-desc">
    					{{ survey.surveyDesc }}
    					<el-button
    						class="q-add"
				    		type="text"
				        icon="el-icon-plus"
				        size="mini"
				        @click="insertQuestion(-1)"
				      >新增一题</el-button>
    				</div>
    			</div>
    			<div class="s-quesitions">
    				<Question 
    					v-for="(question, i) in questionList" 
    					:question="question" 
    					:surveyId="surveyId" 
    					:index="i"
    					@insertQuestion="insertQuestion"/>
    			</div>
    		</div>
    	</el-col>
    </el-row>
  </div>
</template>

<script>
import { getSurvey } from "@/api/survey/survey";
import { listBySurveyId } from "@/api/survey/question";
import { ArrayUtil } from "@/utils/arrayUtil";
import Question from '../question/index';

export default{
	name: 'Design',
	dicts: ['question_type'],
	components: { Question },
	data(){
		return {
			activeName: 'first',
			queModule: [],
			surveyId: this.$route.query.surveyId,
			survey: {},
			questionList: [],
			defaultQuestion: {
				questionId: null,
				surveyId: this.$route.query.surveyId,
		    questionNo: null,
		    questionSort: null,
		    questionName: '请输入标题',
		    questionType: 'input',
		    validateRule: null,
		    showOrHide: '0',
		    questionAttr: null,
		    relationResult: null,
		    notEdit: '0',
		    defaultValue: null,
		    formula: null,
		    bookCode: null,
		    options: [],
		    answer: {
		    	answerValue: null
		    }
			},
		}
	},
	mounted(){
		setTimeout(()=>{
			this.initQuesType()
		}, 1000)
		this.getSurvey();
		this.getQuestionList();
	},
	methods: {
		/** 问题类型初始化数据处理 */
		initQuesType(){
			let tempArr = [];
			this.dict.type.question_type.map(item => {
				if(tempArr.indexOf(item.raw.remark) <= -1){
					tempArr.push(item.raw.remark)
				}
			})

			this.queModule.length = 0;
			tempArr.map(item => {
				let obj = {title: item, value: []}
				this.dict.type.question_type.map(sub => {
					if(item == sub.raw.remark){
						obj.value.push(sub)
					}
				})
				this.queModule.push(obj)
			})
		},
		/** 获取问卷对象 */
		getSurvey(){
			console.log(this.surveyId)
      getSurvey(this.surveyId).then(response => {
	      this.survey = response.data;
      });
		},
		/** 获取问题列表 */
		getQuestionList(){
			listBySurveyId(this.surveyId).then(response => {
				this.questionList = response.data;
			})
		},
		addQuestion(questionType){
			let question = {
				...this.defaultQuestion,
				questionType: questionType,
			}
			this.questionList.push(question);
			this.updateIndex();
		},
		insertQuestion(index){
			let question = {
				...this.defaultQuestion,
				questionType: index == -1 ? 'title' : 'input',
			}
			this.questionList = ArrayUtil.insertNext(this.questionList,index,question);
			this.updateIndex();
		},
		updateIndex(){
			let j = 1;
			this.questionList.forEach((q, i) => {
				if(q.questionType != 'title' && q.questionType != 'text'){
					q.questionNo = j;
					j++;
				}
				q.questionSort = i + 1;
			})
		},
		handleClick(tab, event) {
      console.log(tab, event);
    }
	}
}
</script>

<style scoped="true">
  .app-container{
  	background: #f0f0f0;
  	padding: 0 10px;
  }
  .de-left{
  	background:  #fff;
  	width:100%;
  	min-height: 542px;
  	margin-top: 5px;
  }
  .de-main{
  	background:  #fff;
  	width:  85%;
  	margin: 0 auto;
  	margin-top: 5px;
  	min-height: 542px;
  }
  .el-collapse-item{
  	padding-left: 5px;
  }
  .q-type-module{
  	margin: 0 0 10px 0;
    padding: 0 0 0 10px;
  }
  .q-type-module .q-type-title{
  	font-size: 12px;
  	display: block;
  	margin-bottom: 5px;
  }
  .q-type-module li{
  	display: inline-block;
    width: 95px;
    line-height: 28px;
    color: #707070;
    font-size: 12px;
    border: 1px solid #eaeaea;
    background-color: #fff;
    border-radius: 2px;
    margin: 0 6px 6px 0;
    padding: 0 10px;
    cursor: pointer;
    vertical-align: middle;
  }
  .q-type-module li:hover{
  	border: 1px solid #2672ff;
    box-shadow: 0 1px 5px 0 rgb(38 114 255 / 20%);
    color: #2672ff;
    fill-opacity: 1;
  }
  .q-type-module li i{
  	margin-right: 4px;
  	font-size:18px;
  	vertical-align: -3px;
  }

  .s-title{
  	text-align: center;
    padding: 50px 0 40px 0;
    margin: 0;
  }
  .s-desc{
  	text-indent: 2em;
    border-bottom: 1px solid #eaeaea;
    padding: 6px 20px;
  }
  .q-label{
  	display: block;
  	font-size: 14px;
  	font-weight: normal;
  	padding: 10px 0 0 30px;
    color: #333;
    word-break: break-word;
  }
  .q-add{
  	display: none;
  	float: right;
  }
  .s-box:hover .q-add{
  	display: block;
  }


</style>