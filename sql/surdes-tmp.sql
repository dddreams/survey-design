/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : surdes

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 25/11/2021 15:30:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (7, 'tb_answer', '问卷答案结果表', NULL, NULL, 'Answer', 'crud', 'com.shure.surdes.survey', 'survey', 'answer', '问卷答案结果', 'Shure', '0', '/', NULL, 'admin', '2021-10-18 16:29:48', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'tb_answer_json', '问卷答案结果表json', NULL, NULL, 'AnswerJson', 'crud', 'com.shure.surdes.survey', 'survey', 'json', '问卷答案结果json', 'Shure', '0', '/', NULL, 'admin', '2021-10-18 16:29:48', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'tb_options', '问卷选项表', NULL, NULL, 'Options', 'crud', 'com.shure.surdes.survey', 'survey', 'options', '问卷选项', 'Shure', '0', '/', NULL, 'admin', '2021-10-18 16:29:48', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (10, 'tb_question', '问卷题目表', NULL, NULL, 'Question', 'crud', 'com.shure.surdes.survey', 'survey', 'question', '问卷题目', 'Shure', '0', '/', NULL, 'admin', '2021-10-18 16:29:48', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (11, 'tb_survey', '问卷表', NULL, NULL, 'Survey', 'crud', 'com.shure.surdes.survey', 'survey', 'survey', '问卷', 'Shure', '0', '/', NULL, 'admin', '2021-10-18 16:29:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (72, '7', 'answer_id', '答案主键', 'bigint(20)', 'Long', 'answerId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, '7', 'survey_id', '问卷主键', 'bigint(20)', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, '7', 'question_id', '问题主键', 'bigint(20)', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, '7', 'option_code', '选项编码', 'varchar(100)', 'String', 'optionCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, '7', 'answer_value', '答案结果', 'varchar(1024)', 'String', 'answerValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, '7', 'extend_value', '扩展填空值', 'varchar(500)', 'String', 'extendValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, '7', 'user_id', '答题人唯一标识', 'varchar(100)', 'String', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, '7', 'user_name', '答题人姓名', 'varchar(100)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, '7', 'status', '1：有效，0：无效', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, '7', 'book_code', '账套', 'char(12)', 'String', 'bookCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, '8', 'an_id', '答案主键', 'bigint(20)', 'Long', 'anId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, '8', 'survey_id', '问卷主键', 'bigint(20)', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '8', 'answer_json', '答案结果，json格式存储', 'longtext', 'String', 'answerJson', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, '8', 'user_id', '答题人唯一标识', 'varchar(100)', 'String', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, '8', 'user_name', '答题人姓名', 'varchar(100)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, '8', 'status', '1：有效，0：无效', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, '8', 'book_code', '账套', 'char(12)', 'String', 'bookCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, '9', 'option_id', '选项主键', 'bigint(20)', 'Long', 'optionId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, '9', 'question_id', '问题主键', 'bigint(20)', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, '9', 'option_code', '选项值', 'varchar(64)', 'String', 'optionCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, '9', 'option_text', '选项文本', 'varchar(256)', 'String', 'optionText', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, '9', 'option_no', '选项序号', 'int(8)', 'Integer', 'optionNo', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, '9', 'hide_question', '逻辑隐藏题', 'longtext', 'String', 'hideQuestion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, '9', 'show_question', '逻辑显示题', 'longtext', 'String', 'showQuestion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, '9', 'is_wtqd', '是否设置问题（1：是，0：否）', 'char(1)', 'String', 'isWtqd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, '9', 'wtqd_type', '问题清单分类', 'varchar(2)', 'String', 'wtqdType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, '9', 'wtqd_value', '比较值', 'varchar(250)', 'String', 'wtqdValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, '9', 'wtqd_symbol', '比较逻辑（使用字典）', 'varchar(2)', 'String', 'wtqdSymbol', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, '9', 'wtqd_desc', '问题清单描述', 'varchar(500)', 'String', 'wtqdDesc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, '9', 'is_extend', '是否扩展填空（1：是，0：否）', 'char(1)', 'String', 'isExtend', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, '9', 'status', '1：有效，0：无效', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 15, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, '9', 'logic_symbol', '显示逻辑比较符', 'varchar(8)', 'String', 'logicSymbol', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, '9', 'survey_id', '问卷主键', 'bigint(20)', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '9', 'book_code', '帐套编码', 'char(12)', 'String', 'bookCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, '10', 'question_id', '题目主键', 'bigint(20)', 'Long', 'questionId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, '10', 'survey_id', '问卷主键', 'bigint(20)', 'Long', 'surveyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, '10', 'question_no', '题目编号', 'varchar(20)', 'String', 'questionNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, '10', 'question_sort', '排序字段', 'int(8)', 'Integer', 'questionSort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, '10', 'question_name', '题目名称', 'varchar(500)', 'String', 'questionName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'textarea', '', 5, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, '10', 'question_type', '题目类型（01：填空题，02：单选题，03：多选题，04：多行文本题）', 'char(2)', 'String', 'questionType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, '10', 'validate_rule', '校验规则', 'varchar(256)', 'String', 'validateRule', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, '10', 'show_or_hide', '初始是否隐藏（1：是，0：否）', 'char(1)', 'String', 'showOrHide', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, '10', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, '10', 'status', '1：有效，0：无效', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (119, '10', 'question_attr', '题目属性', 'varchar(32)', 'String', 'questionAttr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, '10', 'relation_result', '关联结果字段', 'varchar(256)', 'String', 'relationResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, '10', 'not_edit', '只读标识 1 为不能编辑', 'char(1)', 'String', 'notEdit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, '10', 'default_value', '默认值', 'varchar(1024)', 'String', 'defaultValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 14, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, '10', 'formula', '结果计算公式', 'varchar(1024)', 'String', 'formula', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 15, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, '10', 'book_code', '账套', 'char(12)', 'String', 'bookCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, '11', 'survey_id', '问卷主键', 'bigint(20)', 'Long', 'surveyId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, '11', 'survey_name', '问卷名称', 'varchar(64)', 'String', 'surveyName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, '11', 'survey_desc', '问卷说明描述', 'varchar(500)', 'String', 'surveyDesc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, '11', 'survey_type', '问卷类型', 'varchar(3)', 'String', 'surveyType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, '11', 'survey_status', '问卷状态（0：未发布，1：收集中，2：已结束）', 'char(1)', 'String', 'surveyStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (130, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (131, '11', 'user_id', '创建人', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (132, '11', 'status', '数据状态（1：有效，0：无效）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-10-18 16:29:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, '11', 'book_code', '帐套编码', 'char(12)', 'String', 'bookCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-10-18 16:29:48', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.shure.surdes.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720025636F6D2E73687572652E7375726465732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002E636F6D2E73687572652E7375726465732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C5F16915878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.shure.surdes.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720025636F6D2E73687572652E7375726465732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002E636F6D2E73687572652E7375726465732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C5F16915878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.shure.surdes.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720025636F6D2E73687572652E7375726465732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002E636F6D2E73687572652E7375726465732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C5F16915878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-0G1JVAI1635779290203', 1635784110056, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1635779290000, -1, 5, 'PAUSED', 'CRON', 1635779290000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1635779295000, -1, 5, 'PAUSED', 'CRON', 1635779290000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1635779300000, -1, 5, 'PAUSED', 'CRON', 1635779290000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-10-08 16:48:07', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-10-08 16:48:07', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-10-08 16:48:07', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-10-08 16:48:07', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-10-08 16:48:07', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-11-25 15:29:38', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '未发布', '0', 'survey_status', NULL, 'default', 'N', '0', 'admin', '2021-10-15 22:54:37', '', NULL, '问卷未发布');
INSERT INTO `sys_dict_data` VALUES (30, 2, '收集中', '1', 'survey_status', NULL, 'default', 'N', '0', 'admin', '2021-10-15 22:54:59', '', NULL, '问卷收集中');
INSERT INTO `sys_dict_data` VALUES (31, 3, '已结束', '2', 'survey_status', NULL, 'default', 'N', '0', 'admin', '2021-10-15 22:55:33', '', NULL, '问卷已结束');
INSERT INTO `sys_dict_data` VALUES (32, 1, '调查问卷', '01', 'survey_type', NULL, 'default', 'N', '0', 'admin', '2021-10-15 23:00:18', '', NULL, '调查问卷');
INSERT INTO `sys_dict_data` VALUES (33, 2, '考试试卷', '02', 'survey_type', NULL, 'default', 'N', '0', 'admin', '2021-10-15 23:01:00', '', NULL, '考试试卷');
INSERT INTO `sys_dict_data` VALUES (34, 3, '表单', '03', 'survey_type', NULL, 'default', 'N', '0', 'admin', '2021-10-15 23:01:57', '', NULL, '登记等表单');
INSERT INTO `sys_dict_data` VALUES (35, 3, '满意度调查', '04', 'survey_type', NULL, 'default', 'N', '0', 'admin', '2021-10-15 23:02:46', '', NULL, '满意度调查');
INSERT INTO `sys_dict_data` VALUES (36, 1, '单行填空', 'input', 'question_type', 'input', 'default', 'N', '0', 'admin', '2021-10-25 15:31:56', '', NULL, '填空题');
INSERT INTO `sys_dict_data` VALUES (37, 2, '多行填空', 'textarea', 'question_type', 'textarea', 'default', 'N', '0', 'admin', '2021-10-25 15:32:22', '', NULL, '填空题');
INSERT INTO `sys_dict_data` VALUES (38, 3, '单项选择', 'radio', 'question_type', 'ridio', 'default', 'N', '0', 'admin', '2021-10-25 15:33:34', 'admin', '2021-10-25 16:50:53', '选择题');
INSERT INTO `sys_dict_data` VALUES (39, 4, '多项选择', 'checkbox', 'question_type', 'checkbox', 'default', 'N', '0', 'admin', '2021-10-25 15:33:58', '', NULL, '选择题');
INSERT INTO `sys_dict_data` VALUES (40, 5, '下拉选择', 'select', 'question_type', 'select', 'default', 'N', '0', 'admin', '2021-10-25 15:34:19', '', NULL, '选择题');
INSERT INTO `sys_dict_data` VALUES (41, 6, '表格题', 'table', 'question_type', 'table', 'default', 'N', '1', 'admin', '2021-10-25 15:36:05', 'admin', '2021-10-29 15:02:45', '复杂题');
INSERT INTO `sys_dict_data` VALUES (42, 7, '计算题', 'compute', 'question_type', 'jisuan', 'default', 'N', '1', 'admin', '2021-10-25 15:44:24', 'admin', '2021-10-29 15:02:51', '复杂题');
INSERT INTO `sys_dict_data` VALUES (43, 8, '附件题', 'file', 'question_type', 'file', 'default', 'N', '1', 'admin', '2021-10-25 15:44:46', 'admin', '2021-10-29 15:02:56', '复杂题');
INSERT INTO `sys_dict_data` VALUES (44, 9, '标题', 'title', 'question_type', 'title', 'default', 'N', '0', 'admin', '2021-10-25 19:42:35', 'admin', '2021-10-25 19:43:36', '文本说明');
INSERT INTO `sys_dict_data` VALUES (45, 10, '段落说明', 'text', 'question_type', 'text', 'default', 'N', '0', 'admin', '2021-10-25 19:43:25', '', NULL, '文本说明');
INSERT INTO `sys_dict_data` VALUES (46, 1, '纵向', 'column', 'option_direction', NULL, 'default', 'N', '0', 'admin', '2021-10-31 01:28:04', '', NULL, '纵向');
INSERT INTO `sys_dict_data` VALUES (47, 2, '横向', 'row', 'option_direction', NULL, 'default', 'N', '0', 'admin', '2021-10-31 01:28:28', '', NULL, '横向');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '问卷状态', 'survey_status', '0', 'admin', '2021-10-15 22:53:36', 'admin', '2021-10-15 22:57:50', '问卷状态列表');
INSERT INTO `sys_dict_type` VALUES (12, '问卷类型', 'survey_type', '0', 'admin', '2021-10-15 22:59:20', '', NULL, '问卷类型');
INSERT INTO `sys_dict_type` VALUES (13, '题目类型', 'question_type', '0', 'admin', '2021-10-25 15:24:29', '', NULL, '题目类型');
INSERT INTO `sys_dict_type` VALUES (14, '选项显示方向', 'option_direction', '0', 'admin', '2021-10-31 01:26:16', '', NULL, '选项显示方向');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-10-08 16:48:07', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2021-10-13 15:04:29');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2021-10-13 15:05:43');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2021-10-13 15:55:58');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 17:03:32');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 10:35:33');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 15:01:32');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 16:43:45');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 13:33:25');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-15 13:50:17');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2021-10-15 15:11:51');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 15:11:56');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 22:14:12');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 15:32:55');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-18 17:15:38');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 17:15:42');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-19 09:00:44');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-19 11:20:53');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-10-19 11:51:46');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-19 11:51:54');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-19 14:33:41');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-19 16:57:16');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-20 10:37:53');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-25 10:58:18');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-25 13:35:34');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-25 14:11:33');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-25 15:06:02');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-25 18:01:49');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-25 19:38:10');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-10-26 17:30:27');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 17:30:32');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 19:15:32');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 20:44:17');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 21:28:58');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2021-10-27 10:43:07');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-10-27 10:43:11');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 10:43:14');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 13:31:19');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-28 13:33:59');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-28 15:11:33');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 14:07:18');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-29 16:05:31');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-30 14:34:21');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-30 17:17:20');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-30 20:08:25');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-30 22:52:49');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-31 15:21:51');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-11-01 23:08:54');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-01 23:08:59');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1088 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 98, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-10-08 16:48:07', 'admin', '2021-10-15 13:37:45', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 99, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-10-08 16:48:07', 'admin', '2021-10-15 13:37:57', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 97, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-10-08 16:48:07', 'admin', '2021-10-18 15:34:06', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-10-08 16:48:07', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-10-08 16:48:07', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-10-08 16:48:07', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-10-08 16:48:07', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-10-08 16:48:07', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-10-08 16:48:07', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-10-08 16:48:07', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-10-08 16:48:07', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-10-08 16:48:07', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-10-08 16:48:07', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-10-08 16:48:07', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-10-08 16:48:07', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-10-08 16:48:07', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-10-08 16:48:07', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-10-08 16:48:07', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-10-08 16:48:07', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-10-08 16:48:07', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-10-08 16:48:07', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-10-08 16:48:07', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-10-08 16:48:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '问卷管理', 0, 1, 'survey', '', NULL, 1, 0, 'M', '0', '0', '', 'questionnire', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:23:11', '问卷菜单');
INSERT INTO `sys_menu` VALUES (1074, '问卷查询', 1080, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'survey:survey:query', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:10:43', '');
INSERT INTO `sys_menu` VALUES (1075, '问卷新增', 1080, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'survey:survey:add', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:10:52', '');
INSERT INTO `sys_menu` VALUES (1076, '问卷修改', 1080, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'survey:survey:edit', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:10:59', '');
INSERT INTO `sys_menu` VALUES (1077, '问卷删除', 1080, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'survey:survey:remove', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:11:08', '');
INSERT INTO `sys_menu` VALUES (1078, '问卷导出', 1080, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'survey:survey:export', '#', 'admin', '2021-10-18 17:00:27', 'admin', '2021-10-18 17:11:14', '');
INSERT INTO `sys_menu` VALUES (1080, '个人问卷', 1073, 1, 'survey', 'surdes/survey/index', NULL, 1, 0, 'C', '0', '0', 'survey:survey:list', 'questionnire', 'admin', '2021-10-18 17:09:41', 'admin', '2021-10-25 11:35:21', '');
INSERT INTO `sys_menu` VALUES (1081, '回收站', 1073, 10, 'recycle', 'surdes/recycle/list', '', 1, 0, 'C', '0', '0', 'survey:suevey:query', 'recycle', 'admin', '2021-10-18 17:15:02', 'admin', '2021-10-19 10:47:19', '');
INSERT INTO `sys_menu` VALUES (1082, '发布', 1080, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'survey:survey:publish', '#', 'admin', '2021-10-19 09:53:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '设计', 1080, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'survey:question:list', '#', 'admin', '2021-10-19 10:05:39', 'admin', '2021-10-20 10:44:05', '');
INSERT INTO `sys_menu` VALUES (1084, '还原', 1081, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'survey:survey:restore', '#', 'admin', '2021-10-19 15:15:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1085, '永久删除', 1081, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'survey:survey:delete', '#', 'admin', '2021-10-19 15:16:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1086, '撤销发布', 1080, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'survey:survey:revoke', '#', 'admin', '2021-10-19 15:36:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, '预览', 1080, 9, '', NULL, NULL, 1, 0, 'F', '0', '0', 'survey:survey:preview', '#', 'admin', '2021-10-19 16:57:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-10-08 16:48:07', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-10-08 16:48:07', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.shure.surdes.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-10-13 17:10:20');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.shure.surdes.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-10-13 17:11:05');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.shure.surdes.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-10-13 17:13:32');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 3, 'com.shure.surdes.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-10-13 17:17:24');
INSERT INTO `sys_oper_log` VALUES (104, '用户头像', 2, 'com.shure.surdes.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/13/8c769035-a6c1-4ea2-b614-86fcdf39b077.jpeg\",\"code\":200}', 0, NULL, '2021-10-13 17:26:05');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":\"3\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1633682887000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-14 10:36:55');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":\"98\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1633682887000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 13:37:45');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"monitor\",\"orderNum\":\"99\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1633682887000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 13:37:57');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":\"97\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1633682887000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 13:38:04');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":\"1\",\"menuName\":\"问卷设计\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/surdes\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 13:40:08');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":\"1\",\"menuName\":\"问卷设计\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"surdes\",\"children\":[],\"createTime\":1634276408000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1061,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 13:40:31');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":\"1\",\"menuName\":\"我的设计\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"surdes\",\"children\":[],\"createTime\":1634276408000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1061,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 15:28:11');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":\"1\",\"menuName\":\"问卷管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"surdes\",\"children\":[],\"createTime\":1634276408000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1061,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 15:36:31');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"1\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"surdes/survey/list\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"surdes:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 15:39:22');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"textarea\",\"orderNum\":\"10\",\"menuName\":\"回收站\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"recycle\",\"component\":\"surdes/recycle/list\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"surdes:recycle:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 15:43:01');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"recycle\",\"orderNum\":\"10\",\"menuName\":\"回收站\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"recycle\",\"component\":\"surdes/recycle/list\",\"children\":[],\"createTime\":1634283781000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1063,\"menuType\":\"C\",\"perms\":\"surdes:recycle:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 22:33:59');
INSERT INTO `sys_oper_log` VALUES (116, '字典类型', 1, 'com.shure.surdes.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"问卷状态\",\"remark\":\"问卷状态列表\",\"params\":{},\"dictType\":\"survey-status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 22:53:36');
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"remark\":\"问卷未发布\",\"params\":{},\"dictType\":\"survey-status\",\"dictLabel\":\"未发布\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 22:54:37');
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":2,\"remark\":\"问卷收集中\",\"params\":{},\"dictType\":\"survey-status\",\"dictLabel\":\"收集中\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 22:54:59');
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":3,\"remark\":\"问卷已结束\",\"params\":{},\"dictType\":\"survey-status\",\"dictLabel\":\"已结束\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 22:55:33');
INSERT INTO `sys_oper_log` VALUES (120, '字典类型', 2, 'com.shure.surdes.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1634309616000,\"updateBy\":\"admin\",\"dictName\":\"问卷状态\",\"remark\":\"问卷状态列表\",\"dictId\":11,\"params\":{},\"dictType\":\"survey_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 22:57:50');
INSERT INTO `sys_oper_log` VALUES (121, '字典类型', 1, 'com.shure.surdes.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"问卷类型\",\"remark\":\"问卷类型\",\"params\":{},\"dictType\":\"survey_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 22:59:20');
INSERT INTO `sys_oper_log` VALUES (122, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"01\",\"listClass\":\"default\",\"dictSort\":1,\"remark\":\"调查问卷\",\"params\":{},\"dictType\":\"survey_type\",\"dictLabel\":\"调查问卷\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:00:18');
INSERT INTO `sys_oper_log` VALUES (123, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"02\",\"listClass\":\"default\",\"dictSort\":2,\"remark\":\"考试试卷\",\"params\":{},\"dictType\":\"survey_type\",\"dictLabel\":\"考试试卷\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:01:00');
INSERT INTO `sys_oper_log` VALUES (124, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"03\",\"listClass\":\"default\",\"dictSort\":3,\"remark\":\"登记等表单\",\"params\":{},\"dictType\":\"survey_type\",\"dictLabel\":\"表单\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:01:57');
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"03\",\"listClass\":\"default\",\"dictSort\":3,\"remark\":\"满意度调查\",\"params\":{},\"dictType\":\"survey_type\",\"dictLabel\":\"满意度调查\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:02:46');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"问卷创建\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"survey:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:13:43');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"问卷创建\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1634310823000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1064,\"menuType\":\"F\",\"perms\":\"surdes:survey:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:14:25');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"问卷修改\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"surdes:survey:update\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:14:59');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"问卷修改\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1634310899000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1065,\"menuType\":\"F\",\"perms\":\"surdes:survey:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:15:14');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"问卷删除\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"surdes:survey:del\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:15:39');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"问卷删除\",\"params\":{},\"parentId\":1062,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1634310939000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1066,\"menuType\":\"F\",\"perms\":\"surdes:survey:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-15 23:15:58');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"tool\",\"orderNum\":\"97\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1633682887000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:34:06');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 6, 'com.shure.surdes.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'tb_answer_json,tbl_survey,tb_question,tb_options,tb_answer', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:46:05');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 3, 'com.shure.surdes.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:49:17');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 6, 'com.shure.surdes.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'tb_survey', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:49:25');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.shure.surdes.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Shure\",\"columns\":[{\"capJavaField\":\"AnswerId\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"answerId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"答案主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1634543165000,\"tableId\":1,\"pk\":true,\"columnName\":\"answer_id\"},{\"capJavaField\":\"SurveyId\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"问卷主键\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543165000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"survey_id\"},{\"capJavaField\":\"QuestionId\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"问题主键\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543165000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"question_id\"},{\"capJavaField\":\"OptionCode\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"选项编码\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryTy', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:50:53');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.shure.surdes.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Shure\",\"columns\":[{\"capJavaField\":\"AnId\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"anId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"答案主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1634543165000,\"tableId\":2,\"pk\":true,\"columnName\":\"an_id\"},{\"capJavaField\":\"SurveyId\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"问卷主键\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543165000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"survey_id\"},{\"capJavaField\":\"AnswerJson\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"answerJson\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"答案结果，json格式存储\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"longtext\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543165000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"answer_json\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"答题人唯一标识\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:51:05');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.shure.surdes.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Shure\",\"columns\":[{\"capJavaField\":\"OptionId\",\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"optionId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"选项主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1634543165000,\"tableId\":3,\"pk\":true,\"columnName\":\"option_id\"},{\"capJavaField\":\"QuestionId\",\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"问题主键\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543165000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"question_id\"},{\"capJavaField\":\"OptionCode\",\"usableColumn\":false,\"columnId\":22,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"选项值\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543165000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"option_code\"},{\"capJavaField\":\"OptionText\",\"usableColumn\":false,\"columnId\":23,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionText\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"选项文本\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Stri', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:55:50');
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.shure.surdes.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Shure\",\"columns\":[{\"capJavaField\":\"QuestionId\",\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"questionId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"题目主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1634543165000,\"tableId\":4,\"pk\":true,\"columnName\":\"question_id\"},{\"capJavaField\":\"SurveyId\",\"usableColumn\":false,\"columnId\":39,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"问卷主键\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543165000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"survey_id\"},{\"capJavaField\":\"QuestionNo\",\"usableColumn\":false,\"columnId\":40,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"questionNo\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"题目编号\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543165000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"question_no\"},{\"capJavaField\":\"QuestionSort\",\"usableColumn\":false,\"columnId\":41,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"questionSort\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"排序字段\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"colu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:57:14');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.shure.surdes.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Shure\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"usableColumn\":false,\"columnId\":63,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"surveyId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"问卷主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1634543365000,\"tableId\":6,\"pk\":true,\"columnName\":\"survey_id\"},{\"capJavaField\":\"SurveyName\",\"usableColumn\":false,\"columnId\":64,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"问卷名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543365000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"survey_name\"},{\"capJavaField\":\"SurveyDesc\",\"usableColumn\":false,\"columnId\":65,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"surveyDesc\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"问卷说明描述\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1634543365000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"survey_desc\"},{\"capJavaField\":\"SurveyType\",\"usableColumn\":false,\"columnId\":66,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"surveyType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"问卷类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 15:57:27');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.shure.surdes.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-10-18 15:57:39');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 3, 'com.shure.surdes.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1,2,3,4,6', '127.0.0.1', '内网IP', '{tableIds=1,2,3,4,6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 16:29:06');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 6, 'com.shure.surdes.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'tb_survey,tb_answer_json,tb_question,tb_options,tb_answer', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 16:29:48');
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 8, 'com.shure.surdes.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-10-18 16:29:53');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"问卷\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"survey/survey/index\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1073,\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:05:50');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"问卷管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"survey/survey/index\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1073,\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:06:03');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"survey/survey/index\",\"component\":\"survey/survey/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"survey:survey:index\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:07:25');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"问卷管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1073,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:07:43');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.shure.surdes.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1079', '127.0.0.1', '内网IP', '{menuId=1079}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:07:55');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"survey/survey/list\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:09:41');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"0\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"survey/survey/list\",\"children\":[],\"createTime\":1634548181000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:10:21');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"survey/survey/list\",\"children\":[],\"createTime\":1634548181000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:10:31');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"问卷查询\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"F\",\"perms\":\"survey:survey:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:10:43');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"问卷新增\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1075,\"menuType\":\"F\",\"perms\":\"survey:survey:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:10:52');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"问卷修改\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1076,\"menuType\":\"F\",\"perms\":\"survey:survey:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:10:59');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"问卷删除\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1077,\"menuType\":\"F\",\"perms\":\"survey:survey:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:11:08');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"问卷导出\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1078,\"menuType\":\"F\",\"perms\":\"survey:survey:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:11:14');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"surdes/survey/list\",\"children\":[],\"createTime\":1634548181000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:13:37');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"recycle\",\"orderNum\":\"10\",\"menuName\":\"回收站\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"recycle\",\"component\":\"surdes/recycle/list\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"survey:suevey:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:15:02');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"问卷管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"\",\"children\":[],\"createTime\":1634547627000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1073,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:23:11');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"surdes/survey/index\",\"children\":[],\"createTime\":1634548181000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-18 17:24:33');
INSERT INTO `sys_oper_log` VALUES (162, '问卷', 1, 'com.shure.surdes.web.controller.survey.SurveyController.add()', 'POST', 1, 'admin', NULL, '/survey/survey', '127.0.0.1', '内网IP', '{\"surveyType\":\"01\",\"surveyStatus\":\"0\",\"surveyId\":1,\"surveyDesc\":\"这是一个测试一个问卷\",\"params\":{},\"surveyName\":\"测试一个问卷\",\"createTime\":1634606852495,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 09:27:32');
INSERT INTO `sys_oper_log` VALUES (163, '用户头像', 2, 'com.shure.surdes.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'java.io.FileNotFoundException: C:\\Users\\shure\\AppData\\Local\\Temp\\tomcat.8080.4450111950187310826\\work\\Tomcat\\localhost\\ROOT\\null\\avatar\\2021\\10\\19\\c447be46-0278-439d-8113-4c66e2b0bd14.jpeg (系统找不到指定的路径。)', '2021-10-19 09:39:12');
INSERT INTO `sys_oper_log` VALUES (164, '用户头像', 2, 'com.shure.surdes.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'java.io.FileNotFoundException: C:\\Users\\shure\\AppData\\Local\\Temp\\tomcat.8080.4450111950187310826\\work\\Tomcat\\localhost\\ROOT\\null\\avatar\\2021\\10\\19\\3b398129-6d64-4d40-8636-9d8d63e515a5.jpeg (系统找不到指定的路径。)', '2021-10-19 09:39:18');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"6\",\"menuName\":\"发布\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"survey:survey:publish\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 09:53:48');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"7\",\"menuName\":\"设计\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"survey:survey:design\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 10:05:39');
INSERT INTO `sys_oper_log` VALUES (167, '问卷', 1, 'com.shure.surdes.web.controller.survey.SurveyController.add()', 'POST', 1, 'admin', NULL, '/survey/survey', '127.0.0.1', '内网IP', '{\"surveyType\":\"01\",\"surveyStatus\":\"0\",\"surveyId\":2,\"surveyDesc\":\"测试一个问卷01\",\"params\":{},\"surveyName\":\"测试问卷-1\",\"createTime\":1634609346807,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 10:09:06');
INSERT INTO `sys_oper_log` VALUES (168, '用户管理', 5, 'com.shure.surdes.web.controller.system.SysUserController.export()', 'GET', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"52950594-02f8-4186-aa79-bd5d3e7c2be0_用户数据.xlsx\",\"code\":200}', 0, NULL, '2021-10-19 10:15:41');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"status=0\",\"icon\":\"recycle\",\"orderNum\":\"10\",\"menuName\":\"回收站\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"recycle\",\"component\":\"surdes/recycle/list\",\"children\":[],\"createTime\":1634548502000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1081,\"menuType\":\"C\",\"perms\":\"survey:suevey:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 10:46:14');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"status=0\",\"icon\":\"recycle\",\"orderNum\":\"10\",\"menuName\":\"回收站\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"recycle\",\"component\":\"surdes/recycle/list\",\"children\":[],\"createTime\":1634548502000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1081,\"menuType\":\"C\",\"perms\":\"survey:suevey:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 10:46:49');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"recycle\",\"orderNum\":\"10\",\"menuName\":\"回收站\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"recycle\",\"component\":\"surdes/recycle/list\",\"children\":[],\"createTime\":1634548502000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1081,\"menuType\":\"C\",\"perms\":\"survey:suevey:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 10:47:19');
INSERT INTO `sys_oper_log` VALUES (172, '问卷删除', 3, 'com.shure.surdes.web.controller.survey.SurveyController.remove()', 'DELETE', 1, 'admin', NULL, '/survey/survey/2', '127.0.0.1', '内网IP', '{surveyIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 10:47:59');
INSERT INTO `sys_oper_log` VALUES (173, '问卷修改', 2, 'com.shure.surdes.web.controller.survey.SurveyController.edit()', 'PUT', 1, 'admin', NULL, '/survey/survey', '127.0.0.1', '内网IP', '{\"surveyType\":\"01\",\"surveyStatus\":\"0\",\"bookCode\":\"\",\"surveyId\":1,\"surveyDesc\":\"这是一个测试一个问卷111\",\"params\":{},\"surveyName\":\"测试一个问卷\",\"createTime\":1634606852000,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 10:50:00');
INSERT INTO `sys_oper_log` VALUES (174, '问卷删除', 3, 'com.shure.surdes.web.controller.survey.SurveyController.delete()', 'DELETE', 1, 'admin', NULL, '/survey/survey/1', '127.0.0.1', '内网IP', '{surveyIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 11:43:06');
INSERT INTO `sys_oper_log` VALUES (175, '问卷新增', 1, 'com.shure.surdes.web.controller.survey.SurveyController.add()', 'POST', 1, 'admin', NULL, '/survey/survey', '127.0.0.1', '内网IP', '{\"surveyType\":\"01\",\"surveyId\":3,\"surveyDesc\":\"测试问卷-2\",\"params\":{},\"userId\":1,\"surveyName\":\"测试问卷-2\",\"createTime\":1634615084151,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 11:44:44');
INSERT INTO `sys_oper_log` VALUES (176, '问卷新增', 1, 'com.shure.surdes.web.controller.survey.SurveyController.add()', 'POST', 1, 'admin', NULL, '/survey/survey', '127.0.0.1', '内网IP', '{\"surveyType\":\"02\",\"surveyId\":4,\"surveyDesc\":\"测试问卷-3\",\"params\":{},\"userId\":1,\"surveyName\":\"测试问卷-3\",\"createTime\":1634615092662,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 11:44:52');
INSERT INTO `sys_oper_log` VALUES (177, '问卷删除', 2, 'com.shure.surdes.web.controller.survey.SurveyController.remove()', 'PUT', 1, 'admin', NULL, '/survey/survey/remove/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 11:44:56');
INSERT INTO `sys_oper_log` VALUES (178, '问卷还原', 3, 'com.shure.surdes.web.controller.survey.SurveyController.restore()', 'PUT', 1, 'admin', NULL, '/survey/survey/restore/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 11:49:35');
INSERT INTO `sys_oper_log` VALUES (179, '问卷还原', 3, 'com.shure.surdes.web.controller.survey.SurveyController.restore()', 'PUT', 1, 'admin', NULL, '/survey/survey/restore/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:37:15');
INSERT INTO `sys_oper_log` VALUES (180, '问卷删除', 2, 'com.shure.surdes.web.controller.survey.SurveyController.remove()', 'PUT', 1, 'admin', NULL, '/survey/survey/remove/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:38:07');
INSERT INTO `sys_oper_log` VALUES (181, '问卷还原', 3, 'com.shure.surdes.web.controller.survey.SurveyController.restore()', 'PUT', 1, 'admin', NULL, '/survey/survey/restore/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:38:26');
INSERT INTO `sys_oper_log` VALUES (182, '问卷发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.publish()', 'PUT', 1, 'admin', NULL, '/survey/survey/publish/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:46:31');
INSERT INTO `sys_oper_log` VALUES (183, '问卷发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.publish()', 'PUT', 1, 'admin', NULL, '/survey/survey/publish/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:47:21');
INSERT INTO `sys_oper_log` VALUES (184, '问卷发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.publish()', 'PUT', 1, 'admin', NULL, '/survey/survey/publish/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:54:02');
INSERT INTO `sys_oper_log` VALUES (185, '问卷发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.publish()', 'PUT', 1, 'admin', NULL, '/survey/survey/publish/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:54:31');
INSERT INTO `sys_oper_log` VALUES (186, '问卷发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.publish()', 'PUT', 1, 'admin', NULL, '/survey/survey/publish/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:55:23');
INSERT INTO `sys_oper_log` VALUES (187, '问卷发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.publish()', 'PUT', 1, 'admin', NULL, '/survey/survey/publish/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 14:56:50');
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"还原\",\"params\":{},\"parentId\":1081,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"survey:survey:restore\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 15:15:39');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"永久删除\",\"params\":{},\"parentId\":1081,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"survey:survey:delete\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 15:16:10');
INSERT INTO `sys_oper_log` VALUES (190, '问卷发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.publish()', 'PUT', 1, 'admin', NULL, '/survey/survey/publish/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 15:35:28');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"8\",\"menuName\":\"撤销发布\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"survey:survey:revoke\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 15:36:48');
INSERT INTO `sys_oper_log` VALUES (192, '问卷撤销发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.revoke()', 'PUT', 1, 'admin', NULL, '/survey/survey/revoke/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 16:23:52');
INSERT INTO `sys_oper_log` VALUES (193, '问卷发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.publish()', 'PUT', 1, 'admin', NULL, '/survey/survey/publish/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 16:23:57');
INSERT INTO `sys_oper_log` VALUES (194, '问卷撤销发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.revoke()', 'PUT', 1, 'admin', NULL, '/survey/survey/revoke/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"问卷数据已采集，不能撤销\",\"code\":500}', 0, NULL, '2021-10-19 16:24:47');
INSERT INTO `sys_oper_log` VALUES (195, '问卷撤销发布', 3, 'com.shure.surdes.web.controller.survey.SurveyController.revoke()', 'PUT', 1, 'admin', NULL, '/survey/survey/revoke/2', '127.0.0.1', '内网IP', '2', '{\"msg\":\"问卷数据已采集，不能撤销\",\"code\":500}', 0, NULL, '2021-10-19 16:24:53');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 1, 'com.shure.surdes.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"9\",\"menuName\":\"预览\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"survey:survey:preview\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 16:57:57');
INSERT INTO `sys_oper_log` VALUES (197, '问卷删除', 2, 'com.shure.surdes.web.controller.survey.SurveyController.remove()', 'PUT', 1, 'admin', NULL, '/survey/survey/remove/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 17:10:13');
INSERT INTO `sys_oper_log` VALUES (198, '问卷还原', 3, 'com.shure.surdes.web.controller.survey.SurveyController.restore()', 'PUT', 1, 'admin', NULL, '/survey/survey/restore/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-19 17:10:24');
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"7\",\"menuName\":\"设计\",\"params\":{},\"parentId\":1080,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1634609139000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1083,\"menuType\":\"F\",\"perms\":\"survey:question:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-20 10:44:05');
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"surdes\",\"component\":\"surdes/survey/index\",\"children\":[],\"createTime\":1634548181000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 11:34:01');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.shure.surdes.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"questionnire\",\"orderNum\":\"1\",\"menuName\":\"个人问卷\",\"params\":{},\"parentId\":1073,\"isCache\":\"0\",\"path\":\"survey\",\"component\":\"surdes/survey/index\",\"children\":[],\"createTime\":1634548181000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"survey:survey:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 11:35:21');
INSERT INTO `sys_oper_log` VALUES (202, '字典类型', 9, 'com.shure.surdes.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:21:56');
INSERT INTO `sys_oper_log` VALUES (203, '字典类型', 1, 'com.shure.surdes.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"题目类型\",\"remark\":\"题目类型\",\"params\":{},\"dictType\":\"question_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:24:29');
INSERT INTO `sys_oper_log` VALUES (204, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"input\",\"listClass\":\"default\",\"dictSort\":1,\"remark\":\"填空题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"单行填空\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"input\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:31:56');
INSERT INTO `sys_oper_log` VALUES (205, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"textarea\",\"listClass\":\"default\",\"dictSort\":2,\"remark\":\"填空题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"多行填空\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"textarea\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:32:22');
INSERT INTO `sys_oper_log` VALUES (206, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"radio\",\"listClass\":\"default\",\"dictSort\":3,\"remark\":\"选择题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"单项选择\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"radio\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:33:34');
INSERT INTO `sys_oper_log` VALUES (207, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"checkbox\",\"listClass\":\"default\",\"dictSort\":4,\"remark\":\"选择题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"多项选择\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"checkbox\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:33:58');
INSERT INTO `sys_oper_log` VALUES (208, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"select\",\"listClass\":\"default\",\"dictSort\":5,\"remark\":\"选择题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"下拉选择\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"select\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:34:19');
INSERT INTO `sys_oper_log` VALUES (209, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"table\",\"listClass\":\"default\",\"dictSort\":6,\"remark\":\"复杂题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"表格题\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"table\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:36:05');
INSERT INTO `sys_oper_log` VALUES (210, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"compute\",\"listClass\":\"default\",\"dictSort\":7,\"remark\":\"复杂题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"计算题\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"jisuan\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:44:24');
INSERT INTO `sys_oper_log` VALUES (211, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"file\",\"listClass\":\"default\",\"dictSort\":8,\"remark\":\"复杂题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"附件题\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"file\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 15:44:46');
INSERT INTO `sys_oper_log` VALUES (212, '字典数据', 2, 'com.shure.surdes.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"radio\",\"listClass\":\"default\",\"dictSort\":3,\"remark\":\"选择题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"单项选择\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"ridio\",\"createTime\":1635147214000,\"dictCode\":38,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 16:50:53');
INSERT INTO `sys_oper_log` VALUES (213, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"title\",\"listClass\":\"default\",\"dictSort\":8,\"remark\":\"文本备注\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"标题\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"title\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 19:42:35');
INSERT INTO `sys_oper_log` VALUES (214, '字典数据', 2, 'com.shure.surdes.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"title\",\"listClass\":\"default\",\"dictSort\":9,\"remark\":\"文本备注\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"标题\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"title\",\"createTime\":1635162155000,\"dictCode\":44,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 19:42:57');
INSERT INTO `sys_oper_log` VALUES (215, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"text\",\"listClass\":\"default\",\"dictSort\":10,\"remark\":\"文本说明\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"段落说明\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"text\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 19:43:25');
INSERT INTO `sys_oper_log` VALUES (216, '字典数据', 2, 'com.shure.surdes.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"title\",\"listClass\":\"default\",\"dictSort\":9,\"remark\":\"文本说明\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"标题\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"title\",\"createTime\":1635162155000,\"dictCode\":44,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 19:43:36');
INSERT INTO `sys_oper_log` VALUES (217, '字典类型', 9, 'com.shure.surdes.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-25 19:43:42');
INSERT INTO `sys_oper_log` VALUES (218, '字典数据', 2, 'com.shure.surdes.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"table\",\"listClass\":\"default\",\"dictSort\":6,\"remark\":\"复杂题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"表格题\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"table\",\"createTime\":1635147365000,\"dictCode\":41,\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-29 15:02:45');
INSERT INTO `sys_oper_log` VALUES (219, '字典数据', 2, 'com.shure.surdes.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"compute\",\"listClass\":\"default\",\"dictSort\":7,\"remark\":\"复杂题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"计算题\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"jisuan\",\"createTime\":1635147864000,\"dictCode\":42,\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-29 15:02:51');
INSERT INTO `sys_oper_log` VALUES (220, '字典数据', 2, 'com.shure.surdes.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"file\",\"listClass\":\"default\",\"dictSort\":8,\"remark\":\"复杂题\",\"params\":{},\"dictType\":\"question_type\",\"dictLabel\":\"附件题\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"file\",\"createTime\":1635147886000,\"dictCode\":43,\"updateBy\":\"admin\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-29 15:02:56');
INSERT INTO `sys_oper_log` VALUES (221, '字典类型', 9, 'com.shure.surdes.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-29 15:03:02');
INSERT INTO `sys_oper_log` VALUES (222, '用户头像', 2, 'com.shure.surdes.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/10/30/065eade8-5d67-438f-b6e0-502b9f22806e.jpeg\",\"code\":200}', 0, NULL, '2021-10-30 15:35:56');
INSERT INTO `sys_oper_log` VALUES (223, '字典类型', 1, 'com.shure.surdes.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"选项显示方向\",\"remark\":\"选项显示方向\",\"params\":{},\"dictType\":\"option_direction\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 01:26:16');
INSERT INTO `sys_oper_log` VALUES (224, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"column\",\"listClass\":\"default\",\"dictSort\":1,\"remark\":\"纵向\",\"params\":{},\"dictType\":\"option_direction\",\"dictLabel\":\"纵向\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 01:28:04');
INSERT INTO `sys_oper_log` VALUES (225, '字典数据', 1, 'com.shure.surdes.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"row\",\"listClass\":\"default\",\"dictSort\":2,\"remark\":\"横向\",\"params\":{},\"dictType\":\"option_direction\",\"dictLabel\":\"横向\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-31 01:28:28');
INSERT INTO `sys_oper_log` VALUES (226, '问卷题目', 1, 'com.shure.surdes.web.controller.survey.QuestionController.add()', 'POST', 1, 'admin', NULL, '/survey/question', '127.0.0.1', '内网IP', '{\"surveyId\":4,\"questionNo\":\"1\",\"defaultValue\":\"AAA\",\"notEdit\":\"0\",\"showOrHide\":\"0\",\"questionName\":\"这是一个选择题\",\"params\":{},\"answer\":{\"params\":{}},\"createTime\":1635782042399,\"options\":[],\"questionSort\":1,\"questionType\":\"input\",\"optionDisplay\":\"column\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'question_type\' at row 1\r\n### The error may exist in file [E:\\workspeace\\github\\survey-design\\surdes-survey\\target\\classes\\mapper\\survey\\QuestionMapper.xml]\r\n### The error may involve com.shure.surdes.survey.mapper.QuestionMapper.insertQuestion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_question          ( survey_id,             question_no,             question_sort,             question_name,             question_type,                          show_or_hide,             create_time,                                       not_edit,             default_value )           values ( ?,             ?,             ?,             ?,             ?,                          ?,             ?,                                       ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'question_type\' at row 1\n; Data truncation: Data too long for column \'question_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'question_type\' at row 1', '2021-11-01 23:54:02');
INSERT INTO `sys_oper_log` VALUES (227, '问卷题目', 1, 'com.shure.surdes.web.controller.survey.QuestionController.add()', 'POST', 1, 'admin', NULL, '/survey/question', '127.0.0.1', '内网IP', '{\"surveyId\":4,\"questionId\":1,\"questionNo\":\"1\",\"defaultValue\":\"AAA\",\"notEdit\":\"0\",\"showOrHide\":\"0\",\"questionName\":\"这是一个选择题\",\"params\":{},\"answer\":{\"params\":{}},\"createTime\":1635782206352,\"options\":[],\"questionSort\":1,\"questionType\":\"input\",\"optionDisplay\":\"column\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-01 23:56:46');
INSERT INTO `sys_oper_log` VALUES (228, '问卷题目', 1, 'com.shure.surdes.web.controller.survey.QuestionController.add()', 'POST', 1, 'admin', NULL, '/survey/question', '127.0.0.1', '内网IP', '{\"surveyId\":4,\"questionId\":2,\"questionNo\":\"1\",\"defaultValue\":\"AAA\",\"notEdit\":\"0\",\"showOrHide\":\"0\",\"questionName\":\"这是一个选择题\",\"params\":{},\"answer\":{\"params\":{}},\"createTime\":1635782306850,\"options\":[],\"questionSort\":1,\"questionType\":\"input\",\"optionDisplay\":\"column\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-01 23:58:26');
INSERT INTO `sys_oper_log` VALUES (229, '问卷题目', 1, 'com.shure.surdes.web.controller.survey.QuestionController.add()', 'POST', 1, 'admin', NULL, '/survey/question', '127.0.0.1', '内网IP', '{\"surveyId\":4,\"questionId\":3,\"notEdit\":\"0\",\"showOrHide\":\"0\",\"questionName\":\"第一部分\",\"params\":{},\"answer\":{\"params\":{}},\"createTime\":1635782402411,\"options\":[],\"questionSort\":1,\"questionType\":\"title\",\"optionDisplay\":\"column\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-02 00:00:02');
INSERT INTO `sys_oper_log` VALUES (230, '问卷题目', 1, 'com.shure.surdes.web.controller.survey.QuestionController.add()', 'POST', 1, 'admin', NULL, '/survey/question', '127.0.0.1', '内网IP', '{\"surveyId\":4,\"questionId\":4,\"questionNo\":\"3\",\"notEdit\":\"0\",\"showOrHide\":\"0\",\"questionName\":\"请输入标题\",\"params\":{},\"answer\":{\"params\":{}},\"createTime\":1635782453527,\"options\":[{\"surveyId\":4,\"wtqdValue\":\"\",\"logicSymbol\":\"\",\"params\":{},\"hideQuestion\":\"\",\"isWtqd\":\"\",\"wtqdSymbol\":\"\",\"wtqdType\":\"\",\"wtqdDesc\":\"\",\"isExtend\":\"\",\"optionCode\":\"\",\"showQuestion\":\"\",\"optionNo\":1,\"optionText\":\"A\"},{\"surveyId\":4,\"wtqdValue\":\"\",\"logicSymbol\":\"\",\"params\":{},\"hideQuestion\":\"\",\"isWtqd\":\"\",\"wtqdSymbol\":\"\",\"wtqdType\":\"\",\"wtqdDesc\":\"\",\"isExtend\":\"\",\"optionCode\":\"\",\"showQuestion\":\"\",\"optionNo\":2,\"optionText\":\"B\"}],\"questionSort\":4,\"questionType\":\"radio\",\"optionDisplay\":\"column\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-11-02 00:00:53');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-10-08 16:48:06', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-10-08 16:48:06', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-10-08 16:48:06', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-10-08 16:48:06', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-10-08 16:48:07', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2021/10/30/065eade8-5d67-438f-b6e0-502b9f22806e.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-11-01 23:09:00', 'admin', '2021-10-08 16:48:06', '', '2021-11-01 23:08:59', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-08 16:48:06', 'admin', '2021-10-08 16:48:06', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for tb_answer
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer`;
CREATE TABLE `tb_answer`  (
  `answer_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '答案主键',
  `survey_id` bigint(20) NOT NULL COMMENT '问卷主键',
  `question_id` bigint(20) NOT NULL COMMENT '问题主键',
  `option_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项编码',
  `answer_value` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '答案结果',
  `extend_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '扩展填空值',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '答题人唯一标识',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '答题人姓名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '账套',
  PRIMARY KEY (`answer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷答案结果表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_answer
-- ----------------------------

-- ----------------------------
-- Table structure for tb_answer_json
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_json`;
CREATE TABLE `tb_answer_json`  (
  `an_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '答案主键',
  `survey_id` bigint(20) NOT NULL COMMENT '问卷主键',
  `answer_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案结果，json格式存储',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '答题人唯一标识',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '答题人姓名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '账套',
  PRIMARY KEY (`an_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷答案结果表json' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_answer_json
-- ----------------------------
INSERT INTO `tb_answer_json` VALUES (1, 2, 'asdfasd', '', 'sdf', NULL, '');

-- ----------------------------
-- Table structure for tb_options
-- ----------------------------
DROP TABLE IF EXISTS `tb_options`;
CREATE TABLE `tb_options`  (
  `option_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '选项主键',
  `question_id` bigint(20) NOT NULL COMMENT '问题主键',
  `option_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项值',
  `option_text` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项文本',
  `option_no` int(8) NOT NULL COMMENT '选项序号',
  `hide_question` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '逻辑隐藏题',
  `show_question` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '逻辑显示题',
  `is_wtqd` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否设置问题（1：是，0：否）',
  `wtqd_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题清单分类',
  `wtqd_value` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比较值',
  `wtqd_symbol` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比较逻辑（使用字典）',
  `wtqd_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题清单描述',
  `is_extend` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否扩展填空（1：是，0：否）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `logic_symbol` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示逻辑比较符',
  `survey_id` bigint(20) NOT NULL COMMENT '问卷主键',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '帐套编码',
  PRIMARY KEY (`option_id`) USING BTREE,
  INDEX `inx_question_id`(`question_id`) USING BTREE,
  INDEX `inx_options_no`(`option_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷选项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_options
-- ----------------------------

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question`  (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '题目主键',
  `survey_id` bigint(20) NOT NULL COMMENT '问卷主键',
  `question_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目编号',
  `question_sort` int(8) NULL DEFAULT 1 COMMENT '排序字段',
  `question_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '题目名称',
  `question_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '01' COMMENT '题目类型',
  `validate_rule` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '校验规则',
  `show_or_hide` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '初始是否隐藏（1：是，0：否）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `question_attr` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目属性',
  `relation_result` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联结果字段',
  `not_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '只读标识 1 为不能编辑',
  `default_value` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `formula` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果计算公式',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账套',
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `inx_survey_id`(`survey_id`) USING BTREE,
  INDEX `inx_question_sort`(`question_sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES (1, 4, '1', 1, '这是一个选择题', 'input', '', '0', '2021-11-01 23:56:46', NULL, NULL, '0', 'AAA', NULL, NULL);
INSERT INTO `tb_question` VALUES (2, 4, '1', 1, '这是一个选择题', 'input', '', '0', '2021-11-01 23:58:27', NULL, NULL, '0', 'AAA', NULL, NULL);
INSERT INTO `tb_question` VALUES (3, 4, NULL, 1, '第一部分', 'title', '', '0', '2021-11-02 00:00:02', NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO `tb_question` VALUES (4, 4, '3', 4, '请输入标题', 'radio', '', '0', '2021-11-02 00:00:54', NULL, NULL, '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_survey
-- ----------------------------
DROP TABLE IF EXISTS `tb_survey`;
CREATE TABLE `tb_survey`  (
  `survey_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '问卷主键',
  `survey_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问卷名称',
  `survey_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷说明描述',
  `survey_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷类型',
  `survey_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '问卷状态（0：未发布，1：收集中，2：已结束）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据状态（1：有效，0：无效）',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '帐套编码',
  PRIMARY KEY (`survey_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_survey
-- ----------------------------
INSERT INTO `tb_survey` VALUES (2, '测试问卷-1', '测试一个问卷01', '01', '1', '2021-10-19 10:09:07', NULL, '1', '');
INSERT INTO `tb_survey` VALUES (3, '测试问卷-2', '测试问卷-2', '01', '0', '2021-10-19 11:44:44', 1, '1', '');
INSERT INTO `tb_survey` VALUES (4, '测试问卷-3', '测试问卷-3', '02', '0', '2021-10-19 11:44:53', 1, '1', '');

SET FOREIGN_KEY_CHECKS = 1;
