-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 10 月 15 日 10:51
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `wlgcx`
--

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `createtime` datetime NOT NULL,
  `lastchangetime` datetime NOT NULL,
  `welcomenumber` int(11) NOT NULL,
  `class` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `classname` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  KEY `number` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='文章表';

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `createtime`, `lastchangetime`, `welcomenumber`, `class`, `classname`) VALUES
(0, '第一篇文章标题', '第一篇文章内容', '2013-10-08 00:00:00', '2013-10-08 00:00:00', 0, '#11', '网络工程'),
(1, '第二篇文章标题', '第二篇文章内容', '2013-10-08 00:00:00', '2013-10-08 00:00:00', 0, '#12', '信息安全辅修专业');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
