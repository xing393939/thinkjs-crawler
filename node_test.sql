-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-09-23 06:13:18
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `node_test`
--

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `configName` char(32) NOT NULL,
  `type` char(15) NOT NULL,
  `page` char(15) NOT NULL DEFAULT '1',
  `url` varchar(250) NOT NULL,
  `from` char(15) NOT NULL,
  `to` char(15) NOT NULL,
  `charset` char(15) NOT NULL,
  `saveDir` varchar(250) NOT NULL,
  `imageFn` text NOT NULL,
  `levels` text NOT NULL,
  `mode` char(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`configName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`id`, `configName`, `type`, `page`, `url`, `from`, `to`, `charset`, `saveDir`, `imageFn`, `levels`, `mode`) VALUES
(2, '京东图片', 'image', '1', 'http://list.jd.com/list.html?cat=670%2C671%2C672&JL=6_0_0&page=%%', '1', '2', 'gbk', 'e:\\\\jd', 'function (url) {return url.replace(''/n5/'', ''/n0/'');}', '[{"selector":"$(\\".p-img a\\")","attr":"href"},{"selector":"$(\\"#spec-list\\").find(\\"img[data-url]\\")","attr":"src"}]', 'web'),
(3, '全球时尚', 'image', '1', 'http://sexy.faceks.com/?page=%%', '1', '5', 'utf8', 'e:\\\\mz', '""', '[{"selector":"$(\\"a.img\\")","attr":"href"},{"selector":"$(\\"a[bigimgsrc]\\")","attr":"bigimgsrc"}]', 'web'),
(4, 'MV地址', 'text', '1', 'http://www.mtvxz.cn/list/37_time_13_0_0_%%.html', '1', '10', 'utf8', 'e:\\\\mv', '""', '[{"selector":"$(\\"span.song-title\\").children(\\"a\\")","attr":"href"},{"selector":"$(\\"div.music_downlist\\").find(\\"a.xltxt[href^=thunder]\\")","attr":"href"}]', 'web');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
