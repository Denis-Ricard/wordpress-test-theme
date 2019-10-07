# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: 127.0.0.1 (MySQL 5.5.5-10.4.6-MariaDB)
# Base de données: wptest
# Temps de génération: 2019-10-07 12:46:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table wp_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_commentmeta`;

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table wp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_comments`;

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`)
VALUES
	(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2019-10-06 19:36:28','2019-10-06 19:36:28','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0);

/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table wp_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_links`;

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table wp_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_options`;

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','http://wptest.local','yes'),
	(2,'home','http://wptest.local','yes'),
	(3,'blogname','Wordpress test','yes'),
	(4,'blogdescription','Test website for Trader','yes'),
	(5,'users_can_register','0','yes'),
	(6,'admin_email','boogiestrat@gmail.com','yes'),
	(7,'start_of_week','1','yes'),
	(8,'use_balanceTags','0','yes'),
	(9,'use_smilies','1','yes'),
	(10,'require_name_email','1','yes'),
	(11,'comments_notify','1','yes'),
	(12,'posts_per_rss','10','yes'),
	(13,'rss_use_excerpt','0','yes'),
	(14,'mailserver_url','mail.example.com','yes'),
	(15,'mailserver_login','login@example.com','yes'),
	(16,'mailserver_pass','password','yes'),
	(17,'mailserver_port','110','yes'),
	(18,'default_category','1','yes'),
	(19,'default_comment_status','open','yes'),
	(20,'default_ping_status','open','yes'),
	(21,'default_pingback_flag','0','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','F j, Y','yes'),
	(24,'time_format','g:i a','yes'),
	(25,'links_updated_date_format','F j, Y g:i a','yes'),
	(26,'comment_moderation','0','yes'),
	(27,'moderation_notify','1','yes'),
	(28,'permalink_structure','/index.php/%year%/%monthnum%/%day%/%postname%/','yes'),
	(29,'rewrite_rules','a:91:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:57:\"index.php/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:45:\"index.php/category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:54:\"index.php/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:49:\"index.php/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:30:\"index.php/tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:42:\"index.php/tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:24:\"index.php/tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:55:\"index.php/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:50:\"index.php/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:31:\"index.php/type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:43:\"index.php/type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:25:\"index.php/type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:42:\"index.php/feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:37:\"index.php/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:18:\"index.php/embed/?$\";s:21:\"index.php?&embed=true\";s:30:\"index.php/page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:37:\"index.php/comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=8&cpage=$matches[1]\";s:51:\"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:46:\"index.php/comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:27:\"index.php/comments/embed/?$\";s:21:\"index.php?&embed=true\";s:54:\"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:49:\"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:30:\"index.php/search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:42:\"index.php/search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:24:\"index.php/search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:57:\"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:52:\"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:33:\"index.php/author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:45:\"index.php/author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:27:\"index.php/author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:79:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:55:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:49:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:66:\"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:42:\"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:54:\"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:36:\"index.php/([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:53:\"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:48:\"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:29:\"index.php/([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:41:\"index.php/([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:23:\"index.php/([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:68:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:78:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:98:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:93:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:74:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:63:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:67:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:87:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:75:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:82:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:71:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:57:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:67:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:87:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:82:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:63:\"index.php/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:74:\"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:61:\"index.php/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:48:\"index.php/([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:37:\"index.php/.?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:47:\"index.php/.?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:67:\"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:62:\"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:43:\"index.php/.?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:26:\"index.php/(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:30:\"index.php/(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:50:\"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:45:\"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:38:\"index.php/(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:45:\"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:34:\"index.php/(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),
	(30,'hack_file','0','yes'),
	(31,'blog_charset','UTF-8','yes'),
	(32,'moderation_keys','','no'),
	(33,'active_plugins','a:0:{}','yes'),
	(34,'category_base','','yes'),
	(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
	(36,'comment_max_links','2','yes'),
	(37,'gmt_offset','0','yes'),
	(38,'default_email_category','1','yes'),
	(39,'recently_edited','','no'),
	(40,'template','wp-test','yes'),
	(41,'stylesheet','wp-test','yes'),
	(42,'comment_whitelist','1','yes'),
	(43,'blacklist_keys','','no'),
	(44,'comment_registration','0','yes'),
	(45,'html_type','text/html','yes'),
	(46,'use_trackback','0','yes'),
	(47,'default_role','subscriber','yes'),
	(48,'db_version','44719','yes'),
	(49,'uploads_use_yearmonth_folders','1','yes'),
	(50,'upload_path','','yes'),
	(51,'blog_public','0','yes'),
	(52,'default_link_category','2','yes'),
	(53,'show_on_front','page','yes'),
	(54,'tag_base','','yes'),
	(55,'show_avatars','1','yes'),
	(56,'avatar_rating','G','yes'),
	(57,'upload_url_path','','yes'),
	(58,'thumbnail_size_w','150','yes'),
	(59,'thumbnail_size_h','150','yes'),
	(60,'thumbnail_crop','1','yes'),
	(61,'medium_size_w','300','yes'),
	(62,'medium_size_h','300','yes'),
	(63,'avatar_default','mystery','yes'),
	(64,'large_size_w','1024','yes'),
	(65,'large_size_h','1024','yes'),
	(66,'image_default_link_type','none','yes'),
	(67,'image_default_size','','yes'),
	(68,'image_default_align','','yes'),
	(69,'close_comments_for_old_posts','0','yes'),
	(70,'close_comments_days_old','14','yes'),
	(71,'thread_comments','1','yes'),
	(72,'thread_comments_depth','5','yes'),
	(73,'page_comments','0','yes'),
	(74,'comments_per_page','50','yes'),
	(75,'default_comments_page','newest','yes'),
	(76,'comment_order','asc','yes'),
	(77,'sticky_posts','a:0:{}','yes'),
	(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(79,'widget_text','a:0:{}','yes'),
	(80,'widget_rss','a:0:{}','yes'),
	(81,'uninstall_plugins','a:0:{}','no'),
	(82,'timezone_string','','yes'),
	(83,'page_for_posts','0','yes'),
	(84,'page_on_front','8','yes'),
	(85,'default_post_format','0','yes'),
	(86,'link_manager_enabled','0','yes'),
	(87,'finished_splitting_shared_terms','1','yes'),
	(88,'site_icon','0','yes'),
	(89,'medium_large_size_w','768','yes'),
	(90,'medium_large_size_h','0','yes'),
	(91,'wp_page_for_privacy_policy','3','yes'),
	(92,'show_comments_cookies_opt_in','0','yes'),
	(93,'initial_db_version','43764','yes'),
	(94,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
	(95,'fresh_site','0','yes'),
	(96,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:9:\"Recherche\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(97,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(98,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(99,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:8:\"Archives\";s:5:\"count\";i:1;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(100,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(101,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:4:{i:0;s:14:\"recent-posts-2\";i:1;s:17:\"recent-comments-2\";i:2;s:12:\"categories-2\";i:3;s:6:\"meta-2\";}s:9:\"sidebar-1\";a:2:{i:0;s:8:\"search-2\";i:1;s:10:\"archives-2\";}s:13:\"array_version\";i:3;}','yes'),
	(102,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(103,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(104,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(105,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(106,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(107,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(108,'nonce_key','j1k=4*fI*CV:=;{#9-nX<gunRdLJ{f#Y@z5!_4t9:wKdQ2qQI;Q /:91yDhtF(< ','no'),
	(109,'nonce_salt','Cln9mABmf5=8)wr5-@bzq4.0Yv|P>;ZiNEeEKgu}8WZoAOVGrkbZ<U!dv5(f<(=6','no'),
	(110,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(111,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(112,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(113,'cron','a:6:{i:1570390594;a:4:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1570390657;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1570444336;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1570446551;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1570449185;a:1:{s:8:\"do_pings\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}s:7:\"version\";i:2;}','yes'),
	(114,'theme_mods_twentynineteen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1570392707;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),
	(115,'_transient_doing_cron','1570452298.5938320159912109375000','yes'),
	(116,'auth_key','i?px$R2.8Z YrGAW_niUhO*fqvVbv2AmWSX~v@c(AC+4--*7/cZ]{9}gKBh3286`','no'),
	(117,'auth_salt','3)1uT!,6=~_xPndwHb/L4]OR`#dlAnZ tC@g`B{.k47u d5<hmf%3&3(Q]7@$M3<','no'),
	(118,'logged_in_key','F~T:+{7q)@3D}I*K6r*^rk#u0ZO=oG*`e}FuF7#GR$SEP9M(>6QsGN~.[JBxS+.>','no'),
	(119,'logged_in_salt','X;F[E=z(} Yt)PaLt}` #4},C&e/_d!8GeW|%&Xr[)m?TIVS,y)ikG&{jyX#-/@q','no'),
	(121,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1570451429;s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.3\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:9:\"hello.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.3\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}','no'),
	(124,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1570451647;s:7:\"checked\";a:4:{s:14:\"twentynineteen\";s:3:\"1.2\";s:15:\"twentyseventeen\";s:3:\"2.0\";s:13:\"twentysixteen\";s:3:\"1.8\";s:7:\"wp-test\";s:3:\"1.0\";}s:8:\"response\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.4.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.2\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.2.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:13:\"twentysixteen\";a:6:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.2.0.zip\";s:8:\"requires\";s:3:\"4.4\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}','no'),
	(125,'_site_transient_timeout_browser_ad878a2d78cfdc400650f39aea9a1c29','1570995458','no'),
	(126,'_site_transient_browser_ad878a2d78cfdc400650f39aea9a1c29','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"77.0.3865.90\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(142,'current_theme','Wordpress Test Theme','yes'),
	(143,'theme_mods_wp-test','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:9:\"main-menu\";i:2;s:9:\"side-menu\";i:3;}s:18:\"custom_css_post_id\";i:-1;}','yes'),
	(144,'theme_switched','','yes'),
	(145,'WPLANG','','yes'),
	(146,'new_admin_email','boogiestrat@gmail.com','yes'),
	(151,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:2:{i:0;i:2;i:1;i:3;}}','yes'),
	(157,'db_upgraded','','yes'),
	(159,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.3-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.3\";s:7:\"version\";s:5:\"5.2.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1570446550;s:15:\"version_checked\";s:5:\"5.2.3\";s:12:\"translations\";a:0:{}}','no'),
	(160,'can_compress_scripts','1','no'),
	(161,'category_children','a:0:{}','yes'),
	(162,'_transient_timeout_plugin_slugs','1570537835','no'),
	(163,'_transient_plugin_slugs','a:3:{i:0;s:19:\"akismet/akismet.php\";i:1;s:9:\"hello.php\";i:2;s:33:\"wp-test-plugin/wp-test-plugin.php\";}','no'),
	(164,'recently_activated','a:1:{s:33:\"wp-test-plugin/wp-test-plugin.php\";i:1570451429;}','yes'),
	(165,'_site_transient_timeout_theme_roots','1570453447','no'),
	(166,'_site_transient_theme_roots','a:4:{s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";s:7:\"wp-test\";s:7:\"/themes\";}','no');

/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table wp_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_postmeta`;

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(1,2,'_wp_page_template','default'),
	(2,3,'_wp_page_template','default'),
	(3,1,'_edit_lock','1570400673:1'),
	(4,6,'_menu_item_type','custom'),
	(5,6,'_menu_item_menu_item_parent','0'),
	(6,6,'_menu_item_object_id','6'),
	(7,6,'_menu_item_object','custom'),
	(8,6,'_menu_item_target',''),
	(9,6,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(10,6,'_menu_item_xfn',''),
	(11,6,'_menu_item_url','http://wptest.local/'),
	(12,6,'_menu_item_orphaned','1570444321'),
	(13,7,'_menu_item_type','post_type'),
	(14,7,'_menu_item_menu_item_parent','0'),
	(15,7,'_menu_item_object_id','2'),
	(16,7,'_menu_item_object','page'),
	(17,7,'_menu_item_target',''),
	(18,7,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(19,7,'_menu_item_xfn',''),
	(20,7,'_menu_item_url',''),
	(21,7,'_menu_item_orphaned','1570444321'),
	(22,8,'_edit_lock','1570445223:1'),
	(23,10,'_edit_lock','1570444895:1'),
	(24,12,'_menu_item_type','custom'),
	(25,12,'_menu_item_menu_item_parent','0'),
	(26,12,'_menu_item_object_id','12'),
	(27,12,'_menu_item_object','custom'),
	(28,12,'_menu_item_target',''),
	(29,12,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(30,12,'_menu_item_xfn',''),
	(31,12,'_menu_item_url','http://wptest.local/'),
	(32,12,'_menu_item_orphaned','1570444659'),
	(33,13,'_menu_item_type','post_type'),
	(34,13,'_menu_item_menu_item_parent','0'),
	(35,13,'_menu_item_object_id','10'),
	(36,13,'_menu_item_object','page'),
	(37,13,'_menu_item_target',''),
	(38,13,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(39,13,'_menu_item_xfn',''),
	(40,13,'_menu_item_url',''),
	(42,14,'_menu_item_type','post_type'),
	(43,14,'_menu_item_menu_item_parent','0'),
	(44,14,'_menu_item_object_id','2'),
	(45,14,'_menu_item_object','page'),
	(46,14,'_menu_item_target',''),
	(47,14,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(48,14,'_menu_item_xfn',''),
	(49,14,'_menu_item_url',''),
	(50,14,'_menu_item_orphaned','1570444659'),
	(51,15,'_menu_item_type','post_type'),
	(52,15,'_menu_item_menu_item_parent','0'),
	(53,15,'_menu_item_object_id','8'),
	(54,15,'_menu_item_object','page'),
	(55,15,'_menu_item_target',''),
	(56,15,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(57,15,'_menu_item_xfn',''),
	(58,15,'_menu_item_url',''),
	(60,8,'_wp_page_template','page_two-columns.php'),
	(61,10,'_wp_page_template','page_three-columns.php'),
	(62,16,'_menu_item_type','post_type'),
	(63,16,'_menu_item_menu_item_parent','0'),
	(64,16,'_menu_item_object_id','10'),
	(65,16,'_menu_item_object','page'),
	(66,16,'_menu_item_target',''),
	(67,16,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(68,16,'_menu_item_xfn',''),
	(69,16,'_menu_item_url',''),
	(71,17,'_menu_item_type','post_type'),
	(72,17,'_menu_item_menu_item_parent','0'),
	(73,17,'_menu_item_object_id','8'),
	(74,17,'_menu_item_object','page'),
	(75,17,'_menu_item_target',''),
	(76,17,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(77,17,'_menu_item_xfn',''),
	(78,17,'_menu_item_url',''),
	(80,18,'_edit_lock','1570451370:1'),
	(81,18,'_encloseme','1');

/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table wp_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_posts`;

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(1,1,'2019-10-06 19:36:28','2019-10-06 19:36:28','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2019-10-06 19:36:28','2019-10-06 19:36:28','',0,'http://wptest.local/?p=1',0,'post','',1),
	(2,1,'2019-10-06 19:36:28','2019-10-06 19:36:28','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://wptest.local/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2019-10-06 19:36:28','2019-10-06 19:36:28','',0,'http://wptest.local/?page_id=2',0,'page','',0),
	(3,1,'2019-10-06 19:36:28','2019-10-06 19:36:28','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://wptest.local.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->','Privacy Policy','','draft','closed','open','','privacy-policy','','','2019-10-06 19:36:28','2019-10-06 19:36:28','',0,'http://wptest.local/?page_id=3',0,'page','',0),
	(4,1,'2019-10-06 19:37:38','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2019-10-06 19:37:38','0000-00-00 00:00:00','',0,'http://wptest.local/?p=4',0,'post','',0),
	(5,1,'2019-10-06 22:26:54','2019-10-06 22:26:54','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','inherit','closed','closed','','1-autosave-v1','','','2019-10-06 22:26:54','2019-10-06 22:26:54','',1,'http://wptest.local/index.php/2019/10/06/1-autosave-v1/',0,'revision','',0),
	(6,1,'2019-10-07 10:32:00','0000-00-00 00:00:00','','Home','','draft','closed','closed','','','','','2019-10-07 10:32:00','0000-00-00 00:00:00','',0,'http://wptest.local/?p=6',1,'nav_menu_item','',0),
	(7,1,'2019-10-07 10:32:01','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2019-10-07 10:32:01','0000-00-00 00:00:00','',0,'http://wptest.local/?p=7',1,'nav_menu_item','',0),
	(8,1,'2019-10-07 10:36:50','2019-10-07 10:36:50','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id hendrerit orci. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed at tempus dui. Sed commodo pulvinar tortor ut rhoncus. Aliquam turpis neque, venenatis et nulla at, mattis vestibulum risus. Aenean eleifend est nibh, vel consequat nulla auctor at. Phasellus sapien leo, varius eget aliquam et, laoreet ac ligula. Duis sit amet facilisis lectus. Sed convallis nec est at commodo. Suspendisse pretium ex nibh, non bibendum nisi consequat sit amet. Nam quis arcu vitae libero faucibus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Suspendisse eget arcu iaculis lorem pharetra cursus quis lobortis felis. Fusce vel faucibus felis. Etiam ut magna et velit gravida bibendum. Donec bibendum at turpis at placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed enim eros, tristique quis velit in, venenatis fringilla tellus. Sed at nunc nec nisi mollis auctor. Phasellus vitae dolor consequat, maximus lectus eu, molestie dui. Sed ullamcorper turpis ut nibh facilisis, vel placerat magna lobortis. Nullam at augue et est facilisis vulputate a sed nisi. Suspendisse sed erat leo. Aenean pulvinar ex a ligula euismod, a interdum sem tristique.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Quisque in leo dictum, molestie ante accumsan, dictum arcu. Donec malesuada, massa a pharetra tristique, tortor justo convallis elit, sed sollicitudin tellus enim at diam. Quisque fringilla lacus ac tellus condimentum, ut vulputate odio mollis. In condimentum efficitur justo, ut laoreet erat tristique at. Morbi volutpat turpis in dolor volutpat, in euismod nisl ultricies. Maecenas scelerisque orci erat. Vivamus sagittis velit non tortor tempor, a ultricies elit sollicitudin. Sed eget ipsum elementum, tristique nisi et, sodales metus. Quisque condimentum ut elit sit amet porta. Nullam quis tincidunt ante. Ut elementum mattis nulla, non pharetra ex fringilla nec.</p>\n<!-- /wp:paragraph -->','Welcome','','publish','closed','closed','','welcome','','','2019-10-07 10:49:24','2019-10-07 10:49:24','',0,'http://wptest.local/?page_id=8',0,'page','',0),
	(9,1,'2019-10-07 10:36:50','2019-10-07 10:36:50','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id hendrerit orci. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed at tempus dui. Sed commodo pulvinar tortor ut rhoncus. Aliquam turpis neque, venenatis et nulla at, mattis vestibulum risus. Aenean eleifend est nibh, vel consequat nulla auctor at. Phasellus sapien leo, varius eget aliquam et, laoreet ac ligula. Duis sit amet facilisis lectus. Sed convallis nec est at commodo. Suspendisse pretium ex nibh, non bibendum nisi consequat sit amet. Nam quis arcu vitae libero faucibus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Suspendisse eget arcu iaculis lorem pharetra cursus quis lobortis felis. Fusce vel faucibus felis. Etiam ut magna et velit gravida bibendum. Donec bibendum at turpis at placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed enim eros, tristique quis velit in, venenatis fringilla tellus. Sed at nunc nec nisi mollis auctor. Phasellus vitae dolor consequat, maximus lectus eu, molestie dui. Sed ullamcorper turpis ut nibh facilisis, vel placerat magna lobortis. Nullam at augue et est facilisis vulputate a sed nisi. Suspendisse sed erat leo. Aenean pulvinar ex a ligula euismod, a interdum sem tristique.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Quisque in leo dictum, molestie ante accumsan, dictum arcu. Donec malesuada, massa a pharetra tristique, tortor justo convallis elit, sed sollicitudin tellus enim at diam. Quisque fringilla lacus ac tellus condimentum, ut vulputate odio mollis. In condimentum efficitur justo, ut laoreet erat tristique at. Morbi volutpat turpis in dolor volutpat, in euismod nisl ultricies. Maecenas scelerisque orci erat. Vivamus sagittis velit non tortor tempor, a ultricies elit sollicitudin. Sed eget ipsum elementum, tristique nisi et, sodales metus. Quisque condimentum ut elit sit amet porta. Nullam quis tincidunt ante. Ut elementum mattis nulla, non pharetra ex fringilla nec.</p>\n<!-- /wp:paragraph -->','Welcome','','inherit','closed','closed','','8-revision-v1','','','2019-10-07 10:36:50','2019-10-07 10:36:50','',8,'http://wptest.local/index.php/2019/10/07/8-revision-v1/',0,'revision','',0),
	(10,1,'2019-10-07 10:37:12','2019-10-07 10:37:12','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id hendrerit orci. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed at tempus dui. Sed commodo pulvinar tortor ut rhoncus. Aliquam turpis neque, venenatis et nulla at, mattis vestibulum risus. Aenean eleifend est nibh, vel consequat nulla auctor at. Phasellus sapien leo, varius eget aliquam et, laoreet ac ligula. Duis sit amet facilisis lectus. Sed convallis nec est at commodo. Suspendisse pretium ex nibh, non bibendum nisi consequat sit amet. Nam quis arcu vitae libero faucibus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Suspendisse eget arcu iaculis lorem pharetra cursus quis lobortis felis. Fusce vel faucibus felis. Etiam ut magna et velit gravida bibendum. Donec bibendum at turpis at placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed enim eros, tristique quis velit in, venenatis fringilla tellus. Sed at nunc nec nisi mollis auctor. Phasellus vitae dolor consequat, maximus lectus eu, molestie dui. Sed ullamcorper turpis ut nibh facilisis, vel placerat magna lobortis. Nullam at augue et est facilisis vulputate a sed nisi. Suspendisse sed erat leo. Aenean pulvinar ex a ligula euismod, a interdum sem tristique.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Quisque in leo dictum, molestie ante accumsan, dictum arcu. Donec malesuada, massa a pharetra tristique, tortor justo convallis elit, sed sollicitudin tellus enim at diam. Quisque fringilla lacus ac tellus condimentum, ut vulputate odio mollis. In condimentum efficitur justo, ut laoreet erat tristique at. Morbi volutpat turpis in dolor volutpat, in euismod nisl ultricies. Maecenas scelerisque orci erat. Vivamus sagittis velit non tortor tempor, a ultricies elit sollicitudin. Sed eget ipsum elementum, tristique nisi et, sodales metus. Quisque condimentum ut elit sit amet porta. Nullam quis tincidunt ante. Ut elementum mattis nulla, non pharetra ex fringilla nec.</p>\n<!-- /wp:paragraph -->','About Us','','publish','closed','closed','','about-us','','','2019-10-07 10:43:56','2019-10-07 10:43:56','',0,'http://wptest.local/?page_id=10',0,'page','',0),
	(11,1,'2019-10-07 10:37:12','2019-10-07 10:37:12','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id hendrerit orci. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed at tempus dui. Sed commodo pulvinar tortor ut rhoncus. Aliquam turpis neque, venenatis et nulla at, mattis vestibulum risus. Aenean eleifend est nibh, vel consequat nulla auctor at. Phasellus sapien leo, varius eget aliquam et, laoreet ac ligula. Duis sit amet facilisis lectus. Sed convallis nec est at commodo. Suspendisse pretium ex nibh, non bibendum nisi consequat sit amet. Nam quis arcu vitae libero faucibus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Suspendisse eget arcu iaculis lorem pharetra cursus quis lobortis felis. Fusce vel faucibus felis. Etiam ut magna et velit gravida bibendum. Donec bibendum at turpis at placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed enim eros, tristique quis velit in, venenatis fringilla tellus. Sed at nunc nec nisi mollis auctor. Phasellus vitae dolor consequat, maximus lectus eu, molestie dui. Sed ullamcorper turpis ut nibh facilisis, vel placerat magna lobortis. Nullam at augue et est facilisis vulputate a sed nisi. Suspendisse sed erat leo. Aenean pulvinar ex a ligula euismod, a interdum sem tristique.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Quisque in leo dictum, molestie ante accumsan, dictum arcu. Donec malesuada, massa a pharetra tristique, tortor justo convallis elit, sed sollicitudin tellus enim at diam. Quisque fringilla lacus ac tellus condimentum, ut vulputate odio mollis. In condimentum efficitur justo, ut laoreet erat tristique at. Morbi volutpat turpis in dolor volutpat, in euismod nisl ultricies. Maecenas scelerisque orci erat. Vivamus sagittis velit non tortor tempor, a ultricies elit sollicitudin. Sed eget ipsum elementum, tristique nisi et, sodales metus. Quisque condimentum ut elit sit amet porta. Nullam quis tincidunt ante. Ut elementum mattis nulla, non pharetra ex fringilla nec.</p>\n<!-- /wp:paragraph -->','About Us','','inherit','closed','closed','','10-revision-v1','','','2019-10-07 10:37:12','2019-10-07 10:37:12','',10,'http://wptest.local/index.php/2019/10/07/10-revision-v1/',0,'revision','',0),
	(12,1,'2019-10-07 10:37:39','0000-00-00 00:00:00','','Home','','draft','closed','closed','','','','','2019-10-07 10:37:39','0000-00-00 00:00:00','',0,'http://wptest.local/?p=12',1,'nav_menu_item','',0),
	(13,1,'2019-10-07 10:38:08','2019-10-07 10:38:08',' ','','','publish','closed','closed','','13','','','2019-10-07 10:38:14','2019-10-07 10:38:14','',0,'http://wptest.local/?p=13',2,'nav_menu_item','',0),
	(14,1,'2019-10-07 10:37:39','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2019-10-07 10:37:39','0000-00-00 00:00:00','',0,'http://wptest.local/?p=14',1,'nav_menu_item','',0),
	(15,1,'2019-10-07 10:38:08','2019-10-07 10:38:08',' ','','','publish','closed','closed','','15','','','2019-10-07 10:38:14','2019-10-07 10:38:14','',0,'http://wptest.local/?p=15',1,'nav_menu_item','',0),
	(16,1,'2019-10-07 10:57:13','2019-10-07 10:57:13',' ','','','publish','closed','closed','','16','','','2019-10-07 10:57:13','2019-10-07 10:57:13','',0,'http://wptest.local/?p=16',2,'nav_menu_item','',0),
	(17,1,'2019-10-07 10:57:13','2019-10-07 10:57:13',' ','','','publish','closed','closed','','17','','','2019-10-07 10:57:13','2019-10-07 10:57:13','',0,'http://wptest.local/?p=17',1,'nav_menu_item','',0),
	(18,1,'2019-10-07 11:53:05','2019-10-07 11:53:05','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id hendrerit orci. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed at tempus dui. Sed commodo pulvinar tortor ut rhoncus. Aliquam turpis neque, venenatis et nulla at, mattis vestibulum risus. Aenean eleifend est nibh, vel consequat nulla auctor at. Phasellus sapien leo, varius eget aliquam et, laoreet ac ligula. Duis sit amet facilisis lectus. Sed convallis nec est at commodo. Suspendisse pretium ex nibh, non bibendum nisi consequat sit amet. Nam quis arcu vitae libero faucibus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Suspendisse eget arcu iaculis lorem pharetra cursus quis lobortis felis. Fusce vel faucibus felis. Etiam ut magna et velit gravida bibendum. Donec bibendum at turpis at placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed enim eros, tristique quis velit in, venenatis fringilla tellus. Sed at nunc nec nisi mollis auctor. Phasellus vitae dolor consequat, maximus lectus eu, molestie dui. Sed ullamcorper turpis ut nibh facilisis, vel placerat magna lobortis. Nullam at augue et est facilisis vulputate a sed nisi. Suspendisse sed erat leo. Aenean pulvinar ex a ligula euismod, a interdum sem tristique.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Quisque in leo dictum, molestie ante accumsan, dictum arcu. Donec malesuada, massa a pharetra tristique, tortor justo convallis elit, sed sollicitudin tellus enim at diam. Quisque fringilla lacus ac tellus condimentum, ut vulputate odio mollis. In condimentum efficitur justo, ut laoreet erat tristique at. Morbi volutpat turpis in dolor volutpat, in euismod nisl ultricies. Maecenas scelerisque orci erat. Vivamus sagittis velit non tortor tempor, a ultricies elit sollicitudin. Sed eget ipsum elementum, tristique nisi et, sodales metus. Quisque condimentum ut elit sit amet porta. Nullam quis tincidunt ante. Ut elementum mattis nulla, non pharetra ex fringilla nec.</p>\n<!-- /wp:paragraph -->','Test blog post','','publish','open','open','','test-blog-post','','','2019-10-07 11:53:05','2019-10-07 11:53:05','',0,'http://wptest.local/?p=18',0,'post','',0),
	(19,1,'2019-10-07 11:53:05','2019-10-07 11:53:05','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id hendrerit orci. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed at tempus dui. Sed commodo pulvinar tortor ut rhoncus. Aliquam turpis neque, venenatis et nulla at, mattis vestibulum risus. Aenean eleifend est nibh, vel consequat nulla auctor at. Phasellus sapien leo, varius eget aliquam et, laoreet ac ligula. Duis sit amet facilisis lectus. Sed convallis nec est at commodo. Suspendisse pretium ex nibh, non bibendum nisi consequat sit amet. Nam quis arcu vitae libero faucibus molestie. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Suspendisse eget arcu iaculis lorem pharetra cursus quis lobortis felis. Fusce vel faucibus felis. Etiam ut magna et velit gravida bibendum. Donec bibendum at turpis at placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed enim eros, tristique quis velit in, venenatis fringilla tellus. Sed at nunc nec nisi mollis auctor. Phasellus vitae dolor consequat, maximus lectus eu, molestie dui. Sed ullamcorper turpis ut nibh facilisis, vel placerat magna lobortis. Nullam at augue et est facilisis vulputate a sed nisi. Suspendisse sed erat leo. Aenean pulvinar ex a ligula euismod, a interdum sem tristique.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Quisque in leo dictum, molestie ante accumsan, dictum arcu. Donec malesuada, massa a pharetra tristique, tortor justo convallis elit, sed sollicitudin tellus enim at diam. Quisque fringilla lacus ac tellus condimentum, ut vulputate odio mollis. In condimentum efficitur justo, ut laoreet erat tristique at. Morbi volutpat turpis in dolor volutpat, in euismod nisl ultricies. Maecenas scelerisque orci erat. Vivamus sagittis velit non tortor tempor, a ultricies elit sollicitudin. Sed eget ipsum elementum, tristique nisi et, sodales metus. Quisque condimentum ut elit sit amet porta. Nullam quis tincidunt ante. Ut elementum mattis nulla, non pharetra ex fringilla nec.</p>\n<!-- /wp:paragraph -->','Test blog post','','inherit','closed','closed','','18-revision-v1','','','2019-10-07 11:53:05','2019-10-07 11:53:05','',18,'http://wptest.local/index.php/2019/10/07/18-revision-v1/',0,'revision','',0);

/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table wp_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_relationships`;

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`)
VALUES
	(1,1,0),
	(13,2,0),
	(15,2,0),
	(16,3,0),
	(17,3,0),
	(18,1,0);

/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table wp_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_taxonomy`;

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,2),
	(2,2,'nav_menu','',0,2),
	(3,3,'nav_menu','',0,2);

/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table wp_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_termmeta`;

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Affichage de la table wp_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_terms`;

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Uncategorized','uncategorized',0),
	(2,'Main menu','main-menu',0),
	(3,'Side Menu','side-menu',0);

/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table wp_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_usermeta`;

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'nickname','boogiestrat'),
	(2,1,'first_name',''),
	(3,1,'last_name',''),
	(4,1,'description',''),
	(5,1,'rich_editing','true'),
	(6,1,'syntax_highlighting','true'),
	(7,1,'comment_shortcuts','false'),
	(8,1,'admin_color','fresh'),
	(9,1,'use_ssl','0'),
	(10,1,'show_admin_bar_front','true'),
	(11,1,'locale',''),
	(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(13,1,'wp_user_level','10'),
	(14,1,'dismissed_wp_pointers','wp496_privacy'),
	(15,1,'show_welcome_panel','1'),
	(16,1,'session_tokens','a:1:{s:64:\"de8c0236cd762df5d2fe055fcb064cfb52b556751c38cd568ed39b6f103659dd\";a:4:{s:10:\"expiration\";i:1571600256;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36\";s:5:\"login\";i:1570390656;}}'),
	(17,1,'wp_dashboard_quick_press_last_post_id','4'),
	(18,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
	(19,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
	(20,1,'metaboxhidden_nav-menus','a:1:{i:0;s:12:\"add-post_tag\";}'),
	(21,1,'nav_menu_recently_edited','3'),
	(22,2,'nickname','admin'),
	(23,2,'first_name','Admin'),
	(24,2,'last_name','Admin'),
	(25,2,'description',''),
	(26,2,'rich_editing','true'),
	(27,2,'syntax_highlighting','true'),
	(28,2,'comment_shortcuts','false'),
	(29,2,'admin_color','fresh'),
	(30,2,'use_ssl','0'),
	(31,2,'show_admin_bar_front','true'),
	(32,2,'locale',''),
	(33,2,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(34,2,'wp_user_level','10'),
	(35,2,'dismissed_wp_pointers','');

/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table wp_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_users`;

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'boogiestrat','$P$BOCnVgqZ6HLMXjuWfvaet.Rac5VZ1T1','boogiestrat','boogiestrat@gmail.com','','2019-10-06 19:36:28','',0,'boogiestrat'),
	(2,'admin','$P$BsaNAfavTTZx6Es4Cqwgytp3BoEAOF.','admin','admin@test.com','','2019-10-07 12:43:55','',0,'Admin Admin');

/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
