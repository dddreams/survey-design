import request from '@/utils/request'

// 查询问卷答案结果json列表
export function listJson(query) {
  return request({
    url: '/survey/json/list',
    method: 'get',
    params: query
  })
}

// 查询问卷答案结果json详细
export function getJson(anId) {
  return request({
    url: '/survey/json/' + anId,
    method: 'get'
  })
}

// 新增问卷答案结果json
export function addJson(data) {
  return request({
    url: '/survey/json',
    method: 'post',
    data: data
  })
}

// 修改问卷答案结果json
export function updateJson(data) {
  return request({
    url: '/survey/json',
    method: 'put',
    data: data
  })
}

// 删除问卷答案结果json
export function delJson(anId) {
  return request({
    url: '/survey/json/' + anId,
    method: 'delete'
  })
}

// 导出问卷答案结果json
export function exportJson(query) {
  return request({
    url: '/survey/json/export',
    method: 'get',
    params: query
  })
}