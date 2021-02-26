-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2021 at 01:03 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_crud_siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`id`, `user_id`, `judul`, `slug`, `konten`, `created_at`, `updated_at`) VALUES
(1, 6, 'Forum pertama', 'forum-pertama', 'ini konten forum', '2020-11-18 11:49:06', '2020-11-18 11:49:06'),
(2, 2, 'Forum Kedua', 'forum-kedua', 'ini kontent kedua', '2020-11-18 11:48:56', '2020-11-18 11:48:56'),
(3, 2, 'ini judul kontent', 'ini-judul-kontent', 'ini kontent', '2020-11-18 05:34:57', '2020-11-18 05:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id`, `nama`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Faktul Maarij', '021999888777', 'Depok', '2020-08-13 04:43:04', NULL),
(2, 'Chairunnisa', '02198987764', 'Tangerang', '2020-08-13 04:43:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `konten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forum_id` bigint(20) UNSIGNED NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `user_id`, `konten`, `forum_id`, `parent`, `created_at`, `updated_at`) VALUES
(1, 2, 'test', 3, 0, '2020-11-18 21:37:39', '2020-11-18 21:37:39'),
(3, 6, 'komentar dari dina', 3, 0, '2020-11-19 02:16:23', '2020-11-19 02:16:23'),
(4, 6, 'halo mila apa kabar?', 3, 0, '2020-11-19 02:17:08', '2020-11-19 02:17:08'),
(5, 2, 'halo juga dina, aku baik, kalo kamu?', 3, 4, '2020-11-19 02:23:01', '2020-11-19 02:23:01'),
(6, 6, 'aku baik, eh kamu kalkulus dapet berapa?', 3, 4, '2020-11-19 02:30:34', '2020-11-19 02:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guru_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id`, `kode`, `nama`, `semester`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'M-001', 'Matematika', 'ganjil', 2, '2020-08-12 06:17:25', '2020-08-13 04:44:20'),
(2, 'F-001', 'Fisika', 'ganjil', 1, '2020-08-12 06:17:25', '2020-08-13 04:44:38'),
(3, 'M-003', 'Agama Islam', 'ganjil', 1, '2020-08-12 14:50:23', '2020-08-13 04:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_siswa`
--

CREATE TABLE `mapel_siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `mapel_id` bigint(20) UNSIGNED NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mapel_siswa`
--

INSERT INTO `mapel_siswa` (`id`, `siswa_id`, `mapel_id`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 80, '2020-08-12 06:18:47', NULL),
(2, 6, 2, 92, '2020-08-12 06:18:47', NULL),
(11, 22, 1, 97, '2020-08-12 03:36:55', '2020-08-13 07:01:36'),
(12, 23, 1, 90, '2020-08-12 03:46:46', '2020-08-12 03:46:46'),
(13, 6, 3, 70, '2020-08-12 15:04:32', NULL),
(15, 24, 1, 89, '2020-08-12 08:14:29', '2020-08-12 08:14:29'),
(16, 23, 3, 81, '2020-08-12 08:16:35', '2020-08-12 08:16:35'),
(17, 2, 1, 90, '2020-08-12 20:54:56', '2020-08-12 20:56:12'),
(18, 2, 3, 98, '2020-08-12 20:56:24', '2020-08-12 20:56:24'),
(19, 2, 2, 81, '2020-08-12 21:50:23', '2020-08-12 21:50:23'),
(20, 22, 2, 98, '2020-08-13 06:52:12', '2020-08-13 07:01:44'),
(21, 22, 3, 88, '2020-08-13 06:52:21', '2020-08-13 07:01:49'),
(22, 23, 2, 90, '2020-08-13 06:52:51', '2020-08-13 06:52:51'),
(23, 24, 2, 77, '2020-08-13 06:58:53', '2020-08-13 06:58:53'),
(24, 24, 3, 81, '2020-08-13 06:59:03', '2020-08-13 06:59:03'),
(25, 29, 2, 77, '2020-08-14 02:40:48', '2020-08-14 02:40:48'),
(26, 29, 1, 67, '2020-08-14 02:41:05', '2020-08-14 02:41:05'),
(27, 29, 3, 90, '2020-08-14 02:41:14', '2020-08-14 02:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2020_08_10_031608_create_siswa_table', 1),
(14, '2020_08_11_044204_add_gambar_to_siswa_table', 2),
(17, '2020_08_11_134148_add_role_to_users', 3),
(18, '2020_08_11_135201_add_user_id_to_siswa', 4),
(19, '2020_08_12_060613_create_mapel_table', 5),
(20, '2020_08_12_060947_crate_mapel_siswa_table', 6),
(24, '2020_08_13_040648_create_guru_table', 7),
(25, '2020_08_13_042455_add_guru_id_to_mapel', 8),
(26, '2020_08_16_031350_create_posts_table', 9),
(27, '2020_11_18_101101_create_forum_table', 10),
(28, '2020_11_18_101445_create_komentar_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `slug`, `tumbnail`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ini berita pertama', '<p>ini isi dari berita petama admin yang diinput secara manual</p>', 'ini-berita-pertama', '', '2020-08-16 03:20:19', NULL),
(2, 1, 'Pengumuman Kelulusan tahun 2018', 'pengumuman Kelulusan siswa tahun 2018 menyatakan bahwa semua siswa  <b>LULUS!</b>', 'pengumuman-kelulusan-tahun-2018', '', '2020-08-16 13:35:08', NULL),
(3, 1, 'ini judul', '<p>ini content nasi goreng</p>', 'ini-judul', 'http://localhost:8000/storage/photos/1/image8.jpg', '2020-08-16 08:43:40', '2020-08-16 08:43:40'),
(4, 1, 'teknologi javascript terbaru', '<p>manusia di era sekarang memang tak lepas dari adanya teknologi</p>', 'teknologi-javascript-terbaru', 'http://localhost:8000/storage/photos/1/image10.jpg', '2020-08-16 08:49:21', '2020-08-16 08:49:21'),
(5, 1, 'ini judul 4', '<p>ini konten 4</p>', 'ini-judul-4', 'http://localhost:8000/storage/photos/1/image-11.jpg', '2020-08-16 21:42:58', '2020-08-16 21:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nama_depan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `gambar`, `created_at`, `updated_at`) VALUES
(2, 0, 'Putri', 'Adisa', 'P', 'Islam', 'Jakarta', '15971577451.jpg', '2020-08-10 03:28:23', '2020-08-14 01:55:07'),
(6, 6, 'Dina', 'Alenda', 'P', 'Islam', 'Tangerang', '15972167996.jpg', '2020-08-09 21:36:54', '2020-08-14 01:59:59'),
(22, 0, 'Muhamad', 'Hendri', 'L', 'Islam', 'Surabaya', '15971436375.jpg', '2020-08-11 03:54:02', '2020-08-12 00:11:51'),
(23, 2, 'Mila', 'Hanifah', 'P', 'Islam', 'Jakarta', '15972173187.jpg', '2020-08-11 07:07:46', '2020-08-12 00:28:38'),
(24, 3, 'Ahmads', 'Zaki', 'L', 'Islam', 'Banten', '1597157803team-3.jpg', '2020-08-11 07:56:43', '2020-08-14 02:17:50'),
(34, 26, 'Galak Carub Utama', 'Yuniar', 'L', 'Buddha', 'Psr. Reksoninten No. 7, Banjar 47776, KalBar', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(35, 64, 'Titi Kusmawati S.T.', 'Farida', 'P', 'Hindu', 'Ki. Wahid No. 449, Banda Aceh 15455, JaTeng', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(36, 67, 'Lasmanto Pradana S.T.', 'Laksmiwati', 'L', 'Hindu', 'Kpg. Wahid Hasyim No. 997, Pematangsiantar 12471, KepR', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(37, 28, 'Prakosa Lazuardi M.Ak', 'Prayoga', 'P', 'Hindu', 'Jr. M.T. Haryono No. 7, Palangka Raya 10723, KalTeng', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(38, 83, 'Wirda Pia Anggraini S.Pt', 'Novitasari', 'P', 'Islam', 'Kpg. Warga No. 959, Jambi 94082, JaBar', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(39, 86, 'Mursita Prasetya', 'Widiastuti', 'L', 'Hindu', 'Psr. Ir. H. Juanda No. 225, Surakarta 17249, SumUt', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(40, 57, 'Farah Hartati M.Farm', 'Uyainah', 'P', 'Islam', 'Jln. Surapati No. 596, Denpasar 26321, NTT', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(41, 45, 'Syahrini Riyanti S.Pt', 'Lailasari', 'P', 'Islam', 'Ki. S. Parman No. 954, Yogyakarta 73784, Bengkulu', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(42, 48, 'Fathonah Nasyidah S.Farm', 'Andriani', 'P', 'Buddha', 'Ki. Flores No. 348, Batu 38603, SumUt', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(43, 11, 'Zizi Cinta Halimah S.Sos', 'Santoso', 'L', 'Islam', 'Jln. Veteran No. 754, Palu 54778, Riau', NULL, '2020-08-16 22:09:48', '2020-08-16 22:09:48'),
(44, 34, 'Jaga Pranowo', 'Wijaya', 'P', 'Islam', 'Kpg. Sutarto No. 370, Sawahlunto 36356, KalSel', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(45, 55, 'Zalindra Agustina', 'Hastuti', 'L', 'Buddha', 'Gg. Jambu No. 755, Tanjungbalai 68488, SulTeng', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(46, 84, 'Widya Oktaviani', 'Wijaya', 'P', 'Buddha', 'Dk. Bakaru No. 791, Denpasar 50719, Banten', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(47, 99, 'Mustika Saputra', 'Safitri', 'L', 'Buddha', 'Dk. Raya Ujungberung No. 942, Payakumbuh 78395, KalTeng', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(48, 96, 'Ellis Nasyidah', 'Susanti', 'P', 'Hindu', 'Psr. Asia Afrika No. 234, Banjar 68471, KalSel', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(49, 79, 'Yono Prasetya', 'Namaga', 'L', 'Islam', 'Psr. B.Agam 1 No. 253, Bengkulu 66969, Bengkulu', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(50, 97, 'Irma Rahayu', 'Safitri', 'L', 'Buddha', 'Jr. Suharso No. 819, Depok 98370, KalUt', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(51, 93, 'Jagaraga Among Sinaga S.E.I', 'Nasyiah', 'L', 'Hindu', 'Kpg. R.M. Said No. 850, Parepare 33196, JaTim', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(52, 59, 'Candra Prayoga', 'Narpati', 'P', 'Islam', 'Jln. Sukabumi No. 92, Balikpapan 14473, PapBar', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(53, 74, 'Dwi Wibowo S.Sos', 'Hidayat', 'L', 'Hindu', 'Ki. Babadan No. 350, Madiun 99167, DIY', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(54, 12, 'Belinda Ade Riyanti S.Gz', 'Habibi', 'P', 'Hindu', 'Gg. Basmol Raya No. 270, Pangkal Pinang 42000, Lampung', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(55, 42, 'Yessi Novitasari S.Pt', 'Namaga', 'L', 'Hindu', 'Jln. Mulyadi No. 158, Mataram 74632, SumBar', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(56, 31, 'Silvia Padmasari', 'Puspasari', 'P', 'Islam', 'Gg. Raden Saleh No. 775, Tanjungbalai 76317, DIY', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(57, 35, 'Ulva Septi Rahmawati', 'Mayasari', 'P', 'Islam', 'Dk. Suniaraja No. 407, Denpasar 82993, JaTeng', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(58, 19, 'Rendy Maulana', 'Mandala', 'P', 'Hindu', 'Psr. Thamrin No. 144, Mojokerto 37288, SumUt', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(59, 100, 'Karen Patricia Kusmawati S.Sos', 'Dabukke', 'P', 'Hindu', 'Jr. Pasirkoja No. 609, Tasikmalaya 44526, SulBar', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(60, 32, 'Siska Winarsih M.Ak', 'Utami', 'L', 'Buddha', 'Jln. Bagas Pati No. 439, Parepare 82163, JaBar', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(61, 45, 'Dina Puji Agustina S.I.Kom', 'Wastuti', 'P', 'Buddha', 'Gg. Elang No. 385, Sibolga 36919, Bengkulu', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(62, 70, 'Aisyah Juli Permata S.E.I', 'Kuswandari', 'L', 'Hindu', 'Psr. Arifin No. 697, Bandar Lampung 38939, KalUt', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(63, 66, 'Kemba Saragih', 'Maryadi', 'L', 'Islam', 'Ki. Suryo No. 630, Gunungsitoli 57711, NTB', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(64, 16, 'Gawati Icha Usada S.E.', 'Suryono', 'L', 'Islam', 'Jln. Mulyadi No. 529, Mataram 59416, SulTra', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(65, 71, 'Artawan Thamrin', 'Mandasari', 'L', 'Kristen', 'Ds. Basuki No. 928, Malang 42688, SumUt', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(66, 80, 'Darimin Suryono M.Pd', 'Utama', 'P', 'Buddha', 'Jr. Orang No. 604, Kendari 75532, SulUt', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(67, 71, 'Aswani Gunarto M.Farm', 'Pradipta', 'P', 'Islam', 'Ki. Ters. Buah Batu No. 203, Tanjungbalai 82922, SulUt', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(68, 88, 'Ulya Pratiwi', 'Oktaviani', 'L', 'Hindu', 'Jln. Bazuka Raya No. 69, Cilegon 77677, SumBar', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(69, 57, 'Darman Dagel Mansur', 'Hidayanto', 'P', 'Buddha', 'Ds. Sutan Syahrir No. 315, Palopo 41867, Bali', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(70, 70, 'Rina Malika Melani', 'Latupono', 'L', 'Hindu', 'Kpg. Qrisdoren No. 325, Serang 91314, Maluku', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(71, 33, 'Ophelia Hasanah', 'Yuniar', 'L', 'Kristen', 'Gg. Sam Ratulangi No. 237, Kotamobagu 54367, DIY', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(72, 26, 'Umaya Pradana', 'Sudiati', 'P', 'Islam', 'Jr. Wora Wari No. 907, Medan 82981, NTB', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(73, 26, 'Kenes Santoso M.Pd', 'Rahmawati', 'L', 'Islam', 'Kpg. Bahagia No. 431, Tanjung Pinang 37158, JaBar', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(74, 49, 'Nabila Rahayu S.Farm', 'Suartini', 'L', 'Kristen', 'Jr. Setiabudhi No. 480, Bengkulu 91135, SumSel', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(75, 77, 'Luhung Narpati', 'Pertiwi', 'P', 'Kristen', 'Gg. Sampangan No. 324, Palopo 29977, Aceh', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(76, 83, 'Mulya Luwes Wahyudin', 'Prakasa', 'P', 'Hindu', 'Ds. B.Agam 1 No. 717, Solok 34772, SulBar', NULL, '2020-08-16 22:12:46', '2020-08-16 22:12:46'),
(77, 91, 'Jaka Jamil Halim S.H.', 'Nuraini', 'L', 'Hindu', 'Psr. Abdul Rahmat No. 671, Subulussalam 30691, SulUt', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(78, 13, 'Raden Putu Prasasta', 'Laksita', 'L', 'Hindu', 'Kpg. Acordion No. 763, Banjarmasin 59443, NTT', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(79, 22, 'Viktor Mandala M.M.', 'Riyanti', 'P', 'Hindu', 'Ds. Wahidin Sudirohusodo No. 508, Pangkal Pinang 35878, Maluku', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(80, 43, 'Mutia Juli Purnawati', 'Pradipta', 'P', 'Buddha', 'Dk. Wahid Hasyim No. 302, Kendari 99612, KalTim', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(81, 51, 'Damar Tampubolon', 'Nasyiah', 'P', 'Buddha', 'Psr. Ki Hajar Dewantara No. 447, Dumai 93815, NTT', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(82, 48, 'Ella Rahmi Prastuti S.Ked', 'Hassanah', 'L', 'Islam', 'Ds. Rajawali No. 545, Sungai Penuh 75274, BaBel', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(83, 25, 'Diana Mandasari', 'Lailasari', 'P', 'Islam', 'Ki. Gatot Subroto No. 309, Kupang 35429, Papua', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(84, 26, 'Galih Ardianto', 'Pratama', 'P', 'Kristen', 'Ki. Raden Saleh No. 162, Tomohon 96481, KalTim', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(85, 55, 'Iriana Hassanah', 'Rahimah', 'L', 'Buddha', 'Dk. Radio No. 277, Tanjung Pinang 92359, Bali', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(86, 96, 'Padma Winarsih', 'Astuti', 'P', 'Islam', 'Ds. Ters. Jakarta No. 156, Lhokseumawe 11435, SulBar', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(87, 90, 'Warta Catur Hutagalung M.M.', 'Firgantoro', 'L', 'Islam', 'Dk. Imam No. 842, Padangsidempuan 39961, PapBar', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(88, 59, 'Elisa Utami', 'Pudjiastuti', 'L', 'Hindu', 'Jln. Warga No. 735, Ambon 69879, Banten', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(89, 97, 'Mutia Gabriella Palastri S.H.', 'Marpaung', 'P', 'Islam', 'Dk. Babadan No. 424, Depok 44024, Papua', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(90, 18, 'Adikara Utama', 'Haryanto', 'L', 'Islam', 'Kpg. Bakau No. 345, Tanjungbalai 65407, NTT', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(91, 85, 'Hari Lukita Pangestu S.Psi', 'Widiastuti', 'L', 'Buddha', 'Jr. Mahakam No. 482, Palopo 25985, SulSel', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(92, 22, 'Maras Hidayat', 'Hutapea', 'P', 'Islam', 'Gg. Mulyadi No. 93, Kediri 56296, Lampung', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(93, 64, 'Yessi Amelia Rahmawati', 'Winarsih', 'P', 'Buddha', 'Jln. Sudirman No. 575, Bekasi 41299, SulTra', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(94, 93, 'Ratih Uyainah S.Pt', 'Laksmiwati', 'P', 'Kristen', 'Ki. Padma No. 136, Pekanbaru 87775, KepR', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(95, 47, 'Uchita Lestari', 'Hassanah', 'P', 'Buddha', 'Jr. Kartini No. 208, Pekanbaru 53520, SulTra', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(96, 14, 'Titin Dalima Hasanah', 'Budiman', 'L', 'Kristen', 'Psr. Bawal No. 689, Tanjungbalai 42063, SulTra', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(97, 83, 'Caraka Haryanto M.Pd', 'Saputra', 'L', 'Kristen', 'Jr. Agus Salim No. 487, Bukittinggi 84132, Gorontalo', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(98, 84, 'Halima Rahimah', 'Maryati', 'P', 'Islam', 'Ki. Ekonomi No. 540, Bima 54236, NTB', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(99, 49, 'Respati Latupono', 'Hariyah', 'P', 'Kristen', 'Kpg. Sumpah Pemuda No. 410, Magelang 21291, SumUt', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(100, 27, 'Harimurti Empluk Hutagalung S.IP', 'Mustofa', 'P', 'Islam', 'Gg. Villa No. 429, Pekanbaru 94160, NTT', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(101, 78, 'Uli Sudiati', 'Halimah', 'P', 'Islam', 'Dk. Pacuan Kuda No. 870, Tanjung Pinang 53318, KalBar', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(102, 70, 'Jarwi Mulyono Saragih', 'Halim', 'P', 'Hindu', 'Jr. Ikan No. 545, Banda Aceh 39869, SumBar', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(103, 10, 'Safina Yulianti', 'Mandasari', 'P', 'Buddha', 'Psr. Basoka Raya No. 639, Depok 58267, KalUt', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(104, 64, 'Intan Laksmiwati S.I.Kom', 'Kuswandari', 'L', 'Buddha', 'Jr. Bhayangkara No. 854, Padang 65242, SulTeng', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(105, 78, 'Rina Nasyiah S.Ked', 'Kusumo', 'P', 'Islam', 'Jln. Batako No. 444, Malang 66434, PapBar', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(106, 35, 'Ira Hastuti', 'Prakasa', 'L', 'Kristen', 'Gg. Ters. Buah Batu No. 382, Medan 10221, SumBar', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(107, 61, 'Naradi Wardi Haryanto', 'Firmansyah', 'P', 'Islam', 'Ds. Dr. Junjunan No. 938, Singkawang 24432, BaBel', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(108, 21, 'Vanesa Kiandra Kusmawati M.Pd', 'Manullang', 'L', 'Hindu', 'Ds. Bakhita No. 242, Bekasi 56071, KalTeng', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(109, 96, 'Kenzie Mustofa', 'Aryani', 'L', 'Kristen', 'Ds. K.H. Maskur No. 51, Padang 32944, SulTra', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(110, 31, 'Heryanto Panji Nugroho', 'Wahyuni', 'P', 'Hindu', 'Dk. Baung No. 265, Banjarmasin 75955, MalUt', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(111, 14, 'Maida Fujiati', 'Nuraini', 'L', 'Hindu', 'Ki. Madrasah No. 583, Malang 92670, MalUt', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(112, 99, 'Vicky Agustina', 'Simbolon', 'L', 'Islam', 'Kpg. Salatiga No. 247, Mojokerto 32186, Maluku', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(113, 87, 'Tugiman Cager Budiman M.TI.', 'Mangunsong', 'L', 'Islam', 'Gg. Gedebage Selatan No. 691, Pekalongan 23695, KepR', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(114, 59, 'Cici Mila Farida', 'Kuswoyo', 'L', 'Islam', 'Gg. Gambang No. 575, Bitung 57751, Maluku', NULL, '2020-08-16 22:12:47', '2020-08-16 22:12:47'),
(115, 51, 'Cindy Palastri', 'Andriani', 'L', 'Kristen', 'Jln. Antapani Lama No. 924, Batu 32661, MalUt', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(116, 13, 'Paramita Puti Yulianti S.Ked', 'Waskita', 'P', 'Hindu', 'Dk. Qrisdoren No. 638, Sorong 81838, BaBel', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(117, 61, 'Shakila Dewi Usamah', 'Najmudin', 'P', 'Buddha', 'Jr. Urip Sumoharjo No. 736, Pontianak 80502, SumUt', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(118, 98, 'Salimah Lailasari', 'Pradipta', 'L', 'Buddha', 'Dk. Sudiarto No. 402, Medan 77620, Aceh', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(119, 83, 'Jessica Permata', 'Riyanti', 'L', 'Buddha', 'Dk. Baabur Royan No. 756, Surabaya 50168, Banten', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(120, 42, 'Liman Firmansyah', 'Marpaung', 'P', 'Hindu', 'Dk. Ahmad Dahlan No. 581, Pekanbaru 28760, MalUt', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(121, 25, 'Dalimin Gilang Latupono', 'Sinaga', 'P', 'Buddha', 'Ki. Honggowongso No. 170, Manado 65172, SulTeng', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(122, 20, 'Nilam Kartika Yolanda M.TI.', 'Budiman', 'L', 'Islam', 'Kpg. K.H. Maskur No. 185, Pematangsiantar 87870, SumBar', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(123, 28, 'Edison Permadi', 'Pradipta', 'L', 'Hindu', 'Jr. Ekonomi No. 616, Makassar 69257, PapBar', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(124, 96, 'Wira Anggriawan', 'Nugroho', 'L', 'Buddha', 'Jr. Salam No. 587, Administrasi Jakarta Barat 79947, KalBar', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(125, 72, 'Gandi Saputra S.Farm', 'Hutasoit', 'L', 'Hindu', 'Kpg. Cikutra Timur No. 745, Batu 71342, SumUt', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(126, 90, 'Indah Rika Hastuti M.Kom.', 'Nainggolan', 'P', 'Kristen', 'Jr. Urip Sumoharjo No. 902, Sibolga 73830, SumBar', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(127, 81, 'Laswi Vega Ramadan', 'Dongoran', 'P', 'Buddha', 'Ds. Flores No. 217, Pangkal Pinang 75123, Bali', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(128, 70, 'Simon Mustofa', 'Dabukke', 'P', 'Hindu', 'Gg. Bakau No. 516, Cilegon 98255, SulSel', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(129, 30, 'Belinda Suci Pratiwi', 'Habibi', 'P', 'Hindu', 'Gg. Jend. A. Yani No. 288, Tangerang 11978, KalTim', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(130, 53, 'Asmuni Hakim S.Ked', 'Siregar', 'L', 'Islam', 'Jln. Bagas Pati No. 994, Cilegon 29292, KalUt', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(131, 66, 'Rahman Hartaka Tampubolon S.E.I', 'Sihombing', 'L', 'Buddha', 'Gg. Laswi No. 238, Cirebon 90342, SulSel', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(132, 64, 'Uda Siregar', 'Sinaga', 'P', 'Hindu', 'Dk. Samanhudi No. 487, Makassar 29295, SulTra', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(133, 82, 'Wawan Bagas Napitupulu M.Ak', 'Winarsih', 'P', 'Buddha', 'Psr. Bara No. 925, Cilegon 52391, JaTim', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(134, 24, 'Asman Cemeti Haryanto S.Kom', 'Siregar', 'L', 'Islam', 'Kpg. Barasak No. 760, Cimahi 81784, JaBar', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(135, 13, 'Vanya Suci Rahayu', 'Damanik', 'P', 'Islam', 'Gg. B.Agam 1 No. 382, Sibolga 69124, KepR', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(136, 27, 'Gangsa Iswahyudi', 'Pratiwi', 'P', 'Islam', 'Jr. K.H. Maskur No. 725, Administrasi Jakarta Selatan 94051, KepR', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(137, 14, 'Tiara Ratna Suartini', 'Prakasa', 'L', 'Islam', 'Jln. Ters. Buah Batu No. 550, Tangerang 74595, DIY', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(138, 65, 'Lili Permata S.Pd', 'Rahimah', 'L', 'Kristen', 'Ki. W.R. Supratman No. 551, Semarang 97927, KalTim', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(139, 10, 'Oni Yuniar', 'Haryanti', 'P', 'Hindu', 'Jln. Ters. Pasir Koja No. 121, Lhokseumawe 72133, KepR', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(140, 41, 'Winda Zahra Maryati S.E.', 'Nuraini', 'L', 'Kristen', 'Ki. Babakan No. 210, Sorong 14296, Lampung', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(141, 18, 'Salimah Agnes Pudjiastuti', 'Lazuardi', 'P', 'Kristen', 'Gg. Rajawali Timur No. 253, Lhokseumawe 16644, JaBar', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(142, 78, 'Sakura Mayasari M.Farm', 'Nasyiah', 'L', 'Buddha', 'Jln. Bagas Pati No. 401, Pangkal Pinang 74240, SulSel', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(143, 40, 'Kenari Sihombing S.T.', 'Natsir', 'P', 'Islam', 'Dk. Yoga No. 459, Pasuruan 48660, SumSel', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(144, 73, 'Farah Lestari', 'Dongoran', 'P', 'Islam', 'Ds. Mulyadi No. 798, Dumai 90978, PapBar', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(145, 54, 'Jagaraga Santoso S.IP', 'Permata', 'P', 'Kristen', 'Jr. Gegerkalong Hilir No. 222, Yogyakarta 86766, JaTim', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(146, 63, 'Mila Kusmawati', 'Simanjuntak', 'P', 'Kristen', 'Kpg. Industri No. 226, Gunungsitoli 35022, SulBar', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(147, 19, 'Latika Melinda Rahimah', 'Kuswoyo', 'L', 'Buddha', 'Kpg. Urip Sumoharjo No. 614, Salatiga 39200, SulSel', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(148, 59, 'Muhammad Napitupulu', 'Wibisono', 'P', 'Kristen', 'Psr. Basmol Raya No. 878, Gorontalo 34506, Banten', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(149, 23, 'Cahyadi Pranowo', 'Wijaya', 'P', 'Kristen', 'Psr. Abdul. Muis No. 888, Semarang 80361, SulTeng', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(150, 21, 'Prayogo Lazuardi', 'Novitasari', 'P', 'Islam', 'Jr. Kebangkitan Nasional No. 399, Madiun 95402, JaTeng', NULL, '2020-08-16 22:12:48', '2020-08-16 22:12:48'),
(151, 19, 'Ika Haryanti', 'Wastuti', 'P', 'Buddha', 'Jln. Madrasah No. 744, Pematangsiantar 18408, SumBar', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(152, 70, 'Patricia Safitri S.IP', 'Simanjuntak', 'P', 'Buddha', 'Ds. Suharso No. 354, Bitung 62997, Papua', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(153, 30, 'Dian Mayasari', 'Melani', 'L', 'Islam', 'Ds. Adisumarmo No. 114, Palangka Raya 25559, SumUt', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(154, 90, 'Taufan Jail Mandala S.T.', 'Gunarto', 'L', 'Islam', 'Jr. Jamika No. 852, Tidore Kepulauan 47655, Bali', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(155, 73, 'Julia Wahyuni', 'Kuswandari', 'P', 'Islam', 'Jr. Bakit  No. 11, Payakumbuh 40426, Maluku', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(156, 55, 'Kamila Nurdiyanti M.Ak', 'Narpati', 'P', 'Kristen', 'Jr. Ki Hajar Dewantara No. 341, Solok 74331, SulBar', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(157, 42, 'Prima Radit Saptono', 'Yuliarti', 'P', 'Hindu', 'Ds. Cikutra Barat No. 552, Cirebon 88332, KalTeng', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(158, 19, 'Heru Indra Budiman', 'Prayoga', 'L', 'Hindu', 'Gg. Otista No. 916, Banjar 46510, SumUt', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(159, 27, 'Karsa Hutapea', 'Pudjiastuti', 'L', 'Kristen', 'Kpg. Cut Nyak Dien No. 556, Magelang 35689, Bengkulu', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(160, 63, 'Daru Putra', 'Purwanti', 'P', 'Buddha', 'Psr. Padma No. 135, Solok 62210, KalBar', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(161, 65, 'Mahmud Ikin Wasita S.Farm', 'Lailasari', 'P', 'Islam', 'Ki. Cemara No. 420, Lubuklinggau 18048, SulTeng', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(162, 48, 'Sarah Purnawati', 'Waluyo', 'L', 'Hindu', 'Ki. Halim No. 574, Tarakan 52356, NTT', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(163, 73, 'Calista Laksmiwati', 'Nugroho', 'L', 'Kristen', 'Dk. Mulyadi No. 8, Solok 79944, NTT', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(164, 46, 'Nadine Hasanah S.IP', 'Zulaika', 'L', 'Hindu', 'Ds. Baiduri No. 47, Sungai Penuh 83976, Bali', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(165, 17, 'Zaenab Melinda Purnawati S.Pd', 'Pranowo', 'P', 'Kristen', 'Psr. Baha No. 915, Surabaya 97207, DIY', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(166, 100, 'Emong Iswahyudi', 'Waluyo', 'P', 'Buddha', 'Dk. Setiabudhi No. 264, Bima 48889, DKI', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(167, 95, 'Jabal Hakim', 'Mangunsong', 'L', 'Islam', 'Kpg. Moch. Yamin No. 612, Sawahlunto 10892, Bali', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(168, 57, 'Daruna Cahyadi Wasita', 'Irawan', 'P', 'Kristen', 'Dk. Bacang No. 116, Sabang 23523, KalSel', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(169, 24, 'Maman Marsudi Situmorang', 'Nugroho', 'P', 'Buddha', 'Kpg. Gardujati No. 764, Dumai 90930, Lampung', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(170, 30, 'Malika Yolanda', 'Siregar', 'P', 'Kristen', 'Kpg. Bak Air No. 398, Pekanbaru 55291, KalTeng', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(171, 43, 'Budi Wacana', 'Hastuti', 'L', 'Hindu', 'Gg. Bakaru No. 940, Sawahlunto 29722, BaBel', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(172, 61, 'Edison Teddy Waluyo', 'Pranowo', 'P', 'Buddha', 'Psr. Cemara No. 813, Bima 61671, BaBel', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(173, 69, 'Yunita Yuniar', 'Laksmiwati', 'L', 'Hindu', 'Kpg. Gading No. 818, Kotamobagu 31984, KalTim', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(174, 66, 'Lutfan Dabukke', 'Wahyudin', 'L', 'Kristen', 'Psr. Baabur Royan No. 93, Mataram 92454, MalUt', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(175, 13, 'Gina Wijayanti S.Gz', 'Pangestu', 'L', 'Islam', 'Ki. Adisumarmo No. 219, Mataram 43709, SulSel', NULL, '2020-08-16 22:12:49', '2020-08-16 22:12:49'),
(176, 81, 'Hasta Karna Dongoran', 'Ramadan', 'P', 'Kristen', 'Gg. Ir. H. Juanda No. 859, Tidore Kepulauan 48348, BaBel', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(177, 24, 'Taswir Sitorus', 'Nainggolan', 'L', 'Hindu', 'Jln. Sampangan No. 559, Denpasar 97156, JaTim', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(178, 22, 'Padmi Wijayanti', 'Haryanti', 'L', 'Kristen', 'Gg. Basoka Raya No. 513, Gorontalo 38883, BaBel', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(179, 100, 'Ilyas Harja Mangunsong', 'Waluyo', 'L', 'Islam', 'Ki. Ters. Kiaracondong No. 917, Magelang 10958, KalTeng', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(180, 18, 'Genta Vicky Laksmiwati S.H.', 'Laksita', 'P', 'Hindu', 'Ki. Banal No. 281, Sungai Penuh 13856, KalTim', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(181, 25, 'Among Dabukke', 'Sitorus', 'P', 'Islam', 'Psr. Sutan Syahrir No. 721, Bima 22401, DKI', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(182, 59, 'Jamil Wisnu Firmansyah', 'Permata', 'P', 'Kristen', 'Jr. Ahmad Dahlan No. 398, Surabaya 33298, JaBar', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(183, 39, 'Kawaya Gunawan', 'Samosir', 'P', 'Hindu', 'Kpg. Baja Raya No. 866, Denpasar 48836, Maluku', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(184, 92, 'Umi Padmasari S.Farm', 'Uyainah', 'P', 'Islam', 'Ki. Madrasah No. 221, Tidore Kepulauan 38179, Banten', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(185, 43, 'Mahdi Hutasoit', 'Rajata', 'L', 'Buddha', 'Dk. Ters. Kiaracondong No. 302, Depok 17013, DKI', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(186, 81, 'Ratna Nasyiah M.Pd', 'Saragih', 'P', 'Kristen', 'Jr. Yoga No. 576, Pontianak 78600, KalSel', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(187, 77, 'Damu Firmansyah', 'Sitompul', 'P', 'Islam', 'Psr. Bambon No. 529, Sibolga 90756, JaTeng', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(188, 65, 'Siti Namaga', 'Budiyanto', 'L', 'Kristen', 'Ki. Gegerkalong Hilir No. 19, Mojokerto 50144, Aceh', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(189, 42, 'Estiono Prasetyo', 'Utami', 'P', 'Islam', 'Psr. Bak Air No. 906, Surabaya 89882, KalUt', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(190, 81, 'Ida Usamah', 'Palastri', 'L', 'Kristen', 'Jr. Pasirkoja No. 270, Sukabumi 50726, DIY', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(191, 70, 'Padma Putri Susanti M.TI.', 'Damanik', 'P', 'Islam', 'Gg. Wora Wari No. 712, Bandung 36306, SulUt', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(192, 10, 'Ade Lestari M.Farm', 'Salahudin', 'L', 'Hindu', 'Kpg. Lumban Tobing No. 666, Gorontalo 44948, SulTra', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(193, 25, 'Edi Wibisono', 'Usamah', 'L', 'Kristen', 'Gg. Barasak No. 896, Samarinda 99106, SulTeng', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(194, 36, 'Cakrajiya Taufik Sinaga S.Farm', 'Permadi', 'P', 'Kristen', 'Psr. Lembong No. 335, Palangka Raya 69225, SumUt', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(195, 40, 'Paramita Ulya Wijayanti', 'Nuraini', 'P', 'Buddha', 'Kpg. Sunaryo No. 9, Pariaman 25426, KalUt', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(196, 26, 'Edi Damanik', 'Permata', 'L', 'Kristen', 'Kpg. Haji No. 387, Pariaman 92360, JaTim', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(197, 42, 'Zamira Riyanti S.Sos', 'Purwanti', 'P', 'Islam', 'Jln. Baik No. 448, Tidore Kepulauan 70931, PapBar', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(198, 49, 'Rachel Purnawati', 'Astuti', 'P', 'Islam', 'Jln. Muwardi No. 52, Bima 16887, NTB', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(199, 70, 'Zamira Handayani', 'Riyanti', 'L', 'Kristen', 'Jr. Kalimantan No. 5, Padang 66055, SulTeng', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(200, 60, 'Wira Najmudin', 'Prasetyo', 'L', 'Hindu', 'Dk. Gremet No. 856, Palopo 95317, SulBar', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(201, 61, 'Rangga Raditya Sitorus S.E.I', 'Nainggolan', 'P', 'Buddha', 'Ki. Bayam No. 468, Gorontalo 76887, JaTeng', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(202, 39, 'Lanjar Sihotang', 'Purnawati', 'P', 'Islam', 'Psr. Wahidin Sudirohusodo No. 678, Palembang 29263, SulUt', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(203, 20, 'Dirja Nababan', 'Widodo', 'P', 'Kristen', 'Gg. Zamrud No. 815, Padangpanjang 66823, SulUt', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(204, 69, 'Dirja Nugroho', 'Sitompul', 'L', 'Buddha', 'Jln. Baik No. 38, Parepare 35053, JaBar', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(205, 93, 'Bakiono Mandala', 'Kuswandari', 'L', 'Hindu', 'Ki. Rumah Sakit No. 212, Tidore Kepulauan 38721, JaBar', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(206, 83, 'Baktiadi Pangestu', 'Wasita', 'L', 'Islam', 'Dk. Halim No. 942, Tomohon 80753, Bengkulu', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(207, 19, 'Gabriella Agustina M.M.', 'Agustina', 'L', 'Hindu', 'Gg. Baja No. 617, Bima 22823, KalBar', NULL, '2020-08-16 22:12:50', '2020-08-16 22:12:50'),
(208, 79, 'Rahayu Permata S.Sos', 'Suryatmi', 'P', 'Kristen', 'Kpg. Pahlawan No. 177, Tangerang 47342, BaBel', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(209, 39, 'Balapati Tarihoran', 'Ramadan', 'P', 'Buddha', 'Gg. Bara No. 372, Surakarta 36284, NTB', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(210, 20, 'Olga Wibisono', 'Setiawan', 'L', 'Kristen', 'Dk. Thamrin No. 881, Tasikmalaya 66630, DKI', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(211, 29, 'Ikhsan Putra S.I.Kom', 'Laksita', 'P', 'Islam', 'Kpg. Villa No. 627, Bandung 74805, Gorontalo', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(212, 18, 'Nabila Padmasari', 'Prasasta', 'P', 'Islam', 'Ds. Yoga No. 335, Serang 36691, SulTra', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(213, 60, 'Jasmin Yolanda S.Farm', 'Nugroho', 'P', 'Hindu', 'Dk. Aceh No. 337, Kupang 90898, NTB', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(214, 30, 'Hesti Yuni Wahyuni S.IP', 'Mulyani', 'L', 'Buddha', 'Psr. Kusmanto No. 102, Balikpapan 33673, Lampung', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(215, 67, 'Gawati Humaira Hariyah', 'Aryani', 'L', 'Buddha', 'Ds. Banda No. 849, Bandung 58498, Papua', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(216, 60, 'Arta Saefullah', 'Nurdiyanti', 'P', 'Hindu', 'Psr. Gajah No. 654, Dumai 92861, KepR', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(217, 60, 'Purwadi Nababan', 'Pranowo', 'P', 'Buddha', 'Gg. Baing No. 822, Blitar 82047, Bali', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(218, 35, 'Panji Wacana M.TI.', 'Halimah', 'L', 'Hindu', 'Jln. Qrisdoren No. 267, Denpasar 26014, KalSel', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(219, 48, 'Lembah Halim', 'Anggraini', 'P', 'Buddha', 'Dk. Baiduri No. 637, Kediri 17766, Maluku', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(220, 68, 'Caturangga Halim', 'Yuliarti', 'P', 'Hindu', 'Ki. Salam No. 736, Bukittinggi 76927, DKI', NULL, '2020-08-16 22:12:51', '2020-08-16 22:12:51'),
(221, 47, 'Balijan Garda Prasetyo', 'Suwarno', 'P', 'Hindu', 'Dk. Gotong Royong No. 531, Pontianak 56836, JaTim', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(222, 41, 'Chelsea Usamah', 'Budiyanto', 'L', 'Buddha', 'Gg. Ronggowarsito No. 564, Bandar Lampung 45113, SumBar', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(223, 27, 'Opan Hutapea', 'Suryono', 'P', 'Kristen', 'Ds. Qrisdoren No. 795, Batam 55704, DIY', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(224, 63, 'Rina Lestari', 'Mulyani', 'L', 'Hindu', 'Dk. Wahidin Sudirohusodo No. 816, Administrasi Jakarta Utara 65277, SumSel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(225, 52, 'Rachel Gasti Hastuti', 'Mulyani', 'P', 'Kristen', 'Kpg. Industri No. 68, Gorontalo 41010, KalTim', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(226, 84, 'Zahra Vera Laksmiwati S.Pd', 'Hutapea', 'L', 'Kristen', 'Ki. Bazuka Raya No. 802, Gorontalo 33361, KalSel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(227, 48, 'Tirta Najmudin', 'Hasanah', 'P', 'Hindu', 'Psr. Ters. Jakarta No. 175, Padang 97599, BaBel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(228, 82, 'Ami Mulyani', 'Yuniar', 'P', 'Kristen', 'Psr. Thamrin No. 294, Salatiga 80821, KalUt', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(229, 32, 'Yessi Wahyuni', 'Rahimah', 'L', 'Islam', 'Psr. Otista No. 789, Jayapura 56455, DIY', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(230, 100, 'Fitriani Oktaviani S.E.I', 'Hasanah', 'L', 'Islam', 'Jr. W.R. Supratman No. 939, Pangkal Pinang 42212, SulBar', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(231, 19, 'Ilyas Prayoga', 'Rahayu', 'P', 'Hindu', 'Dk. Ronggowarsito No. 770, Pariaman 49284, Bengkulu', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(232, 43, 'Halima Wijayanti', 'Laksmiwati', 'L', 'Islam', 'Psr. Labu No. 794, Palembang 29726, KalSel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(233, 21, 'Amalia Maida Laksmiwati', 'Nugroho', 'L', 'Hindu', 'Jr. Teuku Umar No. 907, Banjarbaru 60217, SulTra', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(234, 69, 'Zulaikha Permata', 'Mansur', 'P', 'Hindu', 'Ds. Bayan No. 525, Cimahi 69752, DKI', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(235, 60, 'Restu Wahyuni S.Pd', 'Narpati', 'P', 'Buddha', 'Kpg. Adisumarmo No. 342, Makassar 77437, SulSel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(236, 60, 'Cindy Farida', 'Megantara', 'L', 'Kristen', 'Kpg. Bass No. 780, Mataram 86645, MalUt', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(237, 95, 'Laras Novitasari', 'Saragih', 'L', 'Kristen', 'Jr. Abdul Muis No. 374, Cirebon 52674, KalTeng', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(238, 20, 'Dirja Prayoga', 'Mayasari', 'L', 'Kristen', 'Ds. Cihampelas No. 830, Banjarmasin 46956, SumSel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(239, 78, 'Elisa Zulaika', 'Thamrin', 'L', 'Kristen', 'Ds. Gegerkalong Hilir No. 206, Pasuruan 32130, BaBel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(240, 88, 'Oliva Haryanti', 'Farida', 'L', 'Buddha', 'Gg. Imam Bonjol No. 316, Bukittinggi 59342, SumUt', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(241, 56, 'Shania Hasanah', 'Pradana', 'P', 'Kristen', 'Dk. Dipatiukur No. 881, Langsa 24702, SulSel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(242, 72, 'Damar Gunawan', 'Purnawati', 'P', 'Buddha', 'Dk. Cihampelas No. 180, Mojokerto 34078, Lampung', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(243, 19, 'Bakiono Sihotang', 'Aryani', 'L', 'Buddha', 'Jln. Banceng Pondok No. 954, Bontang 81864, NTB', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(244, 22, 'Suci Rahmawati', 'Mardhiyah', 'P', 'Buddha', 'Kpg. Wahid Hasyim No. 403, Padangsidempuan 37076, SulUt', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(245, 50, 'Yunita Purwanti', 'Putra', 'L', 'Buddha', 'Dk. Jend. A. Yani No. 479, Bandung 74912, BaBel', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(246, 80, 'Muhammad Saka Budiman', 'Maheswara', 'L', 'Hindu', 'Kpg. Nanas No. 236, Tarakan 83137, Bali', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(247, 35, 'Ratna Lestari', 'Anggraini', 'L', 'Hindu', 'Psr. Ir. H. Juanda No. 100, Prabumulih 48729, DIY', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(248, 25, 'Ulya Siti Wijayanti S.E.I', 'Laksita', 'L', 'Islam', 'Kpg. Gedebage Selatan No. 765, Kendari 67015, Riau', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(249, 83, 'Lantar Unggul Tampubolon S.Pd', 'Pratiwi', 'P', 'Hindu', 'Ki. Cemara No. 328, Tomohon 80740, NTB', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(250, 11, 'Restu Andriani', 'Prastuti', 'L', 'Hindu', 'Gg. Jagakarsa No. 822, Subulussalam 54434, Papua', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(251, 10, 'Tania Purnawati', 'Natsir', 'L', 'Hindu', 'Jln. Supomo No. 268, Gorontalo 54125, NTT', NULL, '2020-08-16 22:12:52', '2020-08-16 22:12:52'),
(252, 92, 'Hana Nuraini S.Sos', 'Widodo', 'P', 'Buddha', 'Jr. Nanas No. 77, Yogyakarta 80207, Bali', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(253, 46, 'Salwa Wulan Agustina', 'Suartini', 'L', 'Islam', 'Ki. Bara No. 275, Singkawang 32221, SulSel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(254, 41, 'Uda Samosir', 'Mardhiyah', 'L', 'Buddha', 'Ds. Bappenas No. 465, Gorontalo 59007, JaTeng', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(255, 33, 'Alika Cindy Yuliarti', 'Wibowo', 'P', 'Kristen', 'Dk. R.M. Said No. 499, Langsa 41024, Gorontalo', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(256, 88, 'Rini Uyainah M.Farm', 'Wibowo', 'L', 'Buddha', 'Ki. Wahidin Sudirohusodo No. 163, Surabaya 39714, BaBel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(257, 71, 'Elvina Zelda Safitri', 'Sitompul', 'L', 'Buddha', 'Dk. Wahidin Sudirohusodo No. 834, Dumai 68121, SumBar', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(258, 38, 'Silvia Pertiwi', 'Astuti', 'P', 'Buddha', 'Jr. Arifin No. 887, Batam 45591, Lampung', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(259, 70, 'Dagel Langgeng Marbun', 'Uwais', 'P', 'Buddha', 'Jr. Kyai Gede No. 296, Palembang 14898, BaBel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(260, 33, 'Ellis Lidya Yulianti', 'Winarno', 'L', 'Kristen', 'Jln. Bappenas No. 773, Pekanbaru 15821, Papua', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(261, 29, 'Tiara Nuraini', 'Padmasari', 'L', 'Kristen', 'Jr. Katamso No. 105, Surabaya 84254, Gorontalo', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(262, 85, 'Rahmi Novitasari', 'Putra', 'L', 'Kristen', 'Dk. Bahagia No. 663, Tanjung Pinang 22919, Lampung', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(263, 18, 'Umay Dono Najmudin', 'Riyanti', 'P', 'Islam', 'Ki. Fajar No. 136, Manado 84260, KepR', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(264, 60, 'Ophelia Pratiwi', 'Wibowo', 'P', 'Islam', 'Ki. Sudirman No. 697, Lubuklinggau 47457, SulTra', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(265, 38, 'Ella Mulyani', 'Lestari', 'L', 'Kristen', 'Kpg. K.H. Wahid Hasyim (Kopo) No. 847, Payakumbuh 77536, Lampung', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(266, 69, 'Tugiman Paiman Sitorus', 'Saputra', 'L', 'Kristen', 'Dk. Gotong Royong No. 883, Yogyakarta 55901, Banten', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(267, 57, 'Budi Adriansyah', 'Pangestu', 'P', 'Hindu', 'Kpg. Dewi Sartika No. 255, Magelang 74819, SumBar', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(268, 26, 'Ibrani Narpati S.I.Kom', 'Pudjiastuti', 'L', 'Buddha', 'Jln. Pasir Koja No. 197, Banjar 90704, BaBel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(269, 77, 'Uchita Anggraini', 'Pratiwi', 'P', 'Islam', 'Dk. Ters. Kiaracondong No. 92, Bima 74406, Riau', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(270, 51, 'Rendy Nashiruddin', 'Lestari', 'P', 'Islam', 'Jr. Dr. Junjunan No. 600, Payakumbuh 86250, KalUt', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(271, 32, 'Kairav Sihombing', 'Waskita', 'L', 'Hindu', 'Ds. Hang No. 224, Yogyakarta 88371, Riau', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(272, 60, 'Eka Elon Putra', 'Nurdiyanti', 'L', 'Hindu', 'Ds. Wahidin No. 464, Binjai 34981, SumSel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(273, 47, 'Cinthia Mulyani', 'Halimah', 'L', 'Islam', 'Dk. Kartini No. 29, Banjar 76777, MalUt', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(274, 42, 'Olivia Purwanti', 'Nurdiyanti', 'L', 'Kristen', 'Ds. Gajah Mada No. 196, Malang 33033, DIY', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(275, 66, 'Kariman Saragih', 'Firgantoro', 'L', 'Kristen', 'Jln. Cikutra Timur No. 843, Singkawang 84655, KalSel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(276, 60, 'Jarwadi Karna Prasetya', 'Hutapea', 'P', 'Kristen', 'Kpg. Basuki Rahmat  No. 487, Palembang 90430, Aceh', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(277, 87, 'Usman Emil Tampubolon', 'Prabowo', 'L', 'Kristen', 'Psr. Bata Putih No. 40, Palopo 80611, Bali', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(278, 82, 'Nabila Vanesa Maryati S.Kom', 'Hassanah', 'P', 'Hindu', 'Ds. Bappenas No. 172, Magelang 87255, SulTeng', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(279, 28, 'Virman Rajasa', 'Nuraini', 'P', 'Hindu', 'Dk. Merdeka No. 658, Batam 50424, KalSel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(280, 35, 'Ratih Hasna Suryatmi M.Ak', 'Prabowo', 'P', 'Islam', 'Dk. Baya Kali Bungur No. 78, Lubuklinggau 56470, PapBar', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(281, 98, 'Jagapati Nashiruddin', 'Safitri', 'P', 'Islam', 'Ki. Bappenas No. 743, Langsa 80564, DKI', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(282, 65, 'Anggabaya Adriansyah', 'Agustina', 'L', 'Buddha', 'Dk. Samanhudi No. 919, Kediri 80451, SumSel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(283, 67, 'Kasiran Saragih', 'Farida', 'P', 'Hindu', 'Dk. Sukajadi No. 488, Bitung 75181, PapBar', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(284, 22, 'Gamblang Tamba', 'Namaga', 'P', 'Hindu', 'Ki. Baladewa No. 612, Palopo 99902, Gorontalo', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(285, 94, 'Zaenab Oktaviani', 'Mahendra', 'P', 'Hindu', 'Jln. Baranang Siang Indah No. 208, Pontianak 56566, BaBel', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(286, 18, 'Latika Susanti', 'Mansur', 'L', 'Islam', 'Psr. Baladewa No. 453, Banjarbaru 97219, Gorontalo', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(287, 74, 'Yance Usamah', 'Suwarno', 'L', 'Islam', 'Ki. Suryo Pranoto No. 473, Madiun 24184, KalBar', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(288, 97, 'Catur Olga Mustofa', 'Saputra', 'L', 'Islam', 'Kpg. Bakin No. 978, Sibolga 92479, Maluku', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(289, 48, 'Gaiman Harsana Pradana', 'Rajata', 'L', 'Islam', 'Jr. Abdul No. 290, Tidore Kepulauan 99568, DKI', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(290, 94, 'Diah Rahimah', 'Haryanto', 'P', 'Islam', 'Jr. Qrisdoren No. 21, Samarinda 43206, SulUt', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(291, 13, 'Hasna Rahimah', 'Suwarno', 'L', 'Islam', 'Kpg. Abdullah No. 876, Sorong 96240, NTT', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(292, 26, 'Aisyah Calista Lailasari S.I.Kom', 'Sitompul', 'P', 'Buddha', 'Dk. Dipatiukur No. 298, Sibolga 19433, SumBar', NULL, '2020-08-16 22:12:53', '2020-08-16 22:12:53'),
(293, 57, 'Joko Ikhsan Dongoran S.IP', 'Hutagalung', 'P', 'Hindu', 'Ki. Reksoninten No. 629, Tanjungbalai 94224, MalUt', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(294, 12, 'Nardi Setiawan S.E.', 'Prayoga', 'P', 'Hindu', 'Jln. Teuku Umar No. 54, Bontang 71960, KepR', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(295, 40, 'Yuliana Nadia Handayani', 'Suwarno', 'L', 'Kristen', 'Dk. Ters. Jakarta No. 796, Semarang 89226, SumSel', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(296, 17, 'Karna Iswahyudi', 'Narpati', 'L', 'Islam', 'Ds. Salak No. 336, Solok 25504, SulTeng', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(297, 87, 'Wawan Panji Wasita', 'Safitri', 'L', 'Buddha', 'Kpg. Bambon No. 714, Payakumbuh 41128, Lampung', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(298, 99, 'Artawan Tamba', 'Wibowo', 'P', 'Hindu', 'Kpg. Bahagia No. 94, Pontianak 66010, NTB', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(299, 46, 'Tiara Widiastuti', 'Halim', 'P', 'Hindu', 'Kpg. R.E. Martadinata No. 322, Banda Aceh 56127, SulSel', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(300, 63, 'Balijan Tamba', 'Permata', 'P', 'Hindu', 'Ds. Babah No. 53, Sukabumi 78695, DKI', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(301, 62, 'Malika Rahayu', 'Nasyiah', 'P', 'Islam', 'Psr. Gatot Subroto No. 573, Medan 85571, Bengkulu', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(302, 96, 'Cahyo Bancar Firgantoro S.Farm', 'Prabowo', 'L', 'Kristen', 'Jln. Bakit  No. 32, Bekasi 62010, KepR', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(303, 14, 'Kani Mulyani S.Kom', 'Kusmawati', 'P', 'Buddha', 'Ki. Baan No. 343, Ambon 95784, SulTra', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(304, 56, 'Karya Januar S.E.', 'Utami', 'P', 'Kristen', 'Ds. Bakin No. 145, Sibolga 52440, Banten', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(305, 74, 'Harjo Damanik', 'Safitri', 'P', 'Islam', 'Psr. Baung No. 791, Banda Aceh 46750, SulTeng', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(306, 68, 'Arsipatra Pradana', 'Usada', 'L', 'Kristen', 'Jln. Kebangkitan Nasional No. 65, Gorontalo 88578, SulTeng', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(307, 22, 'Yani Wastuti', 'Pradipta', 'L', 'Buddha', 'Psr. Bagis Utama No. 241, Denpasar 83553, Lampung', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(308, 61, 'Kalim Salahudin M.Ak', 'Latupono', 'P', 'Hindu', 'Ds. Pasir Koja No. 890, Solok 30030, DIY', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(309, 87, 'Endah Mardhiyah', 'Rahimah', 'P', 'Buddha', 'Dk. Wora Wari No. 706, Tasikmalaya 19188, Aceh', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(310, 76, 'Taufik Mangunsong S.H.', 'Mansur', 'P', 'Hindu', 'Jln. Kebangkitan Nasional No. 696, Dumai 44709, KepR', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(311, 65, 'Hamima Maryati', 'Wastuti', 'L', 'Kristen', 'Kpg. Dipatiukur No. 307, Palangka Raya 80922, SulBar', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(312, 19, 'Niyaga Gandewa Ramadan M.TI.', 'Wijayanti', 'L', 'Islam', 'Jln. Yohanes No. 690, Banda Aceh 47408, DIY', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(313, 11, 'Ellis Rahmawati', 'Yulianti', 'P', 'Kristen', 'Gg. Sumpah Pemuda No. 655, Cirebon 16101, KalSel', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(314, 13, 'Prakosa Caket Mandala S.Kom', 'Pertiwi', 'L', 'Kristen', 'Ki. Bakaru No. 203, Blitar 52958, NTT', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(315, 84, 'Umi Elvina Suryatmi S.Gz', 'Rajasa', 'P', 'Kristen', 'Kpg. Yosodipuro No. 261, Ambon 31012, JaTim', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(316, 10, 'Cemplunk Prabowo', 'Zulkarnain', 'P', 'Hindu', 'Gg. Gambang No. 537, Bandar Lampung 56254, SulSel', NULL, '2020-08-16 22:12:54', '2020-08-16 22:12:54'),
(317, 32, 'Syahrini Nasyidah S.E.I', 'Wibisono', 'L', 'Hindu', 'Jr. Teuku Umar No. 977, Subulussalam 85829, NTT', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(318, 60, 'Nasab Radika Simbolon', 'Waluyo', 'L', 'Hindu', 'Ds. Qrisdoren No. 97, Cimahi 82620, NTT', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(319, 48, 'Eko Gunarto', 'Nainggolan', 'L', 'Islam', 'Gg. Asia Afrika No. 45, Lhokseumawe 24415, Bali', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(320, 10, 'Ida Mandasari', 'Purnawati', 'L', 'Islam', 'Ki. Nakula No. 655, Serang 58771, Bengkulu', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(321, 25, 'Ikhsan Firgantoro', 'Permata', 'L', 'Buddha', 'Jln. Samanhudi No. 862, Payakumbuh 54463, DIY', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(322, 65, 'Betania Lestari S.Gz', 'Wasita', 'L', 'Buddha', 'Jr. Casablanca No. 217, Depok 51666, MalUt', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(323, 26, 'Kajen Gandewa Firgantoro', 'Nashiruddin', 'P', 'Kristen', 'Gg. Tentara Pelajar No. 274, Kendari 55875, Bali', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(324, 96, 'Gamani Bala Kurniawan', 'Nuraini', 'P', 'Buddha', 'Ds. Basuki No. 707, Binjai 77493, KepR', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(325, 28, 'Darijan Putra', 'Kurniawan', 'L', 'Hindu', 'Ds. Urip Sumoharjo No. 301, Ambon 12179, Bengkulu', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(326, 70, 'Farhunnisa Kani Anggraini', 'Budiman', 'P', 'Islam', 'Dk. Sutoyo No. 417, Banda Aceh 52693, KalBar', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(327, 87, 'Belinda Laksmiwati', 'Yuniar', 'P', 'Kristen', 'Jr. Elang No. 525, Tasikmalaya 63183, KepR', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(328, 44, 'Dimaz Marpaung', 'Hariyah', 'L', 'Islam', 'Kpg. Sentot Alibasa No. 38, Langsa 35944, JaTeng', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(329, 14, 'Pardi Wasita', 'Prasetyo', 'L', 'Kristen', 'Dk. Suprapto No. 554, Ambon 51247, Papua', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(330, 49, 'Mursinin Darijan Pratama', 'Marpaung', 'P', 'Buddha', 'Jr. K.H. Wahid Hasyim (Kopo) No. 187, Batu 51891, Banten', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(331, 24, 'Narji Hutagalung', 'Mahendra', 'P', 'Kristen', 'Jr. Soekarno Hatta No. 548, Padangsidempuan 71159, NTT', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(332, 47, 'Radit Hasim Putra S.E.', 'Kurniawan', 'L', 'Islam', 'Jln. Suprapto No. 971, Tasikmalaya 34693, MalUt', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(333, 86, 'Enteng Budiman', 'Thamrin', 'L', 'Islam', 'Jr. Bayam No. 621, Tual 76763, SumBar', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(334, 14, 'Paiman Sitorus', 'Rajata', 'L', 'Buddha', 'Dk. Gatot Subroto No. 479, Tomohon 13163, KalUt', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(335, 27, 'Irwan Natsir S.Kom', 'Halim', 'L', 'Islam', 'Dk. Yos No. 798, Ambon 83547, KalBar', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(336, 51, 'Winda Maria Wahyuni S.Sos', 'Permata', 'P', 'Kristen', 'Gg. Baja Raya No. 110, Sibolga 33113, KalTeng', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(337, 18, 'Jessica Restu Rahayu M.Kom.', 'Hariyah', 'L', 'Islam', 'Jr. Mahakam No. 953, Banjar 14808, SulSel', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(338, 54, 'Dirja Sihotang', 'Usada', 'L', 'Hindu', 'Ki. Kyai Gede No. 617, Madiun 60029, Riau', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(339, 43, 'Satya Asirwada Hidayanto', 'Mardhiyah', 'P', 'Hindu', 'Jr. Basoka Raya No. 87, Bandung 16569, SulTeng', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(340, 67, 'Zamira Purwanti', 'Kurniawan', 'L', 'Buddha', 'Dk. Bank Dagang Negara No. 567, Blitar 38202, BaBel', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(341, 29, 'Novi Ajeng Uyainah S.Pd', 'Usamah', 'P', 'Hindu', 'Psr. Baan No. 293, Bandung 34389, Gorontalo', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(342, 94, 'Cakrabuana Jailani', 'Najmudin', 'P', 'Islam', 'Kpg. Hasanuddin No. 956, Pematangsiantar 58910, NTT', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(343, 40, 'Nadine Nurul Zulaika M.Farm', 'Firmansyah', 'L', 'Hindu', 'Ki. Barasak No. 536, Kediri 48557, BaBel', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55');
INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `gambar`, `created_at`, `updated_at`) VALUES
(344, 51, 'Kacung Kusumo', 'Utami', 'P', 'Buddha', 'Gg. Kalimalang No. 335, Pontianak 41712, DKI', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(345, 42, 'Cindy Palastri', 'Rajata', 'L', 'Hindu', 'Kpg. Nanas No. 795, Banjar 35507, SumBar', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(346, 72, 'Yuliana Lestari', 'Sihombing', 'L', 'Islam', 'Gg. Rajiman No. 255, Ternate 66312, Maluku', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(347, 64, 'Jaiman Salahudin', 'Halimah', 'P', 'Islam', 'Kpg. Peta No. 633, Denpasar 93796, Lampung', NULL, '2020-08-16 22:12:55', '2020-08-16 22:12:55'),
(348, 21, 'Panca Hakim', 'Sihombing', 'P', 'Hindu', 'Dk. Suharso No. 279, Singkawang 38208, KalSel', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(349, 42, 'Marsito Prasasta', 'Uwais', 'P', 'Buddha', 'Ki. Padang No. 519, Yogyakarta 68952, Bali', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(350, 29, 'Amelia Yuniar', 'Wahyuni', 'P', 'Islam', 'Psr. Wahid Hasyim No. 150, Tangerang Selatan 95213, KalTim', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(351, 79, 'Bella Kuswandari', 'Adriansyah', 'P', 'Islam', 'Jr. Kiaracondong No. 785, Banda Aceh 59702, Bali', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(352, 10, 'Mala Yulianti', 'Anggraini', 'L', 'Buddha', 'Psr. Yogyakarta No. 744, Tomohon 16247, Jambi', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(353, 59, 'Kala Hendra Ardianto M.Ak', 'Sihombing', 'P', 'Islam', 'Dk. Babakan No. 36, Tasikmalaya 40111, Lampung', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(354, 25, 'Raina Mandasari', 'Prasetya', 'L', 'Islam', 'Ds. Ters. Kiaracondong No. 784, Pontianak 45691, SumBar', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(355, 56, 'Siti Usamah', 'Andriani', 'L', 'Islam', 'Kpg. Tentara Pelajar No. 162, Kendari 99332, NTT', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(356, 84, 'Bakiadi Marsudi Januar', 'Thamrin', 'P', 'Kristen', 'Kpg. Jambu No. 809, Palembang 24385, Banten', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(357, 34, 'Puji Amelia Lestari', 'Sitorus', 'L', 'Kristen', 'Kpg. Yap Tjwan Bing No. 359, Probolinggo 82698, BaBel', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(358, 53, 'Najwa Novitasari S.E.I', 'Farida', 'L', 'Buddha', 'Psr. Gajah No. 702, Banjar 69862, KalTeng', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(359, 81, 'Balamantri Sinaga S.E.I', 'Wastuti', 'P', 'Islam', 'Gg. Jaksa No. 785, Kotamobagu 29558, Aceh', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(360, 30, 'Jumadi Setiawan', 'Manullang', 'P', 'Buddha', 'Ds. Raya Setiabudhi No. 49, Pontianak 17254, NTB', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(361, 15, 'Mila Citra Astuti', 'Padmasari', 'L', 'Islam', 'Ki. Thamrin No. 253, Kediri 72640, Papua', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(362, 13, 'Qori Yuliarti S.Pt', 'Wulandari', 'L', 'Buddha', 'Kpg. Padma No. 556, Administrasi Jakarta Selatan 50032, SumUt', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(363, 16, 'Karya Bambang Rajasa', 'Hariyah', 'P', 'Buddha', 'Kpg. Tangkuban Perahu No. 780, Probolinggo 51904, SulUt', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(364, 85, 'Salman Kardi Waluyo M.Pd', 'Nurdiyanti', 'L', 'Buddha', 'Kpg. Tangkuban Perahu No. 878, Kendari 42341, NTT', NULL, '2020-08-16 22:12:56', '2020-08-16 22:12:56'),
(365, 58, 'Cagak Natsir', 'Utami', 'L', 'Kristen', 'Psr. Hasanuddin No. 707, Kendari 10404, SulBar', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(366, 11, 'Heru Utama', 'Safitri', 'L', 'Kristen', 'Jln. Yos Sudarso No. 572, Tangerang Selatan 19022, SulUt', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(367, 93, 'Azalea Pratiwi', 'Ramadan', 'L', 'Kristen', 'Dk. Adisumarmo No. 684, Sorong 31621, SumSel', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(368, 79, 'Puti Prastuti', 'Hartati', 'L', 'Hindu', 'Jr. Suprapto No. 768, Serang 77904, Aceh', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(369, 50, 'Bakiono Utama', 'Riyanti', 'P', 'Islam', 'Gg. Sumpah Pemuda No. 893, Tanjungbalai 33827, BaBel', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(370, 63, 'Fitria Mutia Zulaika', 'Suryatmi', 'P', 'Kristen', 'Jr. Abdul Muis No. 506, Balikpapan 32816, Maluku', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(371, 55, 'Anastasia Raina Pertiwi S.Psi', 'Wijayanti', 'P', 'Hindu', 'Ds. HOS. Cjokroaminoto (Pasirkaliki) No. 530, Gorontalo 70856, Maluku', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(372, 10, 'Utama Tarihoran', 'Adriansyah', 'P', 'Islam', 'Gg. K.H. Maskur No. 421, Padang 55057, DKI', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(373, 73, 'Adinata Sihombing S.T.', 'Budiyanto', 'P', 'Hindu', 'Ki. Bakau No. 122, Tarakan 72876, PapBar', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(374, 15, 'Puji Palastri M.Farm', 'Mulyani', 'L', 'Kristen', 'Jln. Sampangan No. 758, Dumai 73441, Bengkulu', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(375, 11, 'Ami Purnawati', 'Farida', 'L', 'Buddha', 'Ds. Bahagia  No. 823, Cilegon 99736, SulSel', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(376, 16, 'Warsa Nugroho', 'Hasanah', 'P', 'Islam', 'Ki. Krakatau No. 33, Padangpanjang 82981, MalUt', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(377, 96, 'Ana Anggraini', 'Wahyuni', 'P', 'Buddha', 'Jln. K.H. Maskur No. 835, Bau-Bau 87428, Bali', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(378, 73, 'Puspa Purwanti', 'Hariyah', 'P', 'Buddha', 'Ki. Yohanes No. 406, Metro 79879, Banten', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(379, 32, 'Ikhsan Maryadi', 'Haryanti', 'L', 'Hindu', 'Dk. Laswi No. 730, Bandung 20276, SulBar', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(380, 41, 'Samsul Dongoran', 'Hasanah', 'L', 'Hindu', 'Dk. Nanas No. 819, Makassar 28989, KalBar', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(381, 45, 'Lukita Narpati', 'Nurdiyanti', 'P', 'Kristen', 'Ds. Suniaraja No. 951, Malang 66706, SumSel', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(382, 58, 'Asmuni Ilyas Firmansyah M.Farm', 'Dongoran', 'P', 'Kristen', 'Dk. Villa No. 660, Gunungsitoli 76927, PapBar', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(383, 78, 'Rina Wulan Novitasari S.Gz', 'Anggraini', 'L', 'Kristen', 'Psr. Dr. Junjunan No. 627, Palembang 53427, Bengkulu', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(384, 65, 'Lidya Namaga', 'Mustofa', 'L', 'Islam', 'Gg. Kalimalang No. 625, Tarakan 90758, KalUt', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(385, 56, 'Indah Agustina', 'Andriani', 'P', 'Kristen', 'Kpg. Pasteur No. 116, Blitar 54503, Lampung', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(386, 31, 'Martaka Daruna Putra', 'Andriani', 'P', 'Islam', 'Gg. Pasirkoja No. 684, Kotamobagu 40198, NTB', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(387, 91, 'Titi Haryanti S.E.', 'Laksmiwati', 'P', 'Hindu', 'Dk. Jagakarsa No. 280, Blitar 50156, BaBel', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(388, 42, 'Raihan Sirait S.Sos', 'Zulkarnain', 'L', 'Hindu', 'Ki. Villa No. 370, Magelang 13823, KalSel', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(389, 58, 'Ilyas Prasetyo', 'Prakasa', 'L', 'Hindu', 'Dk. Bacang No. 518, Batam 19897, SulTra', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(390, 53, 'Sabrina Nuraini', 'Sitorus', 'L', 'Hindu', 'Dk. Abdullah No. 608, Pekanbaru 70643, SulTeng', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(391, 99, 'Kacung Nainggolan', 'Maryati', 'L', 'Islam', 'Psr. Flora No. 493, Samarinda 20235, SulSel', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(392, 57, 'Ayu Mandasari M.Pd', 'Rahayu', 'L', 'Hindu', 'Ki. Fajar No. 955, Pariaman 16049, SumUt', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(393, 54, 'Saka Karna Permadi', 'Usamah', 'P', 'Hindu', 'Psr. Nangka No. 815, Surabaya 60492, SulTeng', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(394, 71, 'Mustofa Mahendra', 'Zulaika', 'L', 'Buddha', 'Ds. Nangka No. 121, Pontianak 55984, Gorontalo', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(395, 75, 'Restu Gina Kuswandari', 'Hassanah', 'L', 'Islam', 'Gg. Tambun No. 500, Sorong 84735, SumUt', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(396, 89, 'Viman Maryadi', 'Pudjiastuti', 'P', 'Hindu', 'Jr. Ekonomi No. 440, Salatiga 49673, Lampung', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(397, 62, 'Wage Rahmat Kuswoyo S.Psi', 'Habibi', 'L', 'Buddha', 'Jr. Sukajadi No. 607, Pasuruan 59675, DIY', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(398, 97, 'Ulya Usyi Purwanti', 'Utami', 'L', 'Kristen', 'Psr. Salak No. 741, Payakumbuh 95503, SumBar', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(399, 85, 'Maida Restu Anggraini S.E.I', 'Gunawan', 'L', 'Kristen', 'Ki. Bak Air No. 551, Mojokerto 15643, Banten', NULL, '2020-08-16 22:12:57', '2020-08-16 22:12:57'),
(400, 58, 'Bakda Sirait S.E.I', 'Kuswandari', 'L', 'Hindu', 'Jln. Moch. Ramdan No. 762, Medan 11199, SumUt', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(401, 71, 'Mila Rini Rahmawati', 'Kurniawan', 'P', 'Hindu', 'Kpg. Abdul. Muis No. 469, Ambon 52616, NTB', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(402, 14, 'Farah Suartini', 'Waskita', 'P', 'Buddha', 'Kpg. Adisucipto No. 370, Bandung 36348, SumBar', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(403, 27, 'Carla Haryanti', 'Susanti', 'L', 'Islam', 'Ds. Rajawali Barat No. 338, Tegal 94955, KalBar', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(404, 66, 'Citra Pertiwi', 'Aryani', 'L', 'Hindu', 'Ds. Babadan No. 288, Pagar Alam 29736, SulTeng', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(405, 42, 'Ade Rahayu S.Kom', 'Usada', 'L', 'Islam', 'Gg. Soekarno Hatta No. 354, Samarinda 66077, KalTim', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(406, 36, 'Karja Sitorus', 'Pangestu', 'L', 'Hindu', 'Jr. Cokroaminoto No. 501, Banjar 47599, KalUt', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(407, 13, 'Iriana Hartati S.Farm', 'Mandala', 'P', 'Hindu', 'Jr. Gatot Subroto No. 782, Administrasi Jakarta Pusat 76707, Papua', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(408, 73, 'Mahfud Wahyudin S.Psi', 'Siregar', 'L', 'Hindu', 'Ds. Jagakarsa No. 263, Batu 39248, NTB', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(409, 62, 'Padmi Pudjiastuti', 'Yulianti', 'L', 'Buddha', 'Jr. Madrasah No. 693, Sukabumi 11695, Papua', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(410, 78, 'Irnanto Waskita S.Pt', 'Mulyani', 'P', 'Kristen', 'Ki. Bayam No. 415, Pekalongan 22976, Bengkulu', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(411, 60, 'Edi Saptono S.Farm', 'Mandasari', 'P', 'Hindu', 'Jln. Otista No. 40, Ternate 30051, SumBar', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(412, 61, 'Puti Intan Winarsih S.H.', 'Prakasa', 'L', 'Hindu', 'Ki. Cihampelas No. 692, Administrasi Jakarta Timur 58229, DIY', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(413, 36, 'Cindy Laksita', 'Marbun', 'P', 'Hindu', 'Dk. Katamso No. 330, Subulussalam 10236, KalTeng', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(414, 24, 'Galang Wawan Budiman M.M.', 'Mangunsong', 'P', 'Kristen', 'Gg. Ciumbuleuit No. 519, Tual 85637, Bengkulu', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(415, 56, 'Julia Dewi Namaga S.Ked', 'Firgantoro', 'P', 'Hindu', 'Jr. Suryo Pranoto No. 436, Parepare 36937, KalBar', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(416, 54, 'Ana Ratna Anggraini', 'Haryanti', 'L', 'Islam', 'Gg. Bak Mandi No. 78, Pekalongan 16983, DIY', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(417, 87, 'Cici Nuraini M.Kom.', 'Budiman', 'P', 'Kristen', 'Dk. Raden Saleh No. 129, Tasikmalaya 18309, DKI', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(418, 90, 'Ghani Viman Narpati', 'Padmasari', 'P', 'Buddha', 'Gg. Bara Tambar No. 305, Mataram 21819, SulBar', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(419, 62, 'Harja Mandala', 'Melani', 'L', 'Hindu', 'Jr. Rumah Sakit No. 387, Tual 59903, KalTim', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(420, 21, 'Jinawi Thamrin', 'Hardiansyah', 'L', 'Islam', 'Gg. Setia Budi No. 334, Padang 83064, Lampung', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(421, 10, 'Padmi Hartati', 'Permata', 'L', 'Kristen', 'Jln. Kartini No. 933, Pariaman 53313, KalTeng', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(422, 31, 'Emong Balapati Sitorus', 'Usamah', 'P', 'Islam', 'Ki. Taman No. 989, Banjar 48558, KalSel', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(423, 55, 'Arsipatra Tampubolon', 'Kuswoyo', 'L', 'Kristen', 'Dk. Teuku Umar No. 349, Bontang 47025, SulTra', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(424, 33, 'Kunthara Mustofa', 'Lailasari', 'L', 'Hindu', 'Jln. Fajar No. 366, Pontianak 51279, SumSel', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(425, 23, 'Ophelia Ciaobella Mandasari S.Pd', 'Sihotang', 'L', 'Islam', 'Dk. Basmol Raya No. 992, Sibolga 37203, KalUt', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(426, 78, 'Ganep Mansur M.Farm', 'Fujiati', 'L', 'Buddha', 'Ki. Monginsidi No. 552, Lhokseumawe 27535, NTB', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(427, 36, 'Karna Jailani', 'Situmorang', 'L', 'Buddha', 'Ki. Imam Bonjol No. 148, Sabang 10638, JaBar', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(428, 99, 'Jane Riyanti', 'Usada', 'P', 'Buddha', 'Jln. Ters. Pasir Koja No. 533, Sungai Penuh 29775, PapBar', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(429, 98, 'Cahyadi Gara Prasetyo', 'Pranowo', 'L', 'Buddha', 'Jr. Jagakarsa No. 146, Padang 86251, SulUt', NULL, '2020-08-16 22:12:58', '2020-08-16 22:12:58'),
(430, 76, 'Cecep Adhiarja Adriansyah', 'Mandasari', 'P', 'Islam', 'Jr. Sadang Serang No. 176, Banda Aceh 74057, KalTeng', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(431, 91, 'Tantri Shania Yolanda', 'Yuliarti', 'P', 'Kristen', 'Jln. Suharso No. 11, Tegal 59505, SulUt', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(432, 30, 'Eka Nasyiah S.Ked', 'Wijayanti', 'P', 'Kristen', 'Jr. Raden No. 549, Bima 56793, Riau', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(433, 25, 'Taufan Mansur S.E.', 'Prakasa', 'P', 'Hindu', 'Ds. Jend. A. Yani No. 676, Sabang 43915, KalSel', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(434, 64, 'Gabriella Zaenab Nuraini M.M.', 'Wahyuni', 'P', 'Hindu', 'Ki. Setia Budi No. 119, Payakumbuh 50004, KalTeng', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(435, 45, 'Winda Rahimah', 'Marpaung', 'P', 'Islam', 'Jr. Barasak No. 650, Pekanbaru 10177, BaBel', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(436, 29, 'Cakrawangsa Saragih', 'Sihombing', 'P', 'Hindu', 'Ds. Sampangan No. 688, Sawahlunto 87850, SulBar', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(437, 62, 'Darimin Salahudin M.Ak', 'Rahayu', 'L', 'Islam', 'Dk. Bakit  No. 614, Denpasar 84588, Bali', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(438, 63, 'Rusman Adriansyah', 'Nuraini', 'L', 'Islam', 'Dk. Salatiga No. 79, Palangka Raya 32674, JaBar', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(439, 41, 'Zulfa Nuraini', 'Hartati', 'P', 'Islam', 'Dk. Halim No. 618, Tarakan 83269, BaBel', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(440, 41, 'Vivi Sari Nasyiah', 'Sudiati', 'P', 'Hindu', 'Ki. Banal No. 276, Pekanbaru 22525, Gorontalo', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(441, 14, 'Eli Yuniar', 'Melani', 'L', 'Hindu', 'Jln. Bahagia No. 420, Semarang 67088, SulSel', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(442, 88, 'Heru Cahya Irawan', 'Nugroho', 'L', 'Kristen', 'Jln. Adisumarmo No. 941, Tegal 68160, KalBar', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(443, 12, 'Adinata Wahyudin', 'Laksmiwati', 'P', 'Islam', 'Jr. Kalimalang No. 399, Cimahi 69684, KalSel', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(444, 16, 'Danuja Darmanto Hutasoit', 'Pertiwi', 'L', 'Kristen', 'Jr. Baiduri No. 192, Subulussalam 29286, Jambi', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(445, 23, 'Ciaobella Hesti Hassanah', 'Saefullah', 'L', 'Kristen', 'Psr. Wora Wari No. 1, Sukabumi 67748, DIY', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(446, 43, 'Patricia Yuliarti', 'Riyanti', 'P', 'Kristen', 'Dk. Nakula No. 747, Bitung 16293, BaBel', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(447, 36, 'Endah Maryati S.Gz', 'Usamah', 'L', 'Buddha', 'Gg. Nanas No. 619, Blitar 67645, Jambi', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(448, 23, 'Banawa Thamrin', 'Nababan', 'P', 'Hindu', 'Dk. Bawal No. 590, Bekasi 40537, KalSel', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(449, 73, 'Usyi Lailasari', 'Samosir', 'P', 'Hindu', 'Ki. Abdul No. 247, Batam 27552, JaTim', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(450, 89, 'Maman Hardiansyah', 'Suwarno', 'L', 'Kristen', 'Ki. Astana Anyar No. 944, Tegal 57017, Papua', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(451, 64, 'Gandewa Wijaya', 'Simbolon', 'P', 'Kristen', 'Ds. Bacang No. 847, Sungai Penuh 89576, KalUt', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(452, 38, 'Opung Sirait S.E.', 'Gunawan', 'P', 'Islam', 'Psr. Sukabumi No. 234, Gunungsitoli 99612, BaBel', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(453, 70, 'Irma Andriani', 'Winarno', 'L', 'Kristen', 'Gg. Peta No. 100, Cilegon 95629, KepR', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(454, 17, 'Ismail Nugroho M.Pd', 'Hasanah', 'P', 'Hindu', 'Gg. Pasirkoja No. 187, Padangsidempuan 42382, Gorontalo', NULL, '2020-08-16 22:12:59', '2020-08-16 22:12:59'),
(455, 81, 'Sabar Garang Ramadan', 'Haryanti', 'P', 'Buddha', 'Jln. Juanda No. 835, Mojokerto 10916, KepR', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(456, 68, 'Kasim Dadi Simbolon S.IP', 'Utama', 'P', 'Islam', 'Ki. Baladewa No. 258, Salatiga 21980, SulSel', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(457, 88, 'Eka Pangestu', 'Prakasa', 'L', 'Islam', 'Gg. Laksamana No. 111, Administrasi Jakarta Selatan 50187, SumUt', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(458, 83, 'Icha Hassanah', 'Rahmawati', 'P', 'Buddha', 'Gg. Monginsidi No. 990, Langsa 37792, Maluku', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(459, 35, 'Gilang Saptono', 'Rahimah', 'P', 'Hindu', 'Jr. Supomo No. 248, Gunungsitoli 94896, PapBar', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(460, 86, 'Jail Gunarto S.I.Kom', 'Pertiwi', 'P', 'Islam', 'Jr. Supono No. 193, Bitung 75083, JaTim', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(461, 74, 'Kamila Hasanah', 'Ramadan', 'P', 'Buddha', 'Ki. Sukajadi No. 587, Prabumulih 99752, JaBar', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(462, 28, 'Tira Betania Pratiwi', 'Usamah', 'P', 'Hindu', 'Ds. Moch. Toha No. 729, Bandar Lampung 20473, DKI', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(463, 78, 'Pangestu Reza Saputra', 'Januar', 'L', 'Islam', 'Ki. Setia Budi No. 31, Banda Aceh 95198, Maluku', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(464, 59, 'Hardana Saptono', 'Wibisono', 'P', 'Kristen', 'Jln. M.T. Haryono No. 781, Bandung 16583, Gorontalo', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(465, 73, 'Nadine Latika Haryanti', 'Aryani', 'L', 'Islam', 'Jln. Basoka Raya No. 792, Sungai Penuh 25275, Jambi', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(466, 18, 'Hana Mardhiyah', 'Ramadan', 'L', 'Islam', 'Psr. K.H. Maskur No. 400, Surabaya 12638, Banten', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(467, 25, 'Garang Nasab Wacana', 'Rajata', 'P', 'Hindu', 'Ki. Sutarto No. 452, Kupang 76045, SulUt', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(468, 45, 'Winda Oktaviani', 'Melani', 'P', 'Buddha', 'Jln. Babakan No. 865, Balikpapan 50057, MalUt', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(469, 67, 'Tami Citra Rahimah', 'Pertiwi', 'P', 'Hindu', 'Jr. Tubagus Ismail No. 244, Pariaman 58186, JaBar', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(470, 76, 'Darman Saputra S.Sos', 'Prabowo', 'P', 'Kristen', 'Kpg. Dr. Junjunan No. 52, Bukittinggi 52567, JaTeng', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(471, 51, 'Fitria Zulaika', 'Hasanah', 'L', 'Kristen', 'Kpg. Rumah Sakit No. 541, Singkawang 25505, Gorontalo', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(472, 79, 'Dwi Utama S.Gz', 'Namaga', 'P', 'Islam', 'Kpg. Casablanca No. 883, Sabang 88716, Maluku', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(473, 73, 'Unggul Manullang', 'Rahimah', 'P', 'Buddha', 'Ds. Bahagia No. 720, Banda Aceh 81388, Bali', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(474, 55, 'Vanesa Nasyiah', 'Novitasari', 'P', 'Hindu', 'Jr. Bank Dagang Negara No. 42, Blitar 15619, KalSel', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(475, 71, 'Radika Wacana', 'Sitorus', 'L', 'Hindu', 'Jln. Ikan No. 789, Sungai Penuh 28305, JaTim', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(476, 34, 'Raharja Legawa Pranowo S.H.', 'Wastuti', 'L', 'Kristen', 'Ds. R.E. Martadinata No. 119, Lubuklinggau 51327, NTB', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(477, 60, 'Nasim Suryono S.I.Kom', 'Agustina', 'L', 'Hindu', 'Psr. Acordion No. 784, Administrasi Jakarta Barat 65749, Bengkulu', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(478, 42, 'Ibun Marbun', 'Sirait', 'P', 'Kristen', 'Dk. Tambak No. 465, Bima 44409, SumUt', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(479, 92, 'Pangeran Gantar Narpati S.Sos', 'Wulandari', 'L', 'Buddha', 'Psr. Jend. Sudirman No. 600, Mojokerto 62335, Lampung', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(480, 32, 'Halima Usada', 'Riyanti', 'P', 'Buddha', 'Jln. Jend. Sudirman No. 738, Balikpapan 24619, Jambi', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(481, 77, 'Hafshah Kasiyah Winarsih', 'Maryati', 'L', 'Kristen', 'Psr. Cikutra Timur No. 813, Probolinggo 72195, KalUt', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(482, 38, 'Respati Kasiran Waluyo', 'Marbun', 'L', 'Islam', 'Dk. Adisumarmo No. 240, Bontang 23437, Lampung', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(483, 86, 'Nadine Hastuti', 'Mulyani', 'P', 'Islam', 'Jr. Gading No. 590, Probolinggo 45500, KalUt', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(484, 86, 'Titin Namaga', 'Utama', 'L', 'Hindu', 'Jln. Baik No. 414, Pematangsiantar 70757, DKI', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(485, 87, 'Cawisadi Hutagalung S.Ked', 'Tampubolon', 'P', 'Hindu', 'Kpg. Jagakarsa No. 225, Padangsidempuan 39634, SulUt', NULL, '2020-08-16 22:13:00', '2020-08-16 22:13:00'),
(486, 47, 'Fathonah Nasyidah S.T.', 'Rahmawati', 'P', 'Kristen', 'Dk. Bakti No. 619, Sabang 94741, DIY', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(487, 31, 'Jaiman Januar', 'Nainggolan', 'L', 'Buddha', 'Jln. Babadan No. 529, Kediri 41021, SumUt', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(488, 17, 'Opung Pradipta', 'Saputra', 'L', 'Buddha', 'Jr. Otista No. 506, Tanjungbalai 91667, PapBar', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(489, 31, 'Ikin Prayoga', 'Farida', 'L', 'Buddha', 'Jr. Flora No. 747, Denpasar 26074, JaBar', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(490, 95, 'Karma Rendy Ramadan M.Farm', 'Dabukke', 'P', 'Kristen', 'Gg. Ir. H. Juanda No. 304, Sorong 48092, Lampung', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(491, 73, 'Cemplunk Mustika Waluyo S.Psi', 'Uyainah', 'P', 'Buddha', 'Gg. Baja No. 629, Balikpapan 11711, SulSel', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(492, 61, 'Utama Maryadi M.Farm', 'Melani', 'L', 'Buddha', 'Kpg. Laksamana No. 250, Tanjungbalai 74822, SulBar', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(493, 52, 'Danu Siregar', 'Hakim', 'L', 'Buddha', 'Psr. Cemara No. 737, Malang 87782, KalTim', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(494, 25, 'Ella Yuliarti M.Kom.', 'Suartini', 'P', 'Buddha', 'Ki. Basudewo No. 801, Sawahlunto 41918, Bali', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(495, 35, 'Endra Permadi S.Sos', 'Winarsih', 'P', 'Kristen', 'Jln. Sumpah Pemuda No. 110, Depok 30350, PapBar', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(496, 49, 'Nurul Hasanah', 'Budiyanto', 'L', 'Islam', 'Ki. Warga No. 850, Jambi 55902, SulBar', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(497, 66, 'Lurhur Taufik Irawan', 'Padmasari', 'P', 'Hindu', 'Psr. Bappenas No. 80, Administrasi Jakarta Pusat 70085, JaTeng', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(498, 16, 'Jayadi Siregar', 'Hakim', 'P', 'Islam', 'Kpg. Tambak No. 890, Ternate 93379, SulUt', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(499, 32, 'Wawan Prasasta', 'Mustofa', 'P', 'Buddha', 'Jr. Karel S. Tubun No. 729, Payakumbuh 97953, MalUt', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(500, 73, 'Zalindra Mardhiyah', 'Halim', 'L', 'Kristen', 'Dk. Abdul Muis No. 140, Mojokerto 25114, Gorontalo', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(501, 40, 'Nilam Novitasari', 'Puspasari', 'L', 'Islam', 'Ds. Pasteur No. 390, Tual 51161, JaTim', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(502, 45, 'Rahmat Wijaya S.Pt', 'Andriani', 'P', 'Kristen', 'Ds. Hasanuddin No. 921, Padang 19957, SumSel', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(503, 55, 'Mujur Natsir', 'Andriani', 'P', 'Buddha', 'Gg. Padma No. 575, Pontianak 22235, KalTim', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(504, 14, 'Puti Lidya Usada S.H.', 'Suryatmi', 'P', 'Buddha', 'Jr. BKR No. 925, Tanjung Pinang 49481, DKI', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(505, 24, 'Jaka Dadap Wibisono', 'Irawan', 'L', 'Hindu', 'Kpg. Setia Budi No. 954, Palopo 63664, Aceh', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(506, 90, 'Nurul Namaga M.Kom.', 'Nainggolan', 'P', 'Hindu', 'Dk. Banal No. 870, Ambon 57465, Riau', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(507, 31, 'Prasetya Wasita', 'Usamah', 'P', 'Hindu', 'Kpg. Veteran No. 874, Padangpanjang 13397, SumBar', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(508, 17, 'Keisha Farida', 'Rahimah', 'L', 'Buddha', 'Dk. Radio No. 638, Padangpanjang 40438, SulTeng', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(509, 95, 'Kayla Laksita', 'Anggraini', 'P', 'Hindu', 'Jln. Ketandan No. 726, Singkawang 80409, Aceh', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(510, 28, 'Siska Yolanda S.Kom', 'Wulandari', 'L', 'Buddha', 'Ki. Ekonomi No. 706, Tanjung Pinang 69511, NTB', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(511, 30, 'Kawaya Balamantri Simbolon', 'Saputra', 'P', 'Buddha', 'Jln. Eka No. 348, Padangpanjang 26259, Banten', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(512, 15, 'Anastasia Farida', 'Sinaga', 'P', 'Buddha', 'Kpg. Ki Hajar Dewantara No. 221, Magelang 32338, DIY', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(513, 75, 'Ganda Jaiman Tamba', 'Palastri', 'L', 'Islam', 'Ds. Yoga No. 249, Serang 55035, Jambi', NULL, '2020-08-16 22:13:01', '2020-08-16 22:13:01'),
(514, 79, 'Wirda Ayu Hastuti S.Sos', 'Marbun', 'L', 'Kristen', 'Ds. Diponegoro No. 544, Sawahlunto 27695, KalSel', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(515, 84, 'Imam Erik Waluyo M.Pd', 'Hakim', 'P', 'Hindu', 'Psr. Cemara No. 854, Palopo 23761, Bengkulu', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(516, 81, 'Pia Mulyani', 'Wahyudin', 'L', 'Buddha', 'Jln. Supomo No. 506, Samarinda 77316, SumBar', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(517, 63, 'Cornelia Wahyuni', 'Rajata', 'L', 'Islam', 'Kpg. Ahmad Dahlan No. 978, Sungai Penuh 73414, JaBar', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(518, 57, 'Bakianto Lazuardi', 'Narpati', 'L', 'Hindu', 'Jr. Rajiman No. 991, Tangerang 19532, Banten', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(519, 79, 'Bakidin Dodo Kurniawan', 'Pertiwi', 'P', 'Buddha', 'Gg. Ekonomi No. 79, Lhokseumawe 80716, Jambi', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(520, 65, 'Hesti Lidya Prastuti', 'Purwanti', 'L', 'Hindu', 'Gg. Katamso No. 161, Subulussalam 84799, KepR', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(521, 36, 'Intan Wijayanti M.Kom.', 'Winarsih', 'P', 'Buddha', 'Jln. Orang No. 173, Administrasi Jakarta Utara 34643, JaTeng', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(522, 83, 'Mumpuni Cakrabirawa Waluyo S.Sos', 'Sitorus', 'L', 'Kristen', 'Jr. Bahagia  No. 220, Dumai 36967, Riau', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(523, 11, 'Hasim Siregar', 'Kuswandari', 'P', 'Buddha', 'Ds. Kalimantan No. 225, Gunungsitoli 57284, KalTeng', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(524, 10, 'Sabrina Pudjiastuti M.M.', 'Wastuti', 'P', 'Hindu', 'Gg. Bacang No. 385, Solok 26323, Riau', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(525, 100, 'Faizah Handayani', 'Anggriawan', 'P', 'Hindu', 'Jln. Yosodipuro No. 142, Kendari 24437, SumUt', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(526, 83, 'Parman Elvin Hakim S.T.', 'Sihotang', 'P', 'Kristen', 'Dk. Salam No. 856, Kupang 14298, Maluku', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(527, 45, 'Zelaya Utami', 'Saputra', 'P', 'Islam', 'Dk. Gajah Mada No. 813, Batu 67854, SulTeng', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(528, 77, 'Wawan Hakim', 'Laksmiwati', 'L', 'Hindu', 'Gg. K.H. Maskur No. 404, Padangsidempuan 11337, MalUt', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(529, 10, 'Sarah Lailasari', 'Wacana', 'L', 'Buddha', 'Psr. Moch. Ramdan No. 543, Sabang 76205, KalBar', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(530, 28, 'Bala Suwarno', 'Yuniar', 'P', 'Kristen', 'Jr. Wahid No. 77, Pariaman 26733, SumBar', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(531, 88, 'Jaiman Hidayanto', 'Salahudin', 'L', 'Kristen', 'Dk. S. Parman No. 94, Bukittinggi 93450, KalTim', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(532, 33, 'Alika Diana Wulandari', 'Haryanto', 'P', 'Islam', 'Ki. Baik No. 804, Serang 34002, SumSel', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(533, 68, 'Janet Putri Mulyani S.Kom', 'Lazuardi', 'P', 'Buddha', 'Gg. Acordion No. 606, Administrasi Jakarta Timur 94832, NTB', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(534, 24, 'Leo Firgantoro', 'Sihombing', 'L', 'Islam', 'Ds. Astana Anyar No. 343, Salatiga 31974, Bengkulu', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(535, 75, 'Eja Hutapea', 'Gunawan', 'L', 'Hindu', 'Jr. Merdeka No. 642, Bau-Bau 69103, SulTra', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(536, 53, 'Unjani Ifa Pratiwi M.M.', 'Hariyah', 'L', 'Buddha', 'Gg. Dr. Junjunan No. 630, Blitar 10271, KalTim', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(537, 80, 'Ade Septi Lestari', 'Tarihoran', 'L', 'Islam', 'Kpg. Pahlawan No. 371, Prabumulih 59385, DKI', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(538, 69, 'Adika Wijaya', 'Hariyah', 'P', 'Buddha', 'Gg. Baabur Royan No. 211, Singkawang 85571, Maluku', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(539, 43, 'Eva Palastri', 'Suwarno', 'L', 'Kristen', 'Jr. Halim No. 258, Malang 59631, Riau', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(540, 12, 'Gambira Reksa Mandala S.Pt', 'Padmasari', 'L', 'Islam', 'Ds. Bakti No. 994, Balikpapan 11139, DIY', NULL, '2020-08-16 22:13:02', '2020-08-16 22:13:02'),
(541, 65, 'Jamalia Usamah', 'Wahyuni', 'P', 'Kristen', 'Psr. Gambang No. 584, Malang 50659, Aceh', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(542, 78, 'Queen Dian Lestari', 'Andriani', 'L', 'Buddha', 'Ki. Bakhita No. 172, Solok 12517, SulBar', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(543, 55, 'Salwa Alika Mandasari S.Kom', 'Hassanah', 'P', 'Kristen', 'Gg. Elang No. 47, Batam 57171, Bengkulu', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(544, 35, 'Kenzie Simanjuntak M.Kom.', 'Usada', 'P', 'Hindu', 'Ki. Sutan Syahrir No. 132, Ambon 36868, Lampung', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(545, 69, 'Ayu Rahmawati', 'Widiastuti', 'P', 'Hindu', 'Dk. Laswi No. 75, Gorontalo 59085, JaTim', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(546, 36, 'Utama Kuswoyo S.Sos', 'Santoso', 'P', 'Buddha', 'Psr. Sumpah Pemuda No. 595, Serang 63357, DIY', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(547, 90, 'Umi Zelda Aryani S.Gz', 'Mangunsong', 'L', 'Islam', 'Ki. Sutoyo No. 757, Pematangsiantar 39087, Aceh', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(548, 40, 'Aurora Nasyidah M.Ak', 'Situmorang', 'L', 'Buddha', 'Dk. Antapani Lama No. 58, Bandar Lampung 46329, SulTeng', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(549, 93, 'Anom Situmorang', 'Laksmiwati', 'P', 'Kristen', 'Kpg. Astana Anyar No. 79, Sungai Penuh 86190, PapBar', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(550, 95, 'Garan Wibowo S.Psi', 'Wijayanti', 'L', 'Buddha', 'Kpg. Villa No. 293, Madiun 31800, SulSel', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(551, 54, 'Luis Najmudin', 'Fujiati', 'P', 'Kristen', 'Ki. M.T. Haryono No. 620, Padang 59261, KalTim', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(552, 99, 'Cayadi Gatot Tamba S.Pt', 'Hasanah', 'P', 'Kristen', 'Jr. Bambon No. 230, Ambon 54577, SulSel', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(553, 18, 'Hilda Pia Puspita', 'Lestari', 'P', 'Kristen', 'Ki. Asia Afrika No. 863, Dumai 63482, DKI', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(554, 65, 'Bakianto Hidayat M.TI.', 'Agustina', 'L', 'Islam', 'Gg. Ekonomi No. 362, Prabumulih 53023, Papua', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(555, 69, 'Karsa Pradipta M.Ak', 'Kusumo', 'P', 'Hindu', 'Dk. Juanda No. 569, Surakarta 15607, Bali', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(556, 52, 'Cindy Namaga', 'Yuliarti', 'P', 'Kristen', 'Kpg. Pasteur No. 798, Tegal 16504, Gorontalo', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(557, 71, 'Nilam Nasyiah', 'Budiyanto', 'L', 'Islam', 'Psr. Baranangsiang No. 591, Salatiga 48985, Riau', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(558, 41, 'Jelita Mardhiyah', 'Waskita', 'L', 'Islam', 'Gg. Suryo Pranoto No. 279, Pangkal Pinang 10281, KalUt', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(559, 66, 'Arta Prasetyo Prabowo M.Kom.', 'Simbolon', 'P', 'Buddha', 'Ds. Ciwastra No. 664, Ternate 94354, KepR', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(560, 85, 'Cahya Nalar Maulana S.E.', 'Fujiati', 'P', 'Hindu', 'Jln. Bagonwoto  No. 531, Serang 44183, Aceh', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(561, 44, 'Jaswadi Marbun', 'Widiastuti', 'L', 'Hindu', 'Jln. Babah No. 738, Bitung 95157, JaTeng', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(562, 59, 'Maria Kuswandari', 'Suryono', 'L', 'Islam', 'Jln. Bakau Griya Utama No. 267, Dumai 96529, SumUt', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(563, 84, 'Gina Azalea Nurdiyanti', 'Sihombing', 'P', 'Islam', 'Jr. Gading No. 959, Batu 16117, SulTra', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(564, 15, 'Puti Wahyuni', 'Purwanti', 'L', 'Hindu', 'Kpg. Babadak No. 923, Surabaya 62444, DKI', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(565, 35, 'Kayla Nurul Hasanah', 'Hutasoit', 'L', 'Buddha', 'Ki. Cihampelas No. 18, Kendari 80304, Gorontalo', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(566, 36, 'Febi Kusmawati', 'Iswahyudi', 'L', 'Hindu', 'Dk. Baing No. 493, Palopo 17588, JaTeng', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(567, 27, 'Kunthara Endra Nugroho', 'Iswahyudi', 'L', 'Hindu', 'Ds. R.E. Martadinata No. 610, Sawahlunto 21640, Bali', NULL, '2020-08-16 22:13:03', '2020-08-16 22:13:03'),
(568, 100, 'Gawati Jelita Yulianti S.E.', 'Prasetyo', 'L', 'Kristen', 'Ki. Bah Jaya No. 23, Bitung 63112, Bengkulu', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(569, 76, 'Utama Saputra', 'Usada', 'L', 'Islam', 'Ds. Sumpah Pemuda No. 795, Pangkal Pinang 13545, SumSel', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(570, 56, 'Mulya Kamidin Habibi S.Kom', 'Sihotang', 'P', 'Kristen', 'Psr. Jend. Sudirman No. 208, Malang 76789, SulBar', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(571, 88, 'Maida Purnawati M.M.', 'Manullang', 'P', 'Islam', 'Jr. Bagis Utama No. 389, Administrasi Jakarta Timur 95188, Bengkulu', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(572, 27, 'Zelaya Wijayanti', 'Sinaga', 'L', 'Hindu', 'Psr. Tambak No. 165, Pekanbaru 54631, KalTeng', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(573, 35, 'Restu Eli Mayasari', 'Dabukke', 'L', 'Kristen', 'Jr. M.T. Haryono No. 86, Madiun 23628, Banten', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(574, 73, 'Indra Lanjar Sihotang', 'Hastuti', 'P', 'Hindu', 'Ki. Fajar No. 255, Madiun 27170, JaTeng', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(575, 98, 'Ayu Utami', 'Nasyidah', 'P', 'Kristen', 'Psr. Jend. A. Yani No. 905, Jayapura 15047, Gorontalo', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(576, 48, 'Karimah Ratih Mardhiyah', 'Mandasari', 'P', 'Buddha', 'Kpg. Yogyakarta No. 957, Kupang 43949, KepR', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(577, 38, 'Vivi Salwa Oktaviani', 'Astuti', 'P', 'Hindu', 'Gg. Yohanes No. 814, Makassar 51849, KepR', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(578, 60, 'Raihan Rajata', 'Sihombing', 'L', 'Kristen', 'Psr. Gatot Subroto No. 443, Bekasi 34701, KalTeng', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(579, 14, 'Ellis Hasanah', 'Dongoran', 'L', 'Buddha', 'Ds. Dewi Sartika No. 608, Pasuruan 82812, Maluku', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(580, 59, 'Omar Nababan M.Pd', 'Prasasta', 'L', 'Hindu', 'Jr. Basmol Raya No. 925, Pangkal Pinang 29057, SumBar', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(581, 46, 'Cinta Laksita S.T.', 'Susanti', 'P', 'Kristen', 'Jr. Sudiarto No. 18, Pariaman 88724, Jambi', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(582, 23, 'Caket Habibi', 'Anggraini', 'L', 'Islam', 'Jln. Asia Afrika No. 32, Bekasi 48948, KalBar', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(583, 72, 'Lala Aryani', 'Siregar', 'L', 'Islam', 'Gg. Krakatau No. 641, Mataram 73537, Aceh', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(584, 51, 'Ifa Ilsa Pratiwi M.Farm', 'Yuliarti', 'P', 'Islam', 'Psr. Acordion No. 421, Tebing Tinggi 42488, SulSel', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(585, 20, 'Puji Qori Purnawati M.Pd', 'Hartati', 'L', 'Kristen', 'Psr. Acordion No. 871, Tanjungbalai 78199, NTB', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(586, 36, 'Umay Pangestu', 'Saputra', 'P', 'Islam', 'Jr. Kali No. 653, Tegal 69349, KalSel', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(587, 60, 'Legawa Joko Saptono S.T.', 'Mustofa', 'L', 'Islam', 'Gg. Honggowongso No. 626, Medan 70090, SumUt', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(588, 77, 'Paris Wijayanti', 'Simanjuntak', 'L', 'Islam', 'Ki. Bank Dagang Negara No. 544, Administrasi Jakarta Timur 35300, Riau', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(589, 99, 'Surya Mahfud Widodo M.M.', 'Widiastuti', 'L', 'Islam', 'Gg. Lada No. 771, Tidore Kepulauan 21447, KalBar', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(590, 43, 'Jaya Thamrin', 'Jailani', 'L', 'Buddha', 'Gg. Mulyadi No. 926, Kediri 59136, KalTeng', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(591, 56, 'Najwa Yolanda S.Pt', 'Ardianto', 'L', 'Hindu', 'Jr. Badak No. 589, Kupang 55932, KepR', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(592, 12, 'Purwanto Candra Halim', 'Wibowo', 'P', 'Kristen', 'Kpg. Suniaraja No. 199, Pariaman 22321, DIY', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(593, 10, 'Tantri Laksmiwati', 'Hassanah', 'P', 'Islam', 'Gg. Nanas No. 265, Bandar Lampung 95241, Aceh', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(594, 32, 'Fitria Wijayanti S.Farm', 'Latupono', 'P', 'Hindu', 'Ds. Arifin No. 765, Pekalongan 22220, SumSel', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(595, 77, 'Sidiq Embuh Mustofa M.Kom.', 'Yolanda', 'P', 'Hindu', 'Ds. Sutarjo No. 624, Denpasar 26977, BaBel', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(596, 69, 'Damar Narpati', 'Hartati', 'P', 'Islam', 'Ds. Ketandan No. 821, Samarinda 52547, Maluku', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(597, 40, 'Uchita Andriani', 'Hariyah', 'L', 'Islam', 'Dk. Cut Nyak Dien No. 127, Dumai 82975, MalUt', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(598, 66, 'Balamantri Prayoga', 'Aryani', 'P', 'Islam', 'Psr. Dahlia No. 371, Bau-Bau 36642, PapBar', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(599, 43, 'Hasta Mangunsong', 'Usada', 'P', 'Hindu', 'Gg. Bank Dagang Negara No. 512, Samarinda 47260, KepR', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(600, 76, 'Prabowo Mansur', 'Sitorus', 'L', 'Hindu', 'Jln. Urip Sumoharjo No. 138, Tual 43031, Aceh', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(601, 74, 'Nyana Dariati Prasetyo', 'Suwarno', 'P', 'Buddha', 'Kpg. Ciumbuleuit No. 773, Mataram 40379, Riau', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(602, 66, 'Opan Gaman Maryadi', 'Puspasari', 'L', 'Kristen', 'Gg. Supono No. 189, Banda Aceh 51914, Papua', NULL, '2020-08-16 22:13:04', '2020-08-16 22:13:04'),
(603, 10, 'Asirwada Simanjuntak S.Psi', 'Yulianti', 'P', 'Hindu', 'Kpg. Reksoninten No. 737, Bima 22944, SulTra', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(604, 60, 'Kania Uyainah', 'Sihombing', 'P', 'Hindu', 'Jln. Honggowongso No. 125, Tebing Tinggi 50169, DKI', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(605, 42, 'Queen Ika Susanti S.Farm', 'Narpati', 'P', 'Kristen', 'Dk. Dago No. 639, Bandung 22859, JaBar', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(606, 88, 'Septi Sari Yuniar S.Ked', 'Kusmawati', 'P', 'Buddha', 'Gg. Wora Wari No. 206, Pagar Alam 19016, Aceh', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(607, 40, 'Gilda Wulandari', 'Usada', 'P', 'Islam', 'Jln. Jend. Sudirman No. 772, Metro 99651, KalTeng', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(608, 11, 'Catur Hutagalung', 'Pradana', 'L', 'Hindu', 'Kpg. Salatiga No. 687, Bekasi 71790, DIY', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(609, 28, 'Zelaya Haryanti S.IP', 'Pudjiastuti', 'P', 'Hindu', 'Jln. Baabur Royan No. 392, Surakarta 10837, Jambi', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(610, 36, 'Lintang Permata S.E.I', 'Pratiwi', 'L', 'Hindu', 'Gg. Otto No. 515, Singkawang 85773, Bali', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(611, 46, 'Jessica Salsabila Susanti', 'Aryani', 'L', 'Buddha', 'Jr. Bakin No. 29, Sawahlunto 82455, SumSel', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(612, 77, 'Raina Paramita Puspasari', 'Habibi', 'P', 'Islam', 'Psr. Raden No. 867, Depok 60005, SulUt', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(613, 88, 'Intan Wijayanti', 'Pranowo', 'L', 'Hindu', 'Kpg. Gremet No. 543, Metro 10603, Papua', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(614, 63, 'Mahfud Kemba Waluyo S.Kom', 'Pratama', 'P', 'Islam', 'Ds. Wahid No. 243, Bontang 10916, JaBar', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(615, 59, 'Cemani Saptono', 'Situmorang', 'L', 'Buddha', 'Gg. Taman No. 450, Surabaya 21818, Bali', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(616, 31, 'Banawa Lasmono Megantara M.Farm', 'Nababan', 'L', 'Buddha', 'Ki. Jaksa No. 986, Tarakan 56766, MalUt', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(617, 66, 'Wisnu Haryanto', 'Maheswara', 'L', 'Hindu', 'Psr. Bambu No. 463, Binjai 47852, JaTim', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(618, 92, 'Jumadi Rajata', 'Nugroho', 'P', 'Kristen', 'Kpg. Baja No. 564, Bandar Lampung 19011, Banten', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(619, 14, 'Lidya Astuti', 'Sihombing', 'L', 'Kristen', 'Ds. Surapati No. 562, Gorontalo 27126, DKI', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(620, 36, 'Queen Zahra Hariyah S.Sos', 'Nuraini', 'L', 'Hindu', 'Ki. Moch. Toha No. 596, Administrasi Jakarta Timur 45523, Bali', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(621, 50, 'Siti Safitri', 'Santoso', 'P', 'Islam', 'Ki. Suryo No. 477, Salatiga 83408, DIY', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(622, 17, 'Umar Permadi S.E.I', 'Sihotang', 'P', 'Hindu', 'Gg. Bawal No. 233, Lubuklinggau 40760, Bali', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(623, 97, 'Dinda Hartati', 'Yulianti', 'P', 'Buddha', 'Jr. Bahagia  No. 658, Cilegon 83794, SumUt', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(624, 34, 'Eva Talia Maryati S.Farm', 'Samosir', 'L', 'Buddha', 'Ki. Lada No. 108, Batu 96599, JaTeng', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(625, 11, 'Zalindra Hastuti', 'Novitasari', 'P', 'Hindu', 'Dk. Cokroaminoto No. 361, Pekanbaru 17980, Jambi', NULL, '2020-08-16 22:13:05', '2020-08-16 22:13:05'),
(626, 45, 'Gaiman Jailani', 'Widodo', 'P', 'Kristen', 'Gg. Flores No. 818, Administrasi Jakarta Selatan 79592, JaBar', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(627, 68, 'Pangestu Jati Sihotang S.Sos', 'Sirait', 'L', 'Kristen', 'Ds. Soekarno Hatta No. 993, Bekasi 65821, Bali', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(628, 86, 'Wulan Susanti S.Pt', 'Wahyuni', 'L', 'Islam', 'Gg. Ters. Pasir Koja No. 56, Mojokerto 84111, Banten', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(629, 85, 'Kayla Cinthia Maryati M.Farm', 'Padmasari', 'P', 'Islam', 'Gg. W.R. Supratman No. 506, Sawahlunto 17352, BaBel', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(630, 76, 'Mala Aryani', 'Lazuardi', 'L', 'Buddha', 'Ds. Yohanes No. 407, Gorontalo 80291, Jambi', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(631, 73, 'Gadang Anggriawan S.Kom', 'Prayoga', 'L', 'Islam', 'Ki. Villa No. 975, Bandung 70096, DIY', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(632, 99, 'Argono Tarihoran', 'Natsir', 'L', 'Hindu', 'Ds. S. Parman No. 86, Subulussalam 50740, KalUt', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(633, 77, 'Padmi Mayasari', 'Utami', 'P', 'Buddha', 'Dk. Rajiman No. 351, Sabang 80438, Jambi', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(634, 78, 'Alika Kusmawati', 'Yulianti', 'P', 'Islam', 'Ds. Badak No. 860, Sawahlunto 11384, KalTim', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(635, 49, 'Hesti Safitri', 'Palastri', 'P', 'Kristen', 'Psr. Flora No. 569, Tegal 37557, JaTim', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(636, 85, 'Padmi Hastuti', 'Maryati', 'P', 'Kristen', 'Psr. Bagonwoto  No. 477, Probolinggo 97719, NTT', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(637, 94, 'Ana Hasna Pratiwi', 'Ardianto', 'P', 'Buddha', 'Jln. W.R. Supratman No. 668, Yogyakarta 73864, KalUt', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(638, 68, 'Harsaya Wacana', 'Puspasari', 'L', 'Islam', 'Ds. B.Agam Dlm No. 278, Batu 46466, DKI', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(639, 38, 'Halima Halima Pratiwi S.Pd', 'Wulandari', 'L', 'Hindu', 'Ds. Ters. Jakarta No. 498, Surabaya 38460, SulUt', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(640, 51, 'Gawati Yessi Palastri', 'Maulana', 'P', 'Buddha', 'Gg. Ciwastra No. 707, Banda Aceh 25032, KalBar', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(641, 29, 'Raditya Atmaja Simanjuntak S.I.Kom', 'Nashiruddin', 'L', 'Buddha', 'Dk. Raya Setiabudhi No. 456, Tidore Kepulauan 17664, Banten', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(642, 29, 'Winda Sudiati S.Pt', 'Sinaga', 'P', 'Buddha', 'Dk. Bakaru No. 224, Sukabumi 97445, NTT', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(643, 82, 'Bakianto Tamba', 'Suartini', 'L', 'Kristen', 'Gg. Untung Suropati No. 609, Palembang 67129, KalTeng', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(644, 55, 'Tira Handayani', 'Laksita', 'P', 'Islam', 'Gg. Sutami No. 781, Samarinda 33498, SulSel', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(645, 39, 'Kiandra Safitri', 'Ardianto', 'L', 'Buddha', 'Jr. Industri No. 116, Cirebon 90329, SulBar', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(646, 55, 'Saiful Taufan Pranowo M.M.', 'Tamba', 'L', 'Islam', 'Gg. Cikutra Barat No. 270, Administrasi Jakarta Pusat 35448, Gorontalo', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(647, 47, 'Jane Palastri', 'Tarihoran', 'P', 'Islam', 'Ki. Cihampelas No. 436, Tomohon 69554, SulUt', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(648, 45, 'Lala Icha Padmasari M.Pd', 'Uwais', 'L', 'Hindu', 'Jln. Nangka No. 867, Administrasi Jakarta Selatan 81183, Lampung', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(649, 50, 'Mahmud Purwanto Mustofa', 'Haryanti', 'L', 'Islam', 'Ki. Nakula No. 938, Bontang 52646, Banten', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(650, 81, 'Laksana Kurniawan M.Ak', 'Lestari', 'L', 'Hindu', 'Dk. Abdul Muis No. 523, Medan 80220, SumUt', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(651, 35, 'Vino Marpaung', 'Farida', 'L', 'Buddha', 'Dk. Bagonwoto  No. 578, Pariaman 71742, PapBar', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(652, 17, 'Gandewa Damanik S.Psi', 'Wijayanti', 'L', 'Buddha', 'Gg. Gading No. 210, Tebing Tinggi 93055, Banten', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(653, 82, 'Baktiadi Natsir M.Ak', 'Hariyah', 'P', 'Kristen', 'Jln. Yogyakarta No. 547, Tarakan 56060, KalUt', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(654, 48, 'Cindy Mandasari', 'Salahudin', 'L', 'Hindu', 'Dk. Supomo No. 757, Semarang 31717, KalSel', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(655, 43, 'Jane Lestari', 'Puspita', 'L', 'Kristen', 'Psr. Sutarto No. 755, Jayapura 11409, Maluku', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(656, 59, 'Ana Susanti', 'Prastuti', 'P', 'Buddha', 'Ds. Bagonwoto  No. 458, Administrasi Jakarta Utara 41105, SumBar', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(657, 86, 'Darsirah Galang Firmansyah', 'Natsir', 'P', 'Hindu', 'Dk. Supono No. 752, Tarakan 54055, DIY', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06');
INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `gambar`, `created_at`, `updated_at`) VALUES
(658, 32, 'Rachel Yulianti S.H.', 'Prayoga', 'P', 'Buddha', 'Dk. Bara No. 165, Administrasi Jakarta Selatan 81741, SulSel', NULL, '2020-08-16 22:13:06', '2020-08-16 22:13:06'),
(659, 99, 'Ellis Mayasari', 'Mandala', 'P', 'Islam', 'Psr. Nangka No. 933, Palembang 55253, KalSel', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(660, 42, 'Gabriella Andriani', 'Sihombing', 'L', 'Hindu', 'Jln. Soekarno Hatta No. 203, Palangka Raya 23888, MalUt', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(661, 88, 'Hasta Salahudin', 'Halimah', 'L', 'Kristen', 'Dk. Uluwatu No. 656, Yogyakarta 34654, DKI', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(662, 13, 'Eva Icha Hastuti', 'Maryati', 'L', 'Islam', 'Ki. Siliwangi No. 848, Bontang 42467, KalUt', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(663, 22, 'Harjaya Hidayanto', 'Nasyidah', 'P', 'Islam', 'Jr. Salam No. 76, Balikpapan 25134, DKI', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(664, 75, 'Raden Prabowo', 'Jailani', 'L', 'Islam', 'Gg. Adisucipto No. 709, Banjarmasin 64842, NTT', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(665, 49, 'Maimunah Aryani S.Kom', 'Nurdiyanti', 'L', 'Buddha', 'Gg. Suryo Pranoto No. 582, Palembang 79497, JaBar', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(666, 85, 'Fathonah Irma Uyainah', 'Wibowo', 'L', 'Kristen', 'Jln. Adisumarmo No. 90, Metro 63935, KalTim', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(667, 33, 'Dagel Narpati', 'Pudjiastuti', 'L', 'Islam', 'Gg. Honggowongso No. 873, Cimahi 73715, Aceh', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(668, 53, 'Eluh Umaya Prasetya', 'Dongoran', 'L', 'Hindu', 'Ki. Abdul No. 50, Depok 21459, Lampung', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(669, 22, 'Kasusra Adriansyah', 'Pradipta', 'P', 'Islam', 'Psr. Ciumbuleuit No. 213, Pasuruan 22519, KalUt', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(670, 85, 'Kamila Wahyuni M.TI.', 'Handayani', 'L', 'Hindu', 'Ki. Sampangan No. 991, Administrasi Jakarta Utara 16493, DKI', NULL, '2020-08-16 22:13:07', '2020-08-16 22:13:07'),
(671, 34, 'Oni Kusmawati', 'Hartati', 'L', 'Islam', 'Ds. R.E. Martadinata No. 854, Surabaya 89823, NTT', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(672, 64, 'Enteng Manullang', 'Rahayu', 'P', 'Kristen', 'Psr. B.Agam 1 No. 252, Palangka Raya 81238, NTB', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(673, 24, 'Rahmi Rini Mulyani', 'Sudiati', 'P', 'Buddha', 'Jln. Setiabudhi No. 893, Samarinda 37051, JaBar', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(674, 94, 'Bagas Sirait S.E.', 'Saragih', 'L', 'Islam', 'Jr. Madrasah No. 515, Pontianak 40151, KalBar', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(675, 21, 'Eli Raisa Mayasari', 'Lailasari', 'P', 'Hindu', 'Gg. Ahmad Dahlan No. 314, Samarinda 54870, Jambi', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(676, 97, 'Wakiman Siregar', 'Hidayanto', 'L', 'Buddha', 'Gg. Dr. Junjunan No. 34, Serang 39940, Lampung', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(677, 40, 'Joko Damanik', 'Agustina', 'P', 'Islam', 'Kpg. M.T. Haryono No. 119, Kupang 63569, KalSel', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(678, 94, 'Tantri Farida', 'Hastuti', 'L', 'Hindu', 'Ds. Tentara Pelajar No. 69, Bandar Lampung 23803, KepR', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(679, 52, 'Kamal Ridwan Mansur', 'Fujiati', 'P', 'Hindu', 'Dk. Baranang Siang No. 806, Probolinggo 64237, KalBar', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(680, 29, 'Zamira Hana Nasyidah S.Farm', 'Andriani', 'P', 'Islam', 'Psr. Bacang No. 538, Malang 33612, Banten', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(681, 84, 'Waluyo Ramadan', 'Nurdiyanti', 'L', 'Buddha', 'Ds. Gajah Mada No. 122, Palangka Raya 98265, Bengkulu', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(682, 47, 'Aslijan Ramadan', 'Mustofa', 'P', 'Kristen', 'Kpg. Bayam No. 808, Bitung 11854, KalTeng', NULL, '2020-08-16 22:13:08', '2020-08-16 22:13:08'),
(683, 33, 'Cahyanto Sihombing', 'Pratama', 'P', 'Hindu', 'Kpg. B.Agam Dlm No. 943, Padangpanjang 19149, NTT', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(684, 60, 'Sabrina Maida Widiastuti S.Psi', 'Hastuti', 'L', 'Islam', 'Ki. Gegerkalong Hilir No. 867, Surakarta 94250, NTB', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(685, 21, 'Kacung Situmorang S.Sos', 'Hastuti', 'P', 'Kristen', 'Gg. Lembong No. 109, Surabaya 55634, BaBel', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(686, 62, 'Jatmiko Gunawan', 'Handayani', 'P', 'Hindu', 'Dk. Orang No. 86, Padang 39454, KalBar', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(687, 25, 'Hasta Luluh Prasetyo', 'Hutagalung', 'P', 'Kristen', 'Dk. Sutan Syahrir No. 761, Pekanbaru 29909, KalSel', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(688, 18, 'Legawa Hutapea', 'Siregar', 'L', 'Hindu', 'Ki. Nakula No. 500, Blitar 41632, KalTim', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(689, 77, 'Cindy Eva Handayani M.TI.', 'Agustina', 'L', 'Hindu', 'Kpg. Dahlia No. 260, Ternate 66735, JaTeng', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(690, 55, 'Okto Prasetya', 'Namaga', 'L', 'Islam', 'Psr. Bahagia No. 598, Kupang 12950, NTB', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(691, 41, 'Hesti Namaga S.IP', 'Riyanti', 'P', 'Kristen', 'Gg. Ciwastra No. 22, Langsa 60212, SulUt', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(692, 85, 'Daniswara Prasetyo', 'Lazuardi', 'P', 'Islam', 'Ki. Ekonomi No. 902, Depok 97642, KalUt', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(693, 11, 'Fitriani Salwa Lestari', 'Farida', 'L', 'Buddha', 'Dk. Halim No. 129, Palembang 67611, SulTra', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(694, 57, 'Yani Susanti', 'Prastuti', 'P', 'Kristen', 'Jln. Cikutra Timur No. 209, Tasikmalaya 34238, PapBar', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(695, 48, 'Jumadi Sitorus', 'Rahmawati', 'L', 'Kristen', 'Kpg. Rajiman No. 939, Sawahlunto 72004, MalUt', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(696, 38, 'Najam Sihombing', 'Utami', 'P', 'Hindu', 'Jr. Labu No. 343, Makassar 49885, Papua', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(697, 97, 'Melinda Hartati', 'Pradana', 'L', 'Buddha', 'Jr. Gotong Royong No. 899, Sibolga 91605, KalUt', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(698, 14, 'Amalia Sadina Yuliarti', 'Nasyidah', 'L', 'Kristen', 'Dk. Sentot Alibasa No. 561, Depok 79595, NTT', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(699, 63, 'Jasmin Karen Purnawati', 'Zulaika', 'L', 'Buddha', 'Ds. Sukajadi No. 248, Ambon 62473, SulSel', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(700, 30, 'Siti Wijayanti', 'Hartati', 'L', 'Islam', 'Kpg. Batako No. 705, Semarang 61384, SulTeng', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(701, 46, 'Putri Sudiati', 'Prasetya', 'L', 'Buddha', 'Ds. B.Agam Dlm No. 404, Lubuklinggau 13070, KalTim', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(702, 32, 'Praba Anggriawan', 'Uwais', 'P', 'Kristen', 'Jr. Supono No. 496, Magelang 79765, Riau', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(703, 66, 'Novi Nuraini', 'Hastuti', 'P', 'Buddha', 'Gg. Ahmad Dahlan No. 330, Singkawang 95998, Banten', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(704, 53, 'Danang Kariman Sihombing S.H.', 'Natsir', 'L', 'Kristen', 'Ki. Jaksa No. 451, Yogyakarta 69530, KalSel', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(705, 80, 'Siska Qori Purwanti', 'Tamba', 'P', 'Buddha', 'Jr. Babadak No. 360, Medan 19931, Gorontalo', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(706, 11, 'Irnanto Argono Dongoran S.Kom', 'Fujiati', 'L', 'Kristen', 'Ki. Ters. Pasir Koja No. 720, Medan 19770, Bengkulu', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(707, 84, 'Cakrawala Mangunsong', 'Farida', 'P', 'Kristen', 'Gg. Bawal No. 971, Kediri 67218, KalTeng', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(708, 48, 'Hairyanto Adriansyah S.IP', 'Budiyanto', 'L', 'Buddha', 'Dk. Banal No. 431, Palangka Raya 39386, Riau', NULL, '2020-08-16 22:13:09', '2020-08-16 22:13:09'),
(709, 89, 'Lidya Wijayanti', 'Hakim', 'L', 'Islam', 'Jr. Raden Saleh No. 768, Banjar 45373, NTB', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(710, 75, 'Amelia Cinta Mandasari', 'Utama', 'P', 'Islam', 'Jln. Panjaitan No. 623, Mojokerto 19880, KalSel', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(711, 98, 'Wahyu Waluyo', 'Jailani', 'P', 'Hindu', 'Psr. Bah Jaya No. 503, Kediri 82369, BaBel', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(712, 87, 'Olga Lazuardi S.Gz', 'Permadi', 'L', 'Hindu', 'Psr. Yap Tjwan Bing No. 855, Tual 84394, SulTra', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(713, 65, 'Ajimin Najmudin', 'Haryanto', 'P', 'Islam', 'Ki. Ters. Jakarta No. 166, Bogor 53370, JaTeng', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(714, 11, 'Kasiran Simbolon', 'Handayani', 'L', 'Kristen', 'Psr. Acordion No. 911, Bitung 61240, SumUt', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(715, 96, 'Nasrullah Adriansyah', 'Natsir', 'L', 'Hindu', 'Dk. Setiabudhi No. 305, Tarakan 92340, MalUt', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(716, 70, 'Elisa Kezia Agustina M.M.', 'Wulandari', 'P', 'Islam', 'Ds. Nakula No. 280, Metro 11877, JaTim', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(717, 73, 'Gamanto Saptono M.Kom.', 'Purwanti', 'L', 'Hindu', 'Ki. Antapani Lama No. 368, Jambi 95533, KalUt', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(718, 72, 'Digdaya Wahyu Najmudin', 'Farida', 'P', 'Hindu', 'Ds. Sukabumi No. 754, Dumai 12075, JaTim', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(719, 55, 'Prakosa Saefullah', 'Sudiati', 'L', 'Islam', 'Ds. Ujung No. 760, Tangerang Selatan 32331, Jambi', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(720, 97, 'Kajen Omar Nugroho S.Ked', 'Yolanda', 'L', 'Kristen', 'Kpg. Suprapto No. 177, Pontianak 58671, MalUt', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(721, 37, 'Jarwadi Prayoga', 'Hartati', 'L', 'Hindu', 'Gg. Ketandan No. 785, Magelang 69279, SulTra', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(722, 44, 'Taufik Prabowo', 'Novitasari', 'P', 'Kristen', 'Kpg. Kartini No. 801, Tual 11440, PapBar', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(723, 62, 'Rika Susanti', 'Thamrin', 'P', 'Islam', 'Jr. Astana Anyar No. 947, Administrasi Jakarta Utara 17782, SulTra', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(724, 78, 'Keisha Azalea Maryati', 'Prastuti', 'L', 'Buddha', 'Ds. Moch. Toha No. 57, Kendari 86114, Banten', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(725, 45, 'Ayu Nasyiah', 'Kurniawan', 'P', 'Buddha', 'Ki. Tambak No. 56, Padangsidempuan 66322, BaBel', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(726, 19, 'Daliono Simanjuntak', 'Iswahyudi', 'L', 'Hindu', 'Jr. Arifin No. 954, Tomohon 31711, Riau', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(727, 66, 'Candrakanta Dwi Hidayat', 'Salahudin', 'L', 'Buddha', 'Ki. Gambang No. 750, Bitung 23879, JaBar', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(728, 44, 'Jarwi Teddy Irawan S.Kom', 'Sirait', 'P', 'Hindu', 'Dk. Merdeka No. 363, Tarakan 55160, SulTeng', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(729, 64, 'Manah Zulkarnain', 'Melani', 'L', 'Islam', 'Ki. Surapati No. 99, Surabaya 35656, JaTim', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(730, 33, 'Akarsana Aslijan Ardianto', 'Yuniar', 'L', 'Islam', 'Ki. Wahidin Sudirohusodo No. 715, Bau-Bau 50345, KalBar', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(731, 53, 'Vicky Queen Astuti', 'Wacana', 'P', 'Islam', 'Jln. Kebonjati No. 951, Bandar Lampung 53257, DKI', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(732, 92, 'Elvin Utama', 'Saragih', 'P', 'Buddha', 'Jln. Sudirman No. 888, Kediri 15489, Banten', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(733, 20, 'Anom Widodo', 'Hutagalung', 'P', 'Kristen', 'Kpg. Diponegoro No. 356, Singkawang 79952, SulTeng', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(734, 93, 'Cinta Laras Winarsih', 'Hakim', 'L', 'Kristen', 'Psr. Kebangkitan Nasional No. 576, Lubuklinggau 65122, KepR', NULL, '2020-08-16 22:13:10', '2020-08-16 22:13:10'),
(735, 59, 'Mustika Pranowo', 'Yolanda', 'P', 'Buddha', 'Psr. Supomo No. 521, Ternate 51546, JaBar', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(736, 36, 'Himawan Jefri Sitorus M.Farm', 'Pranowo', 'L', 'Islam', 'Jln. Diponegoro No. 973, Subulussalam 64397, SulBar', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(737, 13, 'Imam Rajata', 'Gunawan', 'L', 'Hindu', 'Gg. Ronggowarsito No. 531, Pasuruan 66408, JaTeng', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(738, 93, 'Harsana Sinaga', 'Permadi', 'P', 'Buddha', 'Jln. Fajar No. 829, Binjai 76403, JaTim', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(739, 78, 'Mahdi Prasetya Latupono S.T.', 'Rahayu', 'L', 'Buddha', 'Dk. Gambang No. 269, Semarang 81882, SumSel', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(740, 96, 'Hardi Marbun', 'Rajasa', 'L', 'Buddha', 'Ki. Pacuan Kuda No. 987, Lhokseumawe 71703, BaBel', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(741, 60, 'Wardi Hidayat', 'Oktaviani', 'P', 'Kristen', 'Psr. Bagonwoto  No. 111, Pematangsiantar 44137, JaBar', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(742, 24, 'Tasnim Luluh Thamrin', 'Nuraini', 'L', 'Kristen', 'Kpg. Kusmanto No. 45, Langsa 76962, Bengkulu', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(743, 13, 'Tira Pertiwi', 'Hutagalung', 'P', 'Islam', 'Ki. W.R. Supratman No. 984, Dumai 99667, NTT', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(744, 50, 'Putri Lestari', 'Napitupulu', 'P', 'Buddha', 'Ds. Nakula No. 332, Kendari 49018, KalBar', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(745, 33, 'Devi Maria Rahimah', 'Prasetya', 'P', 'Hindu', 'Ki. Gegerkalong Hilir No. 135, Surakarta 46662, SulTra', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(746, 43, 'Wirda Mayasari', 'Wijaya', 'P', 'Hindu', 'Gg. Sutarto No. 941, Semarang 36500, SulTra', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(747, 91, 'Shania Zulaika', 'Zulkarnain', 'P', 'Kristen', 'Dk. Adisucipto No. 571, Serang 65835, JaTeng', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(748, 31, 'Rangga Suwarno M.Ak', 'Mandasari', 'L', 'Buddha', 'Jln. Cikapayang No. 588, Cilegon 65395, KalBar', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(749, 50, 'Ganda Timbul Sihombing S.H.', 'Winarno', 'P', 'Islam', 'Kpg. Pahlawan No. 476, Palu 24174, DIY', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(750, 40, 'Vino Sihotang', 'Maryadi', 'P', 'Islam', 'Jr. Rajiman No. 721, Semarang 15025, SulSel', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(751, 75, 'Harimurti Lasmanto Thamrin S.Ked', 'Pratiwi', 'L', 'Buddha', 'Jr. Dewi Sartika No. 893, Banjar 80071, SumBar', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(752, 80, 'Hani Hastuti', 'Hasanah', 'P', 'Buddha', 'Jln. Suryo No. 808, Surakarta 76962, Jambi', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(753, 35, 'Hilda Rika Novitasari', 'Prabowo', 'L', 'Islam', 'Jln. Aceh No. 44, Metro 91836, KalTim', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(754, 48, 'Balijan Pranowo', 'Widiastuti', 'P', 'Hindu', 'Gg. Sutami No. 168, Palembang 25851, KalBar', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(755, 73, 'Ulva Ani Kuswandari S.I.Kom', 'Maulana', 'L', 'Buddha', 'Psr. Hasanuddin No. 828, Padang 97601, JaBar', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(756, 47, 'Cornelia Padmi Yulianti', 'Rahimah', 'L', 'Kristen', 'Jln. Babakan No. 266, Sabang 86017, SumUt', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(757, 42, 'Bagiya Hidayat', 'Pratiwi', 'P', 'Kristen', 'Gg. Cihampelas No. 347, Bogor 89136, Bali', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(758, 83, 'Jayadi Danu Rajata S.I.Kom', 'Hutasoit', 'P', 'Islam', 'Ki. Pasteur No. 835, Balikpapan 99720, DKI', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(759, 97, 'Baktiono Winarno', 'Nugroho', 'L', 'Hindu', 'Dk. Bayam No. 723, Probolinggo 15135, BaBel', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(760, 54, 'Alika Alika Halimah S.Gz', 'Novitasari', 'P', 'Buddha', 'Jln. B.Agam 1 No. 143, Blitar 42916, KepR', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(761, 37, 'Maria Zulaikha Mulyani S.Kom', 'Usamah', 'P', 'Hindu', 'Jr. Cikutra Timur No. 875, Pagar Alam 58259, KepR', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(762, 96, 'Mulyono Sihombing', 'Hassanah', 'P', 'Buddha', 'Gg. Baladewa No. 542, Parepare 62755, KalTeng', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(763, 78, 'Yance Usamah S.Pd', 'Kusmawati', 'P', 'Buddha', 'Dk. Jayawijaya No. 896, Sabang 13257, JaTeng', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(764, 78, 'Uda Heryanto Ardianto', 'Purnawati', 'L', 'Islam', 'Jln. Abdul Muis No. 748, Tidore Kepulauan 29244, KepR', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(765, 50, 'Paiman Pradipta S.Gz', 'Irawan', 'P', 'Hindu', 'Ds. Moch. Toha No. 630, Prabumulih 11070, KepR', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(766, 39, 'Mitra Januar M.TI.', 'Winarsih', 'P', 'Buddha', 'Jr. Hasanuddin No. 248, Banda Aceh 65169, Banten', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(767, 55, 'Irma Laksita', 'Melani', 'L', 'Hindu', 'Ds. Dipatiukur No. 940, Solok 74632, Lampung', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(768, 39, 'Balapati Januar M.Ak', 'Setiawan', 'P', 'Islam', 'Ds. Raya Setiabudhi No. 126, Magelang 29792, Bengkulu', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(769, 17, 'Tina Uyainah', 'Melani', 'L', 'Kristen', 'Kpg. Bara No. 949, Solok 29464, Bengkulu', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(770, 26, 'Pangeran Thamrin', 'Thamrin', 'P', 'Hindu', 'Jln. Thamrin No. 40, Tanjung Pinang 68187, Gorontalo', NULL, '2020-08-16 22:13:11', '2020-08-16 22:13:11'),
(771, 70, 'Rina Pratiwi', 'Wijayanti', 'L', 'Hindu', 'Kpg. Krakatau No. 521, Ternate 57972, MalUt', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(772, 83, 'Harjaya Halim', 'Iswahyudi', 'P', 'Kristen', 'Gg. Bazuka Raya No. 704, Balikpapan 19530, SulTra', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(773, 48, 'Raina Laksmiwati', 'Safitri', 'L', 'Islam', 'Kpg. Suniaraja No. 838, Sabang 71586, JaTeng', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(774, 52, 'Zulfa Paris Rahmawati S.I.Kom', 'Astuti', 'P', 'Buddha', 'Ki. Ciwastra No. 119, Banjarbaru 35231, NTT', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(775, 51, 'Azalea Wastuti', 'Napitupulu', 'P', 'Buddha', 'Gg. Bhayangkara No. 879, Padangpanjang 81890, Banten', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(776, 91, 'Fitriani Laila Oktaviani S.Pd', 'Anggraini', 'L', 'Kristen', 'Ds. Hang No. 948, Blitar 95217, KalUt', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(777, 89, 'Ega Sihotang', 'Andriani', 'P', 'Kristen', 'Gg. Radio No. 72, Administrasi Jakarta Barat 73494, Bali', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(778, 78, 'Melinda Hastuti', 'Samosir', 'L', 'Islam', 'Jln. Dahlia No. 827, Makassar 75431, PapBar', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(779, 63, 'Cornelia Oktaviani', 'Wacana', 'P', 'Hindu', 'Dk. Sampangan No. 44, Pangkal Pinang 31396, NTB', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(780, 40, 'Balapati Mahendra', 'Januar', 'P', 'Buddha', 'Ds. Bazuka Raya No. 145, Gorontalo 95578, SulTeng', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(781, 68, 'Jelita Pudjiastuti M.Farm', 'Mayasari', 'L', 'Buddha', 'Ds. Monginsidi No. 696, Payakumbuh 42069, PapBar', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(782, 60, 'Harsaya Prabowo', 'Prakasa', 'L', 'Buddha', 'Jln. Kartini No. 778, Parepare 28813, DKI', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(783, 82, 'Danang Prasetyo', 'Thamrin', 'L', 'Kristen', 'Jr. Jend. A. Yani No. 942, Dumai 92346, Aceh', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(784, 37, 'Asmadi Rajasa S.Kom', 'Hastuti', 'L', 'Buddha', 'Ki. Barat No. 284, Balikpapan 29528, NTT', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(785, 84, 'Clara Wijayanti', 'Agustina', 'L', 'Buddha', 'Jr. Nangka No. 496, Ternate 37236, JaBar', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(786, 89, 'Amelia Wijayanti S.Psi', 'Novitasari', 'P', 'Kristen', 'Dk. Jakarta No. 631, Pekanbaru 14689, Bali', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(787, 51, 'Gambira Reksa Putra', 'Rahayu', 'L', 'Kristen', 'Ki. Padma No. 83, Tanjung Pinang 31923, Riau', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(788, 68, 'Laras Victoria Wastuti S.E.I', 'Hakim', 'P', 'Islam', 'Jr. Muwardi No. 838, Jambi 93580, Gorontalo', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(789, 22, 'Yuni Kasiyah Melani', 'Setiawan', 'P', 'Hindu', 'Jln. Daan No. 600, Balikpapan 90204, KalBar', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(790, 83, 'Vega Legawa Sihombing', 'Usada', 'P', 'Islam', 'Ki. Peta No. 970, Padangsidempuan 14318, SumUt', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(791, 96, 'Ida Handayani', 'Hartati', 'P', 'Kristen', 'Jr. Ciumbuleuit No. 146, Lubuklinggau 83332, JaBar', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(792, 86, 'Putri Rahimah', 'Pradipta', 'L', 'Hindu', 'Psr. Thamrin No. 476, Bandar Lampung 85383, Maluku', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(793, 65, 'Bala Wasita', 'Jailani', 'P', 'Buddha', 'Dk. Sunaryo No. 858, Lubuklinggau 48686, Lampung', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(794, 71, 'Jumadi Simanjuntak', 'Halimah', 'L', 'Hindu', 'Ki. Muwardi No. 916, Pariaman 48786, KalTeng', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(795, 40, 'Clara Namaga S.T.', 'Mulyani', 'P', 'Islam', 'Jln. Gajah Mada No. 119, Kotamobagu 89296, Lampung', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(796, 81, 'Ana Pratiwi S.Gz', 'Purnawati', 'L', 'Kristen', 'Jln. Perintis Kemerdekaan No. 288, Tebing Tinggi 88227, JaTeng', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(797, 52, 'Bagya Maheswara', 'Wijayanti', 'P', 'Islam', 'Gg. Cut Nyak Dien No. 813, Manado 19557, Bengkulu', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(798, 98, 'Tina Wahyuni S.Kom', 'Utami', 'L', 'Islam', 'Jr. Antapani Lama No. 449, Kotamobagu 43555, KalTeng', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(799, 59, 'Ulva Mulyani', 'Prastuti', 'P', 'Kristen', 'Dk. Dewi Sartika No. 607, Bengkulu 42425, JaBar', NULL, '2020-08-16 22:13:12', '2020-08-16 22:13:12'),
(800, 44, 'Hafshah Maryati S.Gz', 'Budiman', 'P', 'Kristen', 'Jr. Salak No. 322, Cirebon 62562, JaTim', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(801, 91, 'Tami Yuniar S.Ked', 'Widodo', 'L', 'Hindu', 'Jln. Baranangsiang No. 20, Banjarmasin 32384, Aceh', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(802, 62, 'Bagus Mansur M.Ak', 'Handayani', 'P', 'Islam', 'Psr. Kiaracondong No. 2, Administrasi Jakarta Selatan 60813, SumSel', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(803, 85, 'Bajragin Jarwadi Salahudin', 'Pratiwi', 'L', 'Kristen', 'Ki. Dahlia No. 101, Bau-Bau 33598, JaTeng', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(804, 34, 'Ella Suartini M.Farm', 'Dabukke', 'L', 'Islam', 'Dk. Imam No. 793, Depok 21552, Papua', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(805, 46, 'Kemal Pangestu', 'Siregar', 'P', 'Kristen', 'Psr. Jagakarsa No. 914, Padang 61654, Bengkulu', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(806, 49, 'Bakti Maryadi Mustofa S.Pt', 'Suryatmi', 'L', 'Kristen', 'Ds. Bass No. 977, Padangsidempuan 49801, PapBar', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(807, 19, 'Praba Banara Mansur M.Pd', 'Puspita', 'P', 'Buddha', 'Psr. Gegerkalong Hilir No. 614, Langsa 87784, Aceh', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(808, 36, 'Eva Tari Rahayu', 'Winarno', 'L', 'Buddha', 'Dk. Bak Mandi No. 870, Malang 76691, Gorontalo', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(809, 36, 'Kasiyah Suartini', 'Santoso', 'L', 'Buddha', 'Dk. Suryo Pranoto No. 42, Medan 26403, Banten', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(810, 33, 'Umar Waluyo', 'Manullang', 'P', 'Kristen', 'Psr. Basoka Raya No. 102, Bekasi 40314, Riau', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(811, 43, 'Gantar Wakiman Hutasoit', 'Habibi', 'P', 'Islam', 'Ds. Bappenas No. 271, Bandar Lampung 44298, Papua', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(812, 39, 'Balijan Simbolon', 'Mayasari', 'L', 'Islam', 'Jln. Bata Putih No. 431, Pangkal Pinang 12986, MalUt', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(813, 30, 'Ellis Mulyani', 'Nurdiyanti', 'P', 'Hindu', 'Jr. Haji No. 337, Bekasi 16501, DKI', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(814, 74, 'Kemba Zulkarnain', 'Gunarto', 'P', 'Islam', 'Ki. HOS. Cjokroaminoto (Pasirkaliki) No. 97, Lhokseumawe 10502, KalSel', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(815, 13, 'Wardaya Pangestu Saputra', 'Latupono', 'P', 'Islam', 'Jln. Tubagus Ismail No. 903, Pekalongan 92389, Lampung', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(816, 76, 'Hafshah Winarsih', 'Hardiansyah', 'L', 'Hindu', 'Psr. Barat No. 481, Tual 96421, SulUt', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(817, 49, 'Mila Nova Hariyah S.Sos', 'Saputra', 'P', 'Buddha', 'Jln. Bahagia  No. 903, Pagar Alam 70503, Papua', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(818, 80, 'Siska Winarsih', 'Handayani', 'L', 'Kristen', 'Kpg. Babadan No. 509, Sawahlunto 40793, Banten', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(819, 73, 'Kartika Susanti', 'Salahudin', 'P', 'Hindu', 'Dk. Banal No. 864, Kupang 29237, DIY', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(820, 97, 'Ganda Nugroho', 'Andriani', 'P', 'Islam', 'Dk. Nanas No. 374, Palu 43766, MalUt', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(821, 97, 'Wardaya Utama S.T.', 'Suwarno', 'P', 'Hindu', 'Psr. Sukabumi No. 240, Padang 98242, Riau', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(822, 95, 'Padma Olivia Rahimah S.H.', 'Pranowo', 'L', 'Hindu', 'Dk. M.T. Haryono No. 918, Kediri 32052, JaTim', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(823, 31, 'Amalia Rahimah', 'Gunarto', 'L', 'Hindu', 'Kpg. Banal No. 848, Mojokerto 59465, Riau', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(824, 70, 'Dalima Ilsa Novitasari', 'Suartini', 'P', 'Islam', 'Kpg. Padang No. 290, Jambi 20830, Riau', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(825, 98, 'Maryanto Salahudin', 'Kuswandari', 'P', 'Islam', 'Gg. Madiun No. 754, Sungai Penuh 46958, Riau', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(826, 84, 'Rahmi Carla Yuliarti S.Gz', 'Zulaika', 'P', 'Hindu', 'Jr. Supomo No. 889, Samarinda 64468, MalUt', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(827, 73, 'Jasmin Vivi Uyainah', 'Rajata', 'L', 'Kristen', 'Ds. Karel S. Tubun No. 826, Administrasi Jakarta Utara 99032, Bengkulu', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(828, 31, 'Iriana Safina Hartati', 'Uwais', 'P', 'Hindu', 'Dk. Supono No. 963, Jayapura 70631, Maluku', NULL, '2020-08-16 22:13:13', '2020-08-16 22:13:13'),
(829, 56, 'Ida Mandasari M.TI.', 'Riyanti', 'L', 'Hindu', 'Jr. Babadak No. 244, Jayapura 60261, SumSel', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(830, 15, 'Elvina Yulia Hariyah S.Ked', 'Dabukke', 'L', 'Hindu', 'Jr. Haji No. 515, Administrasi Jakarta Utara 51552, KalTim', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(831, 50, 'Radika Mustofa Damanik', 'Utama', 'L', 'Kristen', 'Kpg. Honggowongso No. 204, Pariaman 97142, Papua', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(832, 25, 'Baktiadi Maheswara S.Ked', 'Nainggolan', 'P', 'Hindu', 'Kpg. Astana Anyar No. 898, Makassar 62986, Gorontalo', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(833, 48, 'Vicky Haryanti', 'Sihotang', 'L', 'Hindu', 'Jr. Ir. H. Juanda No. 773, Bengkulu 14441, PapBar', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(834, 94, 'Tantri Kuswandari S.IP', 'Sirait', 'L', 'Buddha', 'Kpg. Bata Putih No. 172, Pontianak 18580, DIY', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(835, 85, 'Gatra Wage Pratama M.TI.', 'Sihombing', 'L', 'Buddha', 'Psr. Fajar No. 386, Makassar 24542, SumBar', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(836, 71, 'Suci Intan Kuswandari M.Pd', 'Rajata', 'L', 'Hindu', 'Ds. Bazuka Raya No. 397, Makassar 93517, PapBar', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(837, 43, 'Cengkal Wardi Wasita', 'Dabukke', 'L', 'Islam', 'Ki. Basmol Raya No. 833, Parepare 49649, KalBar', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(838, 10, 'Ina Dina Utami S.Pd', 'Zulaika', 'L', 'Hindu', 'Jr. Cikutra Barat No. 644, Lhokseumawe 63518, Aceh', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(839, 53, 'Jumadi Mahfud Tarihoran', 'Permata', 'P', 'Kristen', 'Ki. K.H. Maskur No. 110, Tidore Kepulauan 74905, KalTeng', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(840, 75, 'Mutia Puspita', 'Maulana', 'L', 'Buddha', 'Gg. Raden Saleh No. 414, Cimahi 27520, Banten', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(841, 50, 'Emas Jamal Permadi', 'Mustofa', 'L', 'Buddha', 'Jr. Bakin No. 298, Balikpapan 55408, KalTeng', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(842, 60, 'Jessica Ana Usamah', 'Wijayanti', 'L', 'Buddha', 'Psr. Surapati No. 901, Malang 65070, NTB', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(843, 75, 'Jindra Harjasa Dongoran', 'Hassanah', 'P', 'Buddha', 'Ki. Bambon No. 801, Madiun 30426, NTB', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(844, 70, 'Ghaliyati Lailasari', 'Safitri', 'P', 'Islam', 'Dk. Suryo Pranoto No. 356, Bandung 45430, DIY', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(845, 42, 'Luhung Sitorus', 'Yulianti', 'L', 'Islam', 'Ds. Cikutra Timur No. 966, Payakumbuh 52468, KepR', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(846, 37, 'Jamil Jailani S.Psi', 'Astuti', 'P', 'Islam', 'Kpg. Orang No. 715, Surakarta 33686, Jambi', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(847, 65, 'Wani Ilsa Suartini S.E.', 'Anggraini', 'P', 'Islam', 'Psr. Adisucipto No. 469, Administrasi Jakarta Selatan 55712, JaBar', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(848, 14, 'Zamira Usamah', 'Mansur', 'L', 'Buddha', 'Dk. Baiduri No. 530, Padangsidempuan 77961, KalSel', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(849, 31, 'Sidiq Permadi', 'Saefullah', 'P', 'Kristen', 'Ki. Raden No. 326, Padang 22570, KalUt', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(850, 22, 'Rika Uyainah', 'Wahyudin', 'L', 'Islam', 'Dk. Basudewo No. 413, Bitung 46913, DIY', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(851, 45, 'Umay Adriansyah', 'Iswahyudi', 'L', 'Islam', 'Jr. Muwardi No. 668, Tangerang Selatan 60328, NTT', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(852, 89, 'Hamzah Rosman Sihombing M.TI.', 'Prasetyo', 'L', 'Buddha', 'Psr. Hasanuddin No. 716, Palu 43153, SulUt', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(853, 61, 'Elvina Susanti S.Farm', 'Hariyah', 'P', 'Hindu', 'Psr. Pasteur No. 424, Jambi 20599, SulTra', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(854, 15, 'Zalindra Nasyiah', 'Prayoga', 'L', 'Buddha', 'Ki. Batako No. 40, Langsa 40282, DKI', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(855, 77, 'Raisa Rahmi Mardhiyah', 'Widodo', 'L', 'Buddha', 'Jr. HOS. Cjokroaminoto (Pasirkaliki) No. 740, Depok 27105, JaTim', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(856, 22, 'Ayu Suartini', 'Padmasari', 'L', 'Kristen', 'Jr. Peta No. 809, Padang 65442, JaBar', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(857, 74, 'Yessi Ifa Laksita', 'Halim', 'P', 'Islam', 'Ds. Mahakam No. 448, Sawahlunto 65283, KalUt', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(858, 65, 'Kezia Eli Wastuti', 'Kuswoyo', 'P', 'Buddha', 'Gg. Dewi Sartika No. 805, Pasuruan 56162, JaTim', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(859, 21, 'Maryanto Nainggolan S.E.', 'Pranowo', 'P', 'Hindu', 'Kpg. Flores No. 961, Mataram 84884, SulUt', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(860, 94, 'Restu Purnawati', 'Andriani', 'L', 'Hindu', 'Psr. Zamrud No. 936, Yogyakarta 14102, Bengkulu', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(861, 52, 'Jati Usman Waluyo S.I.Kom', 'Sihotang', 'L', 'Islam', 'Ki. Tangkuban Perahu No. 302, Lhokseumawe 50784, NTB', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(862, 85, 'Jane Lestari', 'Purnawati', 'L', 'Islam', 'Jr. Banal No. 640, Bitung 68702, BaBel', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(863, 75, 'Jinawi Umaya Mansur', 'Usada', 'L', 'Hindu', 'Dk. Suniaraja No. 282, Salatiga 97327, Bali', NULL, '2020-08-16 22:13:14', '2020-08-16 22:13:14'),
(864, 18, 'Asmuni Narpati', 'Wahyudin', 'P', 'Kristen', 'Ki. Tambun No. 404, Binjai 84787, Aceh', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(865, 62, 'Safina Yuliarti', 'Utami', 'L', 'Islam', 'Kpg. Madrasah No. 81, Subulussalam 35521, JaTim', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(866, 90, 'Febi Kuswandari', 'Megantara', 'P', 'Buddha', 'Psr. Dipenogoro No. 125, Subulussalam 65576, KalSel', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(867, 40, 'Bajragin Rizki Januar S.E.', 'Andriani', 'L', 'Islam', 'Psr. Ahmad Dahlan No. 634, Sorong 32234, SulBar', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(868, 43, 'Koko Jail Nugroho S.H.', 'Ardianto', 'L', 'Hindu', 'Jln. Achmad No. 100, Pangkal Pinang 79461, DKI', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(869, 97, 'Balangga Winarno', 'Maryati', 'P', 'Buddha', 'Jr. Baja No. 918, Sungai Penuh 11037, Jambi', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(870, 34, 'Lalita Palastri S.Farm', 'Prayoga', 'P', 'Buddha', 'Gg. Panjaitan No. 9, Yogyakarta 54134, SumSel', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(871, 10, 'Edward Mangunsong', 'Dabukke', 'L', 'Islam', 'Ds. Lada No. 393, Bandar Lampung 61478, MalUt', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(872, 66, 'Yusuf Iswahyudi S.T.', 'Mandasari', 'P', 'Islam', 'Jln. Gedebage Selatan No. 133, Pangkal Pinang 64006, SumUt', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(873, 83, 'Calista Anggraini', 'Firmansyah', 'P', 'Kristen', 'Ki. Rajawali Barat No. 15, Sukabumi 24660, Maluku', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(874, 16, 'Bahuwarna Wijaya S.Sos', 'Lailasari', 'P', 'Kristen', 'Kpg. Bara No. 762, Ternate 77416, KalTim', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(875, 15, 'Waluyo Jasmani Dongoran', 'Thamrin', 'P', 'Buddha', 'Dk. Baranang No. 934, Cimahi 27910, Gorontalo', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(876, 91, 'Dasa Wijaya', 'Oktaviani', 'P', 'Kristen', 'Psr. Uluwatu No. 935, Surabaya 31683, KepR', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(877, 96, 'Radika Bakidin Kusumo', 'Suryatmi', 'L', 'Hindu', 'Dk. Basmol Raya No. 177, Bima 45310, SumSel', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(878, 82, 'Viman Hutapea S.Gz', 'Waluyo', 'P', 'Kristen', 'Kpg. Jagakarsa No. 595, Tanjung Pinang 81226, JaTeng', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(879, 57, 'Ajeng Wijayanti S.E.I', 'Nashiruddin', 'P', 'Islam', 'Dk. Daan No. 207, Gunungsitoli 23586, KalSel', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(880, 85, 'Anggabaya Sitompul', 'Sihombing', 'L', 'Kristen', 'Gg. Salam No. 514, Kediri 84920, Lampung', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(881, 36, 'Ajimin Hardiansyah', 'Suartini', 'P', 'Islam', 'Psr. Abang No. 245, Ambon 75876, Lampung', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(882, 10, 'Ifa Fujiati M.Kom.', 'Palastri', 'P', 'Buddha', 'Psr. Perintis Kemerdekaan No. 268, Bandung 58856, Banten', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(883, 58, 'Cemani Hutasoit', 'Mustofa', 'P', 'Islam', 'Gg. Bazuka Raya No. 443, Pasuruan 15007, SumSel', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(884, 37, 'Prasetya Dongoran', 'Wahyudin', 'P', 'Hindu', 'Jln. Sadang Serang No. 263, Bengkulu 49248, Banten', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(885, 62, 'Sabri Jailani', 'Kuswoyo', 'P', 'Kristen', 'Kpg. Barasak No. 293, Sabang 24706, DKI', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(886, 14, 'Ilsa Yulianti', 'Kusmawati', 'L', 'Buddha', 'Kpg. Cokroaminoto No. 87, Kediri 47464, SumUt', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(887, 59, 'Omar Soleh Dabukke M.TI.', 'Maulana', 'L', 'Islam', 'Ki. Baja Raya No. 731, Banjarmasin 64712, SulTra', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(888, 30, 'Tantri Puspita', 'Wijaya', 'P', 'Buddha', 'Dk. Bappenas No. 246, Payakumbuh 91602, NTB', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(889, 22, 'Rangga Raihan Iswahyudi S.E.', 'Hutagalung', 'P', 'Buddha', 'Jln. Kyai Mojo No. 875, Administrasi Jakarta Barat 58899, SulTra', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(890, 11, 'Jindra Lazuardi', 'Wibowo', 'L', 'Kristen', 'Jln. Monginsidi No. 67, Administrasi Jakarta Utara 41194, KalTeng', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(891, 25, 'Salsabila Nuraini', 'Puspasari', 'L', 'Kristen', 'Ds. Ronggowarsito No. 301, Sabang 25356, Jambi', NULL, '2020-08-16 22:13:15', '2020-08-16 22:13:15'),
(892, 62, 'Titin Purwanti S.Psi', 'Nasyidah', 'P', 'Buddha', 'Psr. Cikutra Timur No. 604, Subulussalam 60520, SumSel', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(893, 56, 'Pranata Tarihoran', 'Yuliarti', 'P', 'Kristen', 'Gg. Baan No. 624, Surabaya 36928, JaTim', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(894, 65, 'Warji Anggriawan', 'Ramadan', 'P', 'Buddha', 'Jr. Laswi No. 57, Sibolga 10214, NTB', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(895, 91, 'Puji Rahmawati S.H.', 'Mansur', 'P', 'Kristen', 'Kpg. Halim No. 760, Bengkulu 61509, JaTim', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(896, 19, 'Restu Prastuti', 'Mulyani', 'L', 'Buddha', 'Dk. Madiun No. 620, Blitar 19472, KalBar', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(897, 42, 'Betania Mulyani', 'Safitri', 'P', 'Islam', 'Dk. Bawal No. 340, Kendari 57978, Bengkulu', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(898, 72, 'Anastasia Ulya Rahimah S.Psi', 'Nababan', 'P', 'Hindu', 'Ds. Bak Mandi No. 263, Malang 39866, SumBar', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(899, 57, 'Lasmanto Winarno', 'Suwarno', 'L', 'Buddha', 'Kpg. Bacang No. 982, Denpasar 47428, PapBar', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(900, 15, 'Humaira Oktaviani', 'Permadi', 'L', 'Islam', 'Ds. Uluwatu No. 894, Depok 86671, SumUt', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(901, 85, 'Ina Laksmiwati', 'Sihotang', 'L', 'Islam', 'Ki. Yosodipuro No. 721, Tasikmalaya 84231, SulBar', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(902, 68, 'Devi Mandasari S.Psi', 'Lestari', 'P', 'Kristen', 'Psr. Cihampelas No. 889, Bau-Bau 25119, SulUt', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(903, 28, 'Vinsen Lanang Maulana M.Farm', 'Pertiwi', 'P', 'Buddha', 'Jln. Jayawijaya No. 83, Kediri 58900, MalUt', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(904, 47, 'Yessi Zulaikha Hasanah', 'Hasanah', 'P', 'Kristen', 'Ds. Padang No. 85, Batu 97199, Gorontalo', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(905, 40, 'Intan Julia Suryatmi S.Sos', 'Halimah', 'L', 'Buddha', 'Jln. Untung Suropati No. 270, Lubuklinggau 33038, SumSel', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(906, 35, 'Irfan Wijaya', 'Riyanti', 'L', 'Buddha', 'Jln. Raya Setiabudhi No. 500, Sorong 70437, Bali', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(907, 78, 'Nasim Kuswoyo', 'Pertiwi', 'L', 'Islam', 'Jln. Cikapayang No. 843, Subulussalam 23584, SumSel', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(908, 21, 'Karimah Nasyiah', 'Farida', 'P', 'Hindu', 'Psr. Raya Ujungberung No. 355, Salatiga 81449, Jambi', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(909, 51, 'Paris Mala Safitri', 'Sirait', 'P', 'Buddha', 'Ki. Bawal No. 550, Tanjungbalai 67527, SulSel', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(910, 75, 'Putri Hartati', 'Suwarno', 'L', 'Hindu', 'Gg. Kyai Mojo No. 73, Tebing Tinggi 96646, SulTra', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(911, 75, 'Dono Bala Dabukke', 'Samosir', 'L', 'Islam', 'Dk. Sudirman No. 903, Langsa 54171, SumUt', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(912, 14, 'Jaya Karman Tarihoran S.Psi', 'Hakim', 'P', 'Buddha', 'Gg. Bata Putih No. 789, Pematangsiantar 23410, Bali', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(913, 18, 'Jindra Saefullah', 'Marpaung', 'P', 'Hindu', 'Gg. Bak Mandi No. 573, Solok 92235, SumBar', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(914, 85, 'Anggabaya Tampubolon', 'Gunawan', 'L', 'Hindu', 'Gg. Sugiono No. 902, Administrasi Jakarta Selatan 94852, SulTeng', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(915, 69, 'Cinthia Jane Hastuti S.E.', 'Hartati', 'P', 'Buddha', 'Gg. Cemara No. 834, Tegal 99601, SulBar', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(916, 15, 'Lasmono Firmansyah', 'Yuliarti', 'L', 'Hindu', 'Kpg. Muwardi No. 361, Tanjungbalai 70090, Jambi', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(917, 28, 'Rina Yuniar', 'Nuraini', 'P', 'Islam', 'Gg. K.H. Wahid Hasyim (Kopo) No. 280, Bau-Bau 97559, SulUt', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(918, 70, 'Victoria Pratiwi M.TI.', 'Zulkarnain', 'P', 'Kristen', 'Psr. Basudewo No. 867, Bandar Lampung 22731, SulBar', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(919, 100, 'Caturangga Maryadi', 'Napitupulu', 'L', 'Buddha', 'Ki. Bak Air No. 611, Serang 64143, KalBar', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(920, 63, 'Ana Rahimah S.Psi', 'Winarsih', 'L', 'Hindu', 'Ki. Gremet No. 522, Ternate 44077, Maluku', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(921, 32, 'Ika Eli Zulaika', 'Puspasari', 'L', 'Kristen', 'Ki. Padma No. 990, Cimahi 49313, Banten', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(922, 95, 'Sabri Mandala', 'Mansur', 'L', 'Islam', 'Jln. Nanas No. 815, Serang 49717, SumUt', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(923, 61, 'Kardi Permadi M.Kom.', 'Lailasari', 'P', 'Islam', 'Kpg. Wahid Hasyim No. 216, Administrasi Jakarta Selatan 70622, KalTeng', NULL, '2020-08-16 22:13:16', '2020-08-16 22:13:16'),
(924, 77, 'Ganjaran Cager Hutasoit M.Pd', 'Hastuti', 'P', 'Kristen', 'Ds. Sentot Alibasa No. 530, Padangpanjang 36532, Banten', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(925, 96, 'Uda Hutasoit', 'Rahmawati', 'P', 'Hindu', 'Gg. Industri No. 36, Bima 31762, KalTim', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(926, 86, 'Muni Hutasoit', 'Andriani', 'P', 'Islam', 'Dk. Cut Nyak Dien No. 971, Surakarta 29060, SulUt', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(927, 13, 'Banawa Budiyanto', 'Prasetya', 'L', 'Islam', 'Ds. Madiun No. 914, Administrasi Jakarta Utara 79242, Banten', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(928, 99, 'Eko Tampubolon', 'Megantara', 'P', 'Buddha', 'Jln. Tambak No. 807, Bima 46684, KalSel', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(929, 93, 'Ifa Rahimah', 'Permata', 'P', 'Islam', 'Ds. Bambu No. 717, Malang 89585, JaBar', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(930, 72, 'Natalia Aryani', 'Aryani', 'P', 'Islam', 'Ki. Yos No. 69, Balikpapan 15364, Lampung', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(931, 66, 'Budi Tamba', 'Hassanah', 'L', 'Kristen', 'Jln. Dewi Sartika No. 250, Ternate 14312, SulTra', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(932, 20, 'Eka Novitasari', 'Tamba', 'L', 'Islam', 'Gg. Rajawali Timur No. 262, Binjai 73806, PapBar', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(933, 44, 'Gaduh Waskita', 'Mardhiyah', 'L', 'Kristen', 'Jln. Bara Tambar No. 831, Parepare 68876, DIY', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(934, 97, 'Paulin Lestari', 'Usada', 'L', 'Hindu', 'Jln. Agus Salim No. 372, Padang 68554, KalTim', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(935, 91, 'Hendri Sabri Saragih', 'Hardiansyah', 'L', 'Islam', 'Gg. Bakhita No. 598, Sorong 13543, Bali', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(936, 23, 'Jefri Narpati M.M.', 'Suryatmi', 'P', 'Kristen', 'Psr. Agus Salim No. 21, Tangerang 43912, JaBar', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(937, 62, 'Taufik Banawi Mangunsong', 'Hassanah', 'P', 'Islam', 'Ki. Babakan No. 895, Surakarta 22095, Banten', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(938, 80, 'Ida Uyainah S.Pd', 'Saefullah', 'L', 'Islam', 'Ds. Lembong No. 378, Kediri 33936, KalTeng', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(939, 12, 'Reza Sihombing', 'Oktaviani', 'P', 'Kristen', 'Jln. Haji No. 871, Magelang 12053, SulUt', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(940, 70, 'Indra Sinaga M.Pd', 'Nuraini', 'L', 'Buddha', 'Kpg. Jend. A. Yani No. 742, Pekanbaru 80963, KalSel', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(941, 78, 'Malika Wastuti', 'Lestari', 'L', 'Hindu', 'Psr. Bawal No. 790, Pangkal Pinang 81445, Maluku', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(942, 29, 'Kamal Asirwanda Utama M.Farm', 'Pranowo', 'L', 'Hindu', 'Dk. Basuki Rahmat  No. 309, Administrasi Jakarta Selatan 96255, JaTim', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(943, 48, 'Sabrina Susanti', 'Wijayanti', 'L', 'Kristen', 'Jln. Veteran No. 864, Administrasi Jakarta Selatan 88127, KalUt', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(944, 24, 'Ihsan Budi Tampubolon', 'Yolanda', 'P', 'Kristen', 'Jr. K.H. Maskur No. 179, Tanjung Pinang 77242, SumUt', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(945, 95, 'Cindy Ghaliyati Farida S.Pd', 'Permata', 'P', 'Hindu', 'Ki. Otto No. 1, Sibolga 87242, Riau', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(946, 32, 'Hani Prastuti S.Kom', 'Januar', 'L', 'Buddha', 'Ds. Otista No. 953, Medan 33317, SumUt', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(947, 74, 'Margana Januar', 'Melani', 'L', 'Kristen', 'Kpg. Yogyakarta No. 791, Mojokerto 54140, JaTim', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(948, 27, 'Ega Gunawan', 'Maheswara', 'P', 'Islam', 'Jln. Adisumarmo No. 323, Probolinggo 70091, Papua', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(949, 69, 'Danu Sitorus', 'Winarsih', 'P', 'Kristen', 'Ds. Ters. Jakarta No. 509, Tangerang Selatan 56402, KalTim', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(950, 42, 'Gawati Hastuti', 'Yulianti', 'P', 'Islam', 'Ki. Fajar No. 967, Jayapura 66618, JaBar', NULL, '2020-08-16 22:13:17', '2020-08-16 22:13:17'),
(951, 22, 'Dewi Puput Susanti', 'Pratiwi', 'L', 'Hindu', 'Dk. Cikapayang No. 343, Surakarta 22714, Bali', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(952, 42, 'Mariadi Sitompul', 'Pudjiastuti', 'P', 'Buddha', 'Kpg. Abang No. 571, Serang 25715, Lampung', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(953, 77, 'Ilsa Wahyuni', 'Nuraini', 'L', 'Kristen', 'Kpg. Ters. Jakarta No. 686, Banda Aceh 16950, DKI', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(954, 73, 'Samsul Bajragin Wijaya', 'Permata', 'L', 'Islam', 'Dk. Suryo No. 134, Tanjung Pinang 72768, SulTeng', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(955, 86, 'Bakti Edi Ramadan', 'Kuswandari', 'P', 'Hindu', 'Psr. Astana Anyar No. 954, Pagar Alam 64741, SulBar', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(956, 12, 'Rahmat Dadi Rajata', 'Melani', 'P', 'Kristen', 'Kpg. Achmad Yani No. 781, Sorong 48009, SulUt', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(957, 67, 'Sarah Mandasari', 'Suartini', 'L', 'Islam', 'Dk. Cemara No. 531, Bandar Lampung 10712, KepR', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(958, 98, 'Cakrabirawa Najmudin', 'Andriani', 'L', 'Islam', 'Dk. K.H. Wahid Hasyim (Kopo) No. 271, Tomohon 93430, Jambi', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(959, 16, 'Eka Ana Oktaviani S.Psi', 'Namaga', 'L', 'Islam', 'Jr. Sutami No. 614, Salatiga 51615, JaTim', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(960, 53, 'Queen Pudjiastuti', 'Simanjuntak', 'P', 'Hindu', 'Kpg. Bakau Griya Utama No. 581, Sabang 23819, Riau', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(961, 59, 'Cakrawala Parman Mangunsong', 'Pertiwi', 'P', 'Buddha', 'Psr. Dewi Sartika No. 33, Tasikmalaya 20800, SulTeng', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(962, 81, 'Galiono Balapati Putra M.Kom.', 'Mahendra', 'P', 'Islam', 'Kpg. Ir. H. Juanda No. 566, Kotamobagu 73956, DKI', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(963, 89, 'Pranawa Widodo S.Sos', 'Rahmawati', 'P', 'Islam', 'Gg. Samanhudi No. 163, Sorong 78265, KalTim', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(964, 42, 'Ana Oktaviani S.H.', 'Agustina', 'P', 'Islam', 'Ds. Wahidin No. 922, Banjarbaru 45899, JaTim', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(965, 31, 'Leo Anggriawan', 'Pradipta', 'P', 'Buddha', 'Psr. Abdul Rahmat No. 359, Bukittinggi 70678, BaBel', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(966, 45, 'Ira Padmasari', 'Puspita', 'L', 'Islam', 'Gg. Baha No. 917, Pasuruan 27280, PapBar', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(967, 28, 'Ayu Ella Aryani', 'Hastuti', 'P', 'Kristen', 'Psr. Rajiman No. 323, Cilegon 28632, Riau', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(968, 41, 'Julia Aryani', 'Hasanah', 'P', 'Hindu', 'Psr. Bakit  No. 274, Palembang 27902, NTT', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(969, 21, 'Raina Wijayanti', 'Hakim', 'P', 'Buddha', 'Kpg. Padang No. 926, Administrasi Jakarta Barat 26690, KalTeng', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18');
INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `gambar`, `created_at`, `updated_at`) VALUES
(970, 90, 'Intan Ophelia Winarsih S.Psi', 'Susanti', 'L', 'Islam', 'Jr. Tubagus Ismail No. 180, Tangerang 32422, SulBar', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(971, 17, 'Bagiya Hakim M.TI.', 'Setiawan', 'P', 'Buddha', 'Dk. Yohanes No. 559, Lhokseumawe 87586, SulBar', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(972, 80, 'Lukman Pradipta', 'Wibowo', 'P', 'Hindu', 'Gg. Basoka Raya No. 494, Sabang 38011, KalSel', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(973, 77, 'Garan Agus Anggriawan', 'Maheswara', 'L', 'Buddha', 'Ds. Baranang Siang Indah No. 126, Kotamobagu 59979, Riau', NULL, '2020-08-16 22:13:18', '2020-08-16 22:13:18'),
(974, 80, 'Iriana Kuswandari', 'Usada', 'L', 'Islam', 'Kpg. Ters. Kiaracondong No. 583, Administrasi Jakarta Timur 82330, Riau', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(975, 27, 'Jayadi Firgantoro', 'Fujiati', 'P', 'Buddha', 'Dk. Basket No. 649, Cimahi 52777, NTB', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(976, 67, 'Hana Hariyah', 'Mandasari', 'P', 'Buddha', 'Ds. Achmad No. 767, Serang 76188, JaBar', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(977, 18, 'Enteng Eluh Dabukke', 'Lailasari', 'P', 'Kristen', 'Kpg. Ketandan No. 336, Bengkulu 69233, KalTeng', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(978, 59, 'Embuh Saptono M.Ak', 'Purnawati', 'L', 'Hindu', 'Jln. Elang No. 682, Pekanbaru 31558, DIY', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(979, 34, 'Warta Surya Waskita', 'Jailani', 'L', 'Islam', 'Dk. Ciumbuleuit No. 202, Ternate 29160, KalUt', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(980, 62, 'Vicky Ana Lestari S.Sos', 'Pertiwi', 'L', 'Buddha', 'Ki. Madrasah No. 748, Surabaya 72306, SulBar', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(981, 27, 'Jaka Saputra S.T.', 'Hassanah', 'P', 'Buddha', 'Kpg. Achmad Yani No. 625, Kotamobagu 99301, SumUt', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(982, 25, 'Cindy Ilsa Yuliarti S.I.Kom', 'Zulaika', 'P', 'Hindu', 'Ds. Rajawali No. 417, Yogyakarta 66523, Banten', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(983, 59, 'Jais Maulana', 'Megantara', 'P', 'Buddha', 'Jr. Tentara Pelajar No. 830, Cimahi 17790, NTB', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(984, 18, 'Umi Sudiati', 'Widiastuti', 'L', 'Islam', 'Gg. Imam No. 970, Bukittinggi 12648, SumSel', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(985, 67, 'Ayu Farida', 'Nainggolan', 'L', 'Islam', 'Ki. Ters. Jakarta No. 886, Administrasi Jakarta Timur 84194, SulTra', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(986, 83, 'Vanesa Novitasari', 'Dabukke', 'L', 'Kristen', 'Jln. K.H. Maskur No. 238, Banjarmasin 34934, MalUt', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(987, 90, 'Estiawan Hutapea', 'Novitasari', 'L', 'Kristen', 'Jln. Sutami No. 123, Banjarbaru 38495, KalBar', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(988, 51, 'Murti Sihombing', 'Wijaya', 'L', 'Islam', 'Ds. Suprapto No. 581, Cirebon 31595, Banten', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(989, 56, 'Almira Kuswandari', 'Prastuti', 'P', 'Islam', 'Psr. Astana Anyar No. 879, Sukabumi 30035, JaTim', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(990, 78, 'Hendra Saragih S.T.', 'Nurdiyanti', 'L', 'Islam', 'Jln. Baan No. 550, Solok 10125, DIY', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(991, 20, 'Koko Firgantoro', 'Saragih', 'L', 'Buddha', 'Gg. Lada No. 29, Batam 40824, SulUt', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(992, 59, 'Kemba Irawan', 'Puspasari', 'L', 'Kristen', 'Dk. Gremet No. 267, Jambi 15639, SumBar', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(993, 18, 'Karsa Narpati', 'Fujiati', 'P', 'Islam', 'Jr. Reksoninten No. 576, Banjarmasin 14928, SulTra', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(994, 57, 'Nilam Riyanti', 'Rahimah', 'P', 'Kristen', 'Psr. Diponegoro No. 325, Palu 63586, DKI', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(995, 71, 'Novi Cindy Lestari M.M.', 'Prayoga', 'L', 'Buddha', 'Gg. Orang No. 840, Tangerang 93567, NTT', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(996, 35, 'Rafi Sitorus S.Pt', 'Handayani', 'L', 'Buddha', 'Psr. Sukajadi No. 318, Prabumulih 84862, NTT', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(997, 26, 'Icha Suartini', 'Nuraini', 'P', 'Kristen', 'Jln. Baya Kali Bungur No. 318, Pekanbaru 19249, Banten', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(998, 25, 'Amelia Handayani', 'Haryanto', 'P', 'Buddha', 'Kpg. Radio No. 413, Kotamobagu 50558, JaTeng', NULL, '2020-08-16 22:13:19', '2020-08-16 22:13:19'),
(999, 72, 'Karya Mahendra S.I.Kom', 'Suwarno', 'P', 'Hindu', 'Jr. Gatot Subroto No. 897, Palopo 84788, JaTim', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1000, 22, 'Leo Prasetyo', 'Utama', 'L', 'Buddha', 'Jln. S. Parman No. 878, Batam 50376, Aceh', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1001, 76, 'Atmaja Waskita', 'Prasasta', 'P', 'Buddha', 'Kpg. Bah Jaya No. 362, Sorong 89405, Gorontalo', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1002, 53, 'Eka Febi Haryanti M.Farm', 'Tarihoran', 'L', 'Kristen', 'Kpg. Achmad Yani No. 846, Pekalongan 14034, NTB', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1003, 74, 'Daliono Salahudin', 'Safitri', 'L', 'Hindu', 'Kpg. R.M. Said No. 100, Sungai Penuh 42817, Bengkulu', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1004, 63, 'Ratna Clara Prastuti', 'Suartini', 'L', 'Islam', 'Jr. Pasirkoja No. 330, Ternate 96500, SulBar', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1005, 64, 'Caraka Prasetya', 'Manullang', 'L', 'Buddha', 'Ds. Bara No. 263, Tanjungbalai 50269, NTT', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1006, 19, 'Samsul Bahuwarna Samosir M.Pd', 'Anggriawan', 'L', 'Islam', 'Jr. Veteran No. 500, Mataram 97602, SulUt', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1007, 59, 'Samiah Laksmiwati', 'Prabowo', 'L', 'Hindu', 'Jr. Dago No. 830, Denpasar 78790, KepR', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1008, 22, 'Malika Aryani', 'Yuliarti', 'P', 'Kristen', 'Psr. Cut Nyak Dien No. 141, Pematangsiantar 36372, DKI', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1009, 53, 'Kasiyah Suartini', 'Pangestu', 'L', 'Islam', 'Ds. Bak Air No. 685, Palangka Raya 10548, Jambi', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1010, 28, 'Ade Utami M.Pd', 'Mahendra', 'L', 'Buddha', 'Psr. Surapati No. 474, Palangka Raya 20523, BaBel', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1011, 73, 'Harsaya Saragih S.H.', 'Uwais', 'P', 'Islam', 'Gg. Uluwatu No. 23, Lubuklinggau 18343, SumUt', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1012, 55, 'Yoga Perkasa Maryadi', 'Sihombing', 'P', 'Islam', 'Ds. Bagonwoto  No. 62, Singkawang 39224, KepR', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1013, 97, 'Alika Jane Anggraini S.E.', 'Gunawan', 'P', 'Islam', 'Psr. Abdul Muis No. 34, Palangka Raya 67468, Lampung', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1014, 15, 'Vino Sihotang', 'Jailani', 'P', 'Islam', 'Jr. Babakan No. 791, Pasuruan 84570, KalBar', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1015, 28, 'Candrakanta Prayoga', 'Putra', 'L', 'Kristen', 'Gg. Abdul Muis No. 539, Salatiga 53988, Aceh', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1016, 50, 'Maida Laksita', 'Astuti', 'L', 'Hindu', 'Kpg. Sugiyopranoto No. 350, Bengkulu 52735, MalUt', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1017, 26, 'Uli Zulaika S.Ked', 'Mandala', 'L', 'Hindu', 'Jr. Bakin No. 533, Pekalongan 71642, Riau', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1018, 60, 'Paris Wijayanti', 'Narpati', 'L', 'Kristen', 'Psr. Cikutra Barat No. 935, Pagar Alam 31384, SumUt', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1019, 71, 'Nasim Narpati S.E.I', 'Saputra', 'L', 'Hindu', 'Dk. Babakan No. 346, Bekasi 59970, DIY', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1020, 86, 'Silvia Yuliarti', 'Yolanda', 'P', 'Buddha', 'Jln. Imam Bonjol No. 736, Palu 69467, NTB', NULL, '2020-08-16 22:13:20', '2020-08-16 22:13:20'),
(1021, 42, 'Ganda Kasusra Mustofa M.Farm', 'Hassanah', 'P', 'Islam', 'Ki. Supomo No. 683, Prabumulih 97109, JaTeng', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1022, 65, 'Fathonah Ina Haryanti', 'Laksita', 'L', 'Islam', 'Ds. Bakaru No. 500, Bau-Bau 36578, Bali', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1023, 79, 'Lanjar Cayadi Pradipta S.IP', 'Sitorus', 'L', 'Islam', 'Jln. Yap Tjwan Bing No. 552, Kendari 64301, KalTim', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1024, 63, 'Johan Wibowo', 'Sihombing', 'L', 'Islam', 'Kpg. Cihampelas No. 787, Tebing Tinggi 51910, Banten', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1025, 55, 'Gadang Baktiono Nainggolan M.Farm', 'Yuliarti', 'P', 'Buddha', 'Jln. Sumpah Pemuda No. 259, Administrasi Jakarta Timur 70532, KalTeng', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1026, 58, 'Putri Permata', 'Riyanti', 'P', 'Buddha', 'Psr. Agus Salim No. 497, Parepare 51893, MalUt', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1027, 23, 'Legawa Dongoran', 'Zulaika', 'L', 'Hindu', 'Ki. Sutan Syahrir No. 370, Manado 55314, KalSel', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1028, 100, 'Eluh Budiyanto M.Farm', 'Winarsih', 'P', 'Kristen', 'Ds. Dr. Junjunan No. 87, Cimahi 38616, KalSel', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1029, 51, 'Mala Rahayu', 'Halimah', 'L', 'Islam', 'Gg. Raden No. 834, Magelang 63325, KepR', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1030, 22, 'Vino Dabukke', 'Simbolon', 'P', 'Kristen', 'Gg. Setiabudhi No. 37, Depok 68045, BaBel', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1031, 99, 'Kenes Raditya Mangunsong', 'Pranowo', 'L', 'Kristen', 'Gg. Lada No. 534, Tidore Kepulauan 27937, Lampung', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1032, 28, 'Luhung Rangga Siregar', 'Riyanti', 'P', 'Kristen', 'Ds. Adisucipto No. 164, Prabumulih 27399, Bengkulu', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1033, 83, 'Harto Ardianto', 'Siregar', 'L', 'Hindu', 'Jln. Antapani Lama No. 565, Surabaya 30056, JaTeng', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1034, 34, 'Keisha Mulyani M.Pd', 'Lailasari', 'L', 'Hindu', 'Gg. Sutami No. 295, Depok 66229, KepR', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1035, 25, 'Sarah Yani Nuraini', 'Rahayu', 'P', 'Hindu', 'Ds. Jakarta No. 280, Tanjungbalai 46373, KalUt', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1036, 72, 'Lutfan Narpati', 'Zulaika', 'L', 'Islam', 'Ds. Sutoyo No. 855, Langsa 37553, KalSel', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1037, 81, 'Gangsa Edi Suwarno M.M.', 'Palastri', 'P', 'Islam', 'Kpg. Ters. Pasir Koja No. 37, Gorontalo 88896, SumBar', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1038, 14, 'Laswi Maras Tampubolon', 'Riyanti', 'P', 'Islam', 'Kpg. Baja Raya No. 184, Palembang 18820, DIY', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1039, 52, 'Ozy Sinaga', 'Firmansyah', 'L', 'Islam', 'Dk. Qrisdoren No. 781, Palembang 40214, Bengkulu', NULL, '2020-08-16 22:13:21', '2020-08-16 22:13:21'),
(1040, 76, 'Gilang Gilang Sitorus M.Farm', 'Lailasari', 'L', 'Hindu', 'Psr. Tubagus Ismail No. 586, Makassar 48953, Riau', NULL, '2020-08-16 22:13:22', '2020-08-16 22:13:22'),
(1041, 20, 'Banawi Waskita', 'Tampubolon', 'L', 'Hindu', 'Gg. Lembong No. 53, Bekasi 20870, SulSel', NULL, '2020-08-16 22:13:22', '2020-08-16 22:13:22'),
(1042, 73, 'Lurhur Latupono', 'Nurdiyanti', 'L', 'Hindu', 'Ds. Sutoyo No. 394, Bekasi 77796, Lampung', NULL, '2020-08-16 22:13:22', '2020-08-16 22:13:22'),
(1043, 29, 'Labuh Ega Latupono S.T.', 'Puspasari', 'P', 'Islam', 'Dk. Laswi No. 486, Surabaya 50138, SumUt', NULL, '2020-08-16 22:13:22', '2020-08-16 22:13:22'),
(1048, 12, 'Diah Wulansari', 'Al', 'P', 'Islam', 'Jl. Pemuda Tangerang', NULL, '2020-08-17 07:23:29', '2020-08-17 07:23:29'),
(1049, 12, 'Siti Aulia', 'Al', 'P', 'Islam', 'Jl. Merdeka', NULL, '2020-08-17 07:23:29', '2020-08-17 07:23:29'),
(1050, 12, 'Anisa Fitri', 'Al', 'P', 'Islam', 'Jl. Utama Jakarta Pusat', NULL, '2020-08-17 07:23:29', '2020-08-17 07:23:29'),
(1051, 12, 'Wawan Kurniawan', 'Al', 'L', 'Islam', 'Jl. Kedaung Barat', NULL, '2020-08-17 07:23:29', '2020-08-17 07:23:29'),
(1052, 12, 'Galang Sahri', 'Al', 'L', 'Islam', 'Jl. Merdeka Barat', NULL, '2020-08-17 07:23:29', '2020-08-17 07:23:29'),
(1054, 16, 'Armand', 'Maulana', 'L', 'Islam', 'Bandung', NULL, '2020-08-19 01:50:36', '2020-08-19 01:50:36'),
(1055, 17, 'Nana', 'Ramadani', 'P', 'Islam', 'Jakarta', NULL, '2020-08-19 02:24:11', '2020-08-19 02:24:11'),
(1056, 18, 'Lia', 'Andini', 'P', 'Islam', 'Tangerang', NULL, '2020-08-19 02:30:39', '2020-08-19 02:30:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'gian', 'gian@gmail.com', NULL, '$2y$10$QNsmPT8u9/OZD/.ztuAifexQI96a2ecgO6ZGUSRmy1vx9V9lFdzBC', '7Gsl1jHq5SoDXS6XrMHihIJXQ6SV1hQuu1TydZJw81dE966RaG9yjZP2HOIv', '2020-08-10 21:00:23', '2020-08-10 21:00:23'),
(2, 'siswa', 'Mila', 'mila@gmail.com', NULL, '$2y$10$/o.H5EbusHA684AQ5m3xdecOcYAXO1RWLGnb0tUXgYrELdjMfiGue', 'OT0KsON7PlNLKo7KWzLvazO34bzW7XXLdqHgNourxgjMkyFFP4EQzIONhrwK', '2020-08-11 07:07:45', '2020-08-11 07:07:45'),
(3, 'siswa', 'Ahmad', 'ahmad@gmail.com', NULL, '$2y$10$dgK7c.oko422.tfVIOtHrufLzU5X/HHh/1RLV2eB0OsrBG.Rx.vXq', 'qrBqEmeeLB91Pt0JDkxt9M9I1rXtCi0gWQswp9u2uC7FiJQHNE6avRsg8WTg', '2020-08-11 07:56:43', '2020-08-11 07:56:43'),
(4, 'siswa', 'hadi', 'hadi@gmail.com', NULL, '$2y$10$o1dXPju7703ZKaY3h25lHuu3H6ugOcHAg5jS59GYAFHlO4BMWPN.y', 'VF6GxCtoIuSeG5aPcAlCeiQAxqGiY9phZ9gIW9n9xosv6bMAzBoX6i6q5dGT', '2020-08-14 01:50:34', '2020-08-14 01:50:34'),
(5, 'siswa', 'angga', 'angga@gmail.com', NULL, '$2y$10$rKZ7MZd1.HnAZ3vVLNABmuU1tDHEgNj7.YjL4QbTYZM8WUBooBR6a', 'WHhw4F8YuaXDGVGKbno0689aaft7YLWGdexJcG2Q30qi8gGhq6lCEqKVCmlD', '2020-08-14 02:18:19', '2020-08-14 02:18:19'),
(6, 'siswa', 'dina', 'dina@gmail.com', NULL, '$2y$10$YkJhlBi3VTJdJVn5fmx2TeGU7eSoMCo1p1I1skwZ6nCaAn04Pt2Ym', 'l50NczhqbTLROp4oYjYT2f349lueU6x1dg8PKhdzrJKOpc8QlNzGTtwttNfy', '2020-08-14 02:28:34', '2020-08-14 02:28:34'),
(7, 'siswa', 'hadi', 's@gmail.com', NULL, '$2y$10$/rDDcUgaGMYN02LMKHYmCuJKzYoapMv4hkL60oHr/TiotE5W8CPZK', '7YK3jHCJA5zIgY9Dr7XmO8G8WiryACssQobLa4d3vqpJauSWkexxmODu5r97', '2020-08-14 02:30:07', '2020-08-14 02:30:07'),
(8, 'siswa', 'Sandi', 'sandi@gmail.com', NULL, '$2y$10$1B0/18HfYFJNAoX.idEXquUJAlw4hq6zPm5EukNi709Ku6nhJTJai', 'J2RVbn1mK5R1TajFMr0ftYSeC3BL94Nf2gwxyYbSZsrl7ksCxIOntBpAX0yq', '2020-08-14 02:40:19', '2020-08-14 02:40:19'),
(16, 'siswa', 'Armand', 'armand@gmail.com', NULL, '$2y$10$O2tf8WZV7UhmgmIMVSOMWu3lVsHr/.puX11eGTDr000rqlgV98Hay', 'AWfftVG96MWE2gn1iaIqZx86sUdvM4x87DryqMGh0hy2fQxrsJbwgw97Ui9L', '2020-08-19 01:50:36', '2020-08-19 01:50:36'),
(17, 'siswa', 'Nana', 'nana@gmail.com', NULL, '$2y$10$KBabrUzjIajR2N/e1W6q6elz4X1XayA82exBNj2wRE4nWhHKGDH4C', '5YGG1eEdZXlZWMAiYpkG1HbAMVEudrTZi5HI4giLy72hmJBotU51GtGyxec9', '2020-08-19 02:24:11', '2020-08-19 02:24:11'),
(18, 'siswa', 'Lia', 'liat@gmail.com', NULL, '$2y$10$QCDrUDgczVYya7xMlzrJ1.3t00qSifEAOb.qqyf7yFEoqVQyLwxcC', 'PSs31a60SG0bIKYIhDq8AVOo9yEPeuV23XymD8DmHEyCewcXDTIiAfrEw2SU', '2020-08-19 02:30:39', '2020-08-19 02:30:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mapel_guru_id_foreign` (`guru_id`);

--
-- Indexes for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1057;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mapel`
--
ALTER TABLE `mapel`
  ADD CONSTRAINT `mapel_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
