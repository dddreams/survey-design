/*
 navicat premium data transfer

 source server         : localhost@surdes
 source server type    : mysql
 source server version : 50727
 source host           : localhost:3306
 source schema         : surdes

 target server type    : mysql
 target server version : 50727
 file encoding         : 65001

 date: 12/10/2021 16:03:16
*/

set names utf8mb4;
set foreign_key_checks = 0;

/**
 * 问卷相关的菜单、字典脚本
 * **/
insert into sys_menu values (1073, '问卷管理', 0, 1, 'survey', '', null, 1, 0, 'm', '0', '0', '', 'questionnire', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:23:11', '问卷菜单');
insert into sys_menu values (1080, '个人问卷', 1073, 1, 'survey', 'surdes/survey/index', null, 1, 0, 'c', '0', '0', 'survey:survey:list', 'questionnire', 'admin', '2021-10-18 17:09:41', 'admin', '2021-10-18 17:24:33', '');
insert into sys_menu values (1074, '问卷查询', 1080, 1, '#', '', null, 1, 0, 'f', '0', '0', 'survey:survey:query', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:10:43', '');
insert into sys_menu values (1075, '问卷新增', 1080, 2, '#', '', null, 1, 0, 'f', '0', '0', 'survey:survey:add', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:10:52', '');
insert into sys_menu values (1076, '问卷修改', 1080, 3, '#', '', null, 1, 0, 'f', '0', '0', 'survey:survey:edit', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:10:59', '');
insert into sys_menu values (1077, '问卷删除', 1080, 4, '#', '', null, 1, 0, 'f', '0', '0', 'survey:survey:remove', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:11:08', '');
insert into sys_menu values (1078, '问卷导出', 1080, 5, '#', '', null, 1, 0, 'f', '0', '0', 'survey:survey:export', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:11:14', '');
insert into sys_menu values (1081, '回收站', 1073, 10, 'recycle', 'surdes/recycle/list', null, 1, 0, 'c', '0', '0', 'survey:suevey:query', 'recycle', 'admin', '2021-10-18 17:15:02', '', null, '');
insert into sys_menu values (1082, '发布', 1080, 6, '', null, null, 1, 0, 'f', '0', '0', 'survey:survey:publish', '#', 'admin', '2021-10-19 09:53:47', '', null, '');
insert into sys_menu values (1083, '设计', 1080, 7, '', null, null, 1, 0, 'f', '0', '0', 'survey:question:list', '#', 'admin', '2021-10-19 10:05:39', '', null, '');
insert into sys_menu values (1084, '还原', 1081, 1, '', null, null, 1, 0, 'f', '0', '0', 'survey:survey:restore', '#', 'admin', '2021-10-19 15:15:39', '', null, '');
insert into sys_menu values (1085, '永久删除', 1081, 2, '', null, null, 1, 0, 'f', '0', '0', 'survey:survey:delete', '#', 'admin', '2021-10-19 15:16:10', '', null, '');
insert into sys_menu values (1086, '撤销发布', 1080, 8, '', null, null, 1, 0, 'f', '0', '0', 'survey:survey:revoke', '#', 'admin', '2021-10-19 15:36:48', '', null, '');
insert into sys_menu values (1087, '预览', 1080, 9, '', null, null, 1, 0, 'f', '0', '0', 'survey:survey:preview', '#', 'admin', '2021-10-19 16:57:57', '', null, '');



insert into sys_dict_type values (11, '问卷状态', 'survey_status', '0', 'admin', '2021-10-15 22:53:36', 'admin', '2021-10-15 22:57:50', '问卷状态列表');
insert into sys_dict_type values (12, '问卷类型', 'survey_type', '0', 'admin', '2021-10-15 22:59:20', '', null, '问卷类型');
insert into sys_dict_type values (13, '题目类型', 'question_type', '0', 'admin', '2021-10-25 15:24:29', '', null, '题目类型');

insert into sys_dict_data values (29, 1, '未发布', '0', 'survey_status', null, 'default', 'n', '0', 'admin', '2021-10-15 22:54:37', '', null, '问卷未发布');
insert into sys_dict_data values (30, 2, '收集中', '1', 'survey_status', null, 'default', 'n', '0', 'admin', '2021-10-15 22:54:59', '', null, '问卷收集中');
insert into sys_dict_data values (31, 3, '已结束', '2', 'survey_status', null, 'default', 'n', '0', 'admin', '2021-10-15 22:55:33', '', null, '问卷已结束');
insert into sys_dict_data values (32, 1, '调查问卷', '01', 'survey_type', null, 'default', 'n', '0', 'admin', '2021-10-15 23:00:18', '', null, '调查问卷');
insert into sys_dict_data values (33, 2, '考试试卷', '02', 'survey_type', null, 'default', 'n', '0', 'admin', '2021-10-15 23:01:00', '', null, '考试试卷');
insert into sys_dict_data values (34, 3, '表单', '03', 'survey_type', null, 'default', 'n', '0', 'admin', '2021-10-15 23:01:57', '', null, '登记等表单');
insert into sys_dict_data values (35, 3, '满意度调查', '03', 'survey_type', null, 'default', 'n', '0', 'admin', '2021-10-15 23:02:46', '', null, '满意度调查');
insert into sys_dict_data values (36, 1, '单行填空', 'input', 'question_type', 'input', 'default', 'n', '0', 'admin', '2021-10-25 15:31:56', '', null, '填空题');
insert into sys_dict_data values (37, 2, '多行填空', 'textarea', 'question_type', 'textarea', 'default', 'n', '0', 'admin', '2021-10-25 15:32:22', '', null, '填空题');
insert into sys_dict_data values (38, 3, '单项选择', 'radio', 'question_type', 'ridio', 'default', 'n', '0', 'admin', '2021-10-25 15:33:34', 'admin', '2021-10-25 16:50:53', '选择题');
insert into sys_dict_data values (39, 4, '多项选择', 'checkbox', 'question_type', 'checkbox', 'default', 'n', '0', 'admin', '2021-10-25 15:33:58', '', null, '选择题');
insert into sys_dict_data values (40, 5, '下拉选择', 'select', 'question_type', 'select', 'default', 'n', '0', 'admin', '2021-10-25 15:34:19', '', null, '选择题');
insert into sys_dict_data values (41, 6, '表格题', 'table', 'question_type', 'table', 'default', 'n', '0', 'admin', '2021-10-25 15:36:05', '', null, '复杂题');
insert into sys_dict_data values (42, 7, '计算题', 'compute', 'question_type', 'jisuan', 'default', 'n', '0', 'admin', '2021-10-25 15:44:24', '', null, '复杂题');
insert into sys_dict_data values (43, 8, '附件题', 'file', 'question_type', 'file', 'default', 'n', '0', 'admin', '2021-10-25 15:44:46', '', null, '复杂题');
insert into sys_dict_data values (44, 9, '标题', 'title', 'question_type', 'title', 'default', 'n', '0', 'admin', '2021-10-25 19:42:35', 'admin', '2021-10-25 19:43:36', '文本说明');
insert into sys_dict_data values (45, 10, '段落说明', 'text', 'question_type', 'text', 'default', 'n', '0', 'admin', '2021-10-25 19:43:25', '', null, '文本说明');


-- ----------------------------
-- table structure for tb_survey
-- ----------------------------
drop table if exists tb_survey;
create table tb_survey  (
  survey_id              bigint(20)     not null auto_increment comment '问卷主键',
  survey_name            varchar(64)    not null                comment '问卷名称',
  survey_desc            varchar(500)   default null            comment '问卷说明描述',
  survey_type            varchar(3)     default null            comment '问卷类型',
  survey_status          char(1)        default '0'             comment '问卷状态（0：未发布，1：收集中，2：已结束）',
  create_time            datetime                               comment '创建时间',
  user_id                bigint(20)     default null            comment '创建人',
  status                 char(1)        default '1'             comment '数据状态（1：有效，0：无效）',
  book_code              char(12)       default ''              comment '帐套编码',
  primary key (survey_id)
) engine=innodb auto_increment=1 comment = '问卷表';

-- ----------------------------
-- table structure for tb_question
-- ----------------------------
drop table if exists tb_question;
create table tb_question  (
  question_id           bigint(20)       not null   auto_increment     comment '题目主键',
  survey_id             bigint(20)       not null                      comment '问卷主键',
  question_no           varchar(20)      default null                  comment '题目编号',
  question_sort         int(8)           default '1'                   comment '排序字段',
  question_name         varchar(500)     default ''                    comment '题目名称',
  question_type         varchar(20)      default 'input'               comment '题目类型',
  validate_rule         varchar(256)     default ''                    comment '校验规则',
  show_or_hide          char(1)          default '0'                   comment '初始是否隐藏（1：是，0：否）',
  question_attr         varchar(32)      default null                  comment '题目属性',
  relation_result       varchar(256)     default null                  comment '关联结果字段',
  not_edit              char(1)          default ''                    comment '只读标识 1 为不能编辑',
  default_value         varchar(1024)    default null                  comment '默认值',
  formula               varchar(1024)    default null                  comment '结果计算公式',
  option_display        varchar(10)      default 'column'              comment '选项显示方向',
  book_code             char(12)         default null                  comment '账套',
  create_time           datetime                                       comment '创建时间',
  primary key (question_id) using btree,
  index inx_survey_id(survey_id) using btree,
  index inx_question_sort(question_sort) using btree
) engine=innodb auto_increment=100 comment = '问卷题目表' row_format = dynamic;


-- ----------------------------
-- table structure for tb_options
-- ----------------------------
drop table if exists tb_options;
create table tb_options  (
  option_id          bigint(20)          not null auto_increment           comment '选项主键',
  survey_id          bigint(20)          not null                          comment '问卷主键',
  question_id        bigint(20)          not null                          comment '问题主键',
  option_code        varchar(64)         null                              comment '选项值',
  option_text        varchar(256)        not null                          comment '选项文本',
  option_no          int(8)              not null                          comment '选项序号',
  hide_question      longtext            null                              comment '逻辑隐藏题',
  show_question      longtext            null                              comment '逻辑显示题',
  is_wtqd            char(1)             default '0'                       comment '是否设置问题（1：是，0：否）',
  wtqd_type          varchar(2)          default null                      comment '问题清单分类',
  wtqd_value         varchar(250)        default null                      comment '比较值',
  wtqd_symbol        varchar(2)          default null                      comment '比较逻辑（使用字典）',
  wtqd_desc          varchar(500)        default null                      comment '问题清单描述',
  is_extend          char(1)             default '0'                       comment '是否扩展填空（1：是，0：否）',
  create_time        datetime                                              comment '创建时间',
  logic_symbol       varchar(8)          default null                      comment '显示逻辑比较符',
  book_code          char(12)            default ''                        comment '帐套编码',
  primary key (option_id) using btree,
  index inx_question_id(question_id) using btree,
  index inx_options_no(option_no) using btree
) engine = innodb auto_increment=1000 comment = '问卷选项表' row_format = dynamic;

-- ----------------------------
-- table structure for tb_answer
-- ----------------------------
drop table if exists tb_answer;
create table tb_answer  (
  answer_id             bigint(20)             not null  auto_increment        comment '答案主键',
  survey_id             bigint(20)             not null                        comment '问卷主键',
  question_id           bigint(20)             not null                        comment '问题主键',
  option_code           varchar(100)           not null                        comment '选项编码',
  answer_value          varchar(1024)          default ''                      comment '答案结果',
  extend_value          varchar(500)           default ''                      comment '扩展填空值',
  user_id               varchar(100)           default ''                      comment '答题人唯一标识',
  user_name             varchar(100)           default ''                      comment '答题人姓名',
  create_time           datetime                                               comment '创建时间',
  book_code             char(12)              default ''                       comment '账套',
  primary key (answer_id) using btree
) engine = innodb auto_increment=1000 comment = '问卷答案结果表' row_format = dynamic;

-- ----------------------------
-- table structure for tb_answer_json
-- ----------------------------
drop table if exists tb_answer_json;
create table tb_answer_json  (
  an_id                 bigint(20)             not null  auto_increment        comment '答案主键',
  survey_id             bigint(20)             not null                        comment '问卷主键',
  answer_json           longtext               null                            comment '答案结果，json格式存储',
  user_id               varchar(100)           default ''                      comment '答题人唯一标识',
  user_name             varchar(100)           default ''                      comment '答题人姓名',
  create_time           datetime                                               comment '创建时间',
  book_code             char(12)              default ''                       comment '账套',
  primary key (an_id) using btree
)engine = innodb auto_increment=100 comment = '问卷答案结果表json' row_format = dynamic;

-- ----------------------------
-- table structure for tb_table
-- ----------------------------

-- drop table if exists tb_table;
-- create table tb_table  (
--   table_id char(32)  null default null comment '主键',
--   question_id char(32)  null default null comment '问题主键',
--   target varchar(500)  null default null comment '表格表头指标',
--   target_type varchar(256)  null default null comment '指标类型，横向：row，纵向：column',
--   create_time char(19)  null default null comment '创建时间',
--   table_sort int(11) null default null comment '排序字段',
--   survey_id char(32)  null default null comment '问卷主键',
--   unique index tb_table_pk(table_id) using btree,
--   index tb_table_question_id_index(question_id) using btree
-- ) engine = innodb character set = utf8mb4 collate = utf8mb4_general_ci comment = '表格题关系表' row_format = dynamic;

-- ----------------------------
-- table structure for tb_table_answer
-- ----------------------------

-- drop table if exists tb_table_answer;
-- create table tb_table_answer  (
--   ta_id char(32)  not null comment '主键',
--   survey_id char(32)  null default null comment '问卷主键',
--   question_id char(32)  null default null comment '问题主键',
--   table_row_id varchar(50)  null default null comment '表格行主键',
--   table_column_id varchar(50)  null default null comment '表格列主键',
--   table_value varchar(1000)  null default null comment '结果值',
--   create_time char(19)  null default null comment '创建时间',
--   book_code char(12)  null default null comment '帐套',
--   dcdx_id varchar(50)  null default null comment '调查对象主键',
--   answer_sort int(11) null default null comment '对应排序字段',
--   primary key (ta_id) using btree,
--   index tb_table_answer_question_id_index(question_id) using btree,
--   index inx_table_answer_sort(answer_sort) using btree
-- ) engine = innodb character set = utf8mb4 collate = utf8mb4_general_ci row_format = dynamic;

set foreign_key_checks = 1;
