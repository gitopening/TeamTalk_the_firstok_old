-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-03-30 10:16:28
-- 服务器版本： 5.7.33-log
-- PHP 版本： 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ateams`
--

-- --------------------------------------------------------

--
-- 表的结构 `IMAdmin`
--

CREATE TABLE `IMAdmin` (
  `id` mediumint(6) UNSIGNED NOT NULL,
  `uname` varchar(40) NOT NULL COMMENT '用户名',
  `pwd` char(32) NOT NULL COMMENT '密码',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户状态 0 :正常 1:删除 可扩展',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间´',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间´'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `IMAdmin`
--

INSERT INTO `IMAdmin` (`id`, `uname`, `pwd`, `status`, `created`, `updated`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `IMAudio`
--

CREATE TABLE `IMAudio` (
  `id` int(11) NOT NULL,
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送者Id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收者Id',
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '语音存储的地址',
  `size` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `duration` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '语音时长',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMDepart`
--

CREATE TABLE `IMDepart` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '部门id',
  `departName` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '部门名称',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '显示优先级',
  `parentId` int(11) UNSIGNED NOT NULL COMMENT '上级部门id',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMDiscovery`
--

CREATE TABLE `IMDiscovery` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id',
  `itemName` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '名称',
  `itemUrl` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'URL',
  `itemPriority` int(11) UNSIGNED NOT NULL COMMENT '显示优先级',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMGroup`
--

CREATE TABLE `IMGroup` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '群名称',
  `avatar` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '群头像',
  `creator` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建者用户id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '群组类型，1-固定;2-临时群',
  `userCnt` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '成员人数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否删除,0-正常，1-删除',
  `version` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '群版本号',
  `lastChated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后聊天时间',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群信息';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMember`
--

CREATE TABLE `IMGroupMember` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '群Id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否退出群，0-正常，1-已退出',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和群的关系表';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMessage_0`
--

CREATE TABLE `IMGroupMessage_0` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMessage_1`
--

CREATE TABLE `IMGroupMessage_1` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMessage_2`
--

CREATE TABLE `IMGroupMessage_2` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMessage_3`
--

CREATE TABLE `IMGroupMessage_3` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMessage_4`
--

CREATE TABLE `IMGroupMessage_4` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMessage_5`
--

CREATE TABLE `IMGroupMessage_5` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMessage_6`
--

CREATE TABLE `IMGroupMessage_6` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';

-- --------------------------------------------------------

--
-- 表的结构 `IMGroupMessage_7`
--

