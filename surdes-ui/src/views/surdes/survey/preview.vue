<template>
  <div class="app-container">
    <div class="de-main">
        <div class="s-box">
          <h2 class="s-title">{{ survey.surveyName }}</h2>
          <div class="s-desc">
            {{ survey.surveyDesc }}
          </div>
        </div>
        <div class="s-quesitions">
          <Question 
            v-for="(question, i) in questionList" 
            :question="question" 
            :surveyId="surveyId" 
            :index="i"
            :key="question.questionNo"/>
        </div>

        <div class="s-btn">
          <el-button type="primary" disabled>提交</el-button>
          <!-- <el-button type="primary" plain disabled>暂存</el-button> -->
        </div>
      </div>
      <el-backtop target=".app-container .de-main"></el-backtop>
  </div>
</template>
<script>
import Question from './question/question_view';
import { getSurvey } from "@/api/survey/survey";
import { listBySurveyId } from "@/api/survey/question";
export default {
  name: 'Preview',
  // dicts: [],
  components: { Question },
  data(){
    return {
      surveyId: this.$route.query.surveyId,
      survey: {},
      questionList: [],
    }
  },
  mounted(){
    this.getSurvey();
    this.getQuestionList();
  },
  methods:{
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
  }
}
</script>
<style scoped>
.app-container{
  background: #f0f0f0;
  
}
.de-main{
  background:  #fff;
  width:  770px;
  margin: 0 auto;
  margin-top: 5px;
  min-height: 542px;
  margin-bottom: 50px;
  position: relative;
  overflow-y: auto;
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
.s-btn{
  text-align:center;
  padding-bottom: 50px;
}
</style>