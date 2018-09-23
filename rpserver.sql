-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-09-18 19:46:03
-- 服务器版本： 10.1.34-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.0.31-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rage_omp_bak`
--

-- --------------------------------------------------------

--
-- 表的结构 `barbershop`
--

CREATE TABLE `barbershop` (
  `id` int(255) NOT NULL,
  `camData` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `barbershop`
--

INSERT INTO `barbershop` (`id`, `camData`) VALUES
(4, '{\"x\":-814.64,\"y\":-183.69,\"z\":38.27,\"rz\":298.22,\"viewangle\":20}');

-- --------------------------------------------------------

--
-- 表的结构 `business`
--

CREATE TABLE `business` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `coord` text NOT NULL,
  `price` int(11) NOT NULL,
  `ownerId` int(255) DEFAULT '0',
  `margin` int(11) DEFAULT '0',
  `balance` int(11) NOT NULL DEFAULT '0',
  `buyerMenuCoord` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `business`
--

INSERT INTO `business` (`id`, `title`, `coord`, `price`, `ownerId`, `margin`, `balance`, `buyerMenuCoord`) VALUES
(1, 'Clothing Shop', '{\"x\":127.095703125,\"y\":-224.0974578857422,\"z\":54.56292724609375,\"rot\":27.69999885559082,\"dim\":0}', 10, 0, 0, 0, '{\"x\":123.7242202758789,\"y\":-218.5920867919922,\"z\":54.557830810546875,\"rot\":187.94908142089844,\"dim\":0}'),
(2, 'Gas Station', '{\"x\":645.1665649414062,\"y\":268.3416442871094,\"z\":103.20073699951172,\"rot\":226.85922241210938,\"dim\":0}', 10, 0, 0, 0, '{\"x\":617.9368286132812,\"y\":265.6229553222656,\"z\":103.08939361572266,\"rot\":184.27676391601562,\"dim\":0}'),
(3, 'Cheap Car Dealership', '{\"x\":-37.37321472167969,\"y\":-1111.3145751953125,\"z\":26.438623428344727,\"rot\":267.8714599609375,\"dim\":0}', 10, 0, 0, 0, '{\"x\":-50.92401123046875,\"y\":-1114.0155029296875,\"z\":26.435792922973633,\"rot\":325.1309814453125,\"dim\":0}'),
(4, 'Barber Shop', '{\"x\":-808.0457153320312,\"y\":-181.12709045410156,\"z\":37.568931579589844,\"rot\":286.46954345703125,\"dim\":0}', 10, 0, 0, 0, '{\"x\":-811.7095336914062,\"y\":-182.04342651367188,\"z\":37.568931579589844,\"rot\":117.5919418334961,\"dim\":0}'),
(5, 'Gas Station', '{\"x\":-1429.562744140625,\"y\":-268.767578125,\"z\":46.207664489746094,\"rot\":24.66329002380371,\"dim\":0}', 10, 0, 0, 0, '{\"x\":-1429.7159423828125,\"y\":-279.96435546875,\"z\":46.20770263671875,\"rot\":8.737390518188477,\"dim\":0}'),
(6, 'Gas Station', '{\"x\":-715.934814453125,\"y\":-917.8442993164062,\"z\":19.2147159576416,\"rot\":354.5311279296875,\"dim\":0}', 10, 0, 0, 0, '{\"x\":-725.5956420898438,\"y\":-939.1513061523438,\"z\":19.017017364501953,\"rot\":305.2608947753906,\"dim\":0}'),
(7, 'Gas Station', '{\"x\":-534.527587890625,\"y\":-1219.707275390625,\"z\":18.455026626586914,\"rot\":219.37979125976562,\"dim\":0}', 10, 0, 0, 0, '{\"x\":-529.3493041992188,\"y\":-1205.0078125,\"z\":18.334680557250977,\"rot\":169.56564331054688,\"dim\":0}'),
(8, 'Gas Station', '{\"x\":-342.5171813964844,\"y\":-1487.402099609375,\"z\":30.753286361694336,\"rot\":246.45596313476562,\"dim\":0}', 10, 0, 0, 0, '{\"x\":-328.875244140625,\"y\":-1470.8050537109375,\"z\":30.548505783081055,\"rot\":163.659423828125,\"dim\":0}'),
(9, 'Gas Station', '{\"x\":-57.91111373901367,\"y\":-1753.06591796875,\"z\":29.43963050842285,\"rot\":144.39100646972656,\"dim\":0}', 10, 0, 0, 0, '{\"x\":-65.15530395507812,\"y\":-1767.4342041015625,\"z\":29.131376266479492,\"rot\":247.53338623046875,\"dim\":0}'),
(10, 'Gas Station', '{\"x\":1210.95166015625,\"y\":-1388.947265625,\"z\":35.376895904541016,\"rot\":206.83718872070312,\"dim\":0}', 10, 0, 0, 0, '{\"x\":1207.7071533203125,\"y\":-1398.5753173828125,\"z\":35.3851432800293,\"rot\":27.774681091308594,\"dim\":0}'),
(11, 'Gas Station', '{\"x\":1167.1419677734375,\"y\":-326.0711669921875,\"z\":69.2582778930664,\"rot\":321.29339599609375,\"dim\":0}', 10, 0, 0, 0, '{\"x\":1183.548828125,\"y\":-321.7074279785156,\"z\":69.35308837890625,\"rot\":15.895341873168945,\"dim\":0}'),
(12, 'Gas Station', '{\"x\":2559.229248046875,\"y\":368.5220031738281,\"z\":108.62109375,\"rot\":244.23660278320312,\"dim\":0}', 10, 0, 0, 0, '{\"x\":2579.210693359375,\"y\":358.5287780761719,\"z\":108.47230529785156,\"rot\":247.35372924804688,\"dim\":0}'),
(13, 'Gas Station', '{\"x\":2674.843994140625,\"y\":3268.530517578125,\"z\":55.408931732177734,\"rot\":12.623353004455566,\"dim\":0}', 10, 0, 0, 0, '{\"x\":2681.836669921875,\"y\":3265.794921875,\"z\":55.24055862426758,\"rot\":71.897705078125,\"dim\":0}'),
(14, 'Gas Station', '{\"x\":1697.5283203125,\"y\":6425.6181640625,\"z\":32.76356506347656,\"rot\":291.8790283203125,\"dim\":0}', 10, 0, 0, 0, '{\"x\":1705.2322998046875,\"y\":6413.296875,\"z\":32.68536376953125,\"rot\":325.6998596191406,\"dim\":0}'),
(15, 'Gas Station', '{\"x\":191.3358612060547,\"y\":6610.67578125,\"z\":31.84811019897461,\"rot\":60.23833084106445,\"dim\":0}', 10, 0, 0, 0, '{\"x\":178.08131408691406,\"y\":6604.619140625,\"z\":31.867006301879883,\"rot\":272.5294189453125,\"dim\":0}'),
(16, 'Clothing Shop', '{\"x\":5.4478278160095215,\"y\":6510.978515625,\"z\":31.87784767150879,\"rot\":35.585418701171875,\"dim\":0}', 10, 0, 0, 0, '{\"x\":1.2164422273635864,\"y\":6512.849609375,\"z\":31.877849578857422,\"rot\":224.7537841796875,\"dim\":0}');
(17, 'Barber Shop', '{\"x\":141.4225616455078,\"y\":-1705.747802734375,\"z\":29.291629791259766,\"rot\":306.4740295410156,\"dim\":0}', 10, 0, 0, 0, '{\"x\":135.29542541503906,\"y\":-1707.8775634765625,\"z\":29.291629791259766,\"rot\":128.5691375732422,\"dim\":0}');

-- --------------------------------------------------------

--
-- 表的结构 `cheapcardealership`
--

CREATE TABLE `cheapcardealership` (
  `id` int(255) NOT NULL,
  `newCarCoord` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cheapcardealership`