CREATE TABLE `IMGroupMessage_7` (
  `id` int(11) NOT NULL,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '消息状态',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='IM群消息表';

-- --------------------------------------------------------

--
-- 表的结构 `IMMessage_0`
--

CREATE TABLE `IMMessage_0` (
  `id` int(11) NOT NULL,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMMessage_1`
--

CREATE TABLE `IMMessage_1` (
  `id` int(11) NOT NULL,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `IMMessage_1`
--

INSERT INTO `IMMessage_1` (`id`, `relateId`, `fromId`, `toId`, `msgId`, `content`, `type`, `status`, `updated`, `created`) VALUES
(1, 1, 2, 1, 1, 'AQmZ3P3ljMLUdrA4FzlOrQ==', 1, 0, 1680105556, 1680105556),
(2, 1, 1, 2, 2, 'yPi1udbJkJvn+R1KCyeZuXWXrZFfV+UBo37vcxL/NUY=', 1, 0, 1680105610, 1680105610);

-- --------------------------------------------------------

--
-- 表的结构 `IMMessage_2`
--

CREATE TABLE `IMMessage_2` (
  `id` int(11) NOT NULL,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `IMMessage_2`
--

INSERT INTO `IMMessage_2` (`id`, `relateId`, `fromId`, `toId`, `msgId`, `content`, `type`, `status`, `updated`, `created`) VALUES
(1, 2, 2, 3, 1, 'eej1Gv+Nz37mqdIRczcEQg==', 1, 0, 1680106471, 1680106471);

-- --------------------------------------------------------

--
-- 表的结构 `IMMessage_3`
--

CREATE TABLE `IMMessage_3` (
  `id` int(11) NOT NULL,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMMessage_4`
--

CREATE TABLE `IMMessage_4` (
  `id` int(11) NOT NULL,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMMessage_5`
--

CREATE TABLE `IMMessage_5` (
  `id` int(11) NOT NULL,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMMessage_6`
--

CREATE TABLE `IMMessage_6` (
  `id` int(11) NOT NULL,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMMessage_7`
--

CREATE TABLE `IMMessage_7` (
  `id` int(11) NOT NULL,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) COLLATE utf8mb4_bin DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0正常 1被删除',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 表的结构 `IMRecentSession`
--

CREATE TABLE `IMRecentSession` (
  `id` int(11) NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `peerId` int(11) UNSIGNED NOT NULL COMMENT '对方id',
  `type` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '类型，1-用户,2-群组',
  `status` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '用户:0-正常, 1-用户A删除,群组:0-正常, 1-被删除',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `IMRecentSession`
--

INSERT INTO `IMRecentSession` (`id`, `userId`, `peerId`, `type`, `status`, `created`, `updated`) VALUES
(1, 2, 1, 1, 0, 1680105556, 1680105610),
(2, 1, 2, 1, 0, 1680105556, 1680105610),
(3, 2, 3, 1, 0, 1680106471, 1680106471),
(4, 3, 2, 1, 0, 1680106471, 1680106471);

-- --------------------------------------------------------

--
-- 表的结构 `IMRelationShip`
--

CREATE TABLE `IMRelationShip` (
  `id` int(11) NOT NULL,
  `smallId` int(11) UNSIGNED NOT NULL COMMENT '用户A的id',
  `bigId` int(11) UNSIGNED NOT NULL COMMENT '用户B的id',
  `status` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '用户:0-正常, 1-用户A删除,群组:0-正常, 1-被删除',
  `created` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `IMRelationShip`
--

INSERT INTO `IMRelationShip` (`id`, `smallId`, `bigId`, `status`, `created`, `updated`) VALUES
(1, 1, 2, 0, 1680105556, 1680105556),
(2, 2, 3, 0, 1680106471, 1680106471);

-- --------------------------------------------------------

--
-- 表的结构 `IMUser`
--

CREATE TABLE `IMUser` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1男2女0未知',
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `domain` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '拼音',
  `nick` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '花名,绰号等',
  `password` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(4) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '混淆码',
  `phone` varchar(11) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'email',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '自定义用户头像',
  `departId` int(11) UNSIGNED NOT NULL COMMENT '所属部门Id',
  `status` tinyint(2) UNSIGNED DEFAULT '0' COMMENT '1. 试用期 2. 正式 3. 离职 4.实习',
  `created` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  `updated` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `push_shield_status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0关闭勿扰 1开启勿扰',
  `sign_info` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '个性签名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `IMUser`
--

INSERT INTO `IMUser` (`id`, `sex`, `name`, `domain`, `nick`, `password`, `salt`, `phone`, `email`, `avatar`, `departId`, `status`, `created`, `updated`, `push_shield_status`, `sign_info`) VALUES
(1, 0, 'test', 'test', 'test', '41f61f6b38c7adbb266bd5f73c147d66', '7605', '18657139000', 'test@test.com', '', 1, 0, 1428416403, 1428416403, 0, '时间'),
(2, 0, 'testa', 'testa', 'testa', '41f61f6b38c7adbb266bd5f73c147d66', '7605', '18657139000', 'test@test.com', '', 1, 0, 1428416403, 1428416403, 0, '时间'),
(3, 0, 'testb', 'testb', 'testb', '41f61f6b38c7adbb266bd5f73c147d66', '7605', '18657139000', 'test@test.com', '', 1, 0, 1428416403, 1428416403, 0, '时间'),
(4, 0, 'testc', 'testc', 'testc', '41f61f6b38c7adbb266bd5f73c147d66', '7605', '18657139000', 'test@test.com', '', 1, 0, 1428416403, 1428416403, 0, '时间');

--
-- 转储表的索引
--

--
-- 表的索引 `IMAdmin`
--
ALTER TABLE `IMAdmin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `IMAudio`
--
ALTER TABLE `IMAudio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fromId_toId` (`fromId`,`toId`);

--
-- 表的索引 `IMDepart`
--
ALTER TABLE `IMDepart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_departName` (`departName`),
  ADD KEY `idx_priority_status` (`priority`,`status`);

--
-- 表的索引 `IMDiscovery`
--
ALTER TABLE `IMDiscovery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_itemName` (`itemName`);

--
-- 表的索引 `IMGroup`
--
ALTER TABLE `IMGroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`(191)),
  ADD KEY `idx_creator` (`creator`);

--
-- 表的索引 `IMGroupMember`
--
ALTER TABLE `IMGroupMember`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_userId_status` (`groupId`,`userId`,`status`),
  ADD KEY `idx_userId_status_updated` (`userId`,`status`,`updated`),
  ADD KEY `idx_groupId_updated` (`groupId`,`updated`);

--
-- 表的索引 `IMGroupMessage_0`
--
ALTER TABLE `IMGroupMessage_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  ADD KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`);

--
-- 表的索引 `IMGroupMessage_1`
--
ALTER TABLE `IMGroupMessage_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  ADD KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`);

--
-- 表的索引 `IMGroupMessage_2`
--
ALTER TABLE `IMGroupMessage_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  ADD KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`);

--
-- 表的索引 `IMGroupMessage_3`
--
ALTER TABLE `IMGroupMessage_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  ADD KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`);

