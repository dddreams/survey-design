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
							<label :class="`q-label ${q.questionType=='title' ? 'p-l-5 f-w-b' : ''}`" v-for="q in questionList" :key="q.questionNo">
								<span v-if="q.questionNo != null">{{ q.questionNo }}.</span>{{ q.questionName }}
							</label>
						</el-tab-pane>
					</el-tabs>
    		</div>
    	</el-col>

    	<el-col :span="19" :xs="24" class="de-container">
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
    					:key="question.questionNo"
    					@saveQuestion="saveQuestion"
    					@insertQuestion="insertQuestion"
    					@copyQuestion="copyQuestion"
    					@delQuestion="delQuestion"
    					@upQuestion="upQuestion"
    					@downQuestion="downQuestion"/>
    			</div>
    		
    			<div class="rig-card">
	    			<el-tooltip class="item" effect="dark" content="预览" placement="right">
		    			<div class="card-item yulan" @click="handlePreview">
		    				<i class="el-icon-yulan"></i>
		    			</div>
	    			</el-tooltip>
	    			<el-tooltip class="item" effect="dark" content="发布" placement="right">
		    			<div class="card-item fabu">
		    				<i class="el-icon-fabu"></i>
		    			</div>
	    			</el-tooltip>
	    			<el-tooltip class="item" effect="dark" content="设置逻辑" placement="right">
		    			<div class="card-item luoji">
		    				<i class="el-icon-luoji1"></i>
		    			</div>
	    			</el-tooltip>
	    			<el-tooltip class="item" effect="dark" content="设置计算" placement="right">
		    			<div class="card-item jisuan">
		    				<i class="el-icon-jisuanqi"></i>
		    			</div>
	    			</el-tooltip>
	    		</div>
    		</div>
    	</el-col>
    </el-row>
    <el-backtop target=".de-container"></el-backtop>
  </div>
</template>

<script>
import { getSurvey } from "@/api/survey/survey";
import { listBySurveyId, updateQueNo, saveQuestion, delQuestion} from "@/api/survey/question";
import { ArrayUtil } from "@/utils/arrayUtil";
import Question from './question/question';

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
			queNoes: []
		}
	},
	mounted(){
		setTimeout(()=>{
			this.initQuesType()
		}, 800)
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
		/** 新增问题  **/
		addQuestion(questionType){
			let question = {
				questionId: null,
				surveyId: this.surveyId,
		    questionNo: null,
		    questionSort: null,
		    questionName: '请输入标题',
		    questionType: questionType,
		    validateRule: null,
		    showOrHide: '0',
		    questionAttr: null,
		    relationResult: null,
		    notEdit: '0',
		    defaultValue: null,
		    formula: null,
		    optionDisplay: 'column',
		    bookCode: null,
		    options: [],
		    answer: {
		    	answerValue: null
		    }
			};
			this.questionList.push(question);
			this.updateIndex();
		},
		/** 保存问题 **/
		saveQuestion(question, func){
			console.log(question)
			saveQuestion(question).then(res => {
				func(res)
			})
		},
		/** 插入问题 **/
		insertQuestion(index){
			let question = {
				questionId: null,
				surveyId: this.surveyId,
		    questionNo: null,
		    questionSort: null,
		    questionName: '请输入标题',
		    questionType: index == -1 ? 'title' : 'input',
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
			};
			this.questionList = ArrayUtil.insertNext(this.questionList,index,question);
			this.updateIndex();
		},
		/** 复制问题 **/
		copyQuestion(index){
			const q = this.questionList[index];
			this.questionList.push({...q,questionId: ''});
			this.updateIndex();
		},
		/** 删除问题 **/
		delQuestion(index){
			let questionId = this.questionList[index].questionId;
      if (questionId) {
      	this.$confirm('确定要删除该题吗?', '确认提醒', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
        	delQuestion(questionId).then(res => {
        		this.$message({
	            type: 'success',
	            message: '删除成功!'
	          });
	          this.questionList = ArrayUtil.delete(this.questionList, index);
	          this.updateIndex();
        	})
        });
      } else {
        this.questionList = ArrayUtil.delete(this.questionList, index);
        this.updateIndex();
      }
		},
		/** 上移问题 **/
		upQuestion(index){
			if (this.questionList.length == 0 || index === 0) {
        return;
      }
      this.questionList = ArrayUtil.moveUp(this.questionList, index);
      this.updateIndex();
		},
		/** 下移问题 **/
		downQuestion(index){
			if (this.questionList.length == 0 || index === this.questionList.length - 1) {
        return;
      }
      this.questionList = ArrayUtil.moveDown(this.questionList, index);
      this.updateIndex();
		},
		/** 更新序号 **/
		updateIndex(){
			let j = 1;
			this.queNoes = [];
			this.questionList.forEach((q, i) => {
				if(q.questionType != 'title' && q.questionType != 'text'){
					q.questionNo = j;
					j++;
				}
				q.questionSort = i + 1;
				this.queNoes.push({
					questionId: q.questionId,
					questionNo: q.questionNo,
					questionSort: q.questionSort
				})
			})
			this.updateQuestionNo();
		},
		/** 更新排序 **/
		updateQuestionNo(){
			const queNoes = this.queNoes.filter(q => {
				return !!q.questionId
			})
			updateQueNo(queNoes).then(res => {
				this.$message({
          type: 'success',
          message: '自动保存成功!'
        });
			})
		},
		handlePreview(){
			console.log(this.surveyId)
		},
		handleClick(tab, event) {
      
    }
	}
}
</script>

<style scoped="true">
  .app-container{
  	background: #f0f0f0;
  	padding: 0 10px;
  }
  .de-container{
  	height: calc(100vh - 89px);
  	overflow-y: auto;
  }
  .de-left{
  	background:  #fff;
  	width:100%;
  	min-height: 542px;
  	margin-top: 5px;
  }
  .de-main{
  	background:  #fff;
  	width:  770px;
  	margin: 0 auto;
  	margin-top: 5px;
  	min-height: 542px;
  	margin-bottom: 50px;
  	position: relative;
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
  	padding: 10px 0 0 20px;
    color: #333;
    word-break: break-word;
    cursor: pointer;
  }
  .q-add{
  	display: none;
  	float: right;
  }
  .s-box:hover .q-add{
  	display: block;
  }
  .rig-card{
  	background: #fff;
  	position: absolute;
  	top: 10px;
  	right: -58px;
  	width: 48px;
  	border: 1px solid #dadce0;
  	display: flex;
  	flex-direction: column;
  	text-align: center;;
  }
  .rig-card .card-item{
		padding: 10px 0;
		font-size: 14px;
		flex: 1;
		color: #555;
		cursor: pointer;
  }
  .rig-card .card-item:hover{
  	  background-color: rgba(95,99,104,0.039);
  }
  .rig-card .card-item.yulan i{
  	font-size: 16px;
  }
  .rig-card .card-item.fabu i{
  	font-size: 20px;
  }
  .rig-card .card-item.luoji i{
  	font-size: 24px;
  }
  .rig-card .card-item.jisuan i{
  	font-size: 20px;
  }
</style>