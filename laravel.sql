-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 18, 2024 at 11:09 PM
-- Server version: 10.3.39-MariaDB-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensiguru`
--

CREATE TABLE `absensiguru` (
  `id_absensi` int(11) NOT NULL,
  `nip` char(12) DEFAULT NULL,
  `kalender_absensi` datetime DEFAULT NULL,
  `kode_keterangan` char(2) DEFAULT NULL,
  `nama_keterangan` enum('Hadir','Sakit','Izin','Alpha') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absensiguru`
--

INSERT INTO `absensiguru` (`id_absensi`, `nip`, `kalender_absensi`, `kode_keterangan`, `nama_keterangan`) VALUES
(1, 'G001', '2024-01-01 08:00:00', '05', 'Alpha'),
(2, 'G002', '2024-01-02 08:00:00', '01', 'Hadir'),
(3, 'G003', '2024-01-03 08:00:00', '02', 'Sakit'),
(4, 'G004', '2024-01-04 08:00:00', '03', 'Izin'),
(5, 'G005', '2024-01-05 08:00:00', '04', 'Alpha'),
(6, 'G006', '2024-01-06 08:00:00', '01', 'Hadir'),
(7, 'G007', '2024-01-07 08:00:00', '01', 'Hadir'),
(8, 'G001', '2024-01-08 08:00:00', '02', 'Sakit'),
(9, 'G002', '2024-01-09 08:00:00', '03', 'Izin'),
(10, 'G003', '2024-01-10 08:00:00', '04', 'Alpha'),
(11, 'G004', '2024-01-11 08:00:00', '01', 'Hadir'),
(12, 'G005', '2024-01-12 08:00:00', '01', 'Hadir'),
(13, 'G006', '2024-01-13 08:00:00', '02', 'Sakit'),
(14, 'G007', '2024-01-14 08:00:00', '03', 'Izin'),
(15, 'G001', '2024-01-15 08:00:00', '04', 'Alpha'),
(16, 'G002', '2024-01-16 08:00:00', '01', 'Hadir'),
(17, 'G003', '2024-01-17 08:00:00', '01', 'Hadir'),
(18, 'G004', '2024-01-18 08:00:00', '02', 'Sakit'),
(19, 'G005', '2024-01-19 08:00:00', '03', 'Izin'),
(20, 'G006', '2024-01-20 08:00:00', '04', 'Alpha'),
(21, 'G007', '2024-01-21 08:00:00', '01', 'Hadir'),
(22, 'G001', '2024-01-22 08:00:00', '01', 'Hadir'),
(23, 'G002', '2024-01-23 08:00:00', '02', 'Sakit'),
(24, 'G003', '2024-01-24 08:00:00', '03', 'Izin'),
(25, 'G004', '2024-01-25 08:00:00', '04', 'Alpha'),
(26, 'G005', '2024-01-26 08:00:00', '01', 'Hadir'),
(27, 'G006', '2024-01-27 08:00:00', '01', 'Hadir'),
(28, 'G007', '2024-01-28 08:00:00', '02', 'Sakit'),
(29, 'G001', '2024-01-29 08:00:00', '03', 'Izin'),
(30, 'G002', '2024-01-30 08:00:00', '04', 'Alpha');

-- --------------------------------------------------------

--
-- Table structure for table `absensisiswa`
--