--

INSERT INTO `cheapcardealership` (`id`, `newCarCoord`) VALUES
(3, '{\"x\":-59.1662712097168,\"y\":-1117.2713623046875,\"z\":26.163053512573242,\"rot\":357.8799743652344,\"dim\":0}');

-- --------------------------------------------------------

--
-- 表的结构 `clothingshop`
--

CREATE TABLE `clothingshop` (
  `id` int(255) NOT NULL,
  `camData` text,
  `buyerStandCoord` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `clothingshop`
--

INSERT INTO `clothingshop` (`id`, `camData`, `buyerStandCoord`) VALUES
(1, '{\"x\":124.29,\"y\":-218,\"z\":54.56,\"rz\":156.37,\"viewangle\":35}', '{\"x\":122.62518310546875,\"y\":-222.16580200195312,\"z\":54.55786895751953,\"rot\":337.5536193847656,\"dim\":0}'),
(16, '{\"x\":-0.33,\"y\":6513.38,\"z\":31.88,\"rz\":237.27,\"viewangle\":35}', '{\"x\":2.8674814701080322,\"y\":6511.68701171875,\"z\":31.877853393554688,\"rot\":65.6650619506836,\"dim\":0}');

-- --------------------------------------------------------

--
-- 表的结构 `commercialcardealership`
--

CREATE TABLE `commercialcardealership` (
  `id` int(255) NOT NULL,
  `newCarCoord` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gasstation`
--

CREATE TABLE `gasstation` (
  `id` int(11) NOT NULL,
  `fillingCoord` text,
  `camData` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gasstation`
--

INSERT INTO `gasstation` (`id`, `fillingCoord`, `camData`) VALUES
(2, '{\"x\":618.62,\"y\":265.02,\"z\":102.82,\"r\":15}', '{\"x\":607.96,\"y\":253.27,\"z\":105.29,\"rz\":316.59,\"viewangle\":5}'),
(5, '{\"x\":-1431.31,\"y\":-283.65,\"z\":46.21,\"r\":15}', '{\"x\":-1431.56,\"y\":-288.82,\"z\":48.2,\"rz\":349.65,\"viewangle\":12}'),
(6, '{\"x\":-727.31,\"y\":-939.49,\"z\":19.02,\"r\":15}', '{\"x\":-727.31,\"y\":-939.49,\"z\":21.02,\"rz\":181.5,\"viewangle\":12}'),
(7, '{\"x\":-536.06,\"y\":-1205.01,\"z\":18.19,\"r\":6}', '{\"x\":-531.25,\"y\":-1205.23,\"z\":20.18,\"rz\":251.46,\"viewangle\":12}'),
(8, '{\"x\":-329.69,\"y\":-1467.04,\"z\":30.55,\"r\":15}', '{\"x\":-329.69,\"y\":-1467.04,\"z\":32.55,\"rz\":195.98,\"viewangle\":12}'),
(9, '{\"x\":-67.35,\"y\":-1768.9,\"z\":29.14,\"r\":15}', '{\"x\":-67.35,\"y\":-1768.9,\"z\":31.14,\"rz\":302.68,\"viewangle\":12}'),
(10, '{\"x\":1213.45,\"y\":-1398.91,\"z\":35.22,\"r\":15}', '{\"x\":1213.45,\"y\":-1398.91,\"z\":37.22,\"rz\":49.78,\"viewangle\":12}'),
(11, '{\"x\":1187.23,\"y\":-324.09,\"z\":69.17,\"r\":15}', '{\"x\":1187.23,\"y\":-324.09,\"z\":71.17,\"rz\":82.41,\"viewangle\":12}'),
(12, '{\"x\":2566.34,\"y\":346.86,\"z\":108.46,\"r\":15}', '{\"x\":2566.34,\"y\":346.86,\"z\":110.46,\"rz\":291.41,\"viewangle\":12}'),
(13, '{\"x\":2683.47,\"y\":3266.8,\"z\":55.24,\"r\":15}', '{\"x\":2683.47,\"y\":3266.8,\"z\":57.24,\"rz\":115.25,\"viewangle\":12}'),
(14, '{\"x\":1704.97,\"y\":6412.08,\"z\":32.8,\"r\":15}', '{\"x\":1704.97,\"y\":6412.08,\"z\":34.8,\"rz\":20.6,\"viewangle\":12}'),
(15, '{\"x\":178.1,\"y\":6604.6,\"z\":31.87,\"r\":15}', '{\"x\":178.1,\"y\":6604.6,\"z\":33.87,\"rz\":272.5,\"viewangle\":12}');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `regdate` varchar(255) NOT NULL,
  `logdate` varchar(255) DEFAULT NULL,
  `position` text,
  `lang` varchar(10) NOT NULL DEFAULT 'eng',
  `health` int(3) NOT NULL DEFAULT '100',
  `adminlvl` int(2) NOT NULL DEFAULT '0',
  `loyality` int(255) NOT NULL DEFAULT '0',
  `socialclub` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usersBody`
--

CREATE TABLE `usersBody` (
  `id` int(255) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `skindata` text,
  `facedata` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usersClothes`
--

CREATE TABLE `usersClothes` (
  `id` int(11) NOT NULL,
  `hats` text,
  `glasses` text,
  `tops` text,
  `legs` text,
  `feet` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usersFaction`
--

CREATE TABLE `usersFaction` (
  `id` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rank` int(2) DEFAULT '0',
  `info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usersHeadOverlay`
--

CREATE TABLE `usersHeadOverlay` (
  `id` int(255) NOT NULL,
  `hair` tinyint(2) NOT NULL,
  `hairColor` text NOT NULL,
  `brow` text NOT NULL,
  `beard` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usersJail`
--

CREATE TABLE `usersJail` (
  `id` int(255) NOT NULL,
  `inside` tinyint(1) NOT NULL DEFAULT '0',
  `time` int(255) NOT NULL DEFAULT '0',
  `violations` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usersMoney`
--

CREATE TABLE `usersMoney` (
  `id` int(255) NOT NULL,
  `cash` bigint(255) NOT NULL DEFAULT '1500',
  `bank` bigint(255) NOT NULL DEFAULT '0',
  `tax` bigint(255) NOT NULL DEFAULT '0',
  `fines` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `fuel` float NOT NULL,
  `fuelTank` int(255) NOT NULL,
  `fuelRate` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `ownerId` int(255) NOT NULL,
  `whoCanOpen` text NOT NULL,
  `factionName` varchar(255) DEFAULT NULL,
  `primaryColor` text NOT NULL,
  `secondaryColor` text NOT NULL,
  `numberPlate` varchar(10) NOT NULL,
  `coord` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barbershop`
--
ALTER TABLE `barbershop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cheapcardealership`
--
ALTER TABLE `cheapcardealership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clothingshop`
--
ALTER TABLE `clothingshop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commercialcardealership`
--
ALTER TABLE `commercialcardealership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasstation`
--
ALTER TABLE `gasstation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersBody`
--
ALTER TABLE `usersBody`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersClothes`
--
ALTER TABLE `usersClothes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersFaction`
--
ALTER TABLE `usersFaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersHeadOverlay`
--
ALTER TABLE `usersHeadOverlay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersJail`
--
ALTER TABLE `usersJail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersMoney`
--
ALTER TABLE `usersMoney`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `barbershop`
--
ALTER TABLE `barbershop`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `business`
--
ALTER TABLE `business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `cheapcardealership`
--
ALTER TABLE `cheapcardealership`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `clothingshop`
--
ALTER TABLE `clothingshop`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `commercialcardealership`
--
ALTER TABLE `commercialcardealership`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `gasstation`
--
ALTER TABLE `gasstation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `usersBody`
--
ALTER TABLE `usersBody`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `usersClothes`
--
ALTER TABLE `usersClothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `usersFaction`
--
ALTER TABLE `usersFaction`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `usersHeadOverlay`
--
ALTER TABLE `usersHeadOverlay`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `usersJail`
--
ALTER TABLE `usersJail`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `usersMoney`
--
ALTER TABLE `usersMoney`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
