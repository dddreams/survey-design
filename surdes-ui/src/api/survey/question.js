import request from '@/utils/request'

// 查询问卷题目列表
export function listQuestion(query) {
  return request({
    url: '/survey/question/list',
    method: 'get',
    params: query
  })
}

// 根据问卷主键查询问卷题目列表
export function listBySurveyId(surveyId) {
  return request({
    url: '/survey/question/list/' + surveyId,
    method: 'get',
  })
}

// 查询问卷题目详细
export function getQuestion(questionId) {
  return request({
    url: '/survey/question/' + questionId,
    method: 'get'
  })
}

// 新增问卷题目
export function saveQuestion(data) {
  return request({
    url: '/survey/question',
    method: 'post',
    data: data
  })
}

// 修改问卷题目
export function updateQuestion(data) {
  return request({
    url: '/survey/question',
    method: 'put',
    data: data
  })
}

// 删除问卷题目
export function delQuestion(questionId) {
  return request({
    url: '/survey/question/' + questionId,
    method: 'delete'
  })
}

// 导出问卷题目
export function exportQuestion(query) {
  return request({
    url: '/survey/question/export',
    method: 'get',
    params: query
  })
}

// 更新问题序号和排序
export function updateQueNo(data) {
  return request({
    url: '/survey/question/updateQueNo',
    method: 'put',
    data: data
  })
}