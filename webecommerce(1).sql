-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2018 at 02:06 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `nama`) VALUES
(1, 'newproduk'),
(2, 'hotoffer');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `produkkategori_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(1000) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `foto` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `kategori_id`, `produkkategori_id`, `nama`, `deskripsi`, `harga`, `stok`, `foto`) VALUES
(0, 1, 2, 'Apple Watch Series 4', 'Smart Watch terbaru dari Produk Apple dengan ukuran 44 mm', 8500000, 10, 's1.jpg'),
(1, 1, 1, 'Jam Tangan Alexander Christie', 'Jam Tangan Alexander Christie', 1000000, 20, '1.jpg'),
(2, 1, 1, 'Jam Tangan Rolex Submarinir', 'Jam Tangan Rolex Submarinir', 120000000, 5, 'rolexsubmarinir.jpg'),
(3, 1, 1, 'Jam Tangan Swiss Army SA 5109', 'Jam Tangan Swiss Army SA 5109', 300000, 30, 'sa5109.jpg'),
(4, 1, 1, 'Jam Tangan G Shock gwa 1100a', 'Jam Tangan G Shock gwa 1100a', 500000, 21, 'gwa1100a.jpg'),
(5, 1, 1, 'Samsung Galaxy gear s', 'Samsung Galaxy gear s', 2000000, 15, 'samsung gear s.jpg'),
(6, 1, 2, 'samsung galaxy gear s3', 'samsung galaxy gear s3', 3500000, 30, 'gear s3.jpg'),
(7, 2, 2, 'Sony Smartwatch 3', 'Sony Smartwatch 3', 2000000, 31, 'sony3.jpg'),
(8, 2, 3, 'Xiaomi Mi Band 3', 'Xiaomi Mi Band 3', 345000, 54, 'miband3.jpg'),
(9, 2, 3, 'Xiaomi Mi Band 2', 'Xiaomi Mi Band 2', 270000, 32, 'miband2.jpg'),
(10, 1, 3, 'Bracelet Br 15 Pro', 'Bracelet Br 15 Pro', 200000, 30, 'br15pro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `produk_kategori`
--

CREATE TABLE `produk_kategori` (
  `produkkategori_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_kategori`
--

INSERT INTO `produk_kategori` (`produkkategori_id`, `nama`) VALUES
(1, 'watch'),
(2, 'smartwatch'),
(3, 'smartbracelet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `produkkategori_id` (`produkkategori_id`);

--
-- Indexes for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD PRIMARY KEY (`produkkategori_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`produkkategori_id`) REFERENCES `produk_kategori` (`produkkategori_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