CREATE TABLE `absensisiswa` (
  `id_absensi` int(11) NOT NULL,
  `nis` char(12) DEFAULT NULL,
  `nip` char(12) DEFAULT NULL,
  `kode_mapel` char(15) DEFAULT NULL,
  `kalender_absensi` datetime DEFAULT NULL,
  `kode_keterangan` char(2) DEFAULT NULL,
  `nama_keterangan` enum('Hadir','Sakit','Izin','Alpha') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absensisiswa`
--

INSERT INTO `absensisiswa` (`id_absensi`, `nis`, `nip`, `kode_mapel`, `kalender_absensi`, `kode_keterangan`, `nama_keterangan`) VALUES
(1, 'S001', 'G001', 'M01', '2024-01-01 08:00:00', '01', 'Hadir'),
(2, 'S002', 'G001', 'M02', '2024-01-02 08:00:00', '01', 'Hadir'),
(3, 'S003', 'G002', 'M03', '2024-01-03 08:00:00', '02', 'Sakit'),
(4, 'S004', 'G002', 'M04', '2024-01-04 08:00:00', '03', 'Izin'),
(5, 'S005', 'G003', 'M05', '2024-01-05 08:00:00', '04', 'Alpha'),
(6, 'S006', 'G003', 'M01', '2024-01-06 08:00:00', '01', 'Hadir'),
(7, 'S007', 'G004', 'M02', '2024-01-07 08:00:00', '01', 'Hadir'),
(8, 'S008', 'G004', 'M03', '2024-01-08 08:00:00', '02', 'Sakit'),
(9, 'S009', 'G005', 'M04', '2024-01-09 08:00:00', '03', 'Izin'),
(10, 'S010', 'G005', 'M05', '2024-01-10 08:00:00', '04', 'Alpha'),
(11, 'S011', 'G006', 'M01', '2024-01-11 08:00:00', '01', 'Hadir'),
(12, 'S012', 'G006', 'M02', '2024-01-12 08:00:00', '01', 'Hadir'),
(13, 'S013', 'G007', 'M03', '2024-01-13 08:00:00', '02', 'Sakit'),
(14, 'S014', 'G007', 'M04', '2024-01-14 08:00:00', '03', 'Izin'),
(15, 'S015', 'G001', 'M05', '2024-01-15 08:00:00', '04', 'Alpha'),
(16, 'S016', 'G001', 'M01', '2024-01-16 08:00:00', '01', 'Hadir'),
(17, 'S001', 'G002', 'M02', '2024-01-17 08:00:00', '01', 'Hadir'),
(18, 'S002', 'G002', 'M03', '2024-01-18 08:00:00', '02', 'Sakit'),
(19, 'S003', 'G003', 'M04', '2024-01-19 08:00:00', '03', 'Izin'),
(20, 'S004', 'G003', 'M05', '2024-01-20 08:00:00', '04', 'Alpha'),
(21, 'S005', 'G004', 'M01', '2024-01-21 08:00:00', '01', 'Hadir'),
(22, 'S006', 'G004', 'M02', '2024-01-22 08:00:00', '01', 'Hadir'),
(23, 'S007', 'G005', 'M03', '2024-01-23 08:00:00', '02', 'Sakit'),
(24, 'S008', 'G005', 'M04', '2024-01-24 08:00:00', '03', 'Izin'),
(25, 'S009', 'G006', 'M05', '2024-01-25 08:00:00', '04', 'Alpha'),
(26, 'S010', 'G006', 'M01', '2024-01-26 08:00:00', '01', 'Hadir'),
(27, 'S011', 'G007', 'M02', '2024-01-27 08:00:00', '01', 'Hadir'),
(28, 'S012', 'G007', 'M03', '2024-01-28 08:00:00', '02', 'Sakit'),
(29, 'S013', 'G001', 'M04', '2024-01-29 08:00:00', '03', 'Izin'),
(30, 'S014', 'G001', 'M05', '2024-01-30 08:00:00', '04', 'Alpha');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `admin_password` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aplikasi`
--

CREATE TABLE `aplikasi` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `copyright` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aplikasi`
--

INSERT INTO `aplikasi` (`id`, `slug`, `nama`, `copyright`, `logo`) VALUES
(1, 'ea421be2a688e3c7db86b182177b19ae', 'ABSENSI', 'DIII Manajemen Informatika POLINEMA Kampus Pamekasan', 'logo-43773.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nip` char(12) NOT NULL,
  `nik` varchar(100) DEFAULT NULL,
  `nuptk` varchar(100) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jkel` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tmpt_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `guru_status` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `guru_password` text DEFAULT NULL,
  `guru_email` varchar(200) DEFAULT NULL,
  `verifikasi_kode` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `nik`, `nuptk`, `nama`, `jkel`, `alamat`, `tmpt_lahir`, `tgl_lahir`, `guru_status`, `phone`, `agama`, `guru_password`, `guru_email`, `verifikasi_kode`) VALUES
('G001', '3201011234567890', '1234567890', 'Dr. Agus Supriyadi', 'Laki-laki', 'Jl. Kenanga No.1', 'Bandung', '1970-01-01', 'Aktif', '081234567800', 'Islam', 'password1', 'agus@gmail.com', 'VG001'),
('G002', '3201021234567891', '1234567891', 'Ibu Rina Wijayanti', 'Perempuan', 'Jl. Melati No.2', 'Jakarta', '1975-02-02', 'Aktif', '081234567801', 'Kristen', 'password2', 'rina@gmail.com', 'VG002'),
('G003', '3201031234567892', '1234567892', 'Bapak Budi Santoso', 'Laki-laki', 'Jl. Anggrek No.3', 'Surabaya', '1980-03-03', 'Aktif', '081234567802', 'Hindu', 'password3', 'budi@gmail.com', 'VG003'),
('G004', '3201041234567893', '1234567893', 'Ibu Citra Dewi', 'Perempuan', 'Jl. Mawar No.4', 'Yogyakarta', '1985-04-04', 'Aktif', '081234567803', 'Buddha', 'password4', 'citra@gmail.com', 'VG004'),
('G005', '3201051234567894', '1234567894', 'Dr. Dedi Kusuma', 'Laki-laki', 'Jl. Dahlia No.5', 'Medan', '1990-05-05', 'Aktif', '081234567804', 'Islam', 'password5', 'dedi@gmail.com', 'VG005'),
('G006', '3201061234567895', '1234567895', 'Ibu Eka Putri', 'Perempuan', 'Jl. Kamboja No.6', 'Makassar', '1995-06-06', 'Aktif', '081234567805', 'Kristen', 'password6', 'eka@gmail.com', 'VG006'),
('G007', '3201071234567896', '1234567896', 'Bapak Fajar Hidayat', 'Laki-laki', 'Jl. Teratai No.7', 'Bali', '2000-07-07', 'Aktif', '081234567806', 'Hindu', 'password7', 'fajar@gmail.com', 'VG007');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` char(5) NOT NULL,
  `nama_jurusan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`) VALUES
