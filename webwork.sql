-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-03-25 15:00:59
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `webwork`
--

-- --------------------------------------------------------

--
-- 表的结构 `upload`
--

CREATE TABLE `upload` (
  `id` int(5) NOT NULL,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `file_sql_path` text COLLATE utf8_unicode_ci NOT NULL,
  `file_size` text COLLATE utf8_unicode_ci NOT NULL,
  `file_ext` text COLLATE utf8_unicode_ci NOT NULL,
  `file_time` text COLLATE utf8_unicode_ci NOT NULL,
  `file_owner` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `upload`
--

INSERT INTO `upload` (`id`, `file_name`, `file_sql_path`, `file_size`, `file_ext`, `file_time`, `file_owner`) VALUES
(51, 'IMG_4654(20190122-111929).jpg', 'img\\202103\\24\\164646\\5225b2e8-07bd-41a6-8364-7a7ecb525003.jpg', '841809', 'jpg', '2021-03-24 16:46:46', '1216700206@qq.com'),
(52, 'IMG_4654(20190122-111929).jpg', 'img\\202103\\24\\164646\\5225b2e8-07bd-41a6-8364-7a7ecb525003.jpg', '841809', 'jpg', '2021-03-24 16:46:46', '1216700206@qq.com'),
(53, 'IMG_4659(20190121-173646).jpg', 'img\\202103\\24\\164646\\1351fcfd-364e-4026-86c0-15a4b248e830.jpg', '907170', 'jpg', '2021-03-24 16:46:46', '1216700206@qq.com'),
(54, 'IMG_4659(20190121-173646).jpg', 'img\\202103\\24\\164646\\1351fcfd-364e-4026-86c0-15a4b248e830.jpg', '907170', 'jpg', '2021-03-24 16:46:46', '1216700206@qq.com'),
(55, 'IMG_4546.JPG', 'img\\202103\\24\\165009\\0637d8f5-9444-4866-b4f1-1d727aaba0f7.JPG', '165626', 'JPG', '2021-03-24 16:50:09', '1216700206@qq.com'),
(56, '20270C8A0F51DBD603A10ABF5BA34390.jpg', 'img\\202103\\24\\165009\\2167122c-b5e4-4f65-8498-47403d5c1f92.jpg', '158763', 'jpg', '2021-03-24 16:50:09', '1216700206@qq.com'),
(57, '20270C8A0F51DBD603A10ABF5BA34390.jpg', 'img\\202103\\24\\165009\\2167122c-b5e4-4f65-8498-47403d5c1f92.jpg', '158763', 'jpg', '2021-03-24 16:50:09', '1216700206@qq.com'),
(58, 'IMG_4547.JPG', 'img\\202103\\24\\165009\\0607c095-da3f-4624-9799-3c9cf7e02f9f.JPG', '243849', 'JPG', '2021-03-24 16:50:09', '1216700206@qq.com'),
(59, 'IMG_4547.JPG', 'img\\202103\\24\\165009\\0607c095-da3f-4624-9799-3c9cf7e02f9f.JPG', '243849', 'JPG', '2021-03-24 16:50:09', '1216700206@qq.com'),
(60, 'IMG_4653_副本.jpg', 'img\\202103\\24\\165009\\4c9ce00e-cf12-4f9d-a30e-40beeb5ea783.jpg', '105064', 'jpg', '2021-03-24 16:50:09', '1216700206@qq.com'),
(61, 'IMG_4653_副本.jpg', 'img\\202103\\24\\165009\\4c9ce00e-cf12-4f9d-a30e-40beeb5ea783.jpg', '105064', 'jpg', '2021-03-24 16:50:09', '1216700206@qq.com'),
(62, 'IMG_4683.JPG', 'img\\202103\\24\\165009\\ed9a9a3a-062f-4450-ba43-c02bfa7f2ff4.JPG', '825395', 'JPG', '2021-03-24 16:50:09', '1216700206@qq.com'),
(63, '3a79ff806a28430048353934838a6d1e.jpg', 'img\\202103\\24\\165037\\bfb9998f-dbf0-46c8-a534-9b448ed451eb.jpg', '501926', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(64, '4e90b1936300a7ff1aa006a3ef0f1a3b.jpg', 'img\\202103\\24\\165037\\5174b930-f137-413b-acf9-08279ab5f071.jpg', '559892', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(65, '5e73bb6924136c39d7931a78e2a6ac41.jpg', 'img\\202103\\24\\165037\\9994b208-059b-4e6b-81f3-ec79155b5684.jpg', '410041', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(66, '39722170ecbcac2bd7fbdf384ad6e5f9.jpg', 'img\\202103\\24\\165037\\f0bb1f60-4bd7-4502-94f5-116565b6e4e5.jpg', '526904', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(67, '39722170ecbcac2bd7fbdf384ad6e5f9.jpg', 'img\\202103\\24\\165037\\f0bb1f60-4bd7-4502-94f5-116565b6e4e5.jpg', '526904', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(68, '39722170ecbcac2bd7fbdf384ad6e5f9.jpg', 'img\\202103\\24\\165037\\f0bb1f60-4bd7-4502-94f5-116565b6e4e5.jpg', '526904', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(69, '9fec569be532854f05ec152397c0d29e.jpg', 'img\\202103\\24\\165037\\37f977f5-e490-4895-adfc-b4716ed70ad0.jpg', '416584', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(70, 'b02116b8a297847ebe518b8c25f24715.jpg', 'img\\202103\\24\\165037\\8826c611-b80a-491e-a641-5450e3771ef6.jpg', '443092', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(71, 'b02116b8a297847ebe518b8c25f24715.jpg', 'img\\202103\\24\\165037\\8826c611-b80a-491e-a641-5450e3771ef6.jpg', '443092', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(72, 'c0648530ed6c6ed38c39494c2b592c7b.jpg', 'img\\202103\\24\\165037\\4c7d0977-4f87-4930-8977-5eb619089d62.jpg', '686601', 'jpg', '2021-03-24 16:50:37', '1216700206@qq.com'),
(73, 'b02116b8a297847ebe518b8c25f24715.jpg', 'img\\202103\\24\\171202\\229b9990-9957-4348-a5bc-32f390422372.jpg', '443092', 'jpg', '2021-03-24 17:12:02', '1216700206@qq.com'),
(74, 'b02116b8a297847ebe518b8c25f24715.jpg', 'img\\202103\\24\\171202\\229b9990-9957-4348-a5bc-32f390422372.jpg', '443092', 'jpg', '2021-03-24 17:12:02', '1216700206@qq.com'),
(75, 'b02116b8a297847ebe518b8c25f24715.jpg', 'img\\202103\\24\\171202\\229b9990-9957-4348-a5bc-32f390422372.jpg', '443092', 'jpg', '2021-03-24 17:12:02', '1216700206@qq.com'),
(76, '3a79ff806a28430048353934838a6d1e.jpg', 'img\\202103\\24\\171205\\ed2ed7f6-f0b8-4689-a106-20c80f100f6e.jpg', '501926', 'jpg', '2021-03-24 17:12:05', '1216700206@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_pwd` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `user_wechat` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_imtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_introduce` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `user_email`, `user_name`, `user_pwd`, `user_wechat`, `user_imtype`, `user_introduce`) VALUES
(1, '1216700206@qq.com', 'fmf', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456', '2', ' 签名！'),
(2, '1484487423@qq.com', 'HN-fmf', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456', '2', ' 这家伙很懒，没有留下任何签名！'),
(3, 'fmf1216700206@gmail.com', '黄晓明', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456', '1', ' 这家伙很懒，没有留下任何签名！');

--
-- 转储表的索引
--

--
-- 表的索引 `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
