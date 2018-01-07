-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2018 at 09:29 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_nm` varchar(25) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified _by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `status` enum('Active','Inactive','Delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_nm`, `created_by`, `created_date`, `modified _by`, `modified_date`, `status`) VALUES
(1, 'hdpe', 0, '2017-05-19', 0, '2017-05-19', 'Active'),
(2, 'three blue line', 1, '2017-05-19', 1, '2017-05-19', 'Active'),
(29, 'atwill', 1, '2017-05-19', 1, '2017-05-19', 'Active'),
(30, 'bitwill', 1, '2017-05-19', 1, '2017-05-19', 'Active'),
(34, 'russian', 2, '2017-05-21', 2, '2017-05-21', 'Active'),
(35, 'silpolin', 2, '2017-05-29', 2, '2017-05-29', 'Active'),
(36, 'h.v.c.', 2, '2017-05-29', 2, '2017-05-29', 'Active'),
(37, 'ketki', 2, '2017-05-29', 2, '2017-05-29', 'Active'),
(38, 'canvas', 2, '2017-05-29', 2, '2017-05-29', 'Active'),
(39, 'kadidhari', 2, '2017-05-29', 2, '2017-05-29', 'Active'),
(40, 'f.c.i.', 2, '2017-05-29', 2, '2017-05-29', 'Active'),
(41, 'green line ', 5, '2017-06-26', 5, '2017-06-26', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyid` int(11) NOT NULL,
  `companyname` varchar(20) NOT NULL,
  `proprietor` varchar(25) NOT NULL,
  `iec` int(15) DEFAULT NULL,
  `gstno` varchar(15) NOT NULL,
  `emailid` text NOT NULL,
  `phone` int(12) NOT NULL,
  `fax` int(11) NOT NULL,
  `address` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createdby` int(11) NOT NULL,
  `createddate` date NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifieddate` date NOT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyid`, `companyname`, `proprietor`, `iec`, `gstno`, `emailid`, `phone`, `fax`, `address`, `city`, `description`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `status`) VALUES
