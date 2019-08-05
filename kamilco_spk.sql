/*
 Navicat Premium Data Transfer

 Source Server         : kamil.co.id
 Source Server Type    : MySQL
 Source Server Version : 100140
 Source Host           : kamil.co.id:3306
 Source Schema         : kamilco_spk

 Target Server Type    : MySQL
 Target Server Version : 100140
 File Encoding         : 65001

 Date: 05/08/2019 17:10:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `a_kode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `a_nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_alamat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_telp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_kordinat` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tahun` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`a_kode`),
  KEY `fk_a_id_tahun` (`id_tahun`),
  CONSTRAINT `fk_a_id_tahun` FOREIGN KEY (`id_tahun`) REFERENCES `tahun_berkas` (`thn_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of area
-- ----------------------------
BEGIN;
INSERT INTO `area` VALUES ('01', 'programerrrrr', 'android ', '12345678', '1213', '2020');
INSERT INTO `area` VALUES ('02', 'analist', 'analis sistem', '342564y', '1214', '2020');
INSERT INTO `area` VALUES ('03', 'guru', 'pendidikan', 'y5u57', '1218', '2020');
INSERT INTO `area` VALUES ('04', 'it konsultan', 'wong pinter', '12222222', '', '2020');
COMMIT;

-- ----------------------------
-- Table structure for dyn_groups
-- ----------------------------
DROP TABLE IF EXISTS `dyn_groups`;
CREATE TABLE `dyn_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Navigation groupings. Eg, header, sidebar, footer, etc';

-- ----------------------------
-- Records of dyn_groups
-- ----------------------------
BEGIN;
INSERT INTO `dyn_groups` VALUES (1, 'Header', 'header');
INSERT INTO `dyn_groups` VALUES (2, 'Sidebar', 'sidebar');
INSERT INTO `dyn_groups` VALUES (3, 'Footer', 'footer');
INSERT INTO `dyn_groups` VALUES (4, 'Topbar', 'topbar');
INSERT INTO `dyn_groups` VALUES (5, 'Sidebar1', 'sidebar1');
INSERT INTO `dyn_groups` VALUES (6, 'Sidebar2', 'sidebar2');
COMMIT;

-- ----------------------------
-- Table structure for dyn_menu
-- ----------------------------
DROP TABLE IF EXISTS `dyn_menu`;
CREATE TABLE `dyn_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dyn_group_id` int(11) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) NOT NULL DEFAULT '0',
  `show_menu` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `role` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dyn_menu
-- ----------------------------
BEGIN;
INSERT INTO `dyn_menu` VALUES (1, 'Dasbor', 'uri', 1, 'dashboard', 'fa fa-dashboard', 'https://spk.kamil.co.id/user/dashboard', '', 2, 1, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (2, 'Data Area', 'uri', 2, 'area', 'fa fa-file-text', 'https://spk.kamil.co.id/user/area', '', 2, 2, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (3, 'Data Kriteria', 'uri', 3, 'kriteria', 'fa fa-file-text', 'https://spk.kamil.co.id/user/kriteria', '', 2, 3, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (4, 'Penilaian SAW', 'uri', 9, 'penilaian', 'ion ion-stats-bars', 'https://spk.kamil.co.id/user/penilaian', '', 2, 4, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (5, 'Hasil Perhitungan', 'uri', 16, 'saw', 'ion ion-stats-bars', 'https://spk.kamil.co.id/user/saw', '', 2, 5, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (6, 'Grafik Penilaian', 'uri', 17, 'grafik', 'ion ion-pie-graph', 'https://spk.kamil.co.id/user/grafik', '', 2, 7, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (7, 'Laporan Ranking', 'uri', 18, 'saw', 'fa fa-print', 'https://spk.kamil.co.id/user/saw/cetak', '', 2, 9, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (8, 'Laporan SAW', 'uri', 19, 'saw', 'fa fa-print', 'https://spk.kamil.co.id/user/saw/cetak/lengkap', '', 2, 10, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (9, 'Tahun Berkas', 'uri', 20, 'tahun', 'fa fa-file-text', 'https://spk.kamil.co.id/user/tahun', '', 2, 1, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (10, 'Histori', 'uri', 21, 'histori', 'fa fa-file-text', 'https://spk.kamil.co.id/user/histori', '', 2, 11, NULL, 0, 0, '1', 'user');
INSERT INTO `dyn_menu` VALUES (11, 'Hasil Topsis', 'uri', 22, 'topsis', 'ion ion-stats-bars', 'https://spk.kamil.co.id/user/topsis', '', 2, 6, NULL, 0, 0, '1', 'user');
COMMIT;

-- ----------------------------
-- Table structure for histori
-- ----------------------------
DROP TABLE IF EXISTS `histori`;
CREATE TABLE `histori` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_tgl` datetime DEFAULT NULL,
  `h_before` longtext COLLATE utf8_unicode_ci,
  `h_after` longtext COLLATE utf8_unicode_ci,
  `h_table` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `h_tipe` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'insert/update/delete',
  `h_user` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of histori
-- ----------------------------
BEGIN;
INSERT INTO `histori` VALUES (7, '2019-07-04 14:35:20', NULL, '[\"05\",\"Contoh\",\"alamat\",\"1201010\",\"0099393\",\"2020\"]', 'area', 'insert', 'admin');
INSERT INTO `histori` VALUES (8, '2019-07-04 14:35:49', '[\"05\",\"Contoh\",\"alamat\",\"1201010\",\"0099393\",\"2020\"]', '[\"06\",\"Contoh 2\",\"\",\"466666\",\"32222\",\"2020\"]', 'area', 'delete', 'admin');
INSERT INTO `histori` VALUES (9, '2019-07-04 14:36:37', NULL, '[\"06\",\"Contoh 2\",\"\",\"466666\",\"32222\",\"2020\"]', 'area', 'delete', 'admin');
INSERT INTO `histori` VALUES (10, '2019-07-04 15:35:52', '[\"04\",\"it konsultan\",\"wong pinter\",\"\",\"\",\"2020\"]', '[\"04\",\"it konsultan\",\"wong pinter\",\"12222222\",\"\",\"2020\"]', 'area', 'update', 'admin');
INSERT INTO `histori` VALUES (11, '2019-07-04 15:41:45', '[\"01\",\"programer\",\"android php\",\"12345678\",\"1213\",\"2020\"]', '[\"01\",\"programerrrrr\",\"android php\",\"12345678\",\"1213\",\"2020\"]', 'area', 'update', 'admin');
INSERT INTO `histori` VALUES (12, '2019-07-04 15:42:23', '[\"01\",\"programerrrrr\",\"android php\",\"12345678\",\"1213\",\"2020\"]', '[\"01\",\"programerrrrr\",\"android \",\"12345678\",\"1213\",\"2020\"]', 'area', 'update', 'admin');
INSERT INTO `histori` VALUES (13, '2019-07-04 16:01:58', '[\"k5\",\"gaji\",\"30\",\"2020\"]', '[\"K5\",\"gaji\",\"30\",\"2020\"]', 'kriteria', 'update', 'admin');
INSERT INTO `histori` VALUES (24, '2019-07-04 17:56:41', '[\"01\",\"programerrrrr\",\"k1\",\"ipk\",\"4\"]', '[\"01\",\"programerrrrr\",\"k1\",\"ipk\",\"5\"]', 'penilaian', 'update', 'admin');
INSERT INTO `histori` VALUES (25, '2019-07-04 19:53:45', '[\"K5\",\"gaji\",\"30\",\"2020\"]', '[\"K5\",\"gaji\",\"35\",\"2020\"]', 'kriteria', 'update', 'admin');
INSERT INTO `histori` VALUES (26, '2019-07-31 21:30:35', '[\"01\",\"programerrrrr\",\"k2\",\"pemahaman bahasa pemrograman\",\"80\"]', '[\"01\",\"programerrrrr\",\"k2\",\"pemahaman bahasa pemrograman\",\"5\"]', 'penilaian', 'update', 'admin');
INSERT INTO `histori` VALUES (27, '2019-07-31 21:30:35', '[\"01\",\"programerrrrr\",\"k4\",\"sertifikasi\",\"90\"]', '[\"01\",\"programerrrrr\",\"k4\",\"sertifikasi\",\"2\"]', 'penilaian', 'update', 'admin');
INSERT INTO `histori` VALUES (28, '2019-07-31 21:30:35', '[\"01\",\"programerrrrr\",\"K5\",\"gaji\",\"10\"]', '[\"01\",\"programerrrrr\",\"K5\",\"gaji\",\"4\"]', 'penilaian', 'update', 'admin');
INSERT INTO `histori` VALUES (29, '2019-07-31 21:30:46', '[\"02\",\"analist\",\"k2\",\"pemahaman bahasa pemrograman\",\"90\"]', '[\"02\",\"analist\",\"k2\",\"pemahaman bahasa pemrograman\",\"5\"]', 'penilaian', 'update', 'admin');
INSERT INTO `histori` VALUES (30, '2019-07-31 21:30:46', '[\"02\",\"analist\",\"k3\",\"pengalaman membuat aplikasi\",\"2\"]', '[\"02\",\"analist\",\"k3\",\"pengalaman membuat aplikasi\",\"4\"]', 'penilaian', 'update', 'admin');
INSERT INTO `histori` VALUES (31, '2019-07-31 21:30:46', '[\"02\",\"analist\",\"K5\",\"gaji\",\"10\"]', '[\"02\",\"analist\",\"K5\",\"gaji\",\"3\"]', 'penilaian', 'update', 'admin');
INSERT INTO `histori` VALUES (32, '2019-07-31 21:30:57', NULL, '[\"03\",\"guru\",\"k1\",\"ipk\",\"4\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (33, '2019-07-31 21:30:57', NULL, '[\"03\",\"guru\",\"k2\",\"pemahaman bahasa pemrograman\",\"1\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (34, '2019-07-31 21:30:57', NULL, '[\"03\",\"guru\",\"k3\",\"pengalaman membuat aplikasi\",\"5\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (35, '2019-07-31 21:30:57', NULL, '[\"03\",\"guru\",\"k4\",\"sertifikasi\",\"4\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (36, '2019-07-31 21:30:57', NULL, '[\"03\",\"guru\",\"K5\",\"gaji\",\"3\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (37, '2019-07-31 21:31:07', NULL, '[\"04\",\"it konsultan\",\"k1\",\"ipk\",\"5\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (38, '2019-07-31 21:31:07', NULL, '[\"04\",\"it konsultan\",\"k2\",\"pemahaman bahasa pemrograman\",\"4\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (39, '2019-07-31 21:31:07', NULL, '[\"04\",\"it konsultan\",\"k3\",\"pengalaman membuat aplikasi\",\"5\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (40, '2019-07-31 21:31:07', NULL, '[\"04\",\"it konsultan\",\"k4\",\"sertifikasi\",\"2\"]', 'penilaian', 'insert', 'admin');
INSERT INTO `histori` VALUES (41, '2019-07-31 21:31:07', NULL, '[\"04\",\"it konsultan\",\"K5\",\"gaji\",\"3\"]', 'penilaian', 'insert', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for kriteria
-- ----------------------------
DROP TABLE IF EXISTS `kriteria`;
CREATE TABLE `kriteria` (
  `k_kode` varchar(50) NOT NULL DEFAULT '',
  `k_nama` varchar(50) DEFAULT NULL,
  `k_bobot` int(10) DEFAULT NULL,
  `id_tahun` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`k_kode`),
  KEY `fk_k_id_tahun` (`id_tahun`),
  CONSTRAINT `fk_k_id_tahun` FOREIGN KEY (`id_tahun`) REFERENCES `tahun_berkas` (`thn_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kriteria
-- ----------------------------
BEGIN;
INSERT INTO `kriteria` VALUES ('k1', 'ipk', 30, '2020');
INSERT INTO `kriteria` VALUES ('k2', 'pemahaman bahasa pemrograman', 20, '2020');
INSERT INTO `kriteria` VALUES ('k3', 'pengalaman membuat aplikasi', 10, '2020');
INSERT INTO `kriteria` VALUES ('k4', 'sertifikasi', 10, '2020');
INSERT INTO `kriteria` VALUES ('K5', 'gaji', 35, '2020');
COMMIT;

-- ----------------------------
-- Table structure for penilaian
-- ----------------------------
DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE `penilaian` (
  `pn_id` int(100) NOT NULL AUTO_INCREMENT,
  `id_area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_kriteria` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pn_nilai` int(50) DEFAULT NULL,
  PRIMARY KEY (`pn_id`),
  KEY `pn_id_area` (`id_area`),
  KEY `pn_id_kriteria` (`id_kriteria`),
  CONSTRAINT `pn_id_area` FOREIGN KEY (`id_area`) REFERENCES `area` (`a_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pn_id_kriteria` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`k_kode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of penilaian
-- ----------------------------
BEGIN;
INSERT INTO `penilaian` VALUES (1, '01', 'k1', 5);
INSERT INTO `penilaian` VALUES (2, '01', 'k2', 5);
INSERT INTO `penilaian` VALUES (3, '01', 'k3', 1);
INSERT INTO `penilaian` VALUES (4, '01', 'k4', 2);
INSERT INTO `penilaian` VALUES (5, '01', 'K5', 4);
INSERT INTO `penilaian` VALUES (6, '02', 'k1', 3);
INSERT INTO `penilaian` VALUES (7, '02', 'k2', 5);
INSERT INTO `penilaian` VALUES (8, '02', 'k3', 4);
INSERT INTO `penilaian` VALUES (9, '02', 'k4', 1);
INSERT INTO `penilaian` VALUES (10, '02', 'K5', 3);
INSERT INTO `penilaian` VALUES (11, '03', 'k1', 4);
INSERT INTO `penilaian` VALUES (12, '03', 'k2', 1);
INSERT INTO `penilaian` VALUES (13, '03', 'k3', 5);
INSERT INTO `penilaian` VALUES (14, '03', 'k4', 4);
INSERT INTO `penilaian` VALUES (15, '03', 'K5', 3);
INSERT INTO `penilaian` VALUES (16, '04', 'k1', 5);
INSERT INTO `penilaian` VALUES (17, '04', 'k2', 4);
INSERT INTO `penilaian` VALUES (18, '04', 'k3', 5);
INSERT INTO `penilaian` VALUES (19, '04', 'k4', 2);
INSERT INTO `penilaian` VALUES (20, '04', 'K5', 3);
COMMIT;

-- ----------------------------
-- Table structure for tahun_berkas
-- ----------------------------
DROP TABLE IF EXISTS `tahun_berkas`;
CREATE TABLE `tahun_berkas` (
  `thn_id` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thn_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`thn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tahun_berkas
-- ----------------------------
BEGIN;
INSERT INTO `tahun_berkas` VALUES ('2020', 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(100) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE,
  UNIQUE KEY `u_ibfk1_username` (`u_name`) USING BTREE,
  UNIQUE KEY `u_ibfk2_email` (`u_email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (3, 'admin', 'admin@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '1', 'user');
COMMIT;

-- ----------------------------
-- Triggers structure for table area
-- ----------------------------
DROP TRIGGER IF EXISTS `after_area_insert`;
delimiter ;;
CREATE TRIGGER `after_area_insert` BEFORE INSERT ON `area` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="area",h_tipe="insert", h_user=@user_id,h_after=CONCAT("[""",new.a_kode,""",""",new.a_nama,""",""",new.a_alamat,""",""",new.a_telp,""",""",new.a_kordinat,""",""",new.id_tahun,"""]")
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table area
-- ----------------------------
DROP TRIGGER IF EXISTS `after_area_update`;
delimiter ;;
CREATE TRIGGER `after_area_update` AFTER UPDATE ON `area` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="area",h_tipe="update", h_user=@user_id,h_before=CONCAT("[""",old.a_kode,""",""",old.a_nama,""",""",old.a_alamat,""",""",old.a_telp,""",""",old.a_kordinat,""",""",old.id_tahun,"""]"),h_after=CONCAT("[""",new.a_kode,""",""",new.a_nama,""",""",new.a_alamat,""",""",new.a_telp,""",""",new.a_kordinat,""",""",new.id_tahun,"""]")
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table area
-- ----------------------------
DROP TRIGGER IF EXISTS `after_area_delete`;
delimiter ;;
CREATE TRIGGER `after_area_delete` AFTER DELETE ON `area` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="area",h_tipe="delete", h_user=@user_id,h_after=CONCAT("[""",old.a_kode,""",""",old.a_nama,""",""",old.a_alamat,""",""",old.a_telp,""",""",old.a_kordinat,""",""",old.id_tahun,"""]")
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table kriteria
-- ----------------------------
DROP TRIGGER IF EXISTS `after_kriteria_insert`;
delimiter ;;
CREATE TRIGGER `after_kriteria_insert` AFTER INSERT ON `kriteria` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="kriteria",h_tipe="insert", h_user=@user_id,h_after=CONCAT("[""",new.k_kode,""",""",new.k_nama,""",""",new.k_bobot,""",""",new.id_tahun,"""]")
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table kriteria
-- ----------------------------
DROP TRIGGER IF EXISTS `after_kriteria_update`;
delimiter ;;
CREATE TRIGGER `after_kriteria_update` AFTER UPDATE ON `kriteria` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="kriteria",h_tipe="update", h_user=@user_id,h_after=CONCAT("[""",new.k_kode,""",""",new.k_nama,""",""",new.k_bobot,""",""",new.id_tahun,"""]"),h_before=CONCAT("[""",old.k_kode,""",""",old.k_nama,""",""",old.k_bobot,""",""",old.id_tahun,"""]")
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table kriteria
-- ----------------------------
DROP TRIGGER IF EXISTS `after_kriteria_delete`;
delimiter ;;
CREATE TRIGGER `after_kriteria_delete` AFTER DELETE ON `kriteria` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="kriteria",h_tipe="delete", h_user=@user_id,h_after=CONCAT("[""",old.k_kode,""",""",old.k_nama,""",""",old.k_bobot,""",""",old.id_tahun,"""]")
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table penilaian
-- ----------------------------
DROP TRIGGER IF EXISTS `after_nilai_insert`;
delimiter ;;
CREATE TRIGGER `after_nilai_insert` AFTER INSERT ON `penilaian` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="penilaian",h_tipe="insert", h_user=@user_id,h_after=CONCAT("[""",new.id_area,""",""",@a_nama_a,""",""",new.id_kriteria,""",""",@k_nama_a,""",""",new.pn_nilai,"""]")
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table penilaian
-- ----------------------------
DROP TRIGGER IF EXISTS `after_nilai_update`;
delimiter ;;
CREATE TRIGGER `after_nilai_update` AFTER UPDATE ON `penilaian` FOR EACH ROW IF (old.id_area = new.id_area AND old.id_kriteria = new.id_kriteria AND old.pn_nilai = new.pn_nilai) = false  THEN 
BEGIN INSERT INTO histori SET h_tgl=NOW(), h_table="penilaian",h_tipe="update", h_user=@user_id,h_after=CONCAT("[""",new.id_area,""",""",@a_nama_a,""",""",new.id_kriteria,""",""",@k_nama_a,""",""",new.pn_nilai,"""]"),h_before=CONCAT("[""",old.id_area,""",""",@a_nama_b,""",""",old.id_kriteria,""",""",@k_nama_b,""",""",old.pn_nilai,"""]"); END;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table penilaian
-- ----------------------------
DROP TRIGGER IF EXISTS `after_nilai_delete`;
delimiter ;;
CREATE TRIGGER `after_nilai_delete` AFTER DELETE ON `penilaian` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="penilaian",h_tipe="delete", h_user=@user_id,h_after=CONCAT("[""",old.id_area,""",""",@a_nama_a,""",""",old.id_kriteria,""",""",@k_nama_a,""",""",old.pn_nilai,"""]")
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
