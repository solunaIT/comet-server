-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u8
-- http://www.phpmyadmin.net
--
-- Хост: test.comet.su:3305
-- Время создания: Янв 24 2018 г., 14:56
-- Версия сервера: 5.5.57
-- Версия PHP: 5.6.31-1~dotdeb+7.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `comet_db_saas`
--

-- --------------------------------------------------------

--
-- Структура таблицы `conference`
--

CREATE TABLE IF NOT EXISTS `conference` (
  `dev_id` int(11) NOT NULL,
  `name` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `caller_id` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `profile` varchar(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `stream` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `node` varchar(64) NOT NULL DEFAULT '0',
  `time` int(13) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dev_id`,`name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Кому и к какой конференции дан доступ';

-- --------------------------------------------------------

--
-- Структура таблицы `log_event`
--

CREATE TABLE IF NOT EXISTS `log_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1661 ;

-- --------------------------------------------------------

--
-- Структура таблицы `log_query`
--

CREATE TABLE IF NOT EXISTS `log_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` int(11) NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `pipes_settings`
--

CREATE TABLE IF NOT EXISTS `pipes_settings` (
  `dev_id` int(11) NOT NULL,
  `name` char(128) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `type` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `length` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dev_id`,`name`),
  KEY `name` (`name`),
  KEY `dev_id` (`dev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pipe_messages`
--

CREATE TABLE IF NOT EXISTS `pipe_messages` (
  `id` char(20) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `time` int(11) NOT NULL,
  `dev_id` int(11) NOT NULL,
  `pipe_name` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `event` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin,
  `user_id` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `pipe_name` (`pipe_name`),
  KEY `dev_id` (`dev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `revoked_tokens`
--

CREATE TABLE IF NOT EXISTS `revoked_tokens` (
  `dev_id` int(11) NOT NULL,
  `token` varbinary(600) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`dev_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `users_auth`
--

CREATE TABLE IF NOT EXISTS `users_auth` (
  `dev_id` int(9) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`dev_id`,`user_id`),
  KEY `dev_id` (`dev_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_data`
--

CREATE TABLE IF NOT EXISTS `users_data` (
  `dev_id` int(9) NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` varbinary(600) NOT NULL,
  PRIMARY KEY (`dev_id`,`user_id`),
  KEY `dev_id` (`dev_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_messages`
--

CREATE TABLE IF NOT EXISTS `users_messages` (
  `id` char(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `time` int(11) NOT NULL,
  `dev_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '',
  `message` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `dev_id` (`dev_id`),
  KEY `user_id` (`user_id`),
  KEY `dev_id_2` (`dev_id`,`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_time`
--

CREATE TABLE IF NOT EXISTS `users_time` (
  `dev_id` int(9) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dev_id`,`user_id`),
  KEY `dev_id` (`dev_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