(1, 'dipentrading', 'ajay thakker', 1340000022, 'adhie24z1e', 'dipentrading@hotmail.com', 259747, 259977, 'anand', 'anand', 'null', 2, '2017-09-05', 1, '2017-09-05', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactid` int(11) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `companyid` int(11) NOT NULL,
  `phone` int(12) NOT NULL,
  `email` text,
  `fax` int(11) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `desc` varchar(50) NOT NULL,
  `contacttype` enum('Supplier','Customer') NOT NULL,
  `createdby` int(11) NOT NULL,
  `createddate` date NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifieddate` date NOT NULL,
  `status` enum('Active','Inactive','Delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactid`, `firstname`, `lastname`, `companyid`, `phone`, `email`, `fax`, `address`, `city`, `pincode`, `desc`, `contacttype`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `status`) VALUES
(1, 'Alka', 'thakker', 1, 251747, 'thakker747@gmail.com', 256236, '44 himalya retreat, 100ft road', 'anand', 388001, '.....', 'Supplier', 1, '2017-05-17', 1, '2017-05-17', 'Active'),
(2, 'dipen', 'thakker', 1, 241747, 'dipen747@gmail.com', 269625, 'anand', 'anand', 388001, 'null', 'Customer', 2, '2017-05-26', 2, '2017-05-26', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE `home` (
  `id` int(11) NOT NULL,
  `aboutus` varchar(200) NOT NULL,
  `status` enum('Active','Inactive','Delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`id`, `aboutus`, `status`) VALUES
(1, 'hello', 'Inactive'),
(3, 'hello', 'Inactive'),
(5, 'hii', 'Inactive'),
(6, 'aklaijsck', 'Inactive'),
(11, 'asssdcs', 'Inactive'),
(12, 'asdf', 'Inactive'),
(13, 'hola adios !!', 'Inactive'),
(14, 'sdag', 'Inactive'),
(15, '<span style="font-size: 13.3333px;">it can be customize with ur text.</span>', 'Active'),
(16, 'this is inventory manegment system.', 'Active'),
(17, '<span style="font-weight: normal;">change it from</span><b> home</b> in that add home menu', 'Active'),
(18, '<div><br></div>you can add notes to remember ,pending work etc..', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemid` int(11) NOT NULL,
  `itemname` varchar(25) NOT NULL,
  `category_nm` varchar(15) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createddate` date NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifieddate` date NOT NULL,
  `status` enum('Active','Inactive','Delete') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemid`, `itemname`, `category_nm`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `status`) VALUES
(2, 'big', 'three blue line', 2, '2017-05-20', 2, '2017-05-20', 'Inactive'),
(3, 'small', 'three blue line', 2, '2017-05-20', 2, '2017-05-20', 'Active'),
(4, 'small', 'atwill', 2, '2017-05-20', 2, '2017-05-20', 'Active'),
(5, 'small', 'hdpe', 2, '2017-05-20', 2, '2017-05-20', 'Active'),
(6, 'coco', 'russian', 2, '2017-05-21', 2, '2017-05-21', 'Active'),
(7, 'coffee', 'russian', 2, '2017-06-23', 2, '2017-06-23', 'Active'),
(8, 'rice', 'green line ', 5, '2017-06-26', 5, '2017-06-26', 'Active'),
(9, 'sopari', 'green line ', 5, '2017-06-26', 5, '2017-06-26', 'Inactive'),
(10, 'bajri', 'green line ', 5, '2017-06-26', 5, '2017-06-26', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationid` int(11) NOT NULL,
  `locationname` varchar(25) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createddate` date NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifieddate` date NOT NULL,
  `status` enum('Active','Inactive','Delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationid`, `locationname`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `status`) VALUES
(1, 'bhoyru1', 1, '2017-05-19', 1, '2017-05-19', 'Inactive'),
(2, 'bhoyru2', 1, '2017-05-19', 1, '2017-05-19', 'Active'),
(3, 'room1', 2, '2017-07-02', 2, '2017-07-02', 'Active'),
(4, 'room3', 1, '2017-11-17', 1, '2017-11-17', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `uid` int(11) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createddate` date NOT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` date NOT NULL,
  `status` enum('Active','Inactive','Delete') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uid`, `firstname`, `lastname`, `username`, `password`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `status`) VALUES
(1, 'priyanka', 'thakker', 'priyanka_747', 'guddi123', 1, '2017-05-19', 1, '2017-05-19', 'Active'),
(2, 'priyanka', 'thakker', 'priyanka747', 'guddi123', 0, '2017-05-19', 0, '2017-05-19', 'Active'),
(3, 'alka', 'thakker', 'alka737', 'gatudi123', 0, '2017-06-26', 0, '2017-06-26', 'Active'),
(4, 'alka ', '', '', '', 0, '2017-06-26', 0, '2017-06-26', 'Active'),
(5, 'alka', 'thakker', 'alkakumari', 'babbu123', 0, '2017-06-26', 0, '2017-06-26', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `orderdate` date NOT NULL,
  `qty` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createddate` date NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifieddate` date NOT NULL,
  `status` enum('Active','Inactive','Delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchaseid` int(11) NOT NULL,
  `purchasedate` date NOT NULL,
  `contactid` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createddate` date NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifieddate` date NOT NULL,
  `status` enum('Active','Inactive','Delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `saleid` int(11) NOT NULL,
  `saledate` date NOT NULL,
  `contactid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `sellprice` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `tax` int(11) NOT NULL,
  `grandtotal` double NOT NULL,
  `createdby` int(11) NOT NULL,
  `createddate` date NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `modifieddate` date NOT NULL,
  `status` enum('Active','Inactive','Delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`saleid`, `saledate`, `contactid`, `itemid`, `categoryid`, `sellprice`, `qty`, `subtotal`, `tax`, `grandtotal`, `createdby`, `createddate`, `modifiedby`, `modifieddate`, `status`) VALUES
(1, '2017-06-08', 1, 1, 1, 50, 100, 5000, 5, 5250, 1, '2017-06-27', 1, '2017-06-27', 'Active'),
(5, '2017-06-10', 1, 2, 1, 55, 100, 5500, 5, 5775, 2, '2017-06-27', 2, '2017-06-27', 'Active'),
(6, '2017-06-10', 2, 1, 1, 50, 50, 2500, 5, 2625, 2, '2017-06-27', 2, '2017-06-27', 'Active'),
(7, '2017-06-16', 1, 1, 1, 52, 52, 2704, 5, 2839.2, 2, '2017-06-27', 2, '2017-06-27', 'Active'),
(8, '2017-06-03', 1, 1, 1, 42, 49, 2058, 5, 2160.9, 2, '2017-06-27', 2, '2017-06-27', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stockid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `category_nm` varchar(25) NOT NULL,
  `locationid` int(11) NOT NULL,
  `itemname` varchar(25) NOT NULL,
  `qty` int(11) NOT NULL,
  `unitprice` double NOT NULL,
  `size` varchar(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `weight` int(4) NOT NULL,
  `createddate` date NOT NULL,
  `createdby` int(11) NOT NULL,
  `modifieddate` date NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `status` enum('Active','Inactive','Delete') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stockid`, `itemid`, `categoryid`, `category_nm`, `locationid`, `itemname`, `qty`, `unitprice`, `size`, `capacity`, `weight`, `createddate`, `createdby`, `modifieddate`, `modifiedby`, `status`) VALUES
(1, 1, 1, '', 1, 'coco', 50, 46, '45', 25, 100, '2017-06-26', 1, '2017-06-26', 1, 'Active'),
(2, 2, 2, '', 1, 'asd', 50, 8, '45', 45, 34, '2017-06-26', 1, '2017-06-26', 1, 'Active'),
(3, 2, 1, '', 2, 'asd', 50, 8, '45', 45, 34, '2017-06-26', 1, '2017-06-26', 1, 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactid`);

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchaseid`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`saleid`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stockid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `companyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `home`
--
ALTER TABLE `home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `locationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchaseid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `saleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stockid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
