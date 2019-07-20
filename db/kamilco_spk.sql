-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 08:14 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kamilco_spk`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `a_kode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `a_nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_alamat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_telp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_kordinat` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tahun` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`a_kode`, `a_nama`, `a_alamat`, `a_telp`, `a_kordinat`, `id_tahun`) VALUES
('A01', 'North Sumatera Area', 'Jl. Dr. Wahidin No. 1 Pangkalan Brandan North Sumatera - 20857', '+62-620 323442', '4.021186, 98.283770', '2019'),
('A02', 'Central Sumatera Area', 'Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114', '+62-711 5648507', '-2.951164, 104.768371', '2019'),
('A03', 'Southern Sumatera Area', 'Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114', '+62-711 5648511', '-2.951164, 104.768371', '2019'),
('A04', 'West Java Area', 'Komplek Perumahan Dinas Distrik TGD Jl. Raya Industri Tegalgede South Cikarang, Bekasi - 17550', '+62-21 89833854', '-6.307934, 107.143061', '2019'),
('A05', 'Eastern Java Area', 'Jl. Darmo Kali No. 40-42 Surabaya 60241', '+62-31 5689901', '7.508712, 112.207829', '2019'),
('A06', 'Kalimantan Area', 'KNE Building, Jl. Pupuk Raya No.55, Bontang Barat, Bontang, East Kalimantan Timur 75313', '+62-548 – 41641', '0.173454, 117.467438', '2019');

--
-- Triggers `area`
--
DELIMITER $$
CREATE TRIGGER `after_area_delete` AFTER DELETE ON `area` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="area",h_tipe="delete", h_user=@user_id,h_after=CONCAT("[""",old.a_kode,""",""",old.a_nama,""",""",old.a_alamat,""",""",old.a_telp,""",""",old.a_kordinat,""",""",old.id_tahun,"""]")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_area_insert` BEFORE INSERT ON `area` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="area",h_tipe="insert", h_user=@user_id,h_after=CONCAT("[""",new.a_kode,""",""",new.a_nama,""",""",new.a_alamat,""",""",new.a_telp,""",""",new.a_kordinat,""",""",new.id_tahun,"""]")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_area_update` AFTER UPDATE ON `area` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="area",h_tipe="update", h_user=@user_id,h_before=CONCAT("[""",old.a_kode,""",""",old.a_nama,""",""",old.a_alamat,""",""",old.a_telp,""",""",old.a_kordinat,""",""",old.id_tahun,"""]"),h_after=CONCAT("[""",new.a_kode,""",""",new.a_nama,""",""",new.a_alamat,""",""",new.a_telp,""",""",new.a_kordinat,""",""",new.id_tahun,"""]")
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dyn_groups`
--

CREATE TABLE `dyn_groups` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Navigation groupings. Eg, header, sidebar, footer, etc';

--
-- Dumping data for table `dyn_groups`
--

INSERT INTO `dyn_groups` (`id`, `title`, `abbrev`) VALUES
(1, 'Header', 'header'),
(2, 'Sidebar', 'sidebar'),
(3, 'Footer', 'footer'),
(4, 'Topbar', 'topbar'),
(5, 'Sidebar1', 'sidebar1'),
(6, 'Sidebar2', 'sidebar2');

-- --------------------------------------------------------

--
-- Table structure for table `dyn_menu`
--

CREATE TABLE `dyn_menu` (
  `id` int(11) NOT NULL,
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
  `role` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dyn_menu`
--

INSERT INTO `dyn_menu` (`id`, `title`, `link_type`, `page_id`, `module_name`, `icon`, `url`, `uri`, `dyn_group_id`, `position`, `target`, `parent_id`, `is_parent`, `show_menu`, `role`) VALUES
(1, 'Dasbor', 'uri', 1, 'dashboard', 'fa fa-dashboard', 'http://localhost/spk-area/user/dashboard', '', 2, 1, NULL, 0, 0, '1', 'user'),
(2, 'Data Area', 'uri', 2, 'area', 'fa fa-globe', 'http://localhost/spk-area/user/area', '', 2, 2, NULL, 0, 0, '1', 'user'),
(3, 'Data Kriteria', 'uri', 3, 'kriteria', 'fa fa-file-text', 'http://localhost/spk-area/user/kriteria', '', 2, 3, NULL, 0, 0, '1', 'user'),
(4, 'Penilaian ', 'uri', 9, 'penilaian', 'ion ion-stats-bars', 'http://localhost/spk-area/user/penilaian', '', 2, 4, NULL, 0, 0, '1', 'user'),
(5, 'Hasil Perhitungan', 'uri', 16, 'saw', 'ion ion-stats-bars', 'http://localhost/spk-area/user/saw', '', 2, 5, NULL, 0, 0, '1', 'user'),
(6, 'Grafik Penilaian', 'uri', 17, 'grafik', 'ion ion-pie-graph', 'http://localhost/spk-area/user/grafik', '', 2, 6, NULL, 0, 0, '1', 'user'),
(7, 'Laporan Ranking', 'uri', 18, 'saw', 'fa fa-print', 'http://localhost/spk-area/user/saw/cetak', '', 2, 7, NULL, 0, 0, '1', 'user'),
(8, 'Laporan Perhitungan', 'uri', 19, 'saw', 'fa fa-print', 'http://localhost/spk-area/user/saw/cetak/lengkap', '', 2, 8, NULL, 0, 0, '0', 'user'),
(9, 'Tahun Berkas', 'uri', 20, 'tahun', 'fa fa-file-text', 'http://localhost/spk-area/user/tahun', '', 2, 1, NULL, 0, 0, '0', 'user'),
(10, 'Histori log', 'uri', 21, 'histori', 'fa fa-file-text', 'http://localhost/spk-area/user/histori', '', 2, 9, NULL, 0, 0, '1', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `histori`
--

CREATE TABLE `histori` (
  `h_id` int(11) NOT NULL,
  `h_tgl` datetime DEFAULT NULL,
  `h_before` longtext COLLATE utf8_unicode_ci,
  `h_after` longtext COLLATE utf8_unicode_ci,
  `h_table` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `h_tipe` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'insert/update/delete',
  `h_user` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `histori`
--

INSERT INTO `histori` (`h_id`, `h_tgl`, `h_before`, `h_after`, `h_table`, `h_tipe`, `h_user`) VALUES
(7, '2019-07-04 14:35:20', NULL, '[\"05\",\"Contoh\",\"alamat\",\"1201010\",\"0099393\",\"2020\"]', 'area', 'insert', 'admin'),
(8, '2019-07-04 14:35:49', '[\"05\",\"Contoh\",\"alamat\",\"1201010\",\"0099393\",\"2020\"]', '[\"06\",\"Contoh 2\",\"\",\"466666\",\"32222\",\"2020\"]', 'area', 'delete', 'admin'),
(9, '2019-07-04 14:36:37', NULL, '[\"06\",\"Contoh 2\",\"\",\"466666\",\"32222\",\"2020\"]', 'area', 'delete', 'admin'),
(10, '2019-07-04 15:35:52', '[\"04\",\"it konsultan\",\"wong pinter\",\"\",\"\",\"2020\"]', '[\"04\",\"it konsultan\",\"wong pinter\",\"12222222\",\"\",\"2020\"]', 'area', 'update', 'admin'),
(11, '2019-07-04 15:41:45', '[\"01\",\"programer\",\"android php\",\"12345678\",\"1213\",\"2020\"]', '[\"01\",\"programerrrrr\",\"android php\",\"12345678\",\"1213\",\"2020\"]', 'area', 'update', 'admin'),
(12, '2019-07-04 15:42:23', '[\"01\",\"programerrrrr\",\"android php\",\"12345678\",\"1213\",\"2020\"]', '[\"01\",\"programerrrrr\",\"android \",\"12345678\",\"1213\",\"2020\"]', 'area', 'update', 'admin'),
(13, '2019-07-04 16:01:58', '[\"k5\",\"gaji\",\"30\",\"2020\"]', '[\"K5\",\"gaji\",\"30\",\"2020\"]', 'kriteria', 'update', 'admin'),
(24, '2019-07-04 17:56:41', '[\"01\",\"programerrrrr\",\"k1\",\"ipk\",\"4\"]', '[\"01\",\"programerrrrr\",\"k1\",\"ipk\",\"5\"]', 'penilaian', 'update', 'admin'),
(29, '2019-07-04 18:42:32', NULL, '[\"005\",\"Bendra Wardana\",\"Jl. Dr. Wahidin No. 1 Pangkalan Brandan North Sumatera - 20857\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'insert', 'admin'),
(30, '2019-07-04 18:43:05', NULL, '[\"005\",\"Bendra Wardana\",\"Jl. Dr. Wahidin No. 1 Pangkalan Brandan North Sumatera - 20857\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'delete', 'admin'),
(31, '2019-07-04 18:43:08', NULL, '[\"01\",\"programerrrrr\",\"android \",\"12345678\",\"1213\",\"2019\"]', 'area', 'delete', 'admin'),
(32, '2019-07-04 18:43:11', NULL, '[\"02\",\"analist\",\"analis sistem\",\"342564y\",\"1214\",\"2019\"]', 'area', 'delete', 'admin'),
(33, '2019-07-04 18:43:15', NULL, '[\"03\",\"guru\",\"pendidikan\",\"y5u57\",\"1218\",\"2019\"]', 'area', 'delete', 'admin'),
(34, '2019-07-04 18:43:18', NULL, '[\"04\",\"it konsultan\",\"wong pinter\",\"12222222\",\"\",\"2019\"]', 'area', 'delete', 'admin'),
(35, '2019-07-04 18:43:29', NULL, '[\"k1\",\"ipk\",\"30\",\"2019\"]', 'kriteria', 'delete', 'admin'),
(36, '2019-07-04 18:43:32', NULL, '[\"k2\",\"pemahaman bahasa pemrograman\",\"20\",\"2019\"]', 'kriteria', 'delete', 'admin'),
(37, '2019-07-04 18:43:35', NULL, '[\"k3\",\"pengalaman membuat aplikasi\",\"10\",\"2019\"]', 'kriteria', 'delete', 'admin'),
(38, '2019-07-04 18:43:38', NULL, '[\"k4\",\"sertifikasi\",\"10\",\"2019\"]', 'kriteria', 'delete', 'admin'),
(39, '2019-07-04 18:43:41', NULL, '[\"K5\",\"gaji\",\"30\",\"2019\"]', 'kriteria', 'delete', 'admin'),
(40, '2019-07-04 18:45:14', NULL, '[\"A01\",\"North Sumatera Area\",\"Jl. Dr. Wahidin No. 1 Pangkalan Brandan North Sumatera - 20857\",\"+62-620 323442\",\"4.021186, 98.283770\",\"2019\"]', 'area', 'insert', 'admin'),
(41, '2019-07-04 18:45:44', NULL, '[\"A02\",\"Central Sumatera Area\",\"Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114\",\"+62-711 5648507\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'insert', 'admin'),
(42, '2019-07-04 18:46:15', NULL, '[\"A03\",\"Southern Sumatera Area\",\"Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114\",\"+62-711 5648511\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'insert', 'admin'),
(43, '2019-07-04 18:46:45', NULL, '[\"A04\",\"West Java Area\",\"Komplek Perumahan Dinas Distrik TGD Jl. Raya Industri Tegalgede South Cikarang, Bekasi - 17550\",\"+62-21 89833854\",\"-6.307934, 107.143061\",\"2019\"]', 'area', 'insert', 'admin'),
(44, '2019-07-04 18:47:11', NULL, '[\"A05\",\"Eastern Java Area\",\"Jl. Darmo Kali No. 40-42 Surabaya 60241\",\"+62-31 5689901\",\"7.508712, 112.207829\",\"2019\"]', 'area', 'insert', 'admin'),
(45, '2019-07-04 18:47:44', NULL, '[\"A06\",\"Kalimantan Area\",\"KNE Building, Jl. Pupuk Raya No.55, Bontang Barat, Bontang, East Kalimantan Timur 75313\",\"+62-548 – 41641\",\"0.173454, 117.467438\",\"2019\"]', 'area', 'insert', 'admin'),
(46, '2019-07-04 18:49:19', NULL, '[\"K01\",\"HSE Meeting\",\"30\",\"2019\"]', 'kriteria', 'insert', 'admin'),
(47, '2019-07-04 18:49:31', NULL, '[\"K02\",\"Fire Drill\",\"20\",\"2019\"]', 'kriteria', 'insert', 'admin'),
(48, '2019-07-04 18:49:44', NULL, '[\"K03\",\"Simulasi Tanggap Darurat\",\"20\",\"2019\"]', 'kriteria', 'insert', 'admin'),
(49, '2019-07-04 18:49:55', NULL, '[\"K04\",\"Management Walk Through (MWT)\",\"15\",\"2019\"]', 'kriteria', 'insert', 'admin'),
(50, '2019-07-04 18:50:08', NULL, '[\"K05\",\"Training Aspek QC & HSE\",\"15\",\"2019\"]', 'kriteria', 'insert', 'admin'),
(51, '2019-07-04 18:50:49', NULL, '[\"A01\",\"North Sumatera Area\",\"K01\",\"HSE Meeting\",\"3\"]', 'penilaian', 'insert', 'admin'),
(52, '2019-07-04 18:50:49', NULL, '[\"A01\",\"North Sumatera Area\",\"K02\",\"Fire Drill\",\"4\"]', 'penilaian', 'insert', 'admin'),
(53, '2019-07-04 18:50:49', NULL, '[\"A01\",\"North Sumatera Area\",\"K03\",\"Simulasi Tanggap Darurat\",\"4\"]', 'penilaian', 'insert', 'admin'),
(54, '2019-07-04 18:50:49', NULL, '[\"A01\",\"North Sumatera Area\",\"K04\",\"Management Walk Through (MWT)\",\"5\"]', 'penilaian', 'insert', 'admin'),
(55, '2019-07-04 18:50:49', NULL, '[\"A01\",\"North Sumatera Area\",\"K05\",\"Training Aspek QC & HSE\",\"1\"]', 'penilaian', 'insert', 'admin'),
(56, '2019-07-04 18:51:01', NULL, '[\"A02\",\"Central Sumatera Area\",\"K01\",\"HSE Meeting\",\"5\"]', 'penilaian', 'insert', 'admin'),
(57, '2019-07-04 18:51:01', NULL, '[\"A02\",\"Central Sumatera Area\",\"K02\",\"Fire Drill\",\"3\"]', 'penilaian', 'insert', 'admin'),
(58, '2019-07-04 18:51:01', NULL, '[\"A02\",\"Central Sumatera Area\",\"K03\",\"Simulasi Tanggap Darurat\",\"4\"]', 'penilaian', 'insert', 'admin'),
(59, '2019-07-04 18:51:01', NULL, '[\"A02\",\"Central Sumatera Area\",\"K04\",\"Management Walk Through (MWT)\",\"1\"]', 'penilaian', 'insert', 'admin'),
(60, '2019-07-04 18:51:01', NULL, '[\"A02\",\"Central Sumatera Area\",\"K05\",\"Training Aspek QC & HSE\",\"5\"]', 'penilaian', 'insert', 'admin'),
(61, '2019-07-04 18:51:11', NULL, '[\"A03\",\"Southern Sumatera Area\",\"K01\",\"HSE Meeting\",\"4\"]', 'penilaian', 'insert', 'admin'),
(62, '2019-07-04 18:51:11', NULL, '[\"A03\",\"Southern Sumatera Area\",\"K02\",\"Fire Drill\",\"5\"]', 'penilaian', 'insert', 'admin'),
(63, '2019-07-04 18:51:11', NULL, '[\"A03\",\"Southern Sumatera Area\",\"K03\",\"Simulasi Tanggap Darurat\",\"5\"]', 'penilaian', 'insert', 'admin'),
(64, '2019-07-04 18:51:11', NULL, '[\"A03\",\"Southern Sumatera Area\",\"K04\",\"Management Walk Through (MWT)\",\"5\"]', 'penilaian', 'insert', 'admin'),
(65, '2019-07-04 18:51:11', NULL, '[\"A03\",\"Southern Sumatera Area\",\"K05\",\"Training Aspek QC & HSE\",\"1\"]', 'penilaian', 'insert', 'admin'),
(66, '2019-07-04 18:51:26', NULL, '[\"A04\",\"West Java Area\",\"K01\",\"HSE Meeting\",\"4\"]', 'penilaian', 'insert', 'admin'),
(67, '2019-07-04 18:51:26', NULL, '[\"A04\",\"West Java Area\",\"K02\",\"Fire Drill\",\"5\"]', 'penilaian', 'insert', 'admin'),
(68, '2019-07-04 18:51:26', NULL, '[\"A04\",\"West Java Area\",\"K03\",\"Simulasi Tanggap Darurat\",\"4\"]', 'penilaian', 'insert', 'admin'),
(69, '2019-07-04 18:51:26', NULL, '[\"A04\",\"West Java Area\",\"K04\",\"Management Walk Through (MWT)\",\"1\"]', 'penilaian', 'insert', 'admin'),
(70, '2019-07-04 18:51:27', NULL, '[\"A04\",\"West Java Area\",\"K05\",\"Training Aspek QC & HSE\",\"5\"]', 'penilaian', 'insert', 'admin'),
(71, '2019-07-04 18:51:41', NULL, '[\"A05\",\"Eastern Java Area\",\"K01\",\"HSE Meeting\",\"3\"]', 'penilaian', 'insert', 'admin'),
(72, '2019-07-04 18:51:41', NULL, '[\"A05\",\"Eastern Java Area\",\"K02\",\"Fire Drill\",\"4\"]', 'penilaian', 'insert', 'admin'),
(73, '2019-07-04 18:51:41', NULL, '[\"A05\",\"Eastern Java Area\",\"K03\",\"Simulasi Tanggap Darurat\",\"5\"]', 'penilaian', 'insert', 'admin'),
(74, '2019-07-04 18:51:41', NULL, '[\"A05\",\"Eastern Java Area\",\"K04\",\"Management Walk Through (MWT)\",\"5\"]', 'penilaian', 'insert', 'admin'),
(75, '2019-07-04 18:51:41', NULL, '[\"A05\",\"Eastern Java Area\",\"K05\",\"Training Aspek QC & HSE\",\"1\"]', 'penilaian', 'insert', 'admin'),
(76, '2019-07-04 18:51:52', NULL, '[\"A06\",\"Kalimantan Area\",\"K01\",\"HSE Meeting\",\"4\"]', 'penilaian', 'insert', 'admin'),
(77, '2019-07-04 18:51:52', NULL, '[\"A06\",\"Kalimantan Area\",\"K02\",\"Fire Drill\",\"5\"]', 'penilaian', 'insert', 'admin'),
(78, '2019-07-04 18:51:52', NULL, '[\"A06\",\"Kalimantan Area\",\"K03\",\"Simulasi Tanggap Darurat\",\"3\"]', 'penilaian', 'insert', 'admin'),
(79, '2019-07-04 18:51:52', NULL, '[\"A06\",\"Kalimantan Area\",\"K04\",\"Management Walk Through (MWT)\",\"1\"]', 'penilaian', 'insert', 'admin'),
(80, '2019-07-04 18:51:52', NULL, '[\"A06\",\"Kalimantan Area\",\"K05\",\"Training Aspek QC & HSE\",\"1\"]', 'penilaian', 'insert', 'admin'),
(81, '2019-07-05 08:34:34', NULL, '[\"A07\",\"Bendra Wardana\",\"Jl. Dr. Wahidin No. 1 Pangkalan Brandan North Sumatera - 20857\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'insert', 'admin'),
(82, '2019-07-05 08:34:41', NULL, '[\"A07\",\"Bendra Wardana\",\"Jl. Dr. Wahidin No. 1 Pangkalan Brandan North Sumatera - 20857\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'delete', 'admin'),
(83, '2019-07-05 10:45:58', NULL, '[\"001\",\"Bendra Wardana\",\"Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'insert', 'admin'),
(84, '2019-07-05 10:46:04', NULL, '[\"001\",\"Bendra Wardana\",\"Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'delete', 'admin'),
(85, '2019-07-05 11:22:02', NULL, '[\"A/07\",\"Bendra Wardana\",\"Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'insert', 'admin'),
(87, '2019-07-05 11:22:53', NULL, '[\"A/07\",\"Bendra Wardana\",\"Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'delete', 'admin'),
(88, '2019-07-05 11:23:08', NULL, '[\"A/07\",\"Bendra Wardana\",\"Jl. Darmo Kali No. 40-42 Surabaya 60241\",\"082285873444\",\"4.021186, 98.283770\",\"2019\"]', 'area', 'insert', 'admin'),
(90, '2019-07-05 11:24:14', NULL, '[\"A/07\",\"Bendra Wardana\",\"Jl. Darmo Kali No. 40-42 Surabaya 60241\",\"082285873444\",\"4.021186, 98.283770\",\"2019\"]', 'area', 'delete', 'admin'),
(95, '2019-07-05 11:30:06', NULL, '[\"A07\",\"Bendra Wardana\",\"Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'insert', 'admin'),
(96, '2019-07-05 11:30:22', NULL, '[\"A08\",\"Bendra Wardana\",\"Jl. Dr. Wahidin No. 1 Pangkalan Brandan North Sumatera - 20857\",\"082285873444\",\"-6.307934, 107.143061\",\"2019\"]', 'area', 'insert', 'admin'),
(97, '2019-07-05 11:30:27', NULL, '[\"A08\",\"Bendra Wardana\",\"Jl. Dr. Wahidin No. 1 Pangkalan Brandan North Sumatera - 20857\",\"082285873444\",\"-6.307934, 107.143061\",\"2019\"]', 'area', 'delete', 'admin'),
(98, '2019-07-05 11:30:32', NULL, '[\"A07\",\"Bendra Wardana\",\"Jl. AKBP Cek Agus No 10, Kenten, Palembang - 30114\",\"082285873444\",\"-2.951164, 104.768371\",\"2019\"]', 'area', 'delete', 'admin'),
(99, '2019-07-05 11:33:47', NULL, '[\"K06\",\"Central Sumatera Area\",\"3\",\"2019\"]', 'kriteria', 'insert', 'admin'),
(100, '2019-07-05 11:33:52', NULL, '[\"K06\",\"Central Sumatera Area\",\"3\",\"2019\"]', 'kriteria', 'delete', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `k_kode` varchar(50) NOT NULL DEFAULT '',
  `k_nama` varchar(50) DEFAULT NULL,
  `k_bobot` int(10) DEFAULT NULL,
  `id_tahun` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`k_kode`, `k_nama`, `k_bobot`, `id_tahun`) VALUES
('K01', 'HSE Meeting', 30, '2019'),
('K02', 'Fire Drill', 20, '2019'),
('K03', 'Simulasi Tanggap Darurat', 20, '2019'),
('K04', 'Management Walk Through (MWT)', 15, '2019'),
('K05', 'Training Aspek QC & HSE', 15, '2019');

--
-- Triggers `kriteria`
--
DELIMITER $$
CREATE TRIGGER `after_kriteria_delete` AFTER DELETE ON `kriteria` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="kriteria",h_tipe="delete", h_user=@user_id,h_after=CONCAT("[""",old.k_kode,""",""",old.k_nama,""",""",old.k_bobot,""",""",old.id_tahun,"""]")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_kriteria_insert` AFTER INSERT ON `kriteria` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="kriteria",h_tipe="insert", h_user=@user_id,h_after=CONCAT("[""",new.k_kode,""",""",new.k_nama,""",""",new.k_bobot,""",""",new.id_tahun,"""]")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_kriteria_update` AFTER UPDATE ON `kriteria` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="kriteria",h_tipe="update", h_user=@user_id,h_after=CONCAT("[""",new.k_kode,""",""",new.k_nama,""",""",new.k_bobot,""",""",new.id_tahun,"""]"),h_before=CONCAT("[""",old.k_kode,""",""",old.k_nama,""",""",old.k_bobot,""",""",old.id_tahun,"""]")
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `pn_id` int(100) NOT NULL,
  `id_area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_kriteria` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pn_nilai` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`pn_id`, `id_area`, `id_kriteria`, `pn_nilai`) VALUES
(11, 'A01', 'K01', 3),
(12, 'A01', 'K02', 4),
(13, 'A01', 'K03', 4),
(14, 'A01', 'K04', 5),
(15, 'A01', 'K05', 1),
(16, 'A02', 'K01', 5),
(17, 'A02', 'K02', 3),
(18, 'A02', 'K03', 4),
(19, 'A02', 'K04', 1),
(20, 'A02', 'K05', 5),
(21, 'A03', 'K01', 4),
(22, 'A03', 'K02', 5),
(23, 'A03', 'K03', 5),
(24, 'A03', 'K04', 5),
(25, 'A03', 'K05', 1),
(26, 'A04', 'K01', 4),
(27, 'A04', 'K02', 5),
(28, 'A04', 'K03', 4),
(29, 'A04', 'K04', 1),
(30, 'A04', 'K05', 5),
(31, 'A05', 'K01', 3),
(32, 'A05', 'K02', 4),
(33, 'A05', 'K03', 5),
(34, 'A05', 'K04', 5),
(35, 'A05', 'K05', 1),
(36, 'A06', 'K01', 4),
(37, 'A06', 'K02', 5),
(38, 'A06', 'K03', 3),
(39, 'A06', 'K04', 1),
(40, 'A06', 'K05', 1);

--
-- Triggers `penilaian`
--
DELIMITER $$
CREATE TRIGGER `after_nilai_delete` AFTER DELETE ON `penilaian` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="penilaian",h_tipe="delete", h_user=@user_id,h_after=CONCAT("[""",old.id_area,""",""",@a_nama_a,""",""",old.id_kriteria,""",""",@k_nama_a,""",""",old.pn_nilai,"""]")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_nilai_insert` AFTER INSERT ON `penilaian` FOR EACH ROW INSERT INTO histori SET h_tgl=NOW(), h_table="penilaian",h_tipe="insert", h_user=@user_id,h_after=CONCAT("[""",new.id_area,""",""",@a_nama_a,""",""",new.id_kriteria,""",""",@k_nama_a,""",""",new.pn_nilai,"""]")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_nilai_update` AFTER UPDATE ON `penilaian` FOR EACH ROW IF (old.id_area = new.id_area AND old.id_kriteria = new.id_kriteria AND old.pn_nilai = new.pn_nilai) = false  THEN 
BEGIN INSERT INTO histori SET h_tgl=NOW(), h_table="penilaian",h_tipe="update", h_user=@user_id,h_after=CONCAT("[""",new.id_area,""",""",@a_nama_a,""",""",new.id_kriteria,""",""",@k_nama_a,""",""",new.pn_nilai,"""]"),h_before=CONCAT("[""",old.id_area,""",""",@a_nama_b,""",""",old.id_kriteria,""",""",@k_nama_b,""",""",old.pn_nilai,"""]"); END;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tahun_berkas`
--

CREATE TABLE `tahun_berkas` (
  `thn_id` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thn_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tahun_berkas`
--

INSERT INTO `tahun_berkas` (`thn_id`, `thn_status`) VALUES
('2019', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(100) NOT NULL,
  `u_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_name`, `u_email`, `u_password`, `u_status`, `u_role`) VALUES
(3, 'admin', 'admin@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '1', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`a_kode`),
  ADD KEY `fk_a_id_tahun` (`id_tahun`);

--
-- Indexes for table `dyn_groups`
--
ALTER TABLE `dyn_groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dyn_menu`
--
ALTER TABLE `dyn_menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `histori`
--
ALTER TABLE `histori`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`k_kode`),
  ADD KEY `fk_k_id_tahun` (`id_tahun`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`pn_id`),
  ADD KEY `pn_id_area` (`id_area`),
  ADD KEY `pn_id_kriteria` (`id_kriteria`);

--
-- Indexes for table `tahun_berkas`
--
ALTER TABLE `tahun_berkas`
  ADD PRIMARY KEY (`thn_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`) USING BTREE,
  ADD UNIQUE KEY `u_ibfk1_username` (`u_name`) USING BTREE,
  ADD UNIQUE KEY `u_ibfk2_email` (`u_email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dyn_groups`
--
ALTER TABLE `dyn_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dyn_menu`
--
ALTER TABLE `dyn_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `histori`
--
ALTER TABLE `histori`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `pn_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `fk_a_id_tahun` FOREIGN KEY (`id_tahun`) REFERENCES `tahun_berkas` (`thn_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `fk_k_id_tahun` FOREIGN KEY (`id_tahun`) REFERENCES `tahun_berkas` (`thn_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `pn_id_area` FOREIGN KEY (`id_area`) REFERENCES `area` (`a_kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pn_id_kriteria` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`k_kode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
