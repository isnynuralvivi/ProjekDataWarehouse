-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2023 at 01:10 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dw_penjualan_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_barang`
--

CREATE TABLE `dim_barang` (
  `id_barang` int(11) DEFAULT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `nama_supplier` varchar(30) DEFAULT NULL,
  `sk_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dim_barang`
--

INSERT INTO `dim_barang` (`id_barang`, `nama_barang`, `stok`, `id_supplier`, `nama_supplier`, `sk_barang`) VALUES
(64, 'Sepatu', 10, 1, 'Rafi', 1),
(65, 'Tas', 20, 2, 'Yasa', 2),
(66, 'Topi', 30, 3, 'Husni', 3),
(67, 'Kaos', 10, 4, 'Jali', 4),
(68, 'Celana', 40, 5, 'Celana Bagus', 5),
(69, 'Meja', 20, 5, 'Celana Bagus', 6),
(70, 'Kursi', 20, 1, 'Rafi', 7),
(71, 'Lemari', 50, 1, 'Rafi', 8),
(72, 'Kaos Kaki', 10, 3, 'Husni', 9),
(73, 'Buku', 30, 4, 'Jali', 10),
(74, 'Kaca Mata', 10, 1, 'Rafi', 11),
(75, 'Jam Tangan', 20, 5, 'Celana Bagus', 12),
(76, 'Sendal', 20, 2, 'Yasa', 13),
(77, 'Kemeja', 23, 1, 'Rafi', 14);

-- --------------------------------------------------------

--
-- Table structure for table `dim_pembeli`
--

CREATE TABLE `dim_pembeli` (
  `sk_pembeli` int(11) DEFAULT NULL,
  `id_pembeli` int(11) DEFAULT NULL,
  `nama_pembeli` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dim_pembeli`
--

INSERT INTO `dim_pembeli` (`sk_pembeli`, `id_pembeli`, `nama_pembeli`) VALUES
(1, 2111, 'Isny'),
(2, 2112, 'Rahayu'),
(3, 2113, 'Lia'),
(4, 2114, 'Eki'),
(5, 2115, 'Fikri');

-- --------------------------------------------------------

--
-- Table structure for table `dim_transaksi`
--

CREATE TABLE `dim_transaksi` (
  `sk_transaksi` int(11) DEFAULT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_pembeli` int(11) DEFAULT NULL,
  `nama_pembeli` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dim_transaksi`
--

INSERT INTO `dim_transaksi` (`sk_transaksi`, `id_transaksi`, `id_pembeli`, `nama_pembeli`) VALUES
(1, 111, 2115, 'Fikri'),
(2, 112, 2111, 'Isny'),
(3, 113, 2113, 'Lia'),
(4, 114, 2112, 'Rahayu'),
(5, 116, 2114, 'Eki');

-- --------------------------------------------------------

--
-- Table structure for table `dim_waktu`
--

CREATE TABLE `dim_waktu` (
  `sk_waktu` int(11) DEFAULT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dim_waktu`
--

INSERT INTO `dim_waktu` (`sk_waktu`, `id_transaksi`, `tanggal`) VALUES
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL),
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL),
(1, 111, '2023-06-28 00:00:00'),
(2, 112, '2023-06-28 00:00:00'),
(3, 113, '2023-06-28 00:00:00'),
(4, 114, '2023-06-28 00:00:00'),
(5, 116, '2023-06-28 00:00:00'),
(1, 111, '2023-06-28 00:00:00'),
(2, 112, '2023-06-28 00:00:00'),
(3, 113, '2023-06-28 00:00:00'),
(4, 114, '2023-06-28 00:00:00'),
(5, 116, '2023-06-28 00:00:00'),
(1, 111, '2023-06-28 00:00:00'),
(2, 112, '2023-06-28 00:00:00'),
(3, 113, '2023-06-28 00:00:00'),
(4, 114, '2023-06-28 00:00:00'),
(5, 116, '2023-06-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fact_stok_barang`
--

CREATE TABLE `fact_stok_barang` (
  `sk_pembeli` int(11) DEFAULT NULL,
  `sk_barang` int(11) DEFAULT NULL,
  `sk_transaksi` int(11) DEFAULT NULL,
  `sk_waktu` int(11) DEFAULT NULL,
  `jumlah_pembelian` int(11) DEFAULT NULL,
  `sisa_stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fact_stok_barang`
--

INSERT INTO `fact_stok_barang` (`sk_pembeli`, `sk_barang`, `sk_transaksi`, `sk_waktu`, `jumlah_pembelian`, `sisa_stok`) VALUES
(5, 6, 1, 1, 1, 19),
(1, 5, 2, 2, 1, 39),
(3, 7, 3, 3, 1, 19),
(2, 13, 4, 4, 1, 19),
(4, 3, 6, 5, 1, 29);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
