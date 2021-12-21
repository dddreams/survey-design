<template>
  
</template>
<script>
import { getSurvey } from "@/api/survey/survey";
import { listBySurveyId } from "@/api/survey/question";
export default {
  name: 'Preview',
  // dicts: [],
  components: {  },
  data(){
    return {
      surveyId: this.$route.query.surveyId,
      survey: {},
      questionList: [],
    }
  },
  mounted(){},
  methods:{

  }
}
</script>