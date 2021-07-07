-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： sql.hk153.vhostgo.com
-- 生成日期： 2020-09-21 15:10:27
-- 服务器版本： 5.6.48
-- PHP 版本： 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ahboli`
--

-- --------------------------------------------------------

--
-- 表的结构 `qing_ad`
--

CREATE TABLE `qing_ad` (
  `id` int(11) UNSIGNED NOT NULL,
  `type_id` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `listorder` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_ad`
--

INSERT INTO `qing_ad` (`id`, `type_id`, `title`, `thumb`, `url`, `description`, `listorder`, `status`, `content`) VALUES
(1, 1, '618免单来袭', '/public/upload/20200801/3f9d2a71a0e976eb8daf3208c983d9ac.jpg', '', '', 0, 1, NULL),
(2, 1, '1万份免单派发中', '/public/upload/20200801/968730140783b13d831cf1705efeadf7.jpg', '', '', 0, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `qing_address`
--

CREATE TABLE `qing_address` (
  `id` int(11) NOT NULL,
  `shou_name` varchar(10) DEFAULT NULL,
  `shou_address` varchar(50) DEFAULT NULL,
  `shou_mobile` varchar(11) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(5) NOT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收货地址表';

--
-- 转存表中的数据 `qing_address`
--

INSERT INTO `qing_address` (`id`, `shou_name`, `shou_address`, `shou_mobile`, `isdefault`, `user_id`, `province`, `city`, `district`) VALUES
(1, 'ferfe', 'drd', 'fdfd', 0, 1, '河北省', '石家庄市', '长安区'),
(2, 'fdfd', 'fdfd', 'fdfd', 1, 1, '内蒙古自治区', '呼和浩特市', '新城区');

-- --------------------------------------------------------

--
-- 表的结构 `qing_admin`
--

CREATE TABLE `qing_admin` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `last_login_time` int(11) NOT NULL,
  `group_id` int(2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1启用0禁用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台管理员';

--
-- 转存表中的数据 `qing_admin`
--

INSERT INTO `qing_admin` (`id`, `user_name`, `password`, `last_login_time`, `group_id`, `status`) VALUES
(1, 'root_qing', '0d734ea736e18b582050e3b990636001', 1600656660, 1, 1),
(2, 'goods_admin', '0d734ea736e18b582050e3b990636001', 1590197437, 2, 1),
(4, 'order_admin', '0d734ea736e18b582050e3b990636001', 1597276611, 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_ad_type`
--

CREATE TABLE `qing_ad_type` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_ad_type`
--

INSERT INTO `qing_ad_type` (`id`, `name`) VALUES
(1, '首页轮播图'),
(2, '首页广告位');

-- --------------------------------------------------------

--
-- 表的结构 `qing_auth_group`
--

CREATE TABLE `qing_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_auth_group`
--

INSERT INTO `qing_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理员', 1, '1,2,3,4,5,6,12,13,14,8,9,10,11,15,16'),
(2, '商品管理员', 1, '8,9,10,11,15,16'),
(4, '订单管理员', 1, '6,12,13,14,15,16');

-- --------------------------------------------------------

--
-- 表的结构 `qing_auth_rule`
--

CREATE TABLE `qing_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '上级规则id 0表示顶级规则',
  `listorder` int(10) NOT NULL DEFAULT '0',
  `icon` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_auth_rule`
--

INSERT INTO `qing_auth_rule` (`id`, `name`, `title`, `status`, `parent_id`, `listorder`, `icon`) VALUES
(1, 'Flink\\index', '友情链接列表', 1, 0, 0, ''),
(2, 'Flink\\add', '添加', 1, 1, 0, ''),
(3, 'Flink\\edit', '修改', 1, 1, 0, ''),
(4, 'Search/index', '搜索关键字列表', 1, 0, 0, ''),
(5, 'Search/add', '搜索添加', 1, 4, 0, ''),
(6, 'Order/index', '订单列表', 1, 0, 0, ''),
(7, 'Config/index', '系统管理', 0, 0, 0, ''),
(8, 'Goods/index', '商品列表', 1, 0, 1, '&#xe620'),
(9, 'Goods/add', '商品添加', 1, 8, 1, ''),
(10, 'Goods/edit', '商品修改', 1, 8, 0, ''),
(11, 'Goods/del', '商品删除', 1, 8, 0, ''),
(12, 'Order/add', '订单添加', 1, 6, 1, ''),
(13, 'Order/edit', '订单修改', 1, 6, 0, ''),
(14, 'Order/del', '订单删除', 1, 6, 0, ''),
(15, 'Index/index', '后台首页', 1, 0, 0, '&#xe616;'),
(16, 'Index/welcome', '欢迎页面', 1, 15, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `qing_cart`
--

CREATE TABLE `qing_cart` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `goods_id` mediumint(8) UNSIGNED NOT NULL COMMENT '商品ID',
  `sku` varchar(30) NOT NULL DEFAULT '0' COMMENT '选择的商品属性ID，多个用,隔开',
  `user_id` mediumint(8) UNSIGNED NOT NULL COMMENT '会员id',
  `amount` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：选中，0：未选中'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';

--
-- 转存表中的数据 `qing_cart`
--

INSERT INTO `qing_cart` (`id`, `goods_id`, `sku`, `user_id`, `amount`, `status`) VALUES
(25, 3, '2,10,24', 1, 1, 1),
(23, 9, '', 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_category`
--

CREATE TABLE `qing_category` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '栏目id',
  `cate_name` varchar(30) NOT NULL COMMENT '栏目名称',
  `seo_title` varchar(150) NOT NULL COMMENT '栏目标题',
  `seo_keywords` varchar(150) NOT NULL COMMENT '关键词',
  `seo_description` varchar(255) NOT NULL COMMENT '描述',
  `content` text COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：显示 0：隐藏',
  `thumb` varchar(150) DEFAULT NULL COMMENT '图片',
  `link` varchar(150) NOT NULL COMMENT '栏目外链',
  `listorder` smallint(6) NOT NULL DEFAULT '50' COMMENT '排序',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `type_id` int(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_category`
--

INSERT INTO `qing_category` (`id`, `cate_name`, `seo_title`, `seo_keywords`, `seo_description`, `content`, `status`, `thumb`, `link`, `listorder`, `parent_id`, `type_id`) VALUES
(1, '女装 / 内衣', '', '', '', NULL, 1, '/public/upload/20200907/a9a2ebdfc574b7ba4f63111b725173a1.jpg', '', 1, 0, 2),
(2, '浪漫裙装', '', '', '', NULL, 0, NULL, '', 50, 1, 1),
(3, '美妆 / 护理', '', '', '', NULL, 1, '/public/upload/20200907/6720d04938b02fad0a8df2468a954b98.jpg', '', 3, 0, 0),
(4, '生活电器', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 4, 0, 0),
(5, '护肤品', '', '', '', NULL, 1, '/public/upload/20200907/3dfe3c4b167f688385657d72d1321bc5.jpg', '', 50, 3, 0),
(6, '家居服', '', '', '', NULL, 1, '/public/upload/20200907/bf429889460c7a17b6521c201ef06b18.jpg', '', 50, 1, 0),
(7, '彩妆', '', '', '', NULL, 1, '/public/upload/20200907/59feb5c76f25fc55545541c381f6fb7f.jpg', '', 50, 3, 0),
(8, '洗衣机', '', '', '', NULL, 1, NULL, '', 50, 4, NULL),
(9, '电冰箱', '', '', '', NULL, 1, NULL, '', 50, 4, NULL),
(10, '家居 / 建材', '', '', '', NULL, 1, NULL, '', 50, 0, NULL),
(11, '母婴 / 玩具', '', '', '', NULL, 1, NULL, '', 50, 0, NULL),
(12, '图书 / 音像', '', '', '', NULL, 1, NULL, '', 30, 0, NULL),
(13, '零食 / 茶酒', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 5, 0, 0),
(14, '手机 / 数码', '', '', '', NULL, 1, '/public/upload/20200907/5feb28d16702eaf24bf85ebccc954d2d.jpg', '', 2, 0, 0),
(15, '腕表 / 首饰', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 6, 0, 0),
(16, '小米', '', '', '', NULL, 1, NULL, '', 50, 18, 1),
(17, '荣耀', '', '', '', NULL, 1, NULL, '', 50, 18, NULL),
(18, '热门手机', '', '', '', NULL, 1, NULL, '', 50, 14, 1),
(19, '电脑整机', '', '', '', NULL, 1, NULL, '', 50, 14, NULL),
(20, '笔记本', '', '', '', NULL, 1, NULL, '', 50, 19, NULL),
(21, '平板电脑', '', '', '', NULL, 1, NULL, '', 50, 19, NULL),
(22, '台式机', '', '', '', NULL, 1, NULL, '', 50, 19, NULL),
(23, '一体机', '', '', '', NULL, 1, NULL, '', 50, 19, NULL),
(24, '游戏本', '', '', '', NULL, 1, NULL, '', 50, 19, NULL),
(25, 'iPad', '', '', '', NULL, 1, NULL, '', 50, 19, NULL),
(26, 'Iphone', '', '', '', NULL, 1, NULL, '', 50, 18, NULL),
(27, '魅族', '', '', '', NULL, 1, NULL, '', 50, 18, NULL),
(28, '华为', '', '', '', NULL, 1, NULL, '', 50, 18, NULL),
(29, 'OPPO', '', '', '', NULL, 1, NULL, '', 50, 18, NULL),
(30, '智能数码', '', '', '', NULL, 1, NULL, '', 50, 14, NULL),
(31, '智能设备', '', '', '', NULL, 1, NULL, '', 50, 30, NULL),
(32, '智能手表', '', '', '', NULL, 1, NULL, '', 50, 30, NULL),
(33, '智能手环', '', '', '', NULL, 1, NULL, '', 50, 30, NULL),
(34, 'VR眼镜', '', '', '', NULL, 1, NULL, '', 50, 30, NULL),
(35, '智能摄像', '', '', '', NULL, 1, NULL, '', 50, 30, NULL),
(36, '智能健康', '', '', '', NULL, 1, NULL, '', 50, 30, NULL),
(37, '智能机器人', '', '', '', NULL, 1, NULL, '', 50, 30, NULL),
(38, '硬件存储', '', '', '', NULL, 1, NULL, '', 50, 14, NULL),
(39, '显示器', '', '', '', NULL, 1, NULL, '', 50, 38, NULL),
(40, '机械键盘', '', '', '', NULL, 1, NULL, '', 50, 38, NULL),
(41, '固态硬盘', '', '', '', NULL, 1, NULL, '', 50, 38, NULL),
(42, 'CPU', '', '', '', NULL, 1, NULL, '', 50, 38, NULL),
(43, '显卡', '', '', '', NULL, 1, NULL, '', 50, 38, NULL),
(44, '主板', '', '', '', NULL, 1, NULL, '', 50, 38, NULL),
(45, '高速U盘', '', '', '', NULL, 1, NULL, '', 50, 38, NULL),
(46, '路由器', '', '', '', NULL, 1, NULL, '', 50, 38, NULL),
(47, '摄影摄像', '', '', '', NULL, 1, NULL, '', 50, 14, NULL),
(48, '相机', '', '', '', NULL, 1, NULL, '', 50, 47, NULL),
(49, '单反', '', '', '', NULL, 1, NULL, '', 50, 47, NULL),
(50, '单电微单', '', '', '', NULL, 1, NULL, '', 50, 47, NULL),
(51, '摄像机', '', '', '', NULL, 1, NULL, '', 50, 47, NULL),
(52, '自拍神器', '', '', '', NULL, 1, NULL, '', 50, 47, NULL),
(53, '拍立得', '', '', '', NULL, 1, NULL, '', 50, 47, NULL),
(54, '镜头', '', '', '', NULL, 1, NULL, '', 50, 47, NULL),
(55, '自拍杆', '', '', '', NULL, 1, NULL, '', 50, 47, NULL),
(56, '影音娱乐', '', '', '', NULL, 1, NULL, '', 50, 14, NULL),
(57, '耳机', '', '', '', NULL, 1, NULL, '', 50, 56, NULL),
(58, '天猫魔盒', '', '', '', NULL, 1, NULL, '', 50, 56, NULL),
(59, '数码影音', '', '', '', NULL, 1, NULL, '', 50, 56, NULL),
(60, '家庭影院', '', '', '', NULL, 1, NULL, '', 50, 56, NULL),
(61, '蓝牙耳机', '', '', '', NULL, 1, NULL, '', 50, 56, NULL),
(62, '网络播放器', '', '', '', NULL, 1, NULL, '', 50, 56, NULL),
(63, '精选上装', '', '', '', NULL, 1, '/public/upload/20200907/12e2badae06d0be8dd1f6186c4142ea6.jpg', '', 50, 1, 2),
(64, '女士下装', '', '', '', NULL, 1, '/public/upload/20200907/bc7a1f58d4d737ffc2842f9483f2d7b0.jpg', '', 50, 1, 0),
(65, '特色女装', '', '', '', NULL, 1, '/public/upload/20200907/5b999d2f7a73e7616fe6f86e8b9eab4b.jpg', '', 50, 1, 0),
(66, '文胸塑身', '', '', '', NULL, 1, '/public/upload/20200907/049adc94a689a1ec4bccba90c43e719a.jpg', '', 50, 1, 0),
(67, '毛呢外套', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(68, '羽绒服', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(69, '棉服', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(70, '丝绒卫衣', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(71, '毛针织衫', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(72, '皮毛一体', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(73, '皮草', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(74, '毛衣', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 63, 2),
(75, '衬衫', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(76, '卫衣', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 63, 2),
(77, '针织衫', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(78, 'T恤', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(79, '短外套', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(80, '小西装', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(81, '风衣', '', '', '', NULL, 1, NULL, '', 50, 63, NULL),
(82, '连衣裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(83, '半身裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(84, 'A字裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(85, '荷叶边裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(86, '大摆裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(87, '包臀裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(88, '百褶裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(89, '长袖', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(90, '连衣裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(91, '棉麻连衣裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(92, '牛仔裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(93, '蕾丝连衣裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(94, '真丝连衣裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(95, '印花连衣裙', '', '', '', NULL, 1, NULL, '', 50, 2, NULL),
(96, '春夏家居服', '', '', '', NULL, 1, NULL, '', 50, 6, NULL),
(97, '纯棉家居服', '', '', '', NULL, 1, NULL, '', 50, 6, NULL),
(98, '莫代尔家居服', '', '', '', NULL, 1, NULL, '', 50, 6, NULL),
(99, '真丝家居服', '', '', '', NULL, 1, NULL, '', 50, 6, NULL),
(100, '春夏睡裙', '', '', '', NULL, 1, NULL, '', 50, 6, NULL),
(101, '男士家居服', '', '', '', NULL, 1, NULL, '', 50, 6, NULL),
(102, '情侣家居服', '', '', '', NULL, 1, NULL, '', 50, 6, NULL),
(103, '性感睡裙', '', '', '', NULL, 1, NULL, '', 50, 6, NULL),
(104, '休闲裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(105, '阔腿裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(106, '牛仔裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(107, '打底裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(108, '开叉运动裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(109, '哈伦裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(110, '背带裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(111, '小脚裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(112, '西装裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(113, '短裤', '', '', '', NULL, 1, NULL, '', 50, 64, NULL),
(114, '时尚套装', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(115, '休闲套装', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(116, '日系女装', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(117, '精选妈妈装', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(118, '大码女装', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(119, '职业套装', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(120, '优雅旗袍', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(121, '精致礼服', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(122, '婚纱', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(123, '唐装', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(124, '小码女装', '', '', '', NULL, 1, NULL, '', 50, 65, NULL),
(125, '光面文胸', '', '', '', NULL, 1, NULL, '', 50, 66, NULL),
(126, '运动文胸', '', '', '', NULL, 1, NULL, '', 50, 66, NULL),
(127, '美背文胸', '', '', '', NULL, 1, NULL, '', 50, 66, NULL),
(128, '聚拢文胸', '', '', '', NULL, 1, NULL, '', 50, 66, NULL),
(129, '大杯文胸', '', '', '', NULL, 1, NULL, '', 50, 66, NULL),
(130, '轻薄塑身', '', '', '', NULL, 1, NULL, '', 50, 66, NULL),
(131, '家居服', '', '', '', '', 1, '/public/upload/20200907/6502a54382a96c2f370933c280a8456f.jpg', '', 50, 1, 1),
(132, '精选上衣', '', '', '', '', 1, '/public/upload/20200907/be5921de5ee20e4932305a8dabd8d7d8.jpg', '', 50, 1, 1),
(133, '家居服A', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 6, 2),
(134, '家居服B', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 6, 2),
(138, '进口零食', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 13, 1),
(139, '休闲零食', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 13, 1),
(140, '酒类', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 13, 1),
(141, '茶叶1', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 13, 1),
(142, '茶叶2', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 13, 1),
(143, '', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 13, 1),
(144, '大牌乐器', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 12, 1),
(145, '儿童读书', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 12, 1),
(146, '儿童读物1', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 12, 1),
(148, '儿童读书2', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 12, 1),
(149, '儿童读书3', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 12, 1),
(150, '玩具', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 11, 1),
(151, '童装', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 11, 1),
(155, '电视机', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 4, 3),
(153, '婴儿服', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 11, 1),
(154, '奶粉', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 11, 1),
(156, '液晶电视机', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 155, 3),
(157, '灯饰照明', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 4, 0),
(158, '灯泡', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 157, 0),
(159, '办公文教', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 14, 0),
(160, '婴儿玩具', '', '', '', NULL, 1, '/public/static/index/images/thumb.jpg', '', 50, 150, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qing_collect`
--

CREATE TABLE `qing_collect` (
  `id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品收藏';

--
-- 转存表中的数据 `qing_collect`
--

INSERT INTO `qing_collect` (`id`, `goods_id`, `time`, `user_id`) VALUES
(15, 1, 1596103600, 1),
(16, 2, 1596103607, 1),
(17, 5, 1596103627, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_comment`
--

CREATE TABLE `qing_comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL DEFAULT '',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `star` tinyint(3) NOT NULL DEFAULT '3',
  `order_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_comment`
--

INSERT INTO `qing_comment` (`id`, `user_id`, `content`, `goods_id`, `time`, `star`, `order_id`) VALUES
(1, 1, '很棒的哦', 5, 1599182644, 5, 2),
(2, 1, '还可以吧', 4, 1599182681, 4, 4),
(3, 1, '还凑合吧', 5, 1599182705, 4, 6),
(4, 1, '手感不错呢', 1, 1599182723, 5, 6),
(6, 1, '好评', 4, 1599211817, 5, 10),
(7, 1, '好评', 6, 1599212292, 5, 3),
(15, 1, '好评', 4, 1599221031, 5, 13),
(14, 1, '好评', 7, 1599221030, 5, 13),
(13, 1, '好评', 5, 1599221028, 5, 12),
(12, 1, '好评', 3, 1599221027, 5, 12),
(16, 1, '好评', 8, 1599221571, 5, 11);

-- --------------------------------------------------------

--
-- 表的结构 `qing_config`
--

CREATE TABLE `qing_config` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '配置项id',
  `cname` varchar(60) NOT NULL COMMENT '中文名称',
  `ename` varchar(60) NOT NULL COMMENT '英文名称',
  `value` text NOT NULL COMMENT '默认值',
  `values` varchar(255) NOT NULL COMMENT '可选值',
  `field_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：输入框 2：文本域  3：复选 4：下拉菜单 6：附件',
  `config_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：基本信息 2：联系方式 3：seo设置 '
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_config`
--

INSERT INTO `qing_config` (`id`, `cname`, `ename`, `value`, `values`, `field_type`, `config_type`) VALUES
(1, '网站名称', 'webname', '德州动派网络科技有限公司--电商系统开发', '', 1, 1),
(2, '网站域名', 'domain', 'http://www.dongpaiweb.cn', '', 1, 1),
(13, 'SEO关键字', 'index_keywords', '', '', 1, 1),
(4, '版权信息', 'copyright', '© 版权所有 德州动派网络科技有限公司 保留所有权利', '', 1, 1),
(5, '备案号', 'beian', '鲁ICP备18038664号-1', '', 1, 1),
(6, '统计代码', 'cnzz', '', '', 2, 1),
(7, '地址', 'address', '', '', 1, 2),
(8, '电话1', 'tel1', '17615342770', '', 1, 2),
(9, '电话2', 'tel2', '', '', 1, 2),
(10, 'QQ', 'qq', '', '', 1, 2),
(11, '邮箱', 'email', '', '', 1, 2),
(12, '传真', 'fax', '', '', 1, 2),
(14, 'SEO描述', 'seo_description', '', '', 1, 1),
(15, '签到赚钱积分', 'score', '2', '', 1, 1),
(16, '生日值每天领取数量', 'shengrizhi_number', '10', '', 1, 1),
(17, '积分兑换', 'jifen', '每次只能兑换5个', '', 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `qing_coupons`
--

CREATE TABLE `qing_coupons` (
  `id` int(11) NOT NULL,
  `money1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `money2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `time1` int(11) NOT NULL COMMENT '开始时间',
  `time2` int(11) NOT NULL COMMENT '结束时间',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(10) NOT NULL DEFAULT '1' COMMENT '优惠券数量',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='优惠券';

--
-- 转存表中的数据 `qing_coupons`
--

INSERT INTO `qing_coupons` (`id`, `money1`, `money2`, `time1`, `time2`, `name`, `count`, `status`) VALUES
(2, '100', '10', 1588671659, 1620207661, '五一大促', 4, 1),
(3, '200', '20', 1595952000, 1715875200, '9月就业季', 1, 0),
(4, '50', '10', 1596111081, 1664626287, '新人优惠券', 0, 0),
(5, '100', '20', 1588498772, 1590116148, '5月就业季', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_coupons_user`
--

CREATE TABLE `qing_coupons_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupons_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0未使用，1已使用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='优惠券';

--
-- 转存表中的数据 `qing_coupons_user`
--

INSERT INTO `qing_coupons_user` (`id`, `user_id`, `coupons_id`, `status`) VALUES
(4, 1, 4, 0),
(2, 1, 2, 1),
(5, 1, 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_express`
--

CREATE TABLE `qing_express` (
  `id` int(200) NOT NULL,
  `code` varchar(50) NOT NULL COMMENT '快递公司代号',
  `name` varchar(20) NOT NULL COMMENT '快递公司名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递公司代号';

--
-- 转存表中的数据 `qing_express`
--

INSERT INTO `qing_express` (`id`, `code`, `name`) VALUES
(1, 'BTWL', '百世快运'),
(2, 'DBL', '德邦'),
(3, 'EMS', 'EMS'),
(4, 'HHTT', '天天快递'),
(5, 'HTKY', '百世快递'),
(6, 'JJKY', '佳吉快运'),
(7, 'QFKD', '全峰快递'),
(8, 'SF', '顺丰快递'),
(9, 'STO', '申通快递'),
(10, 'YD', '韵达快递'),
(11, 'YTO', '圆通速递'),
(12, 'YZPY', '邮政平邮/小包'),
(13, 'ZTO', '中通速递');

-- --------------------------------------------------------

--
-- 表的结构 `qing_fapiao`
--

CREATE TABLE `qing_fapiao` (
  `id` int(11) NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `money` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `beizhu` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未开具,1已开具',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) NOT NULL,
  `out_trade_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发票管理';

--
-- 转存表中的数据 `qing_fapiao`
--

INSERT INTO `qing_fapiao` (`id`, `company`, `code`, `time`, `money`, `beizhu`, `status`, `email`, `user_id`, `out_trade_no`) VALUES
(1, '11', '111dsds', 1595671047, '200', 'fdfdf', 1, 'dsd@qq.com', 1, '8dad4cd7c1b9af64a6e421aa138d6813'),
(2, 'fdfdsfds', 'fdfdfds', 1595671276, '100', '文具', 1, 'dfdf@qq.com', 1, '8dad4cd7c1b9af64a6e421aa138d681d');

-- --------------------------------------------------------

--
-- 表的结构 `qing_fenyong`
--

CREATE TABLE `qing_fenyong` (
  `id` int(11) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `qing_fenyong`
--

INSERT INTO `qing_fenyong` (`id`, `code`, `user_id`) VALUES
(1, 'YJ1582684960', 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_flink`
--

CREATE TABLE `qing_flink` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='友情链接表';

-- --------------------------------------------------------

--
-- 表的结构 `qing_goods`
--

CREATE TABLE `qing_goods` (
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(200) NOT NULL,
  `goods_short_name` varchar(60) DEFAULT NULL,
  `goods_thumb` varchar(200) DEFAULT NULL,
  `goods_price` varchar(50) DEFAULT NULL,
  `goods_status` tinyint(10) NOT NULL DEFAULT '1' COMMENT '上架1下架-1',
  `goods_cate_id` int(10) NOT NULL DEFAULT '0',
  `market_price` varchar(100) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `type_id` int(10) DEFAULT NULL,
  `isnew` int(5) NOT NULL DEFAULT '0',
  `isbest` int(5) NOT NULL DEFAULT '0',
  `ishot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '热销',
  `goods_code` int(100) DEFAULT NULL,
  `listorder` int(10) DEFAULT '0',
  `cate_path` varchar(100) DEFAULT NULL COMMENT '分类路径',
  `xiaoliang` int(200) DEFAULT '0',
  `single_standard` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1统一规格，2多规格',
  `post_money` varchar(20) NOT NULL DEFAULT '0' COMMENT '邮费',
  `stock` int(20) NOT NULL DEFAULT '0' COMMENT '库存',
  `selnumber` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `click` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `qing_goods`
--

INSERT INTO `qing_goods` (`goods_id`, `goods_name`, `goods_short_name`, `goods_thumb`, `goods_price`, `goods_status`, `goods_cate_id`, `market_price`, `keywords`, `description`, `time`, `type_id`, `isnew`, `isbest`, `ishot`, `goods_code`, `listorder`, `cate_path`, `xiaoliang`, `single_standard`, `post_money`, `stock`, `selnumber`, `click`) VALUES
(1, '小米11', '享12期分期免息，赠小米129元双动圈耳机', '/public/upload/20200812/ee3efe2b59b4f924b27f3939c74348bc.jpg', '1600', 1, 16, '1800', '', '', 1597200669, 1, 0, 1, 1, NULL, 0, '14_18_16', 0, 2, '0', 0, 1, 84),
(2, '小米22', ' 4500mAh+33W闪充', '/public/upload/20200625/cd4055e97782ef3b2d60fea5076c1572.jpg', '1600', 1, 16, '1800', '', '', 1600656761, 1, 0, 1, 1, NULL, 1, '14_18_16', 0, 2, '1', 0, 5, 13),
(3, '华为111', '120Hz弹出全面屏', '/public/upload/20200625/d4df8f952223634d1fec851dd0522107.jpg', '0.01', 1, 28, '0.02', '', '', 1600656726, 1, 0, 1, 1, NULL, 2, '14_18_28', 0, 2, '0', 0, 0, 11),
(4, '电视机11', '', '/public/upload/20200625/0759f34f3c05e3e800fe811f8d94c2e6.jpg', '5888', 1, 156, '8000', '', '', 1593080663, 3, 0, 1, 1, NULL, 0, '4_155_156', 0, 2, '0', 0, 12, 15),
(5, '智睿LED灯泡 10只装', '', '/public/upload/20200625/b014f074c410cd1f72b2c05e5dc37d04.jpg', '99', 1, 158, '199', '', '', 1593080706, 0, 0, 1, 1, NULL, 1, '4_157_158', 0, 1, '0', 100, 2, 43),
(6, '小米33', '「6GB+128GB到手价仅1399元；8GB+128GB到手价仅1599元；8GB+256GB到手价仅1799元」', '/public/upload/20200810/7c2921c04fda2943e8b4d41011ea99d1.jpg', '1900', 1, 16, '2100', '', '5000mAh长循环大电量 / 6.53\"超大护眼屏幕 / G25八核处理器 / 大音量扬声器 / 1300万 AI相机 / 人脸解锁 / 最高支持512GB存储扩展', 1597049554, 1, 0, 1, 1, NULL, 0, '14_18_16', 0, 2, '11', 0, 4, 44),
(7, 'Redmi手环', '', '/public/upload/20200904/bc87fb6becf47e9afabfc0ee61a6c3bd.jpg', '99', 1, 33, '149', '', '1.08英寸大屏彩显 / 14天续航，快拆直插充电 / 腕上信息提醒，一目了然 / 科学算法，守护你的健康', 1599181773, 0, 0, 1, 1, NULL, 0, '14_30_33', 0, 1, '0', 0, 0, 11),
(8, '小米户外蓝牙音箱', '', '/public/upload/20200904/d0aa10a258d17ec93e6bd03ea5d80719.jpg', '0.02', 1, 59, '199', '', '大音量 / 长续航 / 轻盈便携 / 360°环绕立体声 / IP55防尘防水 / 双麦克风降噪通话 / 蓝牙5.0 / type-c接口', 1600508382, 0, 0, 1, 1, NULL, 0, '14_56_59', 0, 1, '0', 0, 0, 9),
(9, '2020鼠年卡通创意滴胶小老鼠可爱钥匙扣挂件钥匙链情侣网红包挂件', '', '/public/upload/20200919/324f03e92af57a6f1dbbec0e04f29870.jpg', '1', 1, 160, '6', '', '', 1600509569, 0, 0, 1, 1, NULL, 0, '11_150_160', 0, 1, '0', 0, 0, 4),
(10, '洋气网红上衣春秋季2020新款秋装短款针织开衫粗线很仙的毛衣外套', '', '/public/upload/20200919/702a1b47fd2d89863efb072179c9d4d3.jpg', '2', 1, 74, '5', '', '', 1600510090, 2, 0, 1, 1, NULL, 0, '1_63_74', 0, 2, '0', 0, 0, 2),
(11, 'MLB官方 男女卫衣复古老花系列长袖宽松运动休闲潮流圆领秋季MTM1', '', '/public/upload/20200919/3ab5ae38ba4b52b26bddb09f5d32c2ea.jpg', '1.5', 1, 76, '2', '', '', 1600659603, 2, 0, 1, 1, NULL, 0, '1_63_76', 0, 2, '0', 0, 0, 5),
(12, '全面屏电视E43K', '全面屏设计，海量内容', '/public/upload/20200921/266ea6ccc529110760cb3b238b8528da.jpg', '1300', 1, 156, '1500', '', '', 1600657906, 3, 0, 1, 1, NULL, 0, '4_155_156', 0, 2, '0', 0, 0, 6),
(13, '高腰打底裤女裤外穿春秋冬款紧身显瘦百搭小脚黑色铅笔魔术小黑裤', '高腰收腹版型显瘦/显腿长+定制不抽丝不起球', '/public/upload/20200921/0f857bc7876c24ab07aabb5589b8b716.jpg', '65', 1, 111, '88', '', '', 1600660630, 2, 0, 1, 1, NULL, 0, '1_64_111', 0, 2, '1', 0, 0, 5);

-- --------------------------------------------------------

--
-- 表的结构 `qing_goods_attr`
--

CREATE TABLE `qing_goods_attr` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `standard_value_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品属性表';

--
-- 转存表中的数据 `qing_goods_attr`
--

INSERT INTO `qing_goods_attr` (`id`, `goods_id`, `standard_value_id`) VALUES
(1, 1, 2),
(2, 1, 6),
(3, 1, 10),
(4, 2, 5),
(5, 2, 3),
(6, 2, 10),
(7, 3, 11),
(8, 3, 16);

-- --------------------------------------------------------

--
-- 表的结构 `qing_goods_content`
--

CREATE TABLE `qing_goods_content` (
  `goods_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品详情表';

--
-- 转存表中的数据 `qing_goods_content`
--

INSERT INTO `qing_goods_content` (`goods_id`, `content`) VALUES
(1, ''),
(2, ''),
(3, ''),
(4, ''),
(5, ''),
(6, '<p>小米手机还不错的</p>'),
(7, '<p><img src=\"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c9db39101d147cdf7a70b672cf0f1cf4.jpg\"/></p>'),
(8, '<p style=\"text-align: center;\"><img src=\"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/c46236720812ec59cf38fae1faddcdd1.jpg\"/></p>'),
(9, ''),
(10, '<p><img src=\"https://img.alicdn.com/imgextra/i3/1792580015/TB2pTmDairz11Bjy1XaXXbRrFXa_!!1792580015.jpg\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/1792580015/TB2lEayaaLB11BjSspkXXcy9pXa_!!1792580015.jpg\"/></p>'),
(11, '<p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i1/2201410209674/O1CN01LKNbm22LKk8kepzxG_!!2201410209674.jpg\"/></p>'),
(12, '<p style=\"text-align: center;\"><img src=\"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e627ee5af6c036206496abc30102d994.jpg?w=1212&h=716\"/></p>'),
(13, '<p style=\"text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i2/3829438756/O1CN01GBJhCv2EYIXasjmuR_!!3829438756.jpg\"/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `qing_goods_img`
--

CREATE TABLE `qing_goods_img` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品轮播图';

--
-- 转存表中的数据 `qing_goods_img`
--

INSERT INTO `qing_goods_img` (`id`, `goods_id`, `image`) VALUES
(20, 4, '/public/upload/20200625/0759f34f3c05e3e800fe811f8d94c2e6.jpg'),
(21, 4, '/public/upload/20200625/332d25febd2802c6d25646e490f904e6.jpg'),
(22, 4, '/public/upload/20200625/e2edfb80ef55f6b3d5e3f5143ec2f451.jpg'),
(23, 4, '/public/upload/20200625/77d3b56a29fea1d1e52644972bb649e1.jpg'),
(24, 4, '/public/upload/20200625/6e902f359bc7be76f32a6355dfac2746.jpg'),
(25, 5, '/public/upload/20200625/b014f074c410cd1f72b2c05e5dc37d04.jpg'),
(68, 6, '/public/upload/20200810/7c2921c04fda2943e8b4d41011ea99d1.jpg'),
(69, 6, '/public/upload/20200810/7e9ba4838998b81b1b8db30628ec0b7b.jpg'),
(70, 6, '/public/upload/20200810/6645cedc4b3209c22722f7296c310311.jpg'),
(71, 6, '/public/upload/20200810/9307a11a5f65ccda184792ff8ffc2834.jpg'),
(72, 1, '/public/upload/20200812/ee3efe2b59b4f924b27f3939c74348bc.jpg'),
(73, 1, '/public/upload/20200812/9814b9a180076f7e2b80498c2b8bd0ae.jpg'),
(74, 1, '/public/upload/20200812/9814b9a180076f7e2b80498c2b8bd0ae.jpg'),
(75, 1, '/public/upload/20200812/dd0fb4eec5422a2677406e96bb6fadfb.jpg'),
(76, 1, '/public/upload/20200812/392f31c3418bed3ce41d01470db4b7d3.jpg'),
(82, 7, '/public/upload/20200904/bc87fb6becf47e9afabfc0ee61a6c3bd.jpg'),
(88, 8, '/public/upload/20200904/d0aa10a258d17ec93e6bd03ea5d80719.jpg'),
(89, 8, '/public/upload/20200904/ad79ea14236173520b3b0fb00999f408.jpg'),
(90, 8, '/public/upload/20200904/627afb0553e9bde45664dd500c6c7c8c.jpg'),
(91, 8, '/public/upload/20200904/9feba4043dfd2d2bb27f78976a03ddb4.jpg'),
(92, 8, '/public/upload/20200904/4396635239cc67b0be30a98333a3c22c.jpg'),
(93, 9, '/public/upload/20200919/324f03e92af57a6f1dbbec0e04f29870.jpg'),
(94, 9, '/public/upload/20200919/db94d077adc4e9a9c9ba508f8eb72768.jpg'),
(95, 9, '/public/upload/20200919/b4fb57a344e0998d56e78f236ca4bd35.jpg'),
(100, 10, '/public/upload/20200919/702a1b47fd2d89863efb072179c9d4d3.jpg'),
(101, 10, '/public/upload/20200919/b45cfdc09b411bb3b00da4d845fd255a.jpg'),
(102, 10, '/public/upload/20200919/b9d032f681d267e796300dbcb780664b.jpg'),
(103, 10, '/public/upload/20200919/4bfa2441d7f54b36b89ed1fd4c91ab00.jpg'),
(106, 3, '/public/upload/20200625/d4df8f952223634d1fec851dd0522107.jpg'),
(107, 3, '/public/upload/20200625/ff665c01957af1b48ff7978132310e81.jpg'),
(108, 3, '/public/upload/20200625/0978b87433b960b2d2b54128b6d238da.jpg'),
(109, 3, '/public/upload/20200625/43d53215feaebb803e3e8f1ef5bae756.jpg'),
(110, 3, '/public/upload/20200625/ffb84865e7ca78eff20070d918af34ee.jpg'),
(111, 2, '/public/upload/20200625/cd4055e97782ef3b2d60fea5076c1572.jpg'),
(112, 2, '/public/upload/20200625/c2854a4d78f1f8433a4f266f477d8e64.jpg'),
(113, 2, '/public/upload/20200625/7f45b8c16aad5cc21627309114bb21ab.jpg'),
(114, 2, '/public/upload/20200625/ec97ef5110c2d4a29e26e354b187d76c.jpg'),
(115, 2, '/public/upload/20200625/ed8a71b4be046e840404804b3b71c5dd.jpg'),
(131, 12, '/public/upload/20200921/266ea6ccc529110760cb3b238b8528da.jpg'),
(132, 12, '/public/upload/20200921/ef79cb9bd8947a88c2dd775571ebb12e.jpg'),
(133, 12, '/public/upload/20200921/6c50423542b12e4968a54a93ebb9bd27.jpg'),
(134, 12, '/public/upload/20200921/4404ad5bac0cd8a39966d8cbff60f426.jpg'),
(135, 12, '/public/upload/20200921/40663991fce833735ee5a82852133fe9.jpg'),
(136, 11, '/public/upload/20200919/3ab5ae38ba4b52b26bddb09f5d32c2ea.jpg'),
(137, 11, '/public/upload/20200919/a97128f488f3868c0a3cc50f3f7f4205.jpg'),
(142, 13, '/public/upload/20200921/0f857bc7876c24ab07aabb5589b8b716.jpg'),
(143, 13, '/public/upload/20200921/0f857bc7876c24ab07aabb5589b8b716.jpg'),
(144, 13, '/public/upload/20200921/61816b80ac5b6e138e828f116c4749ec.jpg'),
(145, 13, '/public/upload/20200921/326f5f49115feaea20d390f222745df8.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `qing_goods_standard`
--

CREATE TABLE `qing_goods_standard` (
  `id` bigint(11) UNSIGNED NOT NULL COMMENT '主键ID',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '基本信息ID',
  `goods_price` varchar(100) DEFAULT NULL COMMENT '市场价',
  `market_price` varchar(100) DEFAULT '0' COMMENT '市场价格',
  `stock` int(10) DEFAULT NULL COMMENT '库存',
  `sku` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `qing_goods_standard`
--

INSERT INTO `qing_goods_standard` (`id`, `goods_id`, `goods_price`, `market_price`, `stock`, `sku`) VALUES
(63, 1, '1800', '2000', 0, '2,10,23'),
(82, 2, '1700', '1800', 0, '3,6,23'),
(81, 2, '1700', '1800', 0, '3,5,23'),
(77, 3, '0.01', '0.02', 0, '2,6,24'),
(13, 4, '5888', '8000', 0, '11,16'),
(80, 2, '1600', '1800', 0, '2,6,23'),
(79, 2, '1600', '1800', 0, '2,5,23'),
(59, 6, '2000', '2100', 0, '3,6,23'),
(62, 1, '1800', '2000', 0, '2,6,23'),
(61, 1, '1600', '1800', 0, '1,10,23'),
(60, 1, '1600', '1800', 0, '1,6,23'),
(58, 6, '2000', '2100', 0, '3,5,23'),
(57, 6, '1900', '2100', 0, '2,6,23'),
(56, 6, '1900', '2100', 0, '2,5,23'),
(69, 10, '2', '5', 0, '7,14'),
(70, 10, '2', '5', 0, '7,15'),
(71, 10, '2', '5', 0, '8,14'),
(72, 10, '2', '5', 0, '8,15'),
(87, 11, '1.5', '2', 0, '26,14'),
(86, 11, '1.5', '2', 0, '7,25'),
(85, 11, '1.5', '2', 0, '7,14'),
(78, 3, '0.01', '0.02', 0, '2,10,24'),
(84, 12, '1300', '1500', 0, '27,28'),
(88, 11, '1.5', '2', 0, '26,25'),
(89, 13, '65', '88', 0, '7,30'),
(90, 13, '65', '88', 0, '8,30'),
(91, 13, '65', '88', 0, '29,30');

-- --------------------------------------------------------

--
-- 表的结构 `qing_goods_standard1`
--

CREATE TABLE `qing_goods_standard1` (
  `id` bigint(11) UNSIGNED NOT NULL COMMENT '主键ID',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '基本信息ID',
  `goods_price` varchar(100) DEFAULT NULL COMMENT '市场价',
  `market_price` varchar(100) DEFAULT '0' COMMENT '市场价格',
  `stock` int(10) DEFAULT NULL COMMENT '库存',
  `sku` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `qing_goods_standard1`
--

INSERT INTO `qing_goods_standard1` (`id`, `goods_id`, `goods_price`, `market_price`, `stock`, `sku`) VALUES
(19, 6, '2200', '2000', 0, '4,10'),
(18, 6, '2200', '2000', 0, '4,6'),
(17, 6, '2200', '2000', 0, '4,6'),
(16, 6, '2200', '2000', 0, '4_6'),
(15, 1, '1600', '1800', 0, '2,10'),
(14, 1, '1600', '1800', 0, '2,6'),
(7, 2, '1600', '2500', 0, '2,5'),
(8, 2, '1600', '2500', 0, '2,6'),
(9, 2, '2200', '2500', 0, '3,5'),
(10, 2, '2200', '2500', 0, '3,6'),
(11, 3, '1500', '1800', 0, '2,6,7'),
(12, 3, '1500', '1800', 0, '2,10'),
(13, 4, '5888', '8000', 0, '11,16'),
(22, 10, '10', '10', 0, '1,2,6'),
(23, 10, '10', '10', NULL, '1,3,6'),
(24, 11, '10', '10', NULL, '1,2,55'),
(25, 11, '10', '10', NULL, '2,4,5');

-- --------------------------------------------------------

--
-- 表的结构 `qing_message`
--

CREATE TABLE `qing_message` (
  `id` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `weixin` varchar(20) DEFAULT NULL,
  `dingdan` varchar(50) DEFAULT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_message`
--

INSERT INTO `qing_message` (`id`, `content`, `name`, `mobile`, `weixin`, `dingdan`, `time`) VALUES
(2, '还哦不错', '王大力', '13988598596', 'shijiazhuang@126.com', '河北省石家庄市裕华区和合大厦201', 1575511676);

-- --------------------------------------------------------

--
-- 表的结构 `qing_news`
--

CREATE TABLE `qing_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `thumb` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `time` int(11) NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='新闻文章';

--
-- 转存表中的数据 `qing_news`
--

INSERT INTO `qing_news` (`id`, `title`, `thumb`, `content`, `time`, `description`) VALUES
(2, '永远相信美好的事情即将发生', '\\public\\upload/20200504\\c88accb7e23efbc1d0e36d956b958c53.jpg', '<p style=\"text-align: center;\"><img src=\"/ueditor/php/upload/image/20200504/1588583651379544.png\" title=\"1588583651379544.png\" alt=\"image.png\"/></p><p><br/></p><p>小米公司正式成立于2010年4月，是一家以手机、智能硬件和 IoT 平台为核心的互联网公司。创业仅7年时间，小米的年收入就突破了千亿元人民币。截止2018年，小米的业务遍及全球80多个国家和地区。&nbsp;&nbsp;</p><p>小米的使命是，始终坚持做“感动人心、价格厚道”的好产品，让全球每个人都能享受科技带来的美好生活。</p>', 1588562918, '小米的使命是，始终坚持做“感动人心、价格厚道”的好产品，让全球每个人都能享受科技带来的美好生活。'),
(3, '感谢您关注小米', '\\public\\upload/20200504\\6b0b7e2c56044e7b9264576d8e5ea97e.jpg', '<p>目前，小米是全球第四大智能手机制造商，在30余个国家和地区的手机市场进入了前五名，特别是在印度，连续5个季度保持手机出货量第一。通过独特的“生态链模式”，小米投资、带动了更多志同道合的创业者，同时建成了连接超过1.3亿台智能设备的IoT平台。&nbsp;</p><p>2018年7月9日，小米成功在香港主板上市，成为了港交所首个同股不同权上市公司，创造了香港史上最大规模科技股IPO，以及当时历史上全球第三大科技股IPO。&nbsp;&nbsp;</p><p>感谢您关注小米，和我们并肩投身于创造商业效率新典范，用科技改善人类生活的壮丽事业。许商业以敦厚，许科技以温暖，许大众以幸福，我们的征途是星辰大海，请和我们一起，永远相信美好的事情即将发生。</p>', 1588562950, '感谢您关注小米，和我们并肩投身于创造商业效率新典范，用科技改善人类生活的壮丽事业。'),
(4, '小米集团申请推迟召开发审委会议的公告', '\\public\\upload/20200504\\125ff34e05f1bc9c821392c0c3252b7f.jpg', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 19px; background-color: rgb(255, 255, 255);\">公司经过反复慎重研究，决定分步实施在香港和境内的上市计划，即先在香港上市之后，再择机通过发行CDR的方式在境内上市。为此，公司将向中国证券监督管理委员会发起申请，推迟召开发审委会议审核公司的CDR发行申请。特此公告</span></p>', 1588581991, '公司经过反复慎重研究，决定分步实施在香港和境内的上市计划，即先在香港上市之后，再择机通过发行CDR的方式在境内上市。'),
(5, '111', '/public/upload/20200602/b90451409c0dab15d692869f5229552c.jpg', NULL, 1590483739, ''),
(8, '说一说ThinkPHP6的空控制器', '/public/static/index/images/thumb.jpg', '<p>空控制器在ThinkPHP6的手册中只占据了一个很小很小的篇幅，以至于空控制器是什么，甚至这个词语，可能很多程序员并没有听过、没有用过，那么这次给大家用实际例子说一说ThinkPHP6的空控制器。</p><p>我们在ThinkPHP6的官方手册中搜索“空控制器”关键字，就可以找到空控制器的章节内容。我们先看看空控制器的官方定义：<br/></p><p>空控制器的概念是指当系统找不到指定的控制器名称的时候，系统会尝试定位当前应用下的空控制器( Error )</p><p>类，利用这个机制我们可以用来定制错误页面和进行URL的优化。</p><p>也就是说我们可以用空控制器来定制我们的错误页面。</p><p>手册中是以单应用举例，但是实际情况我们项目大部分都是多应用，所以接下来我们以多应用举例。</p><p>假设我们项目域名www.xiangmu.com，我们有index和demo两个应用，两个应用下分别有各自的index控制器和index方法。</p><p>1、找不到方法。</p><p>&nbsp; &nbsp; &nbsp; 如果我们在浏览器中随便输入<a href=\"http://www.xiangmu.com/index/index/a，这个地址会访问到index应用下index控制器中的a方法，但是我们a方法并不存在，如果能拒绝这种无效的请求呢？那我们本节的空控制器就登场了。\">www.xiangmu.com/index/index/a，这个地址会访问到index应用下index控制器中的a方法，但是我们a方法并不存在，如果能拒绝这种无效的请求呢？那我们本节的空控制器就登场了。</a> </p><p>我们在index控制中加入下面方法：<br/></p><p>只要访问index控制中找不到的方法，都会走到__call这里。那么既然已经走到了__call()，对于不存在的页面，我们是不是可以做个404.html，用call()去渲染这个模板呢。</p><p>2、找不到控制器。</p><p>上面是找不到方法，如果找不到控制器怎么办？我在浏览器中随便输入控制器，<a href=\"http://www.xiangmu.com/index/index/a%EF%BC%8C%E8%BF%99%E4%B8%AA%E5%9C%B0%E5%9D%80%E4%BC%9A%E8%AE%BF%E9%97%AE%E5%88%B0index%E5%BA%94%E7%94%A8%E4%B8%8Bindex%E6%8E%A7%E5%88%B6%E5%99%A8%E4%B8%AD%E7%9A%84a%E6%96%B9%E6%B3%95%EF%BC%8C%E4%BD%86%E6%98%AF%E6%88%91%E4%BB%ACa%E6%96%B9%E6%B3%95%E5%B9%B6%E4%B8%8D%E5%AD%98%E5%9C%A8%EF%BC%8C%E5%A6%82%E6%9E%9C%E8%83%BD%E6%8B%92%E7%BB%9D%E8%BF%99%E7%A7%8D%E6%97%A0%E6%95%88%E7%9A%84%E8%AF%B7%E6%B1%82%E5%91%A2%EF%BC%9F%E9%82%A3%E6%88%91%E4%BB%AC%E6%9C%AC%E8%8A%82%E7%9A%84%E7%A9%BA%E6%8E%A7%E5%88%B6%E5%99%A8%E5%B0%B1%E7%99%BB%E5%9C%BA%E4%BA%86%E3%80%82\" style=\"white-space: normal;\">www.xiangmu.com/index/a/a</a>，实际上我们没有a控制器也没有a方法，<a href=\"http://www.xiangmu.com/index/index/a%EF%BC%8C%E8%BF%99%E4%B8%AA%E5%9C%B0%E5%9D%80%E4%BC%9A%E8%AE%BF%E9%97%AE%E5%88%B0index%E5%BA%94%E7%94%A8%E4%B8%8Bindex%E6%8E%A7%E5%88%B6%E5%99%A8%E4%B8%AD%E7%9A%84a%E6%96%B9%E6%B3%95%EF%BC%8C%E4%BD%86%E6%98%AF%E6%88%91%E4%BB%ACa%E6%96%B9%E6%B3%95%E5%B9%B6%E4%B8%8D%E5%AD%98%E5%9C%A8%EF%BC%8C%E5%A6%82%E6%9E%9C%E8%83%BD%E6%8B%92%E7%BB%9D%E8%BF%99%E7%A7%8D%E6%97%A0%E6%95%88%E7%9A%84%E8%AF%B7%E6%B1%82%E5%91%A2%EF%BC%9F%E9%82%A3%E6%88%91%E4%BB%AC%E6%9C%AC%E8%8A%82%E7%9A%84%E7%A9%BA%E6%8E%A7%E5%88%B6%E5%99%A8%E5%B0%B1%E7%99%BB%E5%9C%BA%E4%BA%86%E3%80%82\" style=\"white-space: normal;\">如果能拒绝这种无效的请求呢？</a></p><p>那用下面的Error.php控制器就可以解决，加入当前访问的是index应用，我们就把Error.php放在index应用下。同理我们也可以设置404等错误页面哦。</p><p><br/></p><p><br/></p><p><br/></p>', 1591870366, '');

-- --------------------------------------------------------

--
-- 表的结构 `qing_notice`
--

CREATE TABLE `qing_notice` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为全体，1为某个',
  `title` varchar(100) NOT NULL,
  `content` text,
  `time` int(10) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='通知消息';

--
-- 转存表中的数据 `qing_notice`
--

INSERT INTO `qing_notice` (`id`, `type`, `title`, `content`, `time`, `user_id`) VALUES
(1, 0, '刘同学回复了你的商品分类与商品sku问题，可能有你需要的答案。', '<p>刘同学回复了你的商品分类与商品sku问题，可能有你需要的答案。刘同学回复了你的商品分类与商品sku问题，可能有你需要的答案。</p>', 1575511676, NULL),
(2, 0, '天下谁人不识君关注了你', '天下谁人不识君关注了你天下谁人不识君关注了你', 1575860919, NULL),
(3, 0, '一大把破优惠券来袭！', 'fff', 1575860999, ''),
(4, 0, '你参与的问题被回复了，可能有新收获？', '<p><a target=\"_blank\" href=\"http://coding.imooc.com/learn/questiondetail/159290.html\" style=\"margin: 0px; padding: 0px 5px; outline: 0px; text-decoration-line: none; color: rgb(147, 153, 159); font-weight: 700; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">你参与的问题被回复了，可能有新收获？</a></p>', 1588646762, '0'),
(5, 1, '尊敬的用户，您有8张优惠券即将过期，机不可失，来选一门心仪的课程吧！', '<p><a target=\"_blank\" href=\"https://order.imooc.com/coupon\" style=\"margin: 0px; padding: 0px 5px; outline: 0px; text-decoration-line: none; color: rgb(147, 153, 159); font-weight: 700; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">尊敬的用户，您有8张优惠券即将过期，机不可失，来选一门心仪的课程吧！</a></p>', 1588647018, '1'),
(6, 1, '你的状态筛选性能问题问题，可能有你需要的答案。', '<p><a target=\"_blank\" href=\"http://coding.imooc.com/learn/questiondetail/167280.html\" style=\"margin: 0px; padding: 0px 5px; outline: 0px; text-decoration-line: none; color: rgb(147, 153, 159); font-weight: 700; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">你的状态筛选性能问题问题，可能有你需要的答案。</a></p>', 1588647789, '1'),
(7, 1, '你的状态筛选性能问题问题，可能有你需要的答案。', '<p><a target=\"_blank\" href=\"http://coding.imooc.com/learn/questiondetail/167280.html\" style=\"margin: 0px; padding: 0px 5px; outline: 0px; text-decoration-line: none; color: rgb(147, 153, 159); font-weight: 700; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);\">你的状态筛选性能问题问题，可能有你需要的答案。</a></p>', 1588647789, '2'),
(8, 1, '您的优惠券马上过期了，请尽快使用', '', 1589938762, '1,2,3');

-- --------------------------------------------------------

--
-- 表的结构 `qing_notice_read`
--

CREATE TABLE `qing_notice_read` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notice_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='通知消息已读表';

-- --------------------------------------------------------

--
-- 表的结构 `qing_order`
--

CREATE TABLE `qing_order` (
  `id` int(11) NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL COMMENT '会员id',
  `time` int(10) UNSIGNED NOT NULL COMMENT '下单时间',
  `address_id` varchar(30) NOT NULL COMMENT '收货信息',
  `content` varchar(50) DEFAULT NULL COMMENT '订单备注',
  `total_price` varchar(100) NOT NULL COMMENT '定单总价',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0：待付款，1：支付完成，待发货，2：已完成，4：已发货未签收',
  `pay_method` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：微信支付，2：支付宝支付',
  `postcode` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `express_code` varchar(10) DEFAULT NULL COMMENT '快递公司代号',
  `isfapiao` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：已开发票 0：未开发票',
  `out_trade_no` varchar(100) NOT NULL COMMENT '订单号',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `iscomment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未评论 1已评论'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定单基本信息';

--
-- 转存表中的数据 `qing_order`
--

INSERT INTO `qing_order` (`id`, `user_id`, `time`, `address_id`, `content`, `total_price`, `status`, `pay_method`, `postcode`, `express_code`, `isfapiao`, `out_trade_no`, `pay_time`, `iscomment`) VALUES
(2, 1, 1598427486, '2', '', '99', 2, 2, NULL, NULL, 0, '1dfc9cc646e5cc6b4734a6ad7ade3c79', NULL, 1),
(3, 1, 1598427511, '2', '', '3811', 2, 1, NULL, NULL, 0, 'aa30be8e6f38677635b40e778e272879', 1598514310, 1),
(4, 1, 1598514361, '2', '', '5888', 2, 1, NULL, NULL, 0, 'e90db5aa926d9c56e291d68ed7bf2ad1', NULL, 1),
(6, 1, 1599035542, '2', '', '1899', 2, 2, NULL, NULL, 0, '61f7f2bf2d2dc72a38a8ebe80e2fc974', NULL, 1),
(8, 1, 1599182403, '2', '', '5211', 0, 2, NULL, NULL, 0, '21c8a66df01d155a8af2f2526697ec79', NULL, 0),
(10, 1, 1599120914, '2', '', '5888', 2, 2, NULL, NULL, 0, 'ab0efb33ebc57be99ec0e4fca6ff01fa', NULL, 1),
(11, 1, 1599124518, '2', '', '169', 2, 1, NULL, NULL, 0, '1a1dd5c799de66c67736ca2d7a2e5305', NULL, 1),
(12, 1, 1599124514, '2', '', '1599', 2, 2, NULL, NULL, 0, '89f8f42719c5cddcc7be9a293323b08d', NULL, 1),
(13, 1, 1599124518, '2', '', '5987', 2, 1, NULL, NULL, 0, '0dbd748c6dc4c473edb8af998de21cb3', NULL, 1),
(14, 1, 1600508411, '2', '', '0.02', 0, 1, NULL, NULL, 0, '369b7cb9a7d3372503e01e634374f349', NULL, 0),
(15, 1, 1600508567, '2', '', '0.02', 0, 1, NULL, NULL, 0, 'c6362e833e13a9d08ab132c6de7298d5', NULL, 0),
(16, 1, 1600508714, '2', '', '0.02', 0, 1, NULL, NULL, 0, '79d582a96a711d0cddcd05f87aa5261e', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qing_order_goods`
--

CREATE TABLE `qing_order_goods` (
  `order_id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `goods_price` float NOT NULL,
  `sku` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `post_money` float NOT NULL DEFAULT '0' COMMENT '邮费',
  `iscomment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未评论 1已评论'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户订单商品表';

--
-- 转存表中的数据 `qing_order_goods`
--

INSERT INTO `qing_order_goods` (`order_id`, `goods_id`, `amount`, `goods_price`, `sku`, `id`, `post_money`, `iscomment`) VALUES
(2, 5, 1, 99, '', 3, 0, 1),
(3, 6, 2, 1900, '64G,玫瑰粉,标准套餐', 4, 11, 1),
(4, 4, 1, 5888, '70寸,灰色', 5, 0, 1),
(6, 5, 1, 99, '', 7, 0, 1),
(6, 1, 1, 1800, '64G,土豪金,标准套餐', 8, 0, 1),
(8, 1, 2, 1600, '32G,土豪金,标准套餐', 10, 0, 0),
(8, 6, 1, 2000, '128G,玫瑰粉,标准套餐', 11, 11, 0),
(10, 4, 1, 5888, '70寸,灰色', 13, 0, 1),
(11, 8, 1, 169, '', 14, 0, 1),
(12, 3, 1, 1500, '64G,土豪金', 15, 0, 1),
(12, 5, 1, 99, '', 16, 0, 1),
(13, 7, 1, 99, '', 17, 0, 1),
(13, 4, 1, 5888, '70寸,灰色', 18, 0, 1),
(14, 8, 1, 0.02, '', 19, 0, 0),
(15, 8, 1, 0.02, '', 20, 0, 0),
(16, 8, 1, 0.02, '', 21, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qing_page`
--

CREATE TABLE `qing_page` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单页面';

--
-- 转存表中的数据 `qing_page`
--

INSERT INTO `qing_page` (`id`, `title`, `content`) VALUES
(1, '商品购买政策', '<p>小米商城的部分商品，当您选择的收货区域无货时，可以点选到货通知。开启到货通知功能后，产品开售前，小米商城APP会分批以PUSH的形式通知您。设置成功后支持取消。</p>'),
(2, '商品购买流程', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(251, 251, 251);\">根据国家税务总局公告2017年第16号第一条规定：自2017年7月1日起，购买方为企业的，索取增值税普通发票时，应向销售方提供纳税人识别号或统一社会信用代码；销售方为其开具增值税普通发票时，应在“购买方纳税人识 别号”栏填写购买方的纳税人识别号或统一社会信用代码。不符合规定的发票，不得作为税收凭证。纳税人识别号有两种方式获取：①联系公司财务咨询开票信息；②登录全国组织代码管理中心查询。</span></p>'),
(3, '如何注册会员', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-color: rgb(251, 251, 251);\">开具电子发票的订单申请部分退货，原电子发票会通过系统自动冲红（原电子发票显示无效），并对未发生退货的商品重新开具电子发票。如整单退货，则我司将原电子发票做冲红处理（原电子发票显示无效）。</span></p>');

-- --------------------------------------------------------

--
-- 表的结构 `qing_score`
--

CREATE TABLE `qing_score` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  `info` varchar(30) DEFAULT NULL,
  `source` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1签到2推荐'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员积分';

--
-- 转存表中的数据 `qing_score`
--

INSERT INTO `qing_score` (`id`, `user_id`, `score`, `time`, `info`, `source`) VALUES
(1, 1, 3, 1582598701, '签到赚取积分', 1),
(2, 1, -1, 1582618252, NULL, 1),
(3, 1, -1, 1582618856, '积分商品兑换', 1),
(9, 3, 2, 1588391194, '签到', 1),
(10, 1, 2, 1588584145, '签到', 1),
(11, 1, -1, 1588665999, '积分商品兑换', 1),
(12, 1, -1, 1588670789, '积分商品兑换', 1),
(13, 1, 2, 1588993892, '签到', 1),
(14, 4, 2, 1589189643, '签到', 1),
(15, 4, 2, 1590650596, '签到', 1),
(16, 1, 10, 1595900453, '签到赚取积分', 1),
(17, 1, -2, 1595905313, '商品换购', 1),
(18, 1, -2, 1595905335, '商品换购', 1),
(19, 1, -1, 1595908071, '商品换购', 1),
(20, 1, 10, 1596159280, '签到赚取积分', 1),
(25, 10, 10, 1596268517, '签到赚取积分', 1),
(26, 1, 10, 1596268768, '签到赚取积分', 1),
(27, 3, 200, 1596269488, '新用户奖励', 1),
(28, 1, 100, 1596269488, '推荐返佣', 1),
(29, 4, 200, 1596270502, '新用户奖励', 1),
(30, 1, 100, 1596270502, '推荐返佣', 1),
(31, 7, 200, 1596270662, '新用户奖励', 1),
(32, 1, 100, 1596270662, '推荐返佣', 1),
(33, 9, 200, 1596271885, '新用户奖励', 1),
(34, 1, 100, 1596271885, '推荐返佣', 1),
(35, 10, 200, 1596271970, '新用户奖励', 1),
(36, 1, 100, 1596271970, '推荐返佣', 1),
(37, 11, 200, 1596272026, '新用户奖励', 1),
(38, 1, 100, 1596272026, '推荐返佣', 1),
(39, 12, 200, 1596272097, '新用户奖励', 1),
(40, 1, 100, 1596272097, '推荐返佣', 1),
(41, 13, 200, 1596272182, '新用户奖励', 1),
(42, 15, 200, 1596272763, '新用户奖励', 1),
(43, 1, 100, 1596272763, '推荐返佣', 1),
(44, 16, 200, 1596272850, '新用户奖励', 1),
(45, 17, 200, 1596272887, '新用户奖励', 1),
(46, 25, 200, 1596274444, '新用户奖励', 1),
(47, 1, 100, 1596274444, '推荐返佣', 1),
(48, 26, 200, 1596274510, '新用户奖励', 1),
(49, 1, 100, 1596274510, '推荐返佣', 1),
(50, 27, 200, 1596274686, '新用户奖励', 1),
(51, 1, 100, 1596274686, '推荐返佣', 1),
(52, 28, 200, 1596274760, '新用户奖励', 1),
(53, 1, 100, 1596274760, '推荐返佣', 1),
(54, 29, 200, 1596274795, '新用户奖励', 1),
(55, 1, 100, 1596274795, '推荐返佣', 1),
(56, 31, 200, 1596275364, '新用户奖励', 1),
(57, 33, 200, 1596275434, '新用户奖励', 1),
(58, 1, 100, 1596275434, '推荐返佣', 1),
(59, 1, 10, 1596436479, '签到赚取积分', 1),
(60, 30, 10, 1596436545, '签到赚取积分', 1),
(61, 34, 200, 1598255643, '新用户奖励', 1),
(62, 1, 100, 1598255643, '推荐返佣', 1),
(63, 36, 200, 1598344219, '新用户奖励', 2),
(64, 1, 100, 1598344219, '推荐返佣', 1),
(65, 36, 10, 1598344317, '签到赚取积分', 1),
(66, 37, 200, 1598345040, '新用户奖励', 2),
(67, 1, 100, 1598345040, '推荐返佣', 1),
(68, 37, 10, 1598345076, '签到赚取积分', 1),
(69, 38, 200, 1598345648, '新用户奖励', 2),
(70, 1, 100, 1598345648, '推荐返佣', 2),
(71, 38, 10, 1598345673, '签到赚取积分', 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_score_goods`
--

CREATE TABLE `qing_score_goods` (
  `id` int(11) NOT NULL,
  `title` varchar(110) NOT NULL,
  `thumb` varchar(110) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `content` text,
  `time` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  `listorder` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分商品表';

--
-- 转存表中的数据 `qing_score_goods`
--

INSERT INTO `qing_score_goods` (`id`, `title`, `thumb`, `description`, `content`, `time`, `score`, `listorder`) VALUES
(1, '联通话费10元', '/public/upload/20200728/f3426466b0b7b8a267142523e1602a7e.jpg', '', '<p>联通话费10元，快来抢</p><p><br/></p><p style=\"text-align: center;\"><img src=\"/ueditor/php/upload/image/20200728/1595901865186616.jpg\" title=\"1595901865186616.jpg\" alt=\"liant.jpg\"/></p>', 1545964839, 1, 0),
(2, '精美挂坠', '/public/upload/20200728/650699a16e4c77426ec9ffaf38dc0589.jpg', '', '', 1545968008, 6800, 2),
(3, '爱奇艺30天会员', '/public/upload/20200728/4744e5c0d9abec0b666be8d19d9de645.jpg', NULL, NULL, 1588664854, 1000, 0),
(4, '创世学说 游戏系统设计指南', '/public/upload/20200728/83c5b3cdc66914d77c769b363a0ad129.jpg', NULL, '<p>《创世学说——游戏系统设计指南》是腾讯游戏人十多年工作经验和总结的精华输出，涵盖了无数珍贵的实战案例、千锤百炼的经验总结，以及在用户研究、项目管理、测试迭代等方面的全方位的游戏开发心得和体会。系统设计是游戏设计领域的核心，与游戏的乐趣和核心玩法息息相关，只有通过设计优秀的游戏系统，才能诞生优秀的游戏。</p><p style=\"text-align: center;\"><img src=\"http://www.tp6.com/ueditor/php/upload/image/20200728/1595902085300120.jpg\" title=\"1595902085300120.jpg\" alt=\"QQ截图20200512093956.jpg\"/></p><p>在国内普遍缺乏优秀的游戏系统设计人才的情况下，《创世学说——游戏系统设计指南》对游戏行业系统策划新人的培养意义尤为重大。广大游戏爱好者可以通过阅读本书了解游戏是怎么制作出来的；有志于从事游戏设计事业的学生可以借助本书快速入门；在游戏行业中沉淀已久的专业人员更是可以把本书作为重要的工具书来使用。</p><p><br/></p><p style=\"text-align: center;\"><br/></p>', 1588665216, 2, 3);

-- --------------------------------------------------------

--
-- 表的结构 `qing_score_record`
--

CREATE TABLE `qing_score_record` (
  `id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `empress` varchar(100) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分兑换记录';

--
-- 转存表中的数据 `qing_score_record`
--

INSERT INTO `qing_score_record` (`id`, `score`, `goods_id`, `status`, `empress`, `time`, `user_id`) VALUES
(1, 10, 1, 1, 'YT10315900246', 1575511676, 1),
(2, 1, 1, 1, NULL, 1582618252, 1),
(3, 1, 1, 1, NULL, 1582618856, 1),
(5, 1, 1, 1, NULL, 1588670789, 1),
(6, 2, 4, 1, NULL, 1595905313, 1),
(7, 2, 4, 1, 'YT10315900246', 1595905335, 1),
(8, 1, 1, 1, NULL, 1595908071, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_search`
--

CREATE TABLE `qing_search` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='热门搜索词';

--
-- 转存表中的数据 `qing_search`
--

INSERT INTO `qing_search` (`id`, `name`) VALUES
(2, '羽绒服'),
(3, '手机'),
(4, '毛呢大衣'),
(5, '电视'),
(6, '小米');

-- --------------------------------------------------------

--
-- 表的结构 `qing_standard`
--

CREATE TABLE `qing_standard` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '规格ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `type_id` int(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格表';

--
-- 转存表中的数据 `qing_standard`
--

INSERT INTO `qing_standard` (`id`, `name`, `type_id`) VALUES
(1, '内存', 1),
(2, '颜色', 1),
(3, '尺寸', 2),
(4, '尺寸', 3),
(5, '颜色', 2),
(6, '颜色', 3),
(7, '颜色', 4),
(8, '尺寸', 5),
(9, '手机套餐', 1);

-- --------------------------------------------------------

--
-- 表的结构 `qing_standard_value`
--

CREATE TABLE `qing_standard_value` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '属性值ID',
  `standard_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '规格ID',
  `standard_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规格属性值表';

--
-- 转存表中的数据 `qing_standard_value`
--

INSERT INTO `qing_standard_value` (`id`, `standard_id`, `standard_value`) VALUES
(1, 1, '32G'),
(2, 1, '64G'),
(3, 1, '128G'),
(4, 1, '320G'),
(5, 2, '科技黑'),
(6, 2, '玫瑰粉'),
(7, 3, 'L'),
(8, 3, 'XL'),
(9, 3, 'XXL'),
(10, 2, '土豪金'),
(11, 4, '70寸'),
(12, 4, '65寸'),
(13, 4, '55寸'),
(14, 5, '酒红色'),
(15, 5, '藏青色'),
(16, 6, '灰色'),
(17, 7, '黄色'),
(18, 7, '白色'),
(19, 8, '2.2米'),
(20, 8, '1.5米'),
(21, 8, '2米'),
(22, 2, '丹霞橙'),
(23, 9, '标准套餐'),
(24, 9, '豪华套餐'),
(25, 5, '卡其色'),
(26, 3, 'M'),
(27, 4, '43寸'),
(28, 6, '黑色'),
(29, 3, 'S'),
(30, 5, '黑色');

-- --------------------------------------------------------

--
-- 表的结构 `qing_text`
--

CREATE TABLE `qing_text` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `qing_text`
--

INSERT INTO `qing_text` (`id`, `name`) VALUES
(1, 'abcd'),
(2, 'abcd'),
(3, 'abcd'),
(4, 'abcd'),
(5, 'abcd'),
(6, 'abcd'),
(7, 'abcd'),
(8, 'abcd'),
(9, 'abcd'),
(10, 'abcd'),
(11, 'abcd'),
(12, 'abcd'),
(13, 'abcd'),
(14, 'abcd'),
(15, 'abcd'),
(16, 'abcd'),
(17, 'abcd'),
(18, 'abcd'),
(19, 'abcd'),
(20, 'abcd'),
(21, 'abcd'),
(22, 'abcd'),
(23, 'abcd'),
(24, 'abcd'),
(25, 'abcd'),
(26, 'abcd'),
(27, 'abcd'),
(28, 'abcd'),
(29, 'abcd'),
(30, 'abcd'),
(31, 'abcd'),
(32, 'abcd'),
(33, 'abcd'),
(34, 'abcd'),
(35, 'abcd'),
(36, 'abcd'),
(37, 'abcd'),
(38, 'abcd'),
(39, 'abcd'),
(40, 'abcd'),
(41, 'abcd'),
(42, 'abcd'),
(43, 'abcd'),
(44, 'abcd'),
(45, 'abcd'),
(46, 'abcd'),
(47, 'abcd'),
(48, 'abcd'),
(49, 'abcd'),
(50, 'abcd'),
(51, 'abcd'),
(52, 'abcd'),
(53, 'abcd'),
(54, 'abcd'),
(55, 'abcd'),
(56, 'abcd'),
(57, 'abcd'),
(58, 'abcd'),
(59, 'abcd'),
(60, 'abcd'),
(61, 'abcd'),
(62, 'abcd'),
(63, 'abcd'),
(64, 'abcd'),
(65, 'abcd'),
(66, 'abcd'),
(67, 'abcd'),
(68, 'abcd'),
(69, 'abcd'),
(70, 'abcd'),
(71, 'abcd'),
(72, 'abcd'),
(73, 'abcd'),
(74, 'abcd'),
(75, 'abcd'),
(76, 'abcd'),
(77, 'abcd'),
(78, 'abcd'),
(79, 'abcd'),
(80, 'abcd'),
(81, 'abcd'),
(82, 'abcd'),
(83, 'abcd'),
(84, 'abcd'),
(85, 'abcd'),
(86, 'abcd'),
(87, 'abcd'),
(88, 'abcd'),
(89, 'abcd'),
(90, 'abcd'),
(91, 'abcd'),
(92, 'abcd'),
(93, 'abcd'),
(94, 'abcd'),
(95, 'abcd'),
(96, 'abcd'),
(97, 'abcd'),
(98, 'abcd'),
(99, 'abcd'),
(100, 'abcd'),
(101, 'abcd'),
(102, 'abcd'),
(103, 'abcd'),
(104, 'abcd'),
(105, 'abcd'),
(106, 'abcd'),
(107, 'abcd'),
(108, 'abcd'),
(109, 'abcd'),
(110, 'abcd'),
(111, 'abcd'),
(112, 'abcd'),
(113, 'abcd'),
(114, 'abcd'),
(115, 'abcd'),
(116, 'abcd'),
(117, 'abcd'),
(118, 'abcd'),
(119, 'abcd'),
(120, 'abcd'),
(121, 'abcd'),
(122, 'abcd'),
(123, 'abcd'),
(124, 'abcd'),
(125, 'abcd'),
(126, 'abcd'),
(127, 'abcd'),
(128, 'abcd'),
(129, 'abcd'),
(130, 'abcd'),
(131, 'abcd'),
(132, 'abcd'),
(133, 'abcd'),
(134, 'abcd'),
(135, 'abcd'),
(136, 'abcd'),
(137, 'abcd'),
(138, 'abcd'),
(139, 'abcd'),
(140, 'abcd'),
(141, 'abcd'),
(142, 'abcd'),
(143, 'abcd'),
(144, 'abcd'),
(145, 'abcd'),
(146, 'abcd'),
(147, 'abcd'),
(148, 'abcd'),
(149, 'abcd'),
(150, 'abcd'),
(151, 'abcd'),
(152, 'abcd'),
(153, 'abcd'),
(154, 'abcd'),
(155, 'abcd'),
(156, 'abcd'),
(157, 'abcd'),
(158, 'abcd'),
(159, 'abcd'),
(160, 'abcd'),
(161, 'abcd'),
(162, 'abcd'),
(163, 'abcd'),
(164, 'abcd'),
(165, 'abcd'),
(166, 'abcd'),
(167, 'abcd'),
(168, 'abcd'),
(169, 'abcd'),
(170, 'abcd'),
(171, 'abcd'),
(172, 'abcd'),
(173, 'abcd'),
(174, 'abcd'),
(175, 'abcd'),
(176, 'abcd'),
(177, 'abcd'),
(178, 'abcd'),
(179, 'abcd'),
(180, 'abcd'),
(181, 'abcd'),
(182, 'abcd'),
(183, 'abcd'),
(184, 'abcd'),
(185, 'abcd'),
(186, 'abcd'),
(187, 'abcd'),
(188, 'abcd'),
(189, 'abcd'),
(190, 'abcd'),
(191, 'abcd'),
(192, 'abcd'),
(193, 'abcd'),
(194, 'abcd'),
(195, 'abcd'),
(196, 'abcd'),
(197, 'abcd'),
(198, 'abcd'),
(199, 'abcd'),
(200, 'abcd'),
(201, 'abcd'),
(202, 'abcd'),
(203, 'abcd'),
(204, 'abcd'),
(205, 'abcd'),
(206, 'abcd'),
(207, 'abcd'),
(208, 'abcd'),
(209, 'abcd'),
(210, 'abcd'),
(211, 'abcd'),
(212, 'abcd'),
(213, 'abcd'),
(214, 'abcd'),
(215, 'abcd'),
(216, 'abcd'),
(217, 'abcd'),
(218, 'abcd'),
(219, 'abcd'),
(220, 'abcd'),
(221, 'abcd'),
(222, 'abcd'),
(223, 'abcd'),
(224, 'abcd'),
(225, 'abcd'),
(226, 'abcd'),
(227, 'abcd'),
(228, 'abcd'),
(229, 'abcd'),
(230, 'abcd'),
(231, 'abcd'),
(232, 'abcd'),
(233, 'abcd'),
(234, 'abcd'),
(235, 'abcd'),
(236, 'abcd'),
(237, 'abcd'),
(238, 'abcd'),
(239, 'abcd');

-- --------------------------------------------------------

--
-- 表的结构 `qing_type`
--

CREATE TABLE `qing_type` (
  `id` int(100) NOT NULL,
  `type_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_type`
--

INSERT INTO `qing_type` (`id`, `type_name`) VALUES
(1, '手机'),
(2, '女装'),
(3, '电视'),
(4, '插排'),
(5, '床');

-- --------------------------------------------------------

--
-- 表的结构 `qing_user`
--

CREATE TABLE `qing_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT 'qing',
  `password` char(32) NOT NULL DEFAULT '',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '默认是1，不合格-1',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `face` varchar(200) DEFAULT NULL,
  `unionid` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1男2女3保密',
  `xingzuo` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `code` varchar(50) NOT NULL COMMENT '分佣推荐码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qing_user`
--

INSERT INTO `qing_user` (`id`, `username`, `password`, `last_login_time`, `mobile`, `status`, `time`, `face`, `unionid`, `email`, `sex`, `xingzuo`, `parent_id`, `code`) VALUES
(1, '17611111111', 'b572d025f18cc4f345df37c5f4f63f4b', 1600660245, '17611111111', 1, 1596268661, '\\public\\upload/20200801\\b6af2b651fc82f4afa47416da0039745.jpg', 'oO0Bhv0llJvwqSMmA0OwS8q-NBn4', '103180000@qq.com', 3, '', 0, 'YJ1596268661'),
(2, '15100000001', 'b572d025f18cc4f345df37c5f4f63f4b', 1596269397, '15100000001', 1, 1596269352, NULL, NULL, NULL, 3, NULL, 0, 'YJ1596269352'),
(3, '15100000002', 'b572d025f18cc4f345df37c5f4f63f4b', 1596269506, '15100000002', 1, 1596269488, NULL, NULL, NULL, 3, NULL, 1, 'YJ1596269488'),
(4, '15100000003', 'b572d025f18cc4f345df37c5f4f63f4b', 0, '15100000003', 1, 1596270502, NULL, NULL, NULL, 3, NULL, 1, 'YJ1596270502'),
(5, '15100000004', 'b572d025f18cc4f345df37c5f4f63f4b', 0, '15100000004', 1, 1596270570, NULL, NULL, NULL, 3, NULL, 0, 'YJ1596270570'),
(6, '15100000005', 'b572d025f18cc4f345df37c5f4f63f4b', 0, '15100000005', 1, 1596270593, NULL, NULL, NULL, 3, NULL, 0, 'YJ1596270593'),
(7, '15100000006', 'b572d025f18cc4f345df37c5f4f63f4b', 0, '15100000006', 1, 1596270662, NULL, NULL, NULL, 3, NULL, 1, 'YJ1596270662'),
(14, '15100000007', 'b572d025f18cc4f345df37c5f4f63f4b', 0, '15100000007', 1, 1596272698, NULL, NULL, NULL, 3, NULL, 0, 'YJ1596272698'),
(29, '15100000008', 'b572d025f18cc4f345df37c5f4f63f4b', 0, '15100000008', 1, 1596274795, NULL, NULL, NULL, 3, NULL, 1, 'YJ1596274795'),
(30, '15100000009', 'b572d025f18cc4f345df37c5f4f63f4b', 1596436540, '15100000009', 1, 1596275329, NULL, NULL, NULL, 3, NULL, 0, 'YJ1596275329'),
(33, '15100000011', 'b572d025f18cc4f345df37c5f4f63f4b', 1596275474, '15100000011', 1, 1596275434, NULL, NULL, NULL, 3, NULL, 1, 'YJ1596275434'),
(34, '17615342771', 'b572d025f18cc4f345df37c5f4f63f4b', 1598255654, '17615342771', 1, 1598255643, NULL, NULL, NULL, 3, NULL, 1, 'YJ1598255643'),
(36, '15100000010', 'b572d025f18cc4f345df37c5f4f63f4b', 1598344289, '15100000010', 1, 1598344219, NULL, NULL, NULL, 3, NULL, 1, 'YJ1598344219'),
(37, '15100000012', 'b572d025f18cc4f345df37c5f4f63f4b', 1598345048, '15100000012', 1, 1598345040, NULL, NULL, NULL, 3, NULL, 1, 'YJ1598345040'),
(38, '15100000013', 'b572d025f18cc4f345df37c5f4f63f4b', 1598345659, '15100000013', 1, 1598345648, NULL, NULL, NULL, 3, NULL, 1, 'YJ1598345648');

-- --------------------------------------------------------

--
-- 表的结构 `qing_user_trace`
--

CREATE TABLE `qing_user_trace` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户足迹表';

--
-- 转存表中的数据 `qing_user_trace`
--

INSERT INTO `qing_user_trace` (`id`, `goods_id`, `user_id`, `time`) VALUES
(28, 4, 1, 1600661309),
(29, 9, 1, 1600661325),
(30, 3, 1, 1600661377);

--
-- 转储表的索引
--

--
-- 表的索引 `qing_ad`
--
ALTER TABLE `qing_ad`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_address`
--
ALTER TABLE `qing_address`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_admin`
--
ALTER TABLE `qing_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_ad_type`
--
ALTER TABLE `qing_ad_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_auth_group`
--
ALTER TABLE `qing_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_auth_rule`
--
ALTER TABLE `qing_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 表的索引 `qing_cart`
--
ALTER TABLE `qing_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_id` (`user_id`);

--
-- 表的索引 `qing_category`
--
ALTER TABLE `qing_category`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_collect`
--
ALTER TABLE `qing_collect`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_comment`
--
ALTER TABLE `qing_comment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_config`
--
ALTER TABLE `qing_config`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_coupons`
--
ALTER TABLE `qing_coupons`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_coupons_user`
--
ALTER TABLE `qing_coupons_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 表的索引 `qing_express`
--
ALTER TABLE `qing_express`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_fapiao`
--
ALTER TABLE `qing_fapiao`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_fenyong`
--
ALTER TABLE `qing_fenyong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- 表的索引 `qing_flink`
--
ALTER TABLE `qing_flink`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_goods`
--
ALTER TABLE `qing_goods`
  ADD PRIMARY KEY (`goods_id`);

--
-- 表的索引 `qing_goods_attr`
--
ALTER TABLE `qing_goods_attr`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_goods_content`
--
ALTER TABLE `qing_goods_content`
  ADD PRIMARY KEY (`goods_id`);

--
-- 表的索引 `qing_goods_img`
--
ALTER TABLE `qing_goods_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- 表的索引 `qing_goods_standard`
--
ALTER TABLE `qing_goods_standard`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_goods_standard1`
--
ALTER TABLE `qing_goods_standard1`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_message`
--
ALTER TABLE `qing_message`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_news`
--
ALTER TABLE `qing_news`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_notice`
--
ALTER TABLE `qing_notice`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_notice_read`
--
ALTER TABLE `qing_notice_read`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_order`
--
ALTER TABLE `qing_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `out_trade_no` (`out_trade_no`),
  ADD KEY `out_trade_no_2` (`out_trade_no`);

--
-- 表的索引 `qing_order_goods`
--
ALTER TABLE `qing_order_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_page`
--
ALTER TABLE `qing_page`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_score`
--
ALTER TABLE `qing_score`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_score_goods`
--
ALTER TABLE `qing_score_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_score_record`
--
ALTER TABLE `qing_score_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_search`
--
ALTER TABLE `qing_search`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_standard`
--
ALTER TABLE `qing_standard`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_standard_value`
--
ALTER TABLE `qing_standard_value`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_text`
--
ALTER TABLE `qing_text`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_type`
--
ALTER TABLE `qing_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `qing_user`
--
ALTER TABLE `qing_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `code_2` (`code`);

--
-- 表的索引 `qing_user_trace`
--
ALTER TABLE `qing_user_trace`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `qing_ad`
--
ALTER TABLE `qing_ad`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `qing_address`
--
ALTER TABLE `qing_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `qing_admin`
--
ALTER TABLE `qing_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `qing_ad_type`
--
ALTER TABLE `qing_ad_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `qing_auth_group`
--
ALTER TABLE `qing_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `qing_auth_rule`
--
ALTER TABLE `qing_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `qing_cart`
--
ALTER TABLE `qing_cart`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `qing_category`
--
ALTER TABLE `qing_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '栏目id', AUTO_INCREMENT=161;

--
-- 使用表AUTO_INCREMENT `qing_collect`
--
ALTER TABLE `qing_collect`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `qing_comment`
--
ALTER TABLE `qing_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `qing_config`
--
ALTER TABLE `qing_config`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置项id', AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `qing_coupons`
--
ALTER TABLE `qing_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `qing_coupons_user`
--
ALTER TABLE `qing_coupons_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `qing_express`
--
ALTER TABLE `qing_express`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `qing_fapiao`
--
ALTER TABLE `qing_fapiao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `qing_fenyong`
--
ALTER TABLE `qing_fenyong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `qing_flink`
--
ALTER TABLE `qing_flink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `qing_goods`
--
ALTER TABLE `qing_goods`
  MODIFY `goods_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `qing_goods_attr`
--
ALTER TABLE `qing_goods_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `qing_goods_img`
--
ALTER TABLE `qing_goods_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- 使用表AUTO_INCREMENT `qing_goods_standard`
--
ALTER TABLE `qing_goods_standard`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID', AUTO_INCREMENT=92;

--
-- 使用表AUTO_INCREMENT `qing_goods_standard1`
--
ALTER TABLE `qing_goods_standard1`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID', AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `qing_message`
--
ALTER TABLE `qing_message`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `qing_news`
--
ALTER TABLE `qing_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `qing_notice`
--
ALTER TABLE `qing_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `qing_notice_read`
--
ALTER TABLE `qing_notice_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qing_order`
--
ALTER TABLE `qing_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `qing_order_goods`
--
ALTER TABLE `qing_order_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用表AUTO_INCREMENT `qing_page`
--
ALTER TABLE `qing_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `qing_score`
--
ALTER TABLE `qing_score`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- 使用表AUTO_INCREMENT `qing_score_goods`
--
ALTER TABLE `qing_score_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `qing_score_record`
--
ALTER TABLE `qing_score_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `qing_search`
--
ALTER TABLE `qing_search`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `qing_standard`
--
ALTER TABLE `qing_standard`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规格ID', AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `qing_standard_value`
--
ALTER TABLE `qing_standard_value`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '属性值ID', AUTO_INCREMENT=31;

--
-- 使用表AUTO_INCREMENT `qing_text`
--
ALTER TABLE `qing_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- 使用表AUTO_INCREMENT `qing_type`
--
ALTER TABLE `qing_type`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `qing_user`
--
ALTER TABLE `qing_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- 使用表AUTO_INCREMENT `qing_user_trace`
--
ALTER TABLE `qing_user_trace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
