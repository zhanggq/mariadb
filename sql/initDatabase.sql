DROP DATABASE IF EXISTS test;
CREATE DATABASE test DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
USE test;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `test_table`
-- ----------------------------
DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table` (
  `id`          bigint unsigned   not null auto_increment,
  `value`       varchar(255)  NOT NULL  COMMENT '测试表',
  PRIMARY KEY (id)
) ENGINE=InnoDB;
CREATE INDEX `test_table_1` ON `test_table` (`value`);

SET FOREIGN_KEY_CHECKS = 1;
