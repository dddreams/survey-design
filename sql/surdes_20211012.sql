/*
 Navicat Premium Data Transfer

 Source Server         : 10.18.28.225@wjdc3
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 10.18.28.225:3306
 Source Schema         : wjdc3

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 12/10/2021 16:03:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_survey
-- ----------------------------
DROP TABLE IF EXISTS `tbl_survey`;
CREATE TABLE `tbl_survey`  (
  `survey_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问卷主键',
  `survey_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷名称',
  `survey_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷说明描述',
  `survey_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷类型',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：有效，0：无效',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帐套编码',
  `is_template` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有基础信息模板 1 是; 0 否',
  `template_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基础信息配置模板id',
  `is_template_pool` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是模板池模板： 1-是， 其他-否',
  `is_open_dw` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启定位：1  是，0  否',
  `wcfw` decimal(10, 2) NULL DEFAULT NULL COMMENT '定位误差范围',
  PRIMARY KEY (`survey_id`) USING BTREE,
  INDEX `code_id_index`(`survey_id`, `book_code`) USING BTREE,
  INDEX `inx_survey_type`(`survey_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_survey_answer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_survey_answer`;
CREATE TABLE `tbl_survey_answer`  (
  `plus_id` int(20) NOT NULL,
  `answer_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案主键',
  `batch_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次主键',
  `survey_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷主键',
  `question_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题主键',
  `option_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项编码',
  `answer_value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答案结果',
  `fam_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '农户主键',
  `extend_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展填空值',
  `user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答题人',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：有效，0：无效',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账套',
  PRIMARY KEY (`plus_id`) USING BTREE,
  INDEX `index_answer_question3`(`question_id`, `fam_id`, `survey_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_survey_options
-- ----------------------------
DROP TABLE IF EXISTS `tbl_survey_options`;
CREATE TABLE `tbl_survey_options`  (
  `option_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选项主键',
  `question_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题主键',
  `option_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项值',
  `option_text` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项文本',
  `option_no` int(11) NULL DEFAULT NULL COMMENT '选项序号',
  `hide_question` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '逻辑隐藏题',
  `show_question` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '逻辑显示题',
  `is_wtqd` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否生成问题清单（1：是，0：否）',
  `wtqd_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题清单分类',
  `wtqd_value` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比较值',
  `wtqd_symbol` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比较逻辑（使用字典）',
  `wtqd_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题清单描述',
  `is_extend` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否扩展填空（1：是，0：否）',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：有效，0：无效',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logic_symbol` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示逻辑比较符',
  `survey_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷主键',
  PRIMARY KEY (`option_id`) USING BTREE,
  INDEX `FK_Reference_2`(`question_id`) USING BTREE,
  INDEX `inx_options_no`(`option_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷选项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_survey_question
-- ----------------------------
DROP TABLE IF EXISTS `tbl_survey_question`;
CREATE TABLE `tbl_survey_question`  (
  `question_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目主键',
  `survey_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问卷主键',
  `question_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目编号',
  `question_sort` int(11) NULL DEFAULT NULL COMMENT '排序字段',
  `question_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目名称',
  `question_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目类型（01：填空题，02：单选题，03：多选题，04：多行文本题）',
  `validate_rule` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校验规则',
  `show_or_hide` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '初始是否隐藏（1：是，0：否）',
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：有效，0：无效',
  `book_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账套',
  `question_attr` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目属性',
  `relation_result` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联结果字段',
  `relation_member` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否关联家庭成员信息',
  `not_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '只读标识 1 为不能编辑',
  `default_value` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `formula` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果计算公式',
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `FK_Reference_1`(`survey_id`) USING BTREE,
  INDEX `question_sort_index`(`question_sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问卷题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_survey_table
-- ----------------------------
DROP TABLE IF EXISTS `tbl_survey_table`;
CREATE TABLE `tbl_survey_table`  (
  `table_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主键',
  `question_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题主键',
  `target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格表头指标',
  `target_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指标类型，横向：row，纵向：column',
  `create_time` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `table_sort` int(11) NULL DEFAULT NULL COMMENT '排序字段',
  `survey_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问卷主键',
  UNIQUE INDEX `tbl_survey_table_pk`(`table_id`) USING BTREE,
  INDEX `tbl_survey_table_question_id_index`(`question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '表格题关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tbl_survey_table_answer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_survey_table_answer`;
CREATE TABLE `tbl_survey_table_answer`  (
  `ta_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `survey_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问卷主键',
  `question_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题主键',
  `table_row_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格行主键',
  `table_column_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格列主键',
  `table_value` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果值',
  `create_time` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `book_code` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐套',
  `dcdx_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调查对象主键',
  `answer_sort` int(11) NULL DEFAULT NULL COMMENT '对应排序字段',
  PRIMARY KEY (`ta_id`) USING BTREE,
  INDEX `tbl_survey_table_answer_question_id_index`(`question_id`) USING BTREE,
  INDEX `inx_table_answer_sort`(`answer_sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
