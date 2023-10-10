-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2023 at 07:44 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nm_lengkap` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nm_lengkap`, `username`, `password`) VALUES
(1, 'Dina Dwi Arika', 'dina123', 'dina123'),
(2, 'Ferdi Andriansyah', 'ferdi123', 'ferdi123'),
(3, 'Lya Nurul Ula', 'lya123', 'lya123');

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id_les` int(11) NOT NULL,
  `kode_alternatif` varchar(250) NOT NULL,
  `nm_les` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id_les`, `kode_alternatif`, `nm_les`) VALUES
(2, 'A1', 'Kumon'),
(3, 'A2', 'Ganesha Operation'),
(6, 'A3', 'MAMEN COURSE'),
(8, 'A4', 'HARIS LES');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `kode_kriteria` varchar(250) NOT NULL,
  `nm_kriteria` varchar(250) NOT NULL,
  `bobot` int(11) NOT NULL,
  `status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `kode_kriteria`, `nm_kriteria`, `bobot`, `status`) VALUES
(1, 'C1', 'Biaya', 2, 'COST'),
(2, 'C2', 'Fasilitas', 4, 'BENEFIT'),
(3, 'C3', 'Jarak', 3, 'COST'),
(4, 'C4', 'Kualitas Pengajar', 5, 'BENEFIT');

-- --------------------------------------------------------

--
-- Table structure for table `pembobotan`
--

CREATE TABLE `pembobotan` (
  `id_nilai` int(11) NOT NULL,
  `id_les` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembobotan`
--

INSERT INTO `pembobotan` (`id_nilai`, `id_les`, `id_kriteria`, `nilai`) VALUES
(21, 2, 1, '8'),
(22, 2, 2, '7'),
(23, 2, 3, '9'),
(24, 2, 4, '6'),
(25, 3, 1, '6'),
(26, 3, 2, '8'),
(27, 3, 3, '7'),
(28, 3, 4, '9'),
(29, 6, 1, '7'),
(30, 6, 2, '6'),
(31, 6, 3, '8'),
(38, 6, 4, '6'),
(39, 8, 1, '7'),
(40, 8, 2, '6'),
(41, 8, 3, '6'),
(42, 8, 4, '8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_les`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `pembobotan`
--
ALTER TABLE `pembobotan`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `LES` (`id_les`),
  ADD KEY `KRITERIA` (`id_kriteria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_les` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembobotan`
--
ALTER TABLE `pembobotan`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembobotan`
--
ALTER TABLE `pembobotan`
  ADD CONSTRAINT `KRITERIA` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`),
  ADD CONSTRAINT `LES` FOREIGN KEY (`id_les`) REFERENCES `alternatif` (`id_les`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
