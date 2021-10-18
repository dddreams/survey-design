import request from '@/utils/request'

// 查询问卷答案结果列表
export function listAnswer(query) {
  return request({
    url: '/survey/answer/list',
    method: 'get',
    params: query
  })
}

// 查询问卷答案结果详细
export function getAnswer(answerId) {
  return request({
    url: '/survey/answer/' + answerId,
    method: 'get'
  })
}

// 新增问卷答案结果
export function addAnswer(data) {
  return request({
    url: '/survey/answer',
    method: 'post',
    data: data
  })
}

// 修改问卷答案结果
export function updateAnswer(data) {
  return request({
    url: '/survey/answer',
    method: 'put',
    data: data
  })
}

// 删除问卷答案结果
export function delAnswer(answerId) {
  return request({
    url: '/survey/answer/' + answerId,
    method: 'delete'
  })
}

// 导出问卷答案结果
export function exportAnswer(query) {
  return request({
    url: '/survey/answer/export',
    method: 'get',
    params: query
  })
}