-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 31 Des 2019 pada 07.49
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_onlinestore`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `checkout`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `checkout` (
`id_checkout` varchar(191)
,`nama_produk` varchar(191)
,`harga` float
,`gambar` varchar(191)
,`jumlah` int(11)
,`nama_user` varchar(191)
,`id_user` varchar(191)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_checkout`
--

CREATE TABLE `detail_checkout` (
  `id_checkout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `keranjang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `keranjang` (
`id_keranjang` bigint(20) unsigned
,`nama_user` varchar(191)
,`nama_produk` varchar(191)
,`harga` float
,`gambar` varchar(191)
,`jumlah` int(11)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_produk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` float NOT NULL,
  `gambar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`id`, `nama_produk`, `harga`, `gambar`) VALUES
(2, 'HP', 2000000, '1577020453_hp.jpg'),
(3, 'Gitar', 1000000, '1577020482_gitar.jpg'),
(5, 'Baju', 400000, '1577020547_baju.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_checkout`
--

CREATE TABLE `tbl_checkout` (
  `id_checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_checkout`
--

INSERT INTO `tbl_checkout` (`id_checkout`, `id_user`, `total`) VALUES
('7579635671411641502803147412', '1', 0),
('10479864552097247479113717699', '1', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_keranjang`
--

CREATE TABLE `tbl_keranjang` (
  `id_keranjang` bigint(20) UNSIGNED NOT NULL,
  `id_user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_barang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_konfirmasi`
--

CREATE TABLE `tbl_konfirmasi` (
  `id_konfirmasi` bigint(20) UNSIGNED NOT NULL,
  `id_user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bukti` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_konfirmasi`
--

INSERT INTO `tbl_konfirmasi` (`id_konfirmasi`, `id_user`, `id_checkout`, `bukti`) VALUES
(1, '1', '1020796974919306274846174715', '1577038225_asdazxczxczx.PNG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `nama_user`, `email`, `password`) VALUES
(1, 'ojan', 'ojanhttp@gmail.com', '123');

-- --------------------------------------------------------

--
-- Struktur untuk view `checkout`
--
DROP TABLE IF EXISTS `checkout`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `checkout`  AS  (select `tbl_checkout`.`id_checkout` AS `id_checkout`,`tbl_barang`.`nama_produk` AS `nama_produk`,`tbl_barang`.`harga` AS `harga`,`tbl_barang`.`gambar` AS `gambar`,`detail_checkout`.`jumlah` AS `jumlah`,`tbl_user`.`nama_user` AS `nama_user`,`tbl_checkout`.`id_user` AS `id_user` from (((`detail_checkout` join `tbl_checkout` on((`detail_checkout`.`id_checkout` = `tbl_checkout`.`id_checkout`))) join `tbl_user` on((`tbl_checkout`.`id_user` = `tbl_user`.`id`))) join `tbl_barang` on((`detail_checkout`.`id_barang` = `tbl_barang`.`id`)))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `keranjang`
--
DROP TABLE IF EXISTS `keranjang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `keranjang`  AS  (select `tbl_keranjang`.`id_keranjang` AS `id_keranjang`,`tbl_user`.`nama_user` AS `nama_user`,`tbl_barang`.`nama_produk` AS `nama_produk`,`tbl_barang`.`harga` AS `harga`,`tbl_barang`.`gambar` AS `gambar`,`tbl_keranjang`.`jumlah` AS `jumlah` from ((`tbl_keranjang` join `tbl_barang` on((`tbl_keranjang`.`id_barang` = `tbl_barang`.`id`))) join `tbl_user` on((`tbl_keranjang`.`id_user` = `tbl_user`.`id`)))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `tbl_konfirmasi`
--
ALTER TABLE `tbl_konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  MODIFY `id_keranjang` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_konfirmasi`
--
ALTER TABLE `tbl_konfirmasi`
  MODIFY `id_konfirmasi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