('J01', 'Teknik Informatika'),
('J02', 'Sistem Informasi'),
('J03', 'Teknik Komputer'),
('J04', 'Manajemen Informatika'),
('J05', 'Teknik Telekomunikasi'),
('J06', 'SIpil');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` char(5) NOT NULL,
  `nama_kelas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `nama_kelas`) VALUES
('K01', 'X RPL 1'),
('K02', 'X RPL 2'),
('K03', 'XI RPL 1'),
('K04', 'XI RPL 2'),
('K05', 'XII RPL 1'),
('K06', 'XII RPL 2');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `kode_mapel` char(15) NOT NULL,
  `nama_mapel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`kode_mapel`, `nama_mapel`) VALUES
('M01', 'Matematika'),
('M02', 'Bahasa Indonesia'),
('M03', 'Fisika'),
('M04', 'Kimia'),
('M05', 'Biologi');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `status` enum('menu','sub menu') NOT NULL,
  `anggota` int(11) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `link` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu`, `status`, `anggota`, `slug`, `link`, `created_at`) VALUES
(35, 'Pengguna', 'menu', NULL, 'ec2329a6c21fb73787bc0149db860588', 'users', NULL),
(36, 'Master', 'menu', NULL, 'ea5abd6476abd4e9d779e656a683f0f6', '', NULL),
(48, 'Kelas', 'sub menu', 36, 'e89bbb354c918d3ab28161ebd43232b5', 'kelas', NULL),
(49, 'Jurusan', 'sub menu', 36, '12562961ce7ae55fb4d7cbe056a9fc38', 'jurusan', NULL),
(50, 'Siswa', 'sub menu', 36, '563fb6fdbcdfd97dcd02dc048f7057de', 'siswa', NULL),
(51, 'Guru', 'sub menu', 36, 'd74aabb5c6f87c8bef7db7d867edf301', 'guru', NULL),
(52, 'Mata Pelajaran', 'sub menu', 36, 'f816e0ab20a33a91fc449d2de844ad08', 'matapelajaran', NULL),
(53, 'Absensi', 'menu', NULL, 'de56f96997d9a19a783a55cd8a713958', '', NULL),
(54, 'Siswa', 'sub menu', 53, 'f0c89603c8e3c88a841e275d7d8fe506', 'absensiSiswa', NULL),
(55, 'Guru', 'sub menu', 53, 'a7b83c5daf3aab598e84218befde794c', 'absensiGuru', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_09_095510_create_flights_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `productlines`
--

CREATE TABLE `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext DEFAULT NULL,
  `image` mediumblob DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productlines`
--

INSERT INTO `productlines` (`productLine`, `textDescription`, `htmlDescription`, `image`) VALUES
('Vintage Cars', 'Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.', NULL, NULL),
('Ships', 'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.', NULL, NULL),
('Trains', 'Model trains are a rewarding hobby for enthusiasts of all ages. Whether you\'re looking for collectible wooden trains, electric streetcars or locomotives, you\'ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.', NULL, NULL),
('Planes', 'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.', NULL, NULL),
('Motorcycles', 'Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.', NULL, NULL),
('Classic Cars', 'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.', NULL, NULL),
('Trucks and Buses', 'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` char(12) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kode_kelas` char(5) DEFAULT NULL,
  `kode_jurusan` char(5) DEFAULT NULL,
  `jkel` varchar(50) DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tmpt_lahir` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `siswa_email` varchar(255) DEFAULT NULL,
  `siswa_password` text DEFAULT NULL,
  `verifikasi_kode` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `kode_kelas`, `kode_jurusan`, `jkel`, `agama`, `alamat`, `tgl_lahir`, `tmpt_lahir`, `phone`, `siswa_email`, `siswa_password`, `verifikasi_kode`) VALUES
('123321', 'luqman', 'K01', 'J01', '1', '1', '1', '2024-01-01', '1', '1', '1', '$2y$10$OR3nXVwa8i007rSGSMCl6O4rl27NomfGQyPD8DsPAnzoBXoltZbl2', '2968'),
('S001', 'Guna Darma DW', 'K01', 'J01', 'Laki-laki', 'Islam', 'Jl. Merdeka No.1', '2004-01-01', 'Jakarta', '081234567890', 'gunadwn03@gmail.com', '$2y$10$AgLKHRBG6K3//DhIF9UCV.QGmT/XeaGpl4vuG5vw8bma7s2vIQLsC', '6678'),
('S002', 'Budi Santoso', 'K01', 'J02', 'Laki-laki', 'Kristen', 'Jl. Merdeka No.2', '2004-02-02', 'Bandung', '081234567891', 'budi@gmail.com', 'password2', 'VK002'),
('S003', 'Citra Dewi', 'K02', 'J03', 'Perempuan', 'Hindu', 'Jl. Merdeka No.3', '2004-03-03', 'Surabaya', '081234567892', 'citra@gmail.com', 'password3', 'VK003'),
('S004', 'Dedi Kusuma', 'K02', 'J04', 'Laki-laki', 'Buddha', 'Jl. Merdeka No.4', '2004-04-04', 'Yogyakarta', '081234567893', 'dedi@gmail.com', 'password4', 'VK004'),
('S005', 'Eka Putri', 'K03', 'J05', 'Perempuan', 'Islam', 'Jl. Merdeka No.5', '2004-05-05', 'Medan', '081234567894', 'eka@gmail.com', 'password5', 'VK005'),
('S006', 'Fajar Hidayat', 'K03', 'J01', 'Laki-laki', 'Kristen', 'Jl. Merdeka No.6', '2004-06-06', 'Jakarta', '081234567895', 'fajar@gmail.com', 'password6', 'VK006'),
('S007', 'Gita Sari', 'K04', 'J02', 'Perempuan', 'Hindu', 'Jl. Merdeka No.7', '2004-07-07', 'Bandung', '081234567896', 'gita@gmail.com', 'password7', 'VK007'),
('S008', 'Hadi Prasetyo', 'K04', 'J03', 'Laki-laki', 'Buddha', 'Jl. Merdeka No.8', '2004-08-08', 'Surabaya', '081234567897', 'hadi@gmail.com', 'password8', 'VK008'),
('S009', 'Indah Pertiwi', 'K05', 'J04', 'Perempuan', 'Islam', 'Jl. Merdeka No.9', '2004-09-09', 'Yogyakarta', '081234567898', 'indah@gmail.com', 'password9', 'VK009'),
('S010', 'Joko Widodo', 'K05', 'J05', 'Laki-laki', 'Kristen', 'Jl. Merdeka No.10', '2004-10-10', 'Medan', '081234567899', 'joko@gmail.com', 'password10', 'VK010'),
('S011', 'Kiki Amalia', 'K01', 'J01', 'Perempuan', 'Hindu', 'Jl. Merdeka No.11', '2004-11-11', 'Jakarta', '081234567900', 'kiki@gmail.com', 'password11', 'VK011'),
('S012', 'Lia Susanti', 'K01', 'J02', 'Perempuan', 'Buddha', 'Jl. Merdeka No.12', '2004-12-12', 'Bandung', '081234567901', 'lia@gmail.com', 'password12', 'VK012'),
('S013', 'Maman Suherman', 'K02', 'J03', 'Laki-laki', 'Islam', 'Jl. Merdeka No.13', '2004-01-13', 'Surabaya', '081234567902', 'maman@gmail.com', 'password13', 'VK013'),
('S014', 'Nina Agustin', 'K02', 'J04', 'Perempuan', 'Kristen', 'Jl. Merdeka No.14', '2004-02-14', 'Yogyakarta', '081234567903', 'nina@gmail.com', 'password14', 'VK014'),
('S015', 'Oki Setiana', 'K03', 'J05', 'Perempuan', 'Hindu', 'Jl. Merdeka No.15', '2004-03-15', 'Medan', '081234567904', 'oki@gmail.com', 'password15', 'VK015'),
('S016', 'Putu Adi', 'K03', 'J01', 'Laki-laki', 'Buddha', 'Jl. Merdeka No.16', '2004-04-16', 'Jakarta', '081234567905', 'putu@gmail.com', 'password16', 'VK016');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `slug`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(46, 'be4259069a44e281c6a52712a696ddde', 'Admin', 'admin@gmail.com', NULL, '$2y$12$IiFG48SwBBLbvbadd1Fcvue.IqoHq82p9g3sSViksSU32.sk.w.Sq', NULL, NULL, NULL),
(52, 'f3072d850b69e504da905c0282cc309a', 'Luqman Affandi', 'laffandi@polinema.ac.id', NULL, '$2y$12$WbMKNRz8hDkIJWCMijI3IO0ztzAh9SpPPbsapR.N9vQ82Skble5V.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vguru`
-- (See below for the actual view)
--
CREATE TABLE `vguru` (
`id_absensi` int(11)
,`nip` char(12)
,`kalender_absensi` datetime
,`kode_keterangan` char(2)
,`nama_keterangan` enum('Hadir','Sakit','Izin','Alpha')
,`guru` char(12)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vsiswa`
-- (See below for the actual view)
--
CREATE TABLE `vsiswa` (
`id_absensi` int(11)
,`nis` char(12)
,`nip` char(12)
,`kode_mapel` char(15)
,`kalender_absensi` datetime
,`kode_keterangan` char(2)
,`nama_keterangan` enum('Hadir','Sakit','Izin','Alpha')
,`siswa` char(12)
,`guru` char(12)
,`mapel` char(15)
);

-- --------------------------------------------------------

--
-- Structure for view `vguru`
--
DROP TABLE IF EXISTS `vguru`;

CREATE ALGORITHM=UNDEFINED DEFINER=`luqman`@`%` SQL SECURITY DEFINER VIEW `vguru`  AS  (select `absensiguru`.`id_absensi` AS `id_absensi`,`absensiguru`.`nip` AS `nip`,`absensiguru`.`kalender_absensi` AS `kalender_absensi`,`absensiguru`.`kode_keterangan` AS `kode_keterangan`,`absensiguru`.`nama_keterangan` AS `nama_keterangan`,`absensiguru`.`nip` AS `guru` from `absensiguru`) ;

-- --------------------------------------------------------

--
-- Structure for view `vsiswa`
--
DROP TABLE IF EXISTS `vsiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`luqman`@`%` SQL SECURITY DEFINER VIEW `vsiswa`  AS  (select `absensisiswa`.`id_absensi` AS `id_absensi`,`absensisiswa`.`nis` AS `nis`,`absensisiswa`.`nip` AS `nip`,`absensisiswa`.`kode_mapel` AS `kode_mapel`,`absensisiswa`.`kalender_absensi` AS `kalender_absensi`,`absensisiswa`.`kode_keterangan` AS `kode_keterangan`,`absensisiswa`.`nama_keterangan` AS `nama_keterangan`,`absensisiswa`.`nis` AS `siswa`,`absensisiswa`.`nip` AS `guru`,`absensisiswa`.`kode_mapel` AS `mapel` from `absensisiswa`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensiguru`
--
ALTER TABLE `absensiguru`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `absensisiswa`
--
ALTER TABLE `absensisiswa`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `nis` (`nis`),
  ADD KEY `nip` (`nip`),
  ADD KEY `kode_mapel` (`kode_mapel`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `aplikasi`
--
ALTER TABLE `aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`kode_mapel`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productlines`
--
ALTER TABLE `productlines`
  ADD PRIMARY KEY (`productLine`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `kode_kelas` (`kode_kelas`),
  ADD KEY `kode_jurusan` (`kode_jurusan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aplikasi`
--
ALTER TABLE `aplikasi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensiguru`
--
ALTER TABLE `absensiguru`
  ADD CONSTRAINT `absensiguru_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`);

--
-- Constraints for table `absensisiswa`
--
ALTER TABLE `absensisiswa`
  ADD CONSTRAINT `absensisiswa_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`),
  ADD CONSTRAINT `absensisiswa_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`),
  ADD CONSTRAINT `absensisiswa_ibfk_3` FOREIGN KEY (`kode_mapel`) REFERENCES `mapel` (`kode_mapel`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`kode_kelas`) REFERENCES `kelas` (`kode_kelas`),
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
