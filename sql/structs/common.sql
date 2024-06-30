SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exp_table
-- ----------------------------
DROP TABLE IF EXISTS `exp_table`;
CREATE TABLE `exp_table`  (
  `level` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`level`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gmhost
-- ----------------------------
DROP TABLE IF EXISTS `gmhost`;
CREATE TABLE `gmhost`  (
  `mIP` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mIP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gmlist
-- ----------------------------
DROP TABLE IF EXISTS `gmlist`;
CREATE TABLE `gmlist`  (
  `mID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mAccount` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `mName` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `mContactIP` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `mServerIP` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'ALL',
  `mAuthority` enum('IMPLEMENTOR','HIGH_WIZARD','GOD','LOW_WIZARD','PLAYER') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'PLAYER',
  PRIMARY KEY (`mID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for locale
-- ----------------------------
DROP TABLE IF EXISTS `locale`;
CREATE TABLE `locale`  (
  `mKey` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `mValue` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mKey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for priv_settings
-- ----------------------------
DROP TABLE IF EXISTS `priv_settings`;
CREATE TABLE `priv_settings`  (
  `priv_type` enum('PLAYER','GUILD','EMPIRE') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'EMPIRE' COMMENT 'GUILD and PLAYER are untested.',
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'this is for empire_id, player_id or guild_id',
  `type` int(10) UNSIGNED NOT NULL DEFAULT 4 COMMENT '1:item_drop, 2:gold_drop, 3:gold10_drop, 4:exp (1~4)',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT '0~1000%',
  `duration` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`priv_type`, `id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spam_db
-- ----------------------------
DROP TABLE IF EXISTS `spam_db`;
CREATE TABLE `spam_db`  (
  `word` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `score` int(3) NOT NULL DEFAULT 1,
  `type` enum('SPAM','MAPS') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'SPAM',
  PRIMARY KEY (`word`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