--
-- 表的索引 `IMGroupMessage_4`
--
ALTER TABLE `IMGroupMessage_4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  ADD KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`);

--
-- 表的索引 `IMGroupMessage_5`
--
ALTER TABLE `IMGroupMessage_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  ADD KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`);

--
-- 表的索引 `IMGroupMessage_6`
--
ALTER TABLE `IMGroupMessage_6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  ADD KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`);

--
-- 表的索引 `IMGroupMessage_7`
--
ALTER TABLE `IMGroupMessage_7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_groupId_status_created` (`groupId`,`status`,`created`),
  ADD KEY `idx_groupId_msgId_status_created` (`groupId`,`msgId`,`status`,`created`);

--
-- 表的索引 `IMMessage_0`
--
ALTER TABLE `IMMessage_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  ADD KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  ADD KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`);

--
-- 表的索引 `IMMessage_1`
--
ALTER TABLE `IMMessage_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  ADD KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  ADD KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`);

--
-- 表的索引 `IMMessage_2`
--
ALTER TABLE `IMMessage_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  ADD KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  ADD KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`);

--
-- 表的索引 `IMMessage_3`
--
ALTER TABLE `IMMessage_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  ADD KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  ADD KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`);

--
-- 表的索引 `IMMessage_4`
--
ALTER TABLE `IMMessage_4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  ADD KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  ADD KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`);

--
-- 表的索引 `IMMessage_5`
--
ALTER TABLE `IMMessage_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  ADD KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  ADD KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`);

--
-- 表的索引 `IMMessage_6`
--
ALTER TABLE `IMMessage_6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  ADD KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  ADD KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`);

--
-- 表的索引 `IMMessage_7`
--
ALTER TABLE `IMMessage_7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_relateId_status_created` (`relateId`,`status`,`created`),
  ADD KEY `idx_relateId_status_msgId_created` (`relateId`,`status`,`msgId`,`created`),
  ADD KEY `idx_fromId_toId_created` (`fromId`,`toId`,`status`);

--
-- 表的索引 `IMRecentSession`
--
ALTER TABLE `IMRecentSession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_userId_peerId_status_updated` (`userId`,`peerId`,`status`,`updated`),
  ADD KEY `idx_userId_peerId_type` (`userId`,`peerId`,`type`);

--
-- 表的索引 `IMRelationShip`
--
ALTER TABLE `IMRelationShip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_smallId_bigId_status_updated` (`smallId`,`bigId`,`status`,`updated`);

--
-- 表的索引 `IMUser`
--
ALTER TABLE `IMUser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_domain` (`domain`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_phone` (`phone`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `IMAdmin`
--
ALTER TABLE `IMAdmin`
  MODIFY `id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `IMAudio`
--
ALTER TABLE `IMAudio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMDepart`
--
ALTER TABLE `IMDepart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门id';

--
-- 使用表AUTO_INCREMENT `IMDiscovery`
--
ALTER TABLE `IMDiscovery`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `IMGroup`
--
ALTER TABLE `IMGroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMember`
--
ALTER TABLE `IMGroupMember`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMessage_0`
--
ALTER TABLE `IMGroupMessage_0`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMessage_1`
--
ALTER TABLE `IMGroupMessage_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMessage_2`
--
ALTER TABLE `IMGroupMessage_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMessage_3`
--
ALTER TABLE `IMGroupMessage_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMessage_4`
--
ALTER TABLE `IMGroupMessage_4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMessage_5`
--
ALTER TABLE `IMGroupMessage_5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMessage_6`
--
ALTER TABLE `IMGroupMessage_6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMGroupMessage_7`
--
ALTER TABLE `IMGroupMessage_7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMMessage_0`
--
ALTER TABLE `IMMessage_0`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMMessage_1`
--
ALTER TABLE `IMMessage_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `IMMessage_2`
--
ALTER TABLE `IMMessage_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `IMMessage_3`
--
ALTER TABLE `IMMessage_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMMessage_4`
--
ALTER TABLE `IMMessage_4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMMessage_5`
--
ALTER TABLE `IMMessage_5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMMessage_6`
--
ALTER TABLE `IMMessage_6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMMessage_7`
--
ALTER TABLE `IMMessage_7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `IMRecentSession`
--
ALTER TABLE `IMRecentSession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `IMRelationShip`
--
ALTER TABLE `IMRelationShip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `IMUser`
--
ALTER TABLE `IMUser`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
