import request from '@/utils/request'

// 查询问卷列表
export function listSurvey(query) {
  return request({
    url: '/survey/survey/list',
    method: 'get',
    params: query
  })
}

// 查询问卷详细
export function getSurvey(surveyId) {
  return request({
    url: '/survey/survey/' + surveyId,
    method: 'get'
  })
}

// 新增问卷
export function addSurvey(data) {
  return request({
    url: '/survey/survey',
    method: 'post',
    data: data
  })
}

// 修改问卷
export function updateSurvey(data) {
  return request({
    url: '/survey/survey',
    method: 'put',
    data: data
  })
}

// 删除问卷
export function delSurvey(surveyId) {
  return request({
    url: '/survey/survey/' + surveyId,
    method: 'delete'
  })
}

// 导出问卷
export function exportSurvey(query) {
  return request({
    url: '/survey/survey/export',
    method: 'get',
    params: query
  })
}