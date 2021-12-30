<template>
  <div class="q-box preview">
    <Input ref="input" v-if="question.questionType == 'input'" 
          :question="question" :index="index"/>
    <Textarea ref="textarea" v-if="question.questionType == 'textarea'" 
          :question="question" :index="index"/>
    <Radio ref="radio" v-if="question.questionType == 'radio'" 
          :question="question" :index="index"/>
    <Checkbox ref="checkbox" v-if="question.questionType == 'checkbox'" 
          :question="question" :index="index"/>
    <Select ref="select" v-if="question.questionType == 'select'" 
          :question="question" :index="index"/>
    <Title ref="title" v-if="question.questionType == 'title'" 
          :question="question" :index="index"/>
    <QText ref="text" v-if="question.questionType == 'text'" 
          :question="question" :index="index"/>
  </div>
</template>
<script>
import Input from './components/Input.vue';
import Title from './components/Title.vue';
import Textarea from './components/Textarea.vue';
import Radio from './components/Radio.vue';
import Checkbox from './components/Checkbox.vue';
import Select from './components/Select.vue';
import QText from './components/Text.vue';

export default {
  name: 'QuestionView',
  components: {Input, Title, Textarea, Radio, Checkbox, Select, QText},
  props: {
    index: Number,
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