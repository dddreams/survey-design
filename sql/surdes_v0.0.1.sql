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
  status                 char(1)        default '0'             comment '数据状态（1：有效，0：无效）',
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
  question_type         char(2)          default '01'                  comment '题目类型（01：填空题，02：单选题，03：多选题，04：多行文本题）',
  validate_rule         varchar(256)     default ''                    comment '校验规则',
  show_or_hide          char(1)          default '0'                   comment '初始是否隐藏（1：是，0：否）',
  create_time           datetime                                       comment '创建时间',
  status                char(1)          default '1'                   comment '1：有效，0：无效',
  question_attr         varchar(32)      default null                  comment '题目属性',
  relation_result       varchar(256)     default null                  comment '关联结果字段',
  not_edit              char(1)          default ''                    comment '只读标识 1 为不能编辑',
  default_value         varchar(1024)    default null                  comment '默认值',
  formula               varchar(1024)    default null                  comment '结果计算公式',
  book_code             char(12)         default null                  comment '账套',
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
  question_id        bigint(20)          not null                          comment '问题主键',
  option_code        varchar(64)         not null                          comment '选项值',
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
  status             char(1)             default '1'                       comment '1：有效，0：无效',
  logic_symbol       varchar(8)          default null                      comment '显示逻辑比较符',
  survey_id          bigint(20)          not null                          comment '问卷主键',
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
  status                char(1)               default '1'                      comment '1：有效，0：无效',
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
  status                char(1)               default '1'                      comment '1：有效，0：无效',
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
