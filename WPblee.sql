-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Client: smysql
-- Généré le: Mer 30 Janvier 2013 à 10:25
-- Version du serveur: 5.5.24-4-log
-- Version de PHP: 5.3.10-1ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `WPblee`
--

-- --------------------------------------------------------

--
-- Structure de la table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Monsieur WordPress', '', 'http://wordpress.org/', '', '2013-01-14 15:00:56', '2013-01-14 15:00:56', 'Bonjour, ceci est un commentaire.\nPour supprimer un commentaire, connectez-vous et affichez les commentaires de cet article. Vous pourrez alors les modifier ou les supprimer.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_custom_fields`
--

CREATE TABLE IF NOT EXISTS `wp_mf_custom_fields` (
  `id` int(19) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `label` varchar(150) NOT NULL,
  `description` text,
  `post_type` varchar(120) NOT NULL,
  `custom_group_id` int(19) NOT NULL,
  `type` varchar(100) NOT NULL,
  `required_field` tinyint(1) DEFAULT NULL,
  `display_order` mediumint(9) DEFAULT '0',
  `duplicated` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `options` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_custom_groups`
--

CREATE TABLE IF NOT EXISTS `wp_mf_custom_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `post_type` varchar(255) NOT NULL,
  `duplicated` tinyint(1) DEFAULT '0',
  `expanded` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_custom_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_mf_custom_taxonomy` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `arguments` text,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_posttypes`
--

CREATE TABLE IF NOT EXISTS `wp_mf_posttypes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `arguments` text,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mf_post_meta`
--

CREATE TABLE IF NOT EXISTS `wp_mf_post_meta` (
  `meta_id` int(11) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_count` int(11) NOT NULL,
  `group_count` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `idx_post_field` (`post_id`,`meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=254 ;

--
-- Contenu de la table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/~blee/LGBT', 'yes'),
(2, 'blogname', 'LGBT Festival', 'yes'),
(3, 'blogdescription', 'Festival Gay, Lesbian &amp; co', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'vincent.blee@etu.univ-orleans.fr', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '', 'yes'),
(10, 'comments_notify', '', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'closed', 'yes'),
(19, 'default_ping_status', 'closed', 'yes'),
(20, 'default_pingback_flag', '', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'j F Y', 'yes'),
(23, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(24, 'links_updated_date_format', 'j F Y, G \\h i \\m\\i\\n', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '', 'yes'),
(29, 'moderation_notify', '', 'yes'),
(30, 'permalink_structure', '', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:1:{i:0;s:23:"magic-fields-2/main.php";}', 'yes'),
(36, 'home', 'http://localhost/~blee/LGBT', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '1', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', 'a:3:{i:0;s:75:"/mnt/home/blee/public_html/LGBT/wp-content/themes/twentytwelve/category.php";i:1;s:72:"/mnt/home/blee/public_html/LGBT/wp-content/themes/twentytwelve/style.css";i:2;s:0:"";}', 'no'),
(44, 'template', 'twentytwelve-child', 'yes'),
(45, 'stylesheet', 'twentytwelve-child', 'yes'),
(46, 'comment_whitelist', '', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '22441', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '0', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'page', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:2:{i:3;a:3:{s:5:"title";s:9:"Programme";s:4:"text";s:680:"Retrouvez les films nominés pour le festival LGBT ainsi que les horaires des scéances prévues.\r\n\r\nVendredi 24 septembre : 20h00\r\nSoirée d’ouverture : séance de courts métrages\r\nRencontre-débat avec un réalisateur.\r\n\r\nSamedi 25 septembre : 19h30\r\nDocumentaire :\r\nIt’s elementary, talking about gays issues in school\r\n(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nRencontre-débat avec le Groupe Action Gay & Lesbien – Loiret\r\nsur les interventions en milieu scolaire.\r\n\r\nSamedi 25 septembre : 21h45\r\nFiction : Ander\r\n\r\nDimanche 26 septembre : 16h00\r\nFiction : El niño pez\r\n\r\nDimanche 26 septembre : 18h00\r\nFiction : I can’t think straight\r\n";s:6:"filter";b:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(84, 'widget_rss', 'a:0:{}', 'yes'),
(85, 'uninstall_plugins', 'a:0:{}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '62', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '22441', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:2:{i:3;a:1:{s:5:"title";s:10:"Rechercher";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:2:{i:0;s:8:"search-3";i:1;s:6:"text-3";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:4:{i:1359471659;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1359471741;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1359471870;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:0:{}s:15:"version_checked";s:3:"3.5";s:12:"last_checked";i:1359446112;}', 'yes'),
(102, '_site_transient_update_plugins', 'O:8:"stdClass":1:{s:12:"last_checked";i:1359446142;}', 'yes'),
(105, '_site_transient_update_themes', 'O:8:"stdClass":1:{s:12:"last_checked";i:1359446173;}', 'yes'),
(106, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:27:"http://localhost/~blee/LGBT";s:4:"link";s:103:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost/~blee/LGBT/";s:3:"url";s:136:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/~blee/LGBT/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:35:"http://www.wordpress-fr.net/planet/";s:3:"url";s:55:"http://feeds2.feedburner.com/WordpressFrancophonePlanet";s:5:"title";s:14:"Blog WordPress";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:35:"http://www.wordpress-fr.net/planet/";s:3:"url";s:55:"http://feeds2.feedburner.com/WordpressFrancophonePlanet";s:5:"title";s:46:"Autres actualités de WordPress (en français)";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(107, 'can_compress_scripts', '0', 'yes'),
(141, 'theme_mods_twentytwelve', 'a:8:{s:18:"nav_menu_locations";a:1:{s:7:"primary";i:6;}s:16:"header_textcolor";s:6:"ff2828";s:16:"background_color";s:6:"020202";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1358780606;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:2:{i:0;s:8:"search-3";i:1;s:6:"text-3";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(142, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(148, 'recently_activated', 'a:0:{}', 'yes'),
(149, 'ftp_credentials', 'a:3:{s:8:"hostname";s:4:"blee";s:8:"username";s:4:"blee";s:15:"connection_type";s:3:"ftp";}', 'yes'),
(150, 'mf_db_version', '3', 'yes'),
(167, 'category_children', 'a:0:{}', 'yes'),
(168, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(169, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(183, '_site_transient_timeout_wporg_theme_feature_list', '1358793681', 'yes'),
(184, '_site_transient_wporg_theme_feature_list', 'a:0:{}', 'yes'),
(189, '_transient_random_seed', '8652cd955a03fff9cce1b4143dc8cbab', 'yes'),
(206, 'current_theme', 'Twenty Twelve/twentytwelve-child', 'yes'),
(207, 'theme_mods_twentytwelve-child', 'a:8:{i:0;b:0;s:16:"header_textcolor";s:3:"444";s:16:"background_color";s:6:"e6e6e6";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:18:"nav_menu_locations";a:1:{s:7:"primary";i:6;}}', 'yes'),
(208, 'theme_switched', '', 'yes'),
(232, '_transient_timeout_plugin_slugs', '1359472344', 'no'),
(233, '_transient_plugin_slugs', 'a:3:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:23:"magic-fields-2/main.php";}', 'no'),
(244, '_site_transient_timeout_theme_roots', '1359447972', 'yes'),
(245, '_site_transient_theme_roots', 'a:4:{s:12:"twentyeleven";s:7:"/themes";s:9:"twentyten";s:7:"/themes";s:18:"twentytwelve-child";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(246, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1359489377', 'no'),
(247, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p>', 'no'),
(248, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1359489377', 'no'),
(249, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p></div>', 'no'),
(250, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1359489378', 'no'),
(251, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: connect() timed out!</p></div>', 'no'),
(252, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1359489388', 'no'),
(253, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=336 ;

--
-- Contenu de la table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_wp_trash_meta_status', 'publish'),
(3, 1, '_wp_trash_meta_time', '1358175857'),
(4, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(5, 5, '_edit_last', '1'),
(6, 5, '_edit_lock', '1358779388:1'),
(8, 8, '_edit_last', '1'),
(9, 8, '_edit_lock', '1358779378:1'),
(11, 10, '_edit_last', '1'),
(12, 10, '_edit_lock', '1358779370:1'),
(14, 12, '_edit_last', '1'),
(15, 12, '_edit_lock', '1358779362:1'),
(17, 14, '_edit_last', '1'),
(18, 14, '_edit_lock', '1358779354:1'),
(20, 16, '_edit_last', '1'),
(21, 16, '_edit_lock', '1358779345:1'),
(24, 19, '_edit_last', '1'),
(25, 19, '_edit_lock', '1358779336:1'),
(27, 21, '_edit_last', '1'),
(28, 21, '_edit_lock', '1358779327:1'),
(30, 23, '_edit_last', '1'),
(31, 23, '_edit_lock', '1358779316:1'),
(34, 27, '_edit_last', '1'),
(35, 27, '_edit_lock', '1358779309:1'),
(37, 29, '_edit_last', '1'),
(38, 29, '_edit_lock', '1358779289:1'),
(40, 31, '_edit_last', '1'),
(41, 31, '_edit_lock', '1358781733:1'),
(43, 33, '_edit_last', '1'),
(44, 33, '_edit_lock', '1358176933:1'),
(45, 2, '_wp_trash_meta_status', 'publish'),
(46, 2, '_wp_trash_meta_time', '1358176987'),
(47, 35, '_edit_last', '1'),
(48, 35, '_edit_lock', '1358177642:1'),
(49, 35, '_wp_page_template', 'default'),
(50, 37, '_edit_last', '1'),
(51, 37, '_wp_page_template', 'default'),
(52, 37, '_edit_lock', '1358177956:1'),
(53, 33, '_wp_trash_meta_status', 'draft'),
(54, 33, '_wp_trash_meta_time', '1358177098'),
(55, 39, '_menu_item_type', 'taxonomy'),
(56, 39, '_menu_item_menu_item_parent', '0'),
(57, 39, '_menu_item_object_id', '2'),
(58, 39, '_menu_item_object', 'category'),
(59, 39, '_menu_item_target', ''),
(60, 39, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(61, 39, '_menu_item_xfn', ''),
(62, 39, '_menu_item_url', ''),
(63, 39, '_menu_item_orphaned', '1358177291'),
(127, 37, '_wp_trash_meta_status', 'publish'),
(128, 37, '_wp_trash_meta_time', '1358178324'),
(129, 35, '_wp_trash_meta_status', 'publish'),
(130, 35, '_wp_trash_meta_time', '1358178325'),
(178, 62, '_edit_last', '1'),
(179, 62, '_edit_lock', '1359387020:1'),
(180, 62, '_wp_page_template', 'default'),
(182, 67, '_menu_item_type', 'post_type'),
(183, 67, '_menu_item_menu_item_parent', '0'),
(184, 67, '_menu_item_object_id', '62'),
(185, 67, '_menu_item_object', 'page'),
(186, 67, '_menu_item_target', ''),
(187, 67, '_menu_item_classes', 'a:1:{i:0;s:8:"fg-rouge";}'),
(188, 67, '_menu_item_xfn', ''),
(189, 67, '_menu_item_url', ''),
(191, 68, '_menu_item_type', 'taxonomy'),
(192, 68, '_menu_item_menu_item_parent', '0'),
(193, 68, '_menu_item_object_id', '3'),
(194, 68, '_menu_item_object', 'category'),
(195, 68, '_menu_item_target', ''),
(196, 68, '_menu_item_classes', 'a:1:{i:0;s:9:"fg-orange";}'),
(197, 68, '_menu_item_xfn', ''),
(198, 68, '_menu_item_url', ''),
(200, 69, '_menu_item_type', 'taxonomy'),
(201, 69, '_menu_item_menu_item_parent', '0'),
(202, 69, '_menu_item_object_id', '2'),
(203, 69, '_menu_item_object', 'category'),
(204, 69, '_menu_item_target', ''),
(205, 69, '_menu_item_classes', 'a:1:{i:0;s:8:"fg-jaune";}'),
(206, 69, '_menu_item_xfn', ''),
(207, 69, '_menu_item_url', ''),
(238, 75, '_wp_attached_file', '2013/01/American-boy.png'),
(239, 75, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:901;s:6:"height";i:601;s:4:"file";s:24:"2013/01/American-boy.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"American-boy-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:24:"American-boy-300x200.png";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:24:"American-boy-624x416.png";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(240, 76, '_wp_attached_file', '2013/01/ANDER1.jpg'),
(241, 76, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1080;s:4:"file";s:18:"2013/01/ANDER1.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"ANDER1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"ANDER1-300x168.jpg";s:5:"width";i:300;s:6:"height";i:168;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:19:"ANDER1-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"ANDER1-624x351.jpg";s:5:"width";i:624;s:6:"height";i:351;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(244, 78, '_wp_attached_file', '2013/01/COWBOY-FOREVER.jpg'),
(245, 78, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2544;s:6:"height";i:1696;s:4:"file";s:26:"2013/01/COWBOY-FOREVER.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:26:"COWBOY-FOREVER-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:26:"COWBOY-FOREVER-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:27:"COWBOY-FOREVER-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:26:"COWBOY-FOREVER-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:5.5999999999999996;s:6:"credit";s:0:"";s:6:"camera";s:13:"Canon EOS 30D";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1153563697;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"110";s:3:"iso";s:3:"400";s:13:"shutter_speed";s:5:"0.004";s:5:"title";s:0:"";}}'),
(246, 79, '_wp_attached_file', '2013/01/EL-NINO-PEZ-1.jpg'),
(247, 79, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4405;s:6:"height";i:3010;s:4:"file";s:25:"2013/01/EL-NINO-PEZ-1.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"EL-NINO-PEZ-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"EL-NINO-PEZ-1-300x204.jpg";s:5:"width";i:300;s:6:"height";i:204;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:26:"EL-NINO-PEZ-1-1024x699.jpg";s:5:"width";i:1024;s:6:"height";i:699;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:25:"EL-NINO-PEZ-1-624x426.jpg";s:5:"width";i:624;s:6:"height";i:426;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(250, 81, '_wp_attached_file', '2013/01/EN_COLOricco.jpg'),
(251, 81, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1337;s:6:"height";i:875;s:4:"file";s:24:"2013/01/EN_COLOricco.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"EN_COLOricco-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"EN_COLOricco-300x196.jpg";s:5:"width";i:300;s:6:"height";i:196;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:25:"EN_COLOricco-1024x670.jpg";s:5:"width";i:1024;s:6:"height";i:670;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:24:"EN_COLOricco-624x408.jpg";s:5:"width";i:624;s:6:"height";i:408;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:2.7999999999999998;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1243723185;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"48";s:3:"iso";s:4:"4000";s:13:"shutter_speed";s:5:"0.008";s:5:"title";s:0:"";}}'),
(252, 82, '_wp_attached_file', '2013/01/I_cant_think_straight_001.jpg'),
(253, 82, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2400;s:6:"height";i:1600;s:4:"file";s:37:"2013/01/I_cant_think_straight_001.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:37:"I_cant_think_straight_001-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:37:"I_cant_think_straight_001-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:38:"I_cant_think_straight_001-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:37:"I_cant_think_straight_001-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(256, 84, '_wp_attached_file', '2013/01/Odile-.jpg'),
(257, 84, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:3704;s:6:"height";i:2508;s:4:"file";s:18:"2013/01/Odile-.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"Odile--150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"Odile--300x203.jpg";s:5:"width";i:300;s:6:"height";i:203;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:19:"Odile--1024x693.jpg";s:5:"width";i:1024;s:6:"height";i:693;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"Odile--624x422.jpg";s:5:"width";i:624;s:6:"height";i:422;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(258, 85, '_wp_attached_file', '2013/01/OMAR_.jpg'),
(259, 85, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1890;s:6:"height";i:1260;s:4:"file";s:17:"2013/01/OMAR_.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"OMAR_-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"OMAR_-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:18:"OMAR_-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:17:"OMAR_-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:4;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1243445020;s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"180";s:3:"iso";s:3:"800";s:13:"shutter_speed";s:5:"0.004";s:5:"title";s:0:"";}}'),
(260, 86, '_wp_attached_file', '2013/01/PAULINE_1.jpg'),
(261, 86, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2362;s:6:"height";i:1575;s:4:"file";s:21:"2013/01/PAULINE_1.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"PAULINE_1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"PAULINE_1-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:22:"PAULINE_1-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:21:"PAULINE_1-624x416.jpg";s:5:"width";i:624;s:6:"height";i:416;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";d:3.5;s:6:"credit";s:0:"";s:6:"camera";s:20:"Canon EOS 5D Mark II";s:7:"caption";s:0:"";s:17:"created_timestamp";i:1242468669;s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"50";s:3:"iso";s:3:"500";s:13:"shutter_speed";s:17:"0.016666666666667";s:5:"title";s:0:"";}}'),
(280, 109, '_edit_last', '1'),
(281, 109, '_edit_lock', '1358779256:1'),
(282, 109, '_wp_page_template', 'default'),
(283, 114, '_menu_item_type', 'taxonomy'),
(284, 114, '_menu_item_menu_item_parent', '0'),
(285, 114, '_menu_item_object_id', '8'),
(286, 114, '_menu_item_object', 'category'),
(287, 114, '_menu_item_target', ''),
(288, 114, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(289, 114, '_menu_item_xfn', ''),
(290, 114, '_menu_item_url', ''),
(291, 114, '_menu_item_orphaned', '1358243552'),
(292, 115, '_menu_item_type', 'post_type'),
(293, 115, '_menu_item_menu_item_parent', '0'),
(294, 115, '_menu_item_object_id', '109'),
(295, 115, '_menu_item_object', 'page'),
(296, 115, '_menu_item_target', ''),
(297, 115, '_menu_item_classes', 'a:1:{i:0;s:7:"fg-bleu";}'),
(298, 115, '_menu_item_xfn', ''),
(299, 115, '_menu_item_url', ''),
(310, 117, '_edit_last', '1'),
(311, 117, '_edit_lock', '1358779264:1'),
(312, 117, '_wp_page_template', 'default'),
(313, 119, '_menu_item_type', 'post_type'),
(314, 119, '_menu_item_menu_item_parent', '0'),
(315, 119, '_menu_item_object_id', '117'),
(316, 119, '_menu_item_object', 'page'),
(317, 119, '_menu_item_target', ''),
(318, 119, '_menu_item_classes', 'a:1:{i:0;s:9:"fg-violet";}'),
(319, 119, '_menu_item_xfn', ''),
(320, 119, '_menu_item_url', ''),
(322, 120, '_edit_last', '1'),
(323, 120, '_edit_lock', '1358779510:1'),
(324, 120, '_wp_page_template', 'default'),
(325, 122, '_menu_item_type', 'post_type'),
(326, 122, '_menu_item_menu_item_parent', '0'),
(327, 122, '_menu_item_object_id', '120'),
(328, 122, '_menu_item_object', 'page'),
(329, 122, '_menu_item_target', ''),
(330, 122, '_menu_item_classes', 'a:1:{i:0;s:7:"fg-vert";}'),
(331, 122, '_menu_item_xfn', ''),
(332, 122, '_menu_item_url', ''),
(333, 81, '_edit_lock', '1359384674:1'),
(334, 82, '_edit_lock', '1359384717:1'),
(335, 85, '_edit_lock', '1359384755:1');

-- --------------------------------------------------------

--
-- Structure de la table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=147 ;

--
-- Contenu de la table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2013-01-14 15:00:56', '2013-01-14 15:00:56', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'trash', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2013-01-14 16:04:17', '2013-01-14 15:04:17', '', 0, 'http://localhost/~blee/LGBT/?p=1', 0, 'post', '', 1),
(2, 1, '2013-01-14 15:00:56', '2013-01-14 15:00:56', 'Voici un exemple de page. Elle est différente d&rsquo;un article de blog, en cela qu''elle restera à la même place, et s''affichera dans le menu de navigation de votre site (en fonction de votre thème). La plupart des gens commencent par écrire une page « À Propos » qui les présente aux visiteurs potentiels du site. Vous pourriez y écrire quelque chose de ce tenant :\n\n<blockquote>Bonjour ! Je suis un mécanicien qui aspire à devenir un acteur, et voici mon blog. J''habite à Bordeaux, j''ai un super chien baptisé Russell, et j''aime la vodka-ananas (ainsi que regarder la pluie tomber).</blockquote>\n\n...ou bien quelque chose comme ça :\n\n<blockquote>La société 123 Machin Truc a été créée en 1971, et n''a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules super pour la communauté bouzemontoise.</blockquote>\n\nÉtant donné que vous êtes un nouvel utilisateur de WordPress, vous devriez vous rendre sur votre <a href="http://localhost/~blee/LGBT/wp-admin/">tableau de bord</a> pour effacer la présente page, et créer de nouvelles pages avec votre propre contenu. Amusez-vous bien&nbsp;!', 'Page d&rsquo;exemple', '', 'trash', 'open', 'open', '', 'page-d-exemple', '', '', '2013-01-14 16:23:07', '2013-01-14 15:23:07', '', 0, 'http://localhost/~blee/LGBT/?page_id=2', 0, 'page', '', 0),
(4, 1, '2013-01-14 15:00:56', '2013-01-14 15:00:56', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'inherit', 'open', 'open', '', '1-revision', '', '', '2013-01-14 15:00:56', '2013-01-14 15:00:56', '', 1, 'http://localhost/~blee/LGBT/?p=4', 0, 'revision', '', 0),
(5, 1, '2013-01-14 16:08:23', '2013-01-14 15:08:23', '<p style="text-align: justify;">Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.</p>\r\n<p style="text-align: justify;">Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n<p style="text-align: jus;">En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.</p>\r\n<p style="text-align: left;">Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !</p>\r\n<p style="text-align: left;">Christel Guillard, coordinatrice générale.</p>', 'Édito', '', 'publish', 'closed', 'closed', '', 'edito', '', '', '2013-01-21 15:45:00', '2013-01-21 14:45:00', '', 0, 'http://localhost/~blee/LGBT/?p=5', 0, 'post', '', 0),
(6, 1, '2013-01-14 16:06:31', '2013-01-14 15:06:31', '<p style="text-align: justify;">Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.</p>\n<p style="text-align: justify;">Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\n<p style="text-align: jus;">En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.</p>\n<p style="text-align: left;">Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\nBon festival !</p>\n<p style="text-align: left;">Christel Guillard, coordinatrice générale.</p>', '', '', 'inherit', 'open', 'open', '', '5-revision', '', '', '2013-01-14 16:06:31', '2013-01-14 15:06:31', '', 5, 'http://localhost/~blee/LGBT/5-revision/', 0, 'revision', '', 0),
(7, 1, '2013-01-14 16:09:25', '2013-01-14 15:09:25', '<p style="text-align: justify;">Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.</p>\n<p style="text-align: justify;">Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\n<p style="text-align: jus;">En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.</p>\n<p style="text-align: left;">Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\nBon festival !</p>\n<p style="text-align: left;">Christel Guillard, coordinatrice générale.</p>', 'Édito', '', 'inherit', 'open', 'open', '', '5-autosave', '', '', '2013-01-14 16:09:25', '2013-01-14 15:09:25', '', 5, 'http://localhost/~blee/LGBT/5-autosave/', 0, 'revision', '', 0),
(8, 1, '2013-01-14 16:10:22', '2013-01-14 15:10:22', '<p style="text-align: justify;">Les 3 premiers courts métrages de cette séance font partie des 5 lauréats du concours Jeune et homo sous le regard des autres, dont les scenarii ont été écrits par des jeunes et mis en scène par des réalisateurs. Cette opération contre l’homophobie, a été organisée en 2009 par le Ministère de la Santé, de la Jeunesse, des Sports et de la Vie associative et de l’INPES avec le soutien du groupe Canal+.</p>', 'Intro', '', 'publish', 'closed', 'closed', '', 'intro', '', '', '2013-01-21 15:44:51', '2013-01-21 14:44:51', '', 0, 'http://localhost/~blee/LGBT/?p=8', 0, 'post', '', 0),
(9, 1, '2013-01-14 16:09:46', '2013-01-14 15:09:46', '', 'Intro', '', 'inherit', 'open', 'open', '', '8-revision', '', '', '2013-01-14 16:09:46', '2013-01-14 15:09:46', '', 8, 'http://localhost/~blee/LGBT/8-revision/', 0, 'revision', '', 0),
(10, 1, '2013-01-14 16:11:40', '2013-01-14 15:11:40', '<p style="text-align: justify;">2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont  pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi. A partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle  homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais  surtout le faire réfléchir.</p>\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=86" rel="attachment wp-att-86"><img class="size-medium wp-image-86 aligncenter" alt="PAULINE_1" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/PAULINE_1-300x200.jpg" width="300" height="200" /></a>', 'En colo - Pascal-Alex Vincent - France', '', 'publish', 'closed', 'closed', '', 'en-colo-pascal-alex-vincent-france', '', '', '2013-01-21 15:44:42', '2013-01-21 14:44:42', '', 0, 'http://localhost/~blee/LGBT/?p=10', 0, 'post', '', 0),
(11, 1, '2013-01-14 16:11:35', '2013-01-14 15:11:35', '2009 - 8 minutes\nLors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont  pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi. A partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle  homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais  surtout le faire réfléchir.', '', '', 'inherit', 'open', 'open', '', '10-revision', '', '', '2013-01-14 16:11:35', '2013-01-14 15:11:35', '', 10, 'http://localhost/~blee/LGBT/10-revision/', 0, 'revision', '', 0),
(12, 1, '2013-01-14 16:12:28', '2013-01-14 15:12:28', '<p style="text-align: justify;">7 minutes 13\r\nC’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans  une petite ville de province où tout le monde se connaît, la révélation publique et infamante de son  homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur.  Comme une confidence.</p>\r\n<p style="text-align: justify;"></p>', 'Pauline – Céline Sciamma- France – 2009', '', 'publish', 'closed', 'closed', '', 'pauline-celine-sciamma-france-2009', '', '', '2013-01-21 15:44:35', '2013-01-21 14:44:35', '', 0, 'http://localhost/~blee/LGBT/?p=12', 0, 'post', '', 0),
(13, 1, '2013-01-14 16:11:51', '2013-01-14 15:11:51', '', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '12-revision', '', '', '2013-01-14 16:11:51', '2013-01-14 15:11:51', '', 12, 'http://localhost/~blee/LGBT/12-revision/', 0, 'revision', '', 0),
(14, 1, '2013-01-14 16:13:10', '2013-01-14 15:13:10', '<p style="text-align: left;">C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui l’aime mais où la pression est telle qu’il ne peut vraiment assouvir, ni même révéler, son amour pour Arthur. Jusqu’au jour où les deux jeunes hommes sont découverts.</p>\r\n<p style="text-align: left;"><a href="http://localhost/~blee/LGBT/?attachment_id=85" rel="attachment wp-att-85"><img class="size-medium wp-image-85 aligncenter" alt="OMAR_" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/OMAR_-300x200.jpg" width="300" height="200" /></a></p>', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'publish', 'closed', 'closed', '', 'omar-sebastien-gabriel-france-2009-9-minutes', '', '', '2013-01-21 15:44:26', '2013-01-21 14:44:26', '', 0, 'http://localhost/~blee/LGBT/?p=14', 0, 'post', '', 0),
(15, 1, '2013-01-14 16:12:43', '2013-01-14 15:12:43', '', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'open', 'open', '', '14-revision', '', '', '2013-01-14 16:12:43', '2013-01-14 15:12:43', '', 14, 'http://localhost/~blee/LGBT/14-revision/', 0, 'revision', '', 0),
(16, 1, '2013-01-14 16:13:40', '2013-01-14 15:13:40', '<p style="text-align: justify;">17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche vers la veillée funèbre pour revendiquer l’identité construite de la défunte.</p>\r\n<p style="text-align: justify;"></p>', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'publish', 'closed', 'closed', '', 'odile-benedicte-delgehier-france-2006-10-minutes', '', '', '2013-01-21 15:44:16', '2013-01-21 14:44:16', '', 0, 'http://localhost/~blee/LGBT/?p=16', 0, 'post', '', 0),
(17, 1, '2013-01-14 16:13:20', '2013-01-14 15:13:20', '', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '16-revision', '', '', '2013-01-14 16:13:20', '2013-01-14 15:13:20', '', 16, 'http://localhost/~blee/LGBT/16-revision/', 0, 'revision', '', 0),
(18, 1, '2013-01-14 16:13:40', '2013-01-14 15:13:40', 'Une boulangerie banale sur une route de campagne. Derrière le comptoir, Odile, s’ennuie. Un jour, une horde de motards stoppe devant la boutique. Le passé va faire irruption dans sa vie...', 'Odile - Bénédicte Delgéhier - France - 2006- 10 minutes', '', 'inherit', 'open', 'open', '', '16-revision-2', '', '', '2013-01-14 16:13:40', '2013-01-14 15:13:40', '', 16, 'http://localhost/~blee/LGBT/16-revision-2/', 0, 'revision', '', 0),
(19, 1, '2013-01-14 16:15:04', '2013-01-14 15:15:04', '<p style="text-align: justify;">2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des cowboys latinos, les héros de Cowboy Forever revendiquent leur homosexualité et manient à merveille le lasso, et pas seulement pour attraper le bétail...</p>\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=78" rel="attachment wp-att-78"><img class="size-medium wp-image-78 aligncenter" alt="COWBOY FOREVER" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/COWBOY-FOREVER-300x200.jpg" width="300" height="200" /></a>', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'publish', 'closed', 'closed', '', 'cowboy-forever-jean-baptiste-erreca-france', '', '', '2013-01-21 15:44:08', '2013-01-21 14:44:08', '', 0, 'http://localhost/~blee/LGBT/?p=19', 0, 'post', '', 0),
(20, 1, '2013-01-14 16:14:45', '2013-01-14 15:14:45', '', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '19-revision', '', '', '2013-01-14 16:14:45', '2013-01-14 15:14:45', '', 19, 'http://localhost/~blee/LGBT/19-revision/', 0, 'revision', '', 0),
(21, 1, '2013-01-14 16:15:36', '2013-01-14 15:15:36', '<p style="text-align: justify;">2008 - 4 minutes\r\nComment jouer du genre en chanson ? Projection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat &amp; Scène.</p>\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=75" rel="attachment wp-att-75"><img class="size-medium wp-image-75 aligncenter" alt="American boy" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/American-boy-300x200.png" width="300" height="200" /></a>', 'American Boy - Patricia & Colette - France', '', 'publish', 'closed', 'closed', '', 'american-boy-patricia-colette-france', '', '', '2013-01-21 15:43:57', '2013-01-21 14:43:57', '', 0, 'http://localhost/~blee/LGBT/?p=21', 0, 'post', '', 0),
(22, 1, '2013-01-14 16:15:13', '2013-01-14 15:15:13', '', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '21-revision', '', '', '2013-01-14 16:15:13', '2013-01-14 15:15:13', '', 21, 'http://localhost/~blee/LGBT/21-revision/', 0, 'revision', '', 0),
(23, 1, '2013-01-14 16:17:22', '2013-01-14 15:17:22', '<p style="text-align: justify;">(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nEtats-Unis - 1996 - Documentaire\r\nDurée 01h20 - Réalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques américaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix. Un excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association G.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.</p>\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=74" rel="attachment wp-att-74"><img class="size-medium wp-image-74 aligncenter" alt="37_it_s_still_elementary" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/37_it_s_still_elementary-300x171.jpg" width="418" height="332" /></a>', 'It’s elementary, talking about gays issues in school', '', 'publish', 'closed', 'closed', '', 'its-elementary-talking-about-gays-issues-in-school', '', '', '2013-01-21 15:43:49', '2013-01-21 14:43:49', '', 0, 'http://localhost/~blee/LGBT/?p=23', 0, 'post', '', 0),
(24, 1, '2013-01-14 16:16:43', '2013-01-14 15:16:43', '(C’est élémentaire - Parler de l’homosexualité à l’école)\nEtats-Unis - 1996 - Documentaire\nDurée 01h20 - Réalisation : Debra Chasnoff\nPremier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques américaines, It’s\nelementary suit les interventions des enseignants dans les\nclasses allant du primaire au lycée. Tourné en 1996, il a fait le\ntour des écoles américaines et a gagné de nombreux prix.\nUn excellent support didactique à montrer à tous les élèves\net leurs professeurs lorsque l’on appartient au monde de\nl’éducation.\nCe film a subi aux Etats-Unis des attaques de la part de\nl’ultra-droite chrétienne intégriste et homophobe pour\nempêcher sa diffusion sur une chaîne télé.\nLa projection sera suivie d’un débat avec l’association\nG.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu\nScolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '23-revision', '', '', '2013-01-14 16:16:43', '2013-01-14 15:16:43', '', 23, 'http://localhost/~blee/LGBT/23-revision/', 0, 'revision', '', 0),
(26, 1, '2013-01-14 16:17:22', '2013-01-14 15:17:22', '(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nEtats-Unis - 1996 - Documentaire\r\nDurée 01h20 - Réalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques américaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix. Un excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association G.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '23-revision-2', '', '', '2013-01-14 16:17:22', '2013-01-14 15:17:22', '', 23, 'http://localhost/~blee/LGBT/23-revision-2/', 0, 'revision', '', 0),
(27, 1, '2013-01-14 16:19:17', '2013-01-14 15:19:17', '<p style="text-align: justify;">Espagne - 2009 - 02h08 - VOSTF\r\nInterprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive\r\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien.\r\nLe nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto C<a href="http://localhost/~blee/LGBT/?attachment_id=77" rel="attachment wp-att-77"><img class="size-medium wp-image-77 alignright" alt="ANDER2" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/ANDER2-300x168.jpg" width="300" height="168" /></a>astón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse\r\nle temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer...\r\nCe premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\nPrix C.I.C.A.E – Festival International de Berlin (2009)\r\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\r\nGrand prix du jury – Festival Cinehorizontes (2009)</p>\r\n<p style="text-align: left;"></p>', 'ANDER - Réalisé par Roberto Castón', '', 'publish', 'closed', 'closed', '', 'ander-realise-par-roberto-caston', '', '', '2013-01-21 15:43:29', '2013-01-21 14:43:29', '', 0, 'http://localhost/~blee/LGBT/?p=27', 0, 'post', '', 0),
(28, 1, '2013-01-14 16:18:49', '2013-01-14 15:18:49', 'Espagne - 2009 - 02h08 - VOSTF\nInterprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien.\nLe nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\nConsidéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes\nvivant au contact de la nature d’une manière différente. Il laisse\nle temps à ses personnages de s’apprivoiser, de se découvrir,\nd’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le\ntemps de filmer...\nCe premier beau long métrage où la simplicité formelle côtoie\nla complexité des rapports humains d’une grande intensité, a\nremporté l’adhésion du public dans tous les festivals où il a été\nprojeté.\nPrix C.I.C.A.E – Festival International de Berlin (2009)\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\nGrand prix du jury – Festival Cinehorizontes (2009)', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '27-revision', '', '', '2013-01-14 16:18:49', '2013-01-14 15:18:49', '', 27, 'http://localhost/~blee/LGBT/27-revision/', 0, 'revision', '', 0),
(29, 1, '2013-01-14 16:20:58', '2013-01-14 15:20:58', '<p style="text-align: justify;">Argentine - 2008 - 01h36 - VOSTF\r\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\r\nDans la banlieue<a href="http://localhost/~blee/LGBT/?attachment_id=80" rel="attachment wp-att-80"><img class="size-medium wp-image-80 alignleft" alt="EL NINO PEZ  2" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/EL-NINO-PEZ-2-202x300.jpg" width="202" height="300" /></a> cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. Mais un drame familial va brusquement les séparer...\r\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer.\r\nEntre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.</p>\r\n&nbsp;', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'publish', 'closed', 'closed', '', 'el-nino-pez-realise-par-lucia-puenzo', '', '', '2013-01-21 15:43:22', '2013-01-21 14:43:22', '', 0, 'http://localhost/~blee/LGBT/?p=29', 0, 'post', '', 0),
(30, 1, '2013-01-14 16:20:22', '2013-01-14 15:20:22', 'Argentine - 2008 - 01h36 - VOSTF\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\nDans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser\ns’exprimer sans contrainte leur désir fusionnel. Mais un\ndrame familial va brusquement les séparer...\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi\nd’adapter elle-même son propre roman écrit huit ans\nauparavant où deux jeunes femmes aux physiques opposés et\nde classes sociales différentes vont se rencontrer et s’aimer.\nEntre chronique sociale, onirisme et thriller, la cinéaste nous\nentraîne dans un Thelma et Louise lesbien à travers une\nArgentine inconnue et troublante.', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '29-revision', '', '', '2013-01-14 16:20:22', '2013-01-14 15:20:22', '', 29, 'http://localhost/~blee/LGBT/29-revision/', 0, 'revision', '', 0),
(31, 1, '2013-01-14 16:22:02', '2013-01-14 15:22:02', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\r\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\r\nAlors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide.\r\nEt pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes.\r\nCe premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises.\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)\r\n\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=82" rel="attachment wp-att-82"><img class="size-medium wp-image-82 aligncenter" alt="I_cant_think_straight_001" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/I_cant_think_straight_001-300x200.jpg" width="467" height="200" /></a>', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'publish', 'closed', 'closed', '', 'cant-think-straight-realise-par-shamim-sarif', '', '', '2013-01-21 15:43:14', '2013-01-21 14:43:14', '', 0, 'http://localhost/~blee/LGBT/?p=31', 0, 'post', '', 0),
(32, 1, '2013-01-14 16:21:09', '2013-01-14 15:21:09', '', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '31-revision', '', '', '2013-01-14 16:21:09', '2013-01-14 15:21:09', '', 31, 'http://localhost/~blee/LGBT/31-revision/', 0, 'revision', '', 0),
(33, 1, '2013-01-14 16:22:13', '2013-01-14 15:22:13', '', 'infos pratiques', '', 'trash', 'open', 'open', '', 'infos-pratiques', '', '', '2013-01-14 16:24:58', '2013-01-14 15:24:58', '', 0, 'http://localhost/~blee/LGBT/?p=33', 0, 'post', '', 0),
(34, 1, '2013-01-14 15:00:56', '2013-01-14 15:00:56', 'Voici un exemple de page. Elle est différente d&rsquo;un article de blog, en cela qu''elle restera à la même place, et s''affichera dans le menu de navigation de votre site (en fonction de votre thème). La plupart des gens commencent par écrire une page « À Propos » qui les présente aux visiteurs potentiels du site. Vous pourriez y écrire quelque chose de ce tenant :\n\n<blockquote>Bonjour ! Je suis un mécanicien qui aspire à devenir un acteur, et voici mon blog. J''habite à Bordeaux, j''ai un super chien baptisé Russell, et j''aime la vodka-ananas (ainsi que regarder la pluie tomber).</blockquote>\n\n...ou bien quelque chose comme ça :\n\n<blockquote>La société 123 Machin Truc a été créée en 1971, et n''a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules super pour la communauté bouzemontoise.</blockquote>\n\nÉtant donné que vous êtes un nouvel utilisateur de WordPress, vous devriez vous rendre sur votre <a href="http://localhost/~blee/LGBT/wp-admin/">tableau de bord</a> pour effacer la présente page, et créer de nouvelles pages avec votre propre contenu. Amusez-vous bien&nbsp;!', 'Page d&rsquo;exemple', '', 'inherit', 'open', 'open', '', '2-revision', '', '', '2013-01-14 15:00:56', '2013-01-14 15:00:56', '', 2, 'http://localhost/~blee/LGBT/2-revision/', 0, 'revision', '', 0),
(35, 1, '2013-01-14 16:23:57', '2013-01-14 15:23:57', 'Hello Wolrd', 'Films', '', 'trash', 'open', 'open', '', 'films', '', '', '2013-01-14 16:45:25', '2013-01-14 15:45:25', '', 0, 'http://localhost/~blee/LGBT/?page_id=35', 0, 'page', '', 0),
(36, 1, '2013-01-14 16:23:34', '2013-01-14 15:23:34', '', 'Films', '', 'inherit', 'open', 'open', '', '35-revision', '', '', '2013-01-14 16:23:34', '2013-01-14 15:23:34', '', 35, 'http://localhost/~blee/LGBT/35-revision/', 0, 'revision', '', 0),
(37, 1, '2013-01-14 16:24:11', '2013-01-14 15:24:11', 'hello', 'courts-metrages', '', 'trash', 'open', 'open', '', 'courts-metrages', '', '', '2013-01-14 16:45:24', '2013-01-14 15:45:24', '', 0, 'http://localhost/~blee/LGBT/?page_id=37', 0, 'page', '', 0),
(38, 1, '2013-01-14 16:22:13', '2013-01-14 15:22:13', '', 'infos pratiques', '', 'inherit', 'open', 'open', '', '33-revision', '', '', '2013-01-14 16:22:13', '2013-01-14 15:22:13', '', 33, 'http://localhost/~blee/LGBT/33-revision/', 0, 'revision', '', 0),
(39, 1, '2013-01-14 16:28:10', '0000-00-00 00:00:00', '<p>Catégorie des films long métrages du festival LGBT</p>\n', '', '', 'draft', 'open', 'open', '', '', '', '', '2013-01-14 16:28:10', '0000-00-00 00:00:00', '', 0, 'http://localhost/~blee/LGBT/?p=39', 1, 'nav_menu_item', '', 0),
(43, 1, '2013-01-14 16:24:11', '2013-01-14 15:24:11', '', 'Courts-métrages', '', 'inherit', 'open', 'open', '', '37-revision', '', '', '2013-01-14 16:24:11', '2013-01-14 15:24:11', '', 37, 'http://localhost/~blee/LGBT/37-revision/', 0, 'revision', '', 0),
(46, 1, '2013-01-14 16:33:53', '2013-01-14 15:33:53', 'Hello Wolrd', 'Films', '', 'inherit', 'open', 'open', '', '35-autosave', '', '', '2013-01-14 16:33:53', '2013-01-14 15:33:53', '', 35, 'http://localhost/~blee/LGBT/35-autosave/', 0, 'revision', '', 0),
(47, 1, '2013-01-14 16:23:57', '2013-01-14 15:23:57', '', 'Films', '', 'inherit', 'open', 'open', '', '35-revision-2', '', '', '2013-01-14 16:23:57', '2013-01-14 15:23:57', '', 35, 'http://localhost/~blee/LGBT/35-revision-2/', 0, 'revision', '', 0),
(49, 1, '2013-01-14 16:30:42', '2013-01-14 15:30:42', 'hello', 'courts-metrages', '', 'inherit', 'open', 'open', '', '37-revision-2', '', '', '2013-01-14 16:30:42', '2013-01-14 15:30:42', '', 37, 'http://localhost/~blee/LGBT/37-revision-2/', 0, 'revision', '', 0),
(50, 1, '2013-01-14 16:38:03', '2013-01-14 15:38:03', 'hello', 'courts-metrages', '', 'inherit', 'open', 'open', '', '37-autosave', '', '', '2013-01-14 16:38:03', '2013-01-14 15:38:03', '', 37, 'http://localhost/~blee/LGBT/37-autosave/', 0, 'revision', '', 0),
(51, 1, '2013-01-14 16:37:48', '2013-01-14 15:37:48', 'hello', 'courts-metrages', '', 'inherit', 'open', 'open', '', '37-revision-3', '', '', '2013-01-14 16:37:48', '2013-01-14 15:37:48', '', 37, 'http://localhost/~blee/LGBT/37-revision-3/', 0, 'revision', '', 0),
(54, 1, '2013-01-14 16:38:06', '2013-01-14 15:38:06', 'hello', 'courts-metrages', '', 'inherit', 'open', 'open', '', '37-revision-4', '', '', '2013-01-14 16:38:06', '2013-01-14 15:38:06', '', 37, 'http://localhost/~blee/LGBT/?p=54', 0, 'revision', '', 0),
(55, 1, '2013-01-14 16:33:51', '2013-01-14 15:33:51', 'Hello Wolrd', 'Films', '', 'inherit', 'open', 'open', '', '35-revision-3', '', '', '2013-01-14 16:33:51', '2013-01-14 15:33:51', '', 35, 'http://localhost/~blee/LGBT/?p=55', 0, 'revision', '', 0),
(62, 1, '2013-01-15 10:23:43', '2013-01-15 09:23:43', '<div>\r\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\r\n\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\n\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\n\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\n\r\nChristel Guillard, coordinatrice générale.\r\n\r\n</div>', 'Édito', '', 'publish', 'closed', 'closed', '', 'edito', '', '', '2013-01-28 16:29:18', '2013-01-28 15:29:18', '', 0, 'http://localhost/~blee/LGBT/?page_id=62', 0, 'page', '', 0),
(63, 1, '2013-01-15 10:23:20', '2013-01-15 09:23:20', '', 'É', '', 'inherit', 'open', 'open', '', '62-revision', '', '', '2013-01-15 10:23:20', '2013-01-15 09:23:20', '', 62, 'http://localhost/~blee/LGBT/?p=63', 0, 'revision', '', 0),
(64, 1, '2013-01-14 16:08:23', '2013-01-14 15:08:23', '<p style="text-align: justify;">Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.</p>\r\n<p style="text-align: justify;">Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n<p style="text-align: jus;">En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.</p>\r\n<p style="text-align: left;">Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !</p>\r\n<p style="text-align: left;">Christel Guillard, coordinatrice générale.</p>', 'Édito', '', 'inherit', 'open', 'open', '', '5-revision-2', '', '', '2013-01-14 16:08:23', '2013-01-14 15:08:23', '', 5, 'http://localhost/~blee/LGBT/?p=64', 0, 'revision', '', 0),
(65, 1, '2013-01-15 10:23:43', '2013-01-15 09:23:43', '<div>\r\n\r\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\r\n\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\n\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\n\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\n\r\nChristel Guillard, coordinatrice générale.\r\n\r\n</div>', 'Édito', '', 'inherit', 'open', 'open', '', '62-revision-2', '', '', '2013-01-15 10:23:43', '2013-01-15 09:23:43', '', 62, 'http://localhost/~blee/LGBT/?p=65', 0, 'revision', '', 0),
(66, 1, '2013-01-28 15:52:42', '2013-01-28 14:52:42', '<div>\n<ul class="slideshow">\n<li><img src="wp-content/uploads/2013/01/EN_COLOricco-1024x670.jpg" alt="En Coloricco"></li>\n<li><img src="wp-content/uploads/2013/01/I_cant_think_straight_001-1024x682.jpg" alt="I cant think straight"></li>\n<li><img src="3.jpg" alt=""></li>\n</ul>\n\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\n\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\n\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\n\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\nBon festival !\n\nChristel Guillard, coordinatrice générale.\n\n</div>', 'Édito', '', 'inherit', 'open', 'open', '', '62-autosave', '', '', '2013-01-28 15:52:42', '2013-01-28 14:52:42', '', 62, 'http://localhost/~blee/LGBT/?p=66', 0, 'revision', '', 0),
(67, 1, '2013-01-15 10:26:47', '2013-01-15 09:26:47', ' ', '', '', 'publish', 'open', 'closed', '', '67', '', '', '2013-01-21 16:52:25', '2013-01-21 15:52:25', '', 0, 'http://localhost/~blee/LGBT/?p=67', 1, 'nav_menu_item', '', 0),
(68, 1, '2013-01-15 10:27:59', '2013-01-15 09:27:59', 'Catégorie des films courts métrages du festival LGBT', '', '', 'publish', 'open', 'closed', '', '68', '', '', '2013-01-21 16:52:25', '2013-01-21 15:52:25', '', 0, 'http://localhost/~blee/LGBT/?p=68', 2, 'nav_menu_item', '', 0),
(69, 1, '2013-01-15 10:27:59', '2013-01-15 09:27:59', 'Catégorie des films long métrages du festival LGBT', '', '', 'publish', 'open', 'closed', '', '69', '', '', '2013-01-21 16:52:25', '2013-01-21 15:52:25', '', 0, 'http://localhost/~blee/LGBT/?p=69', 3, 'nav_menu_item', '', 0),
(73, 1, '2013-01-15 10:24:43', '2013-01-15 09:24:43', '<div>\r\n\r\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\r\n\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\n\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\n\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\n\r\nChristel Guillard, coordinatrice générale.\r\n\r\n</div>', 'Édito', '', 'inherit', 'open', 'open', '', '62-revision-3', '', '', '2013-01-15 10:24:43', '2013-01-15 09:24:43', '', 62, 'http://localhost/~blee/LGBT/?p=73', 0, 'revision', '', 0),
(75, 1, '2013-01-15 10:30:26', '2013-01-15 09:30:26', '', 'American boy', '', 'inherit', 'open', 'open', '', 'american-boy', '', '', '2013-01-15 10:30:26', '2013-01-15 09:30:26', '', 21, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/American-boy.png', 0, 'attachment', 'image/png', 0),
(76, 1, '2013-01-15 10:30:27', '2013-01-15 09:30:27', '', 'ANDER1', '', 'inherit', 'open', 'open', '', 'ander1', '', '', '2013-01-15 10:30:27', '2013-01-15 09:30:27', '', 0, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/ANDER1.jpg', 0, 'attachment', 'image/jpeg', 0),
(78, 1, '2013-01-15 10:30:28', '2013-01-15 09:30:28', '', 'COWBOY FOREVER', '', 'inherit', 'open', 'open', '', 'cowboy-forever', '', '', '2013-01-15 10:30:28', '2013-01-15 09:30:28', '', 19, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/COWBOY-FOREVER.jpg', 0, 'attachment', 'image/jpeg', 0),
(79, 1, '2013-01-15 10:30:29', '2013-01-15 09:30:29', '', 'EL NINO PEZ 1', '', 'inherit', 'open', 'open', '', 'el-nino-pez-1', '', '', '2013-01-15 10:30:29', '2013-01-15 09:30:29', '', 0, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/EL-NINO-PEZ-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(81, 1, '2013-01-15 10:30:32', '2013-01-15 09:30:32', '', 'EN_COLOricco', '', 'inherit', 'open', 'open', '', 'en_coloricco', '', '', '2013-01-15 10:30:32', '2013-01-15 09:30:32', '', 0, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/EN_COLOricco.jpg', 0, 'attachment', 'image/jpeg', 0),
(82, 1, '2013-01-15 10:30:33', '2013-01-15 09:30:33', '', 'I_cant_think_straight_001', '', 'inherit', 'open', 'open', '', 'i_cant_think_straight_001', '', '', '2013-01-15 10:30:33', '2013-01-15 09:30:33', '', 31, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/I_cant_think_straight_001.jpg', 0, 'attachment', 'image/jpeg', 0),
(84, 1, '2013-01-15 10:30:34', '2013-01-15 09:30:34', '', 'Odile', '', 'inherit', 'open', 'open', '', 'odile', '', '', '2013-01-15 10:30:34', '2013-01-15 09:30:34', '', 0, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/Odile-.jpg', 0, 'attachment', 'image/jpeg', 0),
(85, 1, '2013-01-15 10:30:35', '2013-01-15 09:30:35', '', 'OMAR_', '', 'inherit', 'open', 'open', '', 'omar_', '', '', '2013-01-15 10:30:35', '2013-01-15 09:30:35', '', 14, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/OMAR_.jpg', 0, 'attachment', 'image/jpeg', 0),
(86, 1, '2013-01-15 10:30:36', '2013-01-15 09:30:36', '', 'PAULINE_1', '', 'inherit', 'open', 'open', '', 'pauline_1', '', '', '2013-01-15 10:30:36', '2013-01-15 09:30:36', '', 10, 'http://localhost/~blee/LGBT/wp-content/uploads/2013/01/PAULINE_1.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(87, 1, '2013-01-15 10:32:52', '2013-01-15 09:32:52', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\nAlors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide.\nEt pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes.\nCe premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises.\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)\n\n<a href="http://localhost/~blee/LGBT/?attachment_id=82" rel="attachment wp-att-82"><img class="alignnone size-medium wp-image-82" alt="I_cant_think_straight_001" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/I_cant_think_straight_001-300x200.jpg" ALIGwidth="300" height="200" /></a>', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '31-autosave', '', '', '2013-01-15 10:32:52', '2013-01-15 09:32:52', '', 31, 'http://localhost/~blee/LGBT/?p=87', 0, 'revision', '', 0),
(88, 1, '2013-01-14 16:22:02', '2013-01-14 15:22:02', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\r\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\r\nAlors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide.\r\nEt pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes.\r\nCe premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises.\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'open', 'open', '', '31-revision-2', '', '', '2013-01-14 16:22:02', '2013-01-14 15:22:02', '', 31, 'http://localhost/~blee/LGBT/?p=88', 0, 'revision', '', 0),
(89, 1, '2013-01-14 16:20:58', '2013-01-14 15:20:58', 'Argentine - 2008 - 01h36 - VOSTF\r\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\r\nDans la banlieue cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. Mais un drame familial va brusquement les séparer...\r\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer.\r\nEntre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '29-revision-2', '', '', '2013-01-14 16:20:58', '2013-01-14 15:20:58', '', 29, 'http://localhost/~blee/LGBT/?p=89', 0, 'revision', '', 0),
(90, 1, '2013-01-15 10:36:08', '2013-01-15 09:36:08', 'Espagne - 2009 - 02h08 - VOSTF\nInterprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine<a href="http://localhost/~blee/LGBT/?attachment_id=77" rel="attachment wp-att-77"><img class="size-medium wp-image-77 alignright" alt="ANDER2" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/ANDER2-300x168.jpg" width="300" height="168" /></a> passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien.\nLe nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\nConsidéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse\nle temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer...\nCe premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\nPrix C.I.C.A.E – Festival International de Berlin (2009)\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\nGrand prix du jury – Festival Cinehorizontes (2009)\n\n&nbsp;', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '27-autosave', '', '', '2013-01-15 10:36:08', '2013-01-15 09:36:08', '', 27, 'http://localhost/~blee/LGBT/?p=90', 0, 'revision', '', 0),
(91, 1, '2013-01-14 16:19:17', '2013-01-14 15:19:17', 'Espagne - 2009 - 02h08 - VOSTF\r\nInterprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive\r\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien.\r\nLe nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse\r\nle temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer...\r\nCe premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\nPrix C.I.C.A.E – Festival International de Berlin (2009)\r\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\r\nGrand prix du jury – Festival Cinehorizontes (2009)', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '27-revision-2', '', '', '2013-01-14 16:19:17', '2013-01-14 15:19:17', '', 27, 'http://localhost/~blee/LGBT/?p=91', 0, 'revision', '', 0),
(92, 1, '2013-01-15 10:34:50', '2013-01-15 09:34:50', 'Argentine - 2008 - 01h36 - VOSTF\r\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\r\nDans la banlieue<a href="http://localhost/~blee/LGBT/?attachment_id=80" rel="attachment wp-att-80"><img class="size-medium wp-image-80 alignleft" alt="EL NINO PEZ  2" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/EL-NINO-PEZ-2-202x300.jpg" width="202" height="300" /></a> cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. Mais un drame familial va brusquement les séparer...\r\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer.\r\nEntre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.\r\n\r\n&nbsp;', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'open', 'open', '', '29-revision-3', '', '', '2013-01-15 10:34:50', '2013-01-15 09:34:50', '', 29, 'http://localhost/~blee/LGBT/?p=92', 0, 'revision', '', 0),
(93, 1, '2013-01-15 10:36:22', '2013-01-15 09:36:22', '<p style="text-align: justify;">Espagne - 2009 - 02h08 - VOSTF\r\nInterprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive\r\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine<a href="http://localhost/~blee/LGBT/?attachment_id=77" rel="attachment wp-att-77"><img class="size-medium wp-image-77 alignright" alt="ANDER2" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/ANDER2-300x168.jpg" width="300" height="168" /></a> passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien.\r\nLe nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto Castón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse\r\nle temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer...\r\nCe premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\nPrix C.I.C.A.E – Festival International de Berlin (2009)\r\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\r\nGrand prix du jury – Festival Cinehorizontes (2009)</p>\r\n<p style="text-align: left;"></p>', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'open', 'open', '', '27-revision-3', '', '', '2013-01-15 10:36:22', '2013-01-15 09:36:22', '', 27, 'http://localhost/~blee/LGBT/?p=93', 0, 'revision', '', 0),
(94, 1, '2013-01-15 10:39:11', '2013-01-15 09:39:11', '<p style="text-align: justify;">(C’est élémentaire - Parler de l’homosexualité à l’école)\nEtats-Unis - 1996 - Documentaire\nDurée 01h20 - Réalisation : Debra Chasnoff\nPremier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques américaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix. Un excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation.\nCe film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé.\nLa projection sera suivie d’un débat avec l’association G.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.</p>\n<a href="http://localhost/~blee/LGBT/?attachment_id=74" rel="attachment wp-att-74"><img class="size-medium wp-image-74 aligncenter" alt="37_it_s_still_elementary" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/37_it_s_still_elementary-300x171.jpg" width="418" height="332" /></a>', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '23-autosave', '', '', '2013-01-15 10:39:11', '2013-01-15 09:39:11', '', 23, 'http://localhost/~blee/LGBT/?p=94', 0, 'revision', '', 0),
(95, 1, '2013-01-14 16:17:46', '2013-01-14 15:17:46', '(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nEtats-Unis - 1996 - Documentaire\r\nDurée 01h20 - Réalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques américaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix. Un excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association G.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'open', 'open', '', '23-revision-3', '', '', '2013-01-14 16:17:46', '2013-01-14 15:17:46', '', 23, 'http://localhost/~blee/LGBT/?p=95', 0, 'revision', '', 0),
(96, 1, '2013-01-15 10:40:34', '2013-01-15 09:40:34', '<p style="text-align: left;">2008 - 4 minutes\nComment jouer du genre en chanson ? Projection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat &amp; Scène.</p>', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '21-autosave', '', '', '2013-01-15 10:40:34', '2013-01-15 09:40:34', '', 21, 'http://localhost/~blee/LGBT/?p=96', 0, 'revision', '', 0),
(97, 1, '2013-01-14 16:15:36', '2013-01-14 15:15:36', '2008 - 4 minutes\r\nComment jouer du genre en chanson ? Projection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat &amp; Scène.', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '21-revision-2', '', '', '2013-01-14 16:15:36', '2013-01-14 15:15:36', '', 21, 'http://localhost/~blee/LGBT/?p=97', 0, 'revision', '', 0),
(98, 1, '2013-01-15 10:40:52', '2013-01-15 09:40:52', '<p style="text-align: justify;">2008 - 4 minutes\r\nComment jouer du genre en chanson ? Projection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat &amp; Scène.</p>', 'American Boy - Patricia & Colette - France', '', 'inherit', 'open', 'open', '', '21-revision-3', '', '', '2013-01-15 10:40:52', '2013-01-15 09:40:52', '', 21, 'http://localhost/~blee/LGBT/?p=98', 0, 'revision', '', 0),
(99, 1, '2013-01-14 16:15:04', '2013-01-14 15:15:04', '2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des cowboys latinos, les héros de Cowboy Forever revendiquent leur homosexualité et manient à merveille le lasso, et pas seulement pour attraper le bétail...', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '19-revision-2', '', '', '2013-01-14 16:15:04', '2013-01-14 15:15:04', '', 19, 'http://localhost/~blee/LGBT/?p=99', 0, 'revision', '', 0),
(100, 1, '2013-01-15 10:41:44', '2013-01-15 09:41:44', '<p style="text-align: justify;">2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des cowboys latinos, les héros de Cowboy Forever revendiquent leur homosexualité et manient à merveille le lasso, et pas seulement pour attraper le bétail...</p>', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'open', 'open', '', '19-revision-3', '', '', '2013-01-15 10:41:44', '2013-01-15 09:41:44', '', 19, 'http://localhost/~blee/LGBT/?p=100', 0, 'revision', '', 0),
(101, 1, '2013-01-14 16:14:27', '2013-01-14 15:14:27', '17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche vers la veillée funèbre pour revendiquer l’identité construite de la défunte.', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '16-revision-3', '', '', '2013-01-14 16:14:27', '2013-01-14 15:14:27', '', 16, 'http://localhost/~blee/LGBT/?p=101', 0, 'revision', '', 0),
(102, 1, '2013-01-15 10:42:27', '2013-01-15 09:42:27', '<p style="text-align: justify;">17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche vers la veillée funèbre pour revendiquer l’identité construite de la défunte.</p>', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'open', 'open', '', '16-revision-4', '', '', '2013-01-15 10:42:27', '2013-01-15 09:42:27', '', 16, 'http://localhost/~blee/LGBT/?p=102', 0, 'revision', '', 0),
(103, 1, '2013-01-14 16:13:10', '2013-01-14 15:13:10', 'C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui l’aime mais où la pression est telle qu’il ne peut vraiment assouvir, ni même révéler, son amour pour Arthur. Jusqu’au jour où les deux jeunes hommes sont découverts.', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'open', 'open', '', '14-revision-2', '', '', '2013-01-14 16:13:10', '2013-01-14 15:13:10', '', 14, 'http://localhost/~blee/LGBT/?p=103', 0, 'revision', '', 0),
(104, 1, '2013-01-14 16:12:28', '2013-01-14 15:12:28', '7 minutes 13\r\nC’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans  une petite ville de province où tout le monde se connaît, la révélation publique et infamante de son  homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur.  Comme une confidence.', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '12-revision-2', '', '', '2013-01-14 16:12:28', '2013-01-14 15:12:28', '', 12, 'http://localhost/~blee/LGBT/?p=104', 0, 'revision', '', 0),
(105, 1, '2013-01-15 10:44:28', '2013-01-15 09:44:28', '<p style="text-align: justify;">7 minutes 13\r\nC’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans  une petite ville de province où tout le monde se connaît, la révélation publique et infamante de son  homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur.  Comme une confidence.</p>', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'open', 'open', '', '12-revision-3', '', '', '2013-01-15 10:44:28', '2013-01-15 09:44:28', '', 12, 'http://localhost/~blee/LGBT/?p=105', 0, 'revision', '', 0),
(106, 1, '2013-01-14 16:11:40', '2013-01-14 15:11:40', '2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont  pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi. A partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle  homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais  surtout le faire réfléchir.', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '10-revision-2', '', '', '2013-01-14 16:11:40', '2013-01-14 15:11:40', '', 10, 'http://localhost/~blee/LGBT/?p=106', 0, 'revision', '', 0),
(107, 1, '2013-01-15 10:45:07', '2013-01-15 09:45:07', '<p style="text-align: justify;">2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont  pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi. A partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle  homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais  surtout le faire réfléchir.</p>', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'open', 'open', '', '10-revision-3', '', '', '2013-01-15 10:45:07', '2013-01-15 09:45:07', '', 10, 'http://localhost/~blee/LGBT/?p=107', 0, 'revision', '', 0),
(108, 1, '2013-01-14 16:10:22', '2013-01-14 15:10:22', 'Les 3 premiers courts métrages de cette séance font partie des 5 lauréats du concours Jeune et homo sous le regard des autres, dont les scenarii ont été écrits par des jeunes et mis en scène par des réalisateurs. Cette opération contre l’homophobie, a été organisée en 2009 par le Ministère de la Santé, de la Jeunesse, des Sports et de la Vie associative et de l’INPES avec le soutien du groupe Canal+.', 'Intro', '', 'inherit', 'open', 'open', '', '8-revision-2', '', '', '2013-01-14 16:10:22', '2013-01-14 15:10:22', '', 8, 'http://localhost/~blee/LGBT/?p=108', 0, 'revision', '', 0),
(109, 1, '2013-01-15 10:49:05', '2013-01-15 09:49:05', '<ul>\r\n	<li>Région Centre</li>\r\n	<li>Orléans</li>\r\n	<li>Cinéma des Carmes</li>\r\n	<li>GAGL</li>\r\n	<li>Têtu</li>\r\n	<li>La dixième MUSE</li>\r\n	<li>CiteGay</li>\r\n	<li>Yagg.com</li>\r\n	<li>France Bleu</li>\r\n</ul>', 'Partenaires', '', 'publish', 'closed', 'closed', '', 'partenaires', '', '', '2013-01-21 15:42:49', '2013-01-21 14:42:49', '', 0, 'http://localhost/~blee/LGBT/?page_id=109', 0, 'page', '', 0),
(110, 1, '2013-01-15 10:49:01', '2013-01-15 09:49:01', '- Région Centre\n- Orléans\n- Cinéma des Carmes\n- GAGL\n- Têtu\n- La dixième MUSE\n- CiteGay\n- Yagg.com\n- France Bleu', 'Partenaires', '', 'inherit', 'open', 'open', '', '109-revision', '', '', '2013-01-15 10:49:01', '2013-01-15 09:49:01', '', 109, 'http://localhost/~blee/LGBT/?p=110', 0, 'revision', '', 0),
(111, 1, '2013-01-15 10:49:05', '2013-01-15 09:49:05', '- Région Centre\r\n- Orléans\r\n- Cinéma des Carmes\r\n- GAGL\r\n- Têtu\r\n- La dixième MUSE\r\n- CiteGay\r\n- Yagg.com\r\n- France Bleu', 'Partenaires', '', 'inherit', 'open', 'open', '', '109-revision-2', '', '', '2013-01-15 10:49:05', '2013-01-15 09:49:05', '', 109, 'http://localhost/~blee/LGBT/?p=111', 0, 'revision', '', 0),
(112, 1, '2013-01-15 10:49:56', '2013-01-15 09:49:56', '<ul>\r\n	<li>Région Centre</li>\r\n	<li>Orléans</li>\r\n	<li>Cinéma des Carmes</li>\r\n	<li>GAGL</li>\r\n	<li>Têtu</li>\r\n	<li>La dixième MUSE</li>\r\n	<li>CiteGay</li>\r\n	<li>Yagg.com</li>\r\n	<li>France Bleu</li>\r\n</ul>', 'Partenaires', '', 'inherit', 'open', 'open', '', '109-revision-3', '', '', '2013-01-15 10:49:56', '2013-01-15 09:49:56', '', 109, 'http://localhost/~blee/LGBT/?p=112', 0, 'revision', '', 0),
(113, 1, '2013-01-15 10:51:20', '2013-01-15 09:51:20', '<ul>\n	<li>Région Centre</li>\n	<li>Orléans</li>\n	<li>Cinéma des Carmes</li>\n	<li>GAGL</li>\n	<li>Têtu</li>\n	<li>La dixième MUSE</li>\n	<li>CiteGay</li>\n	<li>Yagg.com</li>\n	<li>France Bleu</li>\n</ul>', 'Partenaires', '', 'inherit', 'open', 'open', '', '109-autosave', '', '', '2013-01-15 10:51:20', '2013-01-15 09:51:20', '', 109, 'http://localhost/~blee/LGBT/?p=113', 0, 'revision', '', 0),
(114, 1, '2013-01-15 10:52:32', '0000-00-00 00:00:00', '<p>Retrouvez tous les partenaires du festival LGBT</p>\n', '', '', 'draft', 'open', 'open', '', '', '', '', '2013-01-15 10:52:32', '0000-00-00 00:00:00', '', 0, 'http://localhost/~blee/LGBT/?p=114', 1, 'nav_menu_item', '', 0),
(115, 1, '2013-01-15 10:53:12', '2013-01-15 09:53:12', ' ', '', '', 'publish', 'open', 'closed', '', '115', '', '', '2013-01-21 16:52:26', '2013-01-21 15:52:26', '', 0, 'http://localhost/~blee/LGBT/?p=115', 5, 'nav_menu_item', '', 0),
(117, 1, '2013-01-15 10:54:21', '2013-01-15 09:54:21', '<ul>\r\n	<li>La Région Centre</li>\r\n	<li>La Mairie d''Orléans</li>\r\n	<li>Le cinéma des Carmes</li>\r\n	<li>Le Groupe Action Gay &amp; Lesbien - Loiret</li>\r\n	<li>Citégay</li>\r\n	<li>La dixième Muse</li>\r\n	<li>Têtu</li>\r\n	<li>Yagg.com</li>\r\n	<li>France Bleu Orléans</li>\r\n	<li>Bagdam Espace Lesbien ( Toulouse )</li>\r\n	<li>Cineffable</li>\r\n	<li>Le Festival Tous Courts ( Aix en Provence )</li>\r\n	<li>Les VidéObstinées</li>\r\n</ul>\r\n&nbsp;', 'Remerciements', '', 'publish', 'closed', 'closed', '', 'remerciements', '', '', '2013-01-21 15:42:56', '2013-01-21 14:42:56', '', 0, 'http://localhost/~blee/LGBT/?page_id=117', 0, 'page', '', 0),
(118, 1, '2013-01-15 10:53:50', '2013-01-15 09:53:50', '', 'Remerciements', '', 'inherit', 'open', 'open', '', '117-revision', '', '', '2013-01-15 10:53:50', '2013-01-15 09:53:50', '', 117, 'http://localhost/~blee/LGBT/?p=118', 0, 'revision', '', 0),
(119, 1, '2013-01-15 10:54:49', '2013-01-15 09:54:49', ' ', '', '', 'publish', 'open', 'closed', '', '119', '', '', '2013-01-21 16:52:26', '2013-01-21 15:52:26', '', 0, 'http://localhost/~blee/LGBT/?p=119', 6, 'nav_menu_item', '', 0),
(120, 1, '2013-01-15 10:55:33', '2013-01-15 09:55:33', '<p style="text-align: justify;">Lieu du festival : Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS\r\nTarifs : Plein tarif : 7,50 €\r\nPass Festival : 25 € (5 séances)\r\nSoirée courts métrages : 6 € (vendredi)\r\n2 séances consécutives le samedi ou le dimanche : 12 €<br/>\r\n\r\nCartes &amp; réductions acceptées :\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...<br/>\r\n\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.<br/>\r\n\r\nEquipe :\r\nDirection artistique : Christel Guillard (Présidente de Ciné Mundi)\r\nProgrammation : Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)\r\nCommunication &amp; partenariats : Christel Guillard\r\nConception graphique : Yannis Bellair\r\nConception du site internet : rccc\r\nImpression : Prevost Offset<br/>\r\n\r\nContacts :\r\nfestival.dunbordalautre@gmail.com\r\nwww.festivaldunbordalautre.com</p>', 'Infos pratiques', '', 'publish', 'closed', 'closed', '', 'infos-pratiques', '', '', '2013-01-21 15:42:39', '2013-01-21 14:42:39', '', 0, 'http://localhost/~blee/LGBT/?page_id=120', 0, 'page', '', 0),
(121, 1, '2013-01-15 10:55:19', '2013-01-15 09:55:19', '', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '120-revision', '', '', '2013-01-15 10:55:19', '2013-01-15 09:55:19', '', 120, 'http://localhost/~blee/LGBT/?p=121', 0, 'revision', '', 0),
(122, 1, '2013-01-15 10:56:14', '2013-01-15 09:56:14', ' ', '', '', 'publish', 'open', 'closed', '', '122', '', '', '2013-01-21 16:52:25', '2013-01-21 15:52:25', '', 0, 'http://localhost/~blee/LGBT/?p=122', 4, 'nav_menu_item', '', 0),
(123, 1, '2013-01-15 10:56:34', '2013-01-15 09:56:34', '<p style="text-align: justify;">Lieu du festival : Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS\nTarifs : Plein tarif : 7,50 €<br/>\nPass Festival : 25 € (5 séances)\nSoirée courts métrages : 6 € (vendredi)\n2 séances consécutives le samedi ou le dimanche : 12 €\nCartes &amp; réductions acceptées :\nCartes DECOUVERTE &amp; PASSION,\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\ntous continents.\nEquipe :\nDirection artistique : Christel Guillard (Présidente de Ciné Mundi)\nProgrammation : Christel Guillard en collaboration avec\nFrançoise Dahmane (Cinéma Les Carmes)\nCommunication &amp; partenariats : Christel Guillard\nConception graphique : Yannis Bellair\nConception du site internet : rccc\nImpression : Prevost Offset\nContacts :\nfestival.dunbordalautre@gmail.com\nwww.festivaldunbordalautre.com</p>', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '120-autosave', '', '', '2013-01-15 10:56:34', '2013-01-15 09:56:34', '', 120, 'http://localhost/~blee/LGBT/?p=123', 0, 'revision', '', 0),
(124, 1, '2013-01-15 10:55:33', '2013-01-15 09:55:33', '<p style="text-align: justify;">Lieu du festival : Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS\r\nTarifs : Plein tarif : 7,50 €\r\nPass Festival : 25 € (5 séances)\r\nSoirée courts métrages : 6 € (vendredi)\r\n2 séances consécutives le samedi ou le dimanche : 12 €\r\nCartes &amp; réductions acceptées :\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.\r\nEquipe :\r\nDirection artistique : Christel Guillard (Présidente de Ciné Mundi)\r\nProgrammation : Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)\r\nCommunication &amp; partenariats : Christel Guillard\r\nConception graphique : Yannis Bellair\r\nConception du site internet : rccc\r\nImpression : Prevost Offset\r\nContacts :\r\nfestival.dunbordalautre@gmail.com\r\nwww.festivaldunbordalautre.com</p>', 'Infos pratiques', '', 'inherit', 'open', 'open', '', '120-revision-2', '', '', '2013-01-15 10:55:33', '2013-01-15 09:55:33', '', 120, 'http://localhost/~blee/LGBT/?p=124', 0, 'revision', '', 0),
(125, 1, '2013-01-15 10:28:12', '2013-01-15 09:28:12', '<div>\r\n\r\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\r\n\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\n\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\n\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\n\r\nChristel Guillard, coordinatrice générale.\r\n\r\n</div>', 'Édito', '', 'inherit', 'closed', 'closed', '', '62-revision-4', '', '', '2013-01-15 10:28:12', '2013-01-15 09:28:12', '', 62, 'http://localhost/~blee/LGBT/?p=125', 0, 'revision', '', 0),
(126, 1, '2013-01-15 10:57:30', '2013-01-15 09:57:30', '<p style="text-align: justify;">Lieu du festival : Cinéma Les Carmes – 7, rue des Carmes – 45000 ORLEANS\r\nTarifs : Plein tarif : 7,50 €\r\nPass Festival : 25 € (5 séances)\r\nSoirée courts métrages : 6 € (vendredi)\r\n2 séances consécutives le samedi ou le dimanche : 12 €<br/>\r\n\r\nCartes &amp; réductions acceptées :\r\nCartes DECOUVERTE &amp; PASSION,\r\ntitulaire du PAC étudiant &amp; de la JPASS, tarif – de 26 ans...<br/>\r\n\r\nLe festival D’un bord à l’autre est organisé par Ciné Mundi.\r\nAssociation dont l’objectif est de soutenir et de promouvoir le cinéma indépendant en organisant\r\ndes projections de films, des festivals et autres actions culturelles liées au cinéma d’auteur de\r\ntous continents.<br/>\r\n\r\nEquipe :\r\nDirection artistique : Christel Guillard (Présidente de Ciné Mundi)\r\nProgrammation : Christel Guillard en collaboration avec\r\nFrançoise Dahmane (Cinéma Les Carmes)\r\nCommunication &amp; partenariats : Christel Guillard\r\nConception graphique : Yannis Bellair\r\nConception du site internet : rccc\r\nImpression : Prevost Offset<br/>\r\n\r\nContacts :\r\nfestival.dunbordalautre@gmail.com\r\nwww.festivaldunbordalautre.com</p>', 'Infos pratiques', '', 'inherit', 'closed', 'closed', '', '120-revision-3', '', '', '2013-01-15 10:57:30', '2013-01-15 09:57:30', '', 120, 'http://localhost/~blee/LGBT/?p=126', 0, 'revision', '', 0),
(127, 1, '2013-01-15 10:50:19', '2013-01-15 09:50:19', '<ul>\r\n	<li>Région Centre</li>\r\n	<li>Orléans</li>\r\n	<li>Cinéma des Carmes</li>\r\n	<li>GAGL</li>\r\n	<li>Têtu</li>\r\n	<li>La dixième MUSE</li>\r\n	<li>CiteGay</li>\r\n	<li>Yagg.com</li>\r\n	<li>France Bleu</li>\r\n</ul>', 'Partenaires', '', 'inherit', 'closed', 'closed', '', '109-revision-4', '', '', '2013-01-15 10:50:19', '2013-01-15 09:50:19', '', 109, 'http://localhost/~blee/LGBT/?p=127', 0, 'revision', '', 0),
(128, 1, '2013-01-15 10:54:21', '2013-01-15 09:54:21', '<ul>\r\n	<li>La Région Centre</li>\r\n	<li>La Mairie d''Orléans</li>\r\n	<li>Le cinéma des Carmes</li>\r\n	<li>Le Groupe Action Gay &amp; Lesbien - Loiret</li>\r\n	<li>Citégay</li>\r\n	<li>La dixième Muse</li>\r\n	<li>Têtu</li>\r\n	<li>Yagg.com</li>\r\n	<li>France Bleu Orléans</li>\r\n	<li>Bagdam Espace Lesbien ( Toulouse )</li>\r\n	<li>Cineffable</li>\r\n	<li>Le Festival Tous Courts ( Aix en Provence )</li>\r\n	<li>Les VidéObstinées</li>\r\n</ul>\r\n&nbsp;', 'Remerciements', '', 'inherit', 'closed', 'closed', '', '117-revision-2', '', '', '2013-01-15 10:54:21', '2013-01-15 09:54:21', '', 117, 'http://localhost/~blee/LGBT/?p=128', 0, 'revision', '', 0),
(129, 1, '2013-01-15 10:33:33', '2013-01-15 09:33:33', 'Grande Bretagne - 2007 - 01h20 - Comédie romantique - VOSTF\r\nInterprétation : Lisa Ray, Sheetal Sheth, Antonia Frering\r\nAlors qu’elle est sur le point de se marier, Tala, une jeune Palestinienne installée à Londres, tombe amoureuse de Leyla, une jeune Britannique d’origine indienne. Tout les oppose : Tala est chrétienne et affirmée, Leyla musulmane et timide.\r\nEt pourtant, les deux femmes succombent lors d’une nuit passionnée. Mais le poids des cultures, la pression familiale et le sens du devoir mettront à l’épreuve leur relation et les forceront à se découvrir elles-mêmes.\r\nCe premier long métrage de Shamim Sarif, portée par les deux talentueuses actrices (que l’on retrouve également dans son autre film The world unseen) est un pur joyau digne des comédies romantiques anglaises.\r\nMeilleur Film – Festival Gay et Lesbien de Gran Canaria (2009)\r\n\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=82" rel="attachment wp-att-82"><img class="size-medium wp-image-82 aligncenter" alt="I_cant_think_straight_001" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/I_cant_think_straight_001-300x200.jpg" width="467" height="200" /></a>', 'CAN’T THINK STRAIGHT - Réalisé par Shamim Sarif', '', 'inherit', 'closed', 'closed', '', '31-revision-3', '', '', '2013-01-15 10:33:33', '2013-01-15 09:33:33', '', 31, 'http://localhost/~blee/LGBT/?p=129', 0, 'revision', '', 0),
(130, 1, '2013-01-15 10:37:24', '2013-01-15 09:37:24', '<p style="text-align: justify;">Argentine - 2008 - 01h36 - VOSTF\r\nInterprétation : Inés Efron, Mariela Vitale, Pep Munne\r\nDans la banlieue<a href="http://localhost/~blee/LGBT/?attachment_id=80" rel="attachment wp-att-80"><img class="size-medium wp-image-80 alignleft" alt="EL NINO PEZ  2" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/EL-NINO-PEZ-2-202x300.jpg" width="202" height="300" /></a> cossue de Buenos Aires, Lala, fille d’un juge dépressif et d’une mère toxicomane, est follement amoureuse de Guayi, jeune et jolie domestique paraguayenne au service de la famille depuis l’âge de treize ans. Les deux jeunes filles projettent de s’enfuir dans le village d’origine de Guayi, au bord du lac Ypoà où elles pourraient vivre ensemble et laisser s’exprimer sans contrainte leur désir fusionnel. Mais un drame familial va brusquement les séparer...\r\nLucía Puenzo, à qui l’on doit le bouleversant XXY, a choisi d’adapter elle-même son propre roman écrit huit ans auparavant où deux jeunes femmes aux physiques opposés et de classes sociales différentes vont se rencontrer et s’aimer.\r\nEntre chronique sociale, onirisme et thriller, la cinéaste nous entraîne dans un Thelma et Louise lesbien à travers une Argentine inconnue et troublante.</p>\r\n&nbsp;', 'EL NIÑO PEZ - Réalisé par Lucía Puenzo', '', 'inherit', 'closed', 'closed', '', '29-revision-4', '', '', '2013-01-15 10:37:24', '2013-01-15 09:37:24', '', 29, 'http://localhost/~blee/LGBT/?p=130', 0, 'revision', '', 0),
(131, 1, '2013-01-15 10:38:03', '2013-01-15 09:38:03', '<p style="text-align: justify;">Espagne - 2009 - 02h08 - VOSTF\r\nInterprétation : Josean Bengoetxea, Eriz Alberdi, Christian Esquive\r\nAu fin fond du pays basque, Ander, paysan célibataire à la quarantaine passée, vit avec sa sœur Arantxa et leur mère âgée dans la ferme familiale. Alors qu’Arantxa doit bientôt se marier et laisser Ander s’occuper seul de leur mère, celui-ci se casse une jambe. Pour l’assister dans ses tâches, sa famille embauche José, un jeune travailleur saisonnier péruvien.\r\nLe nouveau venu va bientôt bouleverser les relations familiales et surtout troubler de plus en plus Ander...\r\nConsidéré comme le Brockback Mountain basque, Roberto C<a href="http://localhost/~blee/LGBT/?attachment_id=77" rel="attachment wp-att-77"><img class="size-medium wp-image-77 alignright" alt="ANDER2" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/ANDER2-300x168.jpg" width="300" height="168" /></a>astón met en scène cette histoire d’amour entre deux hommes vivant au contact de la nature d’une manière différente. Il laisse\r\nle temps à ses personnages de s’apprivoiser, de se découvrir, d’évoluer dans le rude paysage de la Biscaye qu’il prend aussi le temps de filmer...\r\nCe premier beau long métrage où la simplicité formelle côtoie la complexité des rapports humains d’une grande intensité, a remporté l’adhésion du public dans tous les festivals où il a été projeté.\r\nPrix C.I.C.A.E – Festival International de Berlin (2009)\r\nViolette d’or du meilleur film – Festival Cinespaña - Toulouse (2009)\r\nGrand prix du jury – Festival Cinehorizontes (2009)</p>\r\n<p style="text-align: left;"></p>', 'ANDER - Réalisé par Roberto Castón', '', 'inherit', 'closed', 'closed', '', '27-revision-4', '', '', '2013-01-15 10:38:03', '2013-01-15 09:38:03', '', 27, 'http://localhost/~blee/LGBT/?p=131', 0, 'revision', '', 0),
(132, 1, '2013-01-15 10:39:13', '2013-01-15 09:39:13', '<p style="text-align: justify;">(C’est élémentaire - Parler de l’homosexualité à l’école)\r\nEtats-Unis - 1996 - Documentaire\r\nDurée 01h20 - Réalisation : Debra Chasnoff\r\nPremier documentaire à traiter de l’homosexualité expliquée aux enfants dans les écoles publiques américaines, It’s elementary suit les interventions des enseignants dans les classes allant du primaire au lycée. Tourné en 1996, il a fait le tour des écoles américaines et a gagné de nombreux prix. Un excellent support didactique à montrer à tous les élèves et leurs professeurs lorsque l’on appartient au monde de l’éducation.\r\nCe film a subi aux Etats-Unis des attaques de la part de l’ultra-droite chrétienne intégriste et homophobe pour empêcher sa diffusion sur une chaîne télé.\r\nLa projection sera suivie d’un débat avec l’association G.A.G.L 45 qui organise depuis 2007 des Interventions en Milieu Scolaire dans le Loiret.</p>\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=74" rel="attachment wp-att-74"><img class="size-medium wp-image-74 aligncenter" alt="37_it_s_still_elementary" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/37_it_s_still_elementary-300x171.jpg" width="418" height="332" /></a>', 'It’s elementary, talking about gays issues in school', '', 'inherit', 'closed', 'closed', '', '23-revision-4', '', '', '2013-01-15 10:39:13', '2013-01-15 09:39:13', '', 23, 'http://localhost/~blee/LGBT/?p=132', 0, 'revision', '', 0),
(133, 1, '2013-01-15 10:41:09', '2013-01-15 09:41:09', '<p style="text-align: justify;">2008 - 4 minutes\r\nComment jouer du genre en chanson ? Projection suivie d’un débat avec un réalisateur. Un cocktail vous sera servi à l’issue de la soirée dans l’espace Délicat &amp; Scène.</p>\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=75" rel="attachment wp-att-75"><img class="size-medium wp-image-75 aligncenter" alt="American boy" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/American-boy-300x200.png" width="300" height="200" /></a>', 'American Boy - Patricia & Colette - France', '', 'inherit', 'closed', 'closed', '', '21-revision-4', '', '', '2013-01-15 10:41:09', '2013-01-15 09:41:09', '', 21, 'http://localhost/~blee/LGBT/?p=133', 0, 'revision', '', 0),
(134, 1, '2013-01-15 10:42:11', '2013-01-15 09:42:11', '<p style="text-align: justify;">2006 - 26 minutes\r\nAu cœur du Brésil, dans le monde machiste des cowboys latinos, les héros de Cowboy Forever revendiquent leur homosexualité et manient à merveille le lasso, et pas seulement pour attraper le bétail...</p>\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=78" rel="attachment wp-att-78"><img class="size-medium wp-image-78 aligncenter" alt="COWBOY FOREVER" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/COWBOY-FOREVER-300x200.jpg" width="300" height="200" /></a>', 'Cowboy Forever - Jean Baptiste Erreca - France', '', 'inherit', 'closed', 'closed', '', '19-revision-4', '', '', '2013-01-15 10:42:11', '2013-01-15 09:42:11', '', 19, 'http://localhost/~blee/LGBT/?p=134', 0, 'revision', '', 0),
(135, 1, '2013-01-15 10:43:27', '2013-01-15 09:43:27', '<p style="text-align: justify;">17 minutes - VOSTF\r\nLe corps d’un travesti décédé est préparé pour l’enterrement par d’autres travestis. Son corps de femme est amené à sa famille, qui décide de l’enterrer comme un homme. Une procession de travestis se met en marche vers la veillée funèbre pour revendiquer l’identité construite de la défunte.</p>\r\n<p style="text-align: justify;"></p>', 'Os sapatos de Aristeu - René Guerra Luiz - Brésil - 2008', '', 'inherit', 'closed', 'closed', '', '16-revision-5', '', '', '2013-01-15 10:43:27', '2013-01-15 09:43:27', '', 16, 'http://localhost/~blee/LGBT/?p=135', 0, 'revision', '', 0),
(136, 1, '2013-01-15 10:43:48', '2013-01-15 09:43:48', '<p style="text-align: left;">C’est l’histoire d’Omar qui vit dans une cité. Une cité qu’il aime et qui l’aime mais où la pression est telle qu’il ne peut vraiment assouvir, ni même révéler, son amour pour Arthur. Jusqu’au jour où les deux jeunes hommes sont découverts.</p>\r\n<p style="text-align: left;"><a href="http://localhost/~blee/LGBT/?attachment_id=85" rel="attachment wp-att-85"><img class="size-medium wp-image-85 aligncenter" alt="OMAR_" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/OMAR_-300x200.jpg" width="300" height="200" /></a></p>', 'Omar - Sébastien Gabriel - France - 2009 - 9 minutes', '', 'inherit', 'closed', 'closed', '', '14-revision-3', '', '', '2013-01-15 10:43:48', '2013-01-15 09:43:48', '', 14, 'http://localhost/~blee/LGBT/?p=136', 0, 'revision', '', 0),
(137, 1, '2013-01-15 10:44:46', '2013-01-15 09:44:46', '<p style="text-align: justify;">7 minutes 13\r\nC’est la mise en scène d’une jeune fille, qui se raconte face à la caméra : l’enfance joyeuse dans  une petite ville de province où tout le monde se connaît, la révélation publique et infamante de son  homosexualité par un ami de ses parents, le silence des témoins, la douleur de la solitude, la possibilité de l’acceptation. Tout cela elle le raconte à une autre fille, à la caméra, au spectateur.  Comme une confidence.</p>\r\n<p style="text-align: justify;"></p>', 'Pauline – Céline Sciamma- France – 2009', '', 'inherit', 'closed', 'closed', '', '12-revision-4', '', '', '2013-01-15 10:44:46', '2013-01-15 09:44:46', '', 12, 'http://localhost/~blee/LGBT/?p=137', 0, 'revision', '', 0),
(138, 1, '2013-01-15 10:45:33', '2013-01-15 09:45:33', '<p style="text-align: justify;">2009 - 8 minutes\r\nLors d’une séance du jeu « Action ou vérité ? », deux jeunes garçons, Mathieu et Maxime, ont  pour défi de s’embrasser. Le baiser va provoquer chez eux un certain émoi. A partir de ce moment, les ados, témoins de cette scène, font des allusions plus ou moins directes à l’éventuelle  homosexualité de Maxime. Une révélation surprenante va alors déstabiliser le groupe, mais  surtout le faire réfléchir.</p>\r\n<a href="http://localhost/~blee/LGBT/?attachment_id=86" rel="attachment wp-att-86"><img class="size-medium wp-image-86 aligncenter" alt="PAULINE_1" src="http://localhost/~blee/LGBT/wp-content/uploads/2013/01/PAULINE_1-300x200.jpg" width="300" height="200" /></a>', 'En colo - Pascal-Alex Vincent - France', '', 'inherit', 'closed', 'closed', '', '10-revision-4', '', '', '2013-01-15 10:45:33', '2013-01-15 09:45:33', '', 10, 'http://localhost/~blee/LGBT/?p=138', 0, 'revision', '', 0),
(139, 1, '2013-01-15 10:46:10', '2013-01-15 09:46:10', '<p style="text-align: justify;">Les 3 premiers courts métrages de cette séance font partie des 5 lauréats du concours Jeune et homo sous le regard des autres, dont les scenarii ont été écrits par des jeunes et mis en scène par des réalisateurs. Cette opération contre l’homophobie, a été organisée en 2009 par le Ministère de la Santé, de la Jeunesse, des Sports et de la Vie associative et de l’INPES avec le soutien du groupe Canal+.</p>', 'Intro', '', 'inherit', 'closed', 'closed', '', '8-revision-3', '', '', '2013-01-15 10:46:10', '2013-01-15 09:46:10', '', 8, 'http://localhost/~blee/LGBT/?p=139', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(140, 1, '2013-01-15 10:24:20', '2013-01-15 09:24:20', '<p style="text-align: justify;">Après trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien - Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.</p>\r\n<p style="text-align: justify;">Au programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.</p>\r\n<p style="text-align: jus;">En ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire - Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.</p>\r\n<p style="text-align: left;">Enfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !</p>\r\n<p style="text-align: left;">Christel Guillard, coordinatrice générale.</p>', 'Édito', '', 'inherit', 'closed', 'closed', '', '5-revision-3', '', '', '2013-01-15 10:24:20', '2013-01-15 09:24:20', '', 5, 'http://localhost/~blee/LGBT/?p=140', 0, 'revision', '', 0),
(142, 1, '2013-01-21 16:26:14', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2013-01-21 16:26:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/~blee/LGBT/?p=142', 0, 'post', '', 0),
(143, 1, '2013-01-21 15:41:55', '2013-01-21 14:41:55', '<div>\r\n\r\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\r\n\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\n\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\n\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\n\r\nChristel Guillard, coordinatrice générale.\r\n\r\n</div>', 'Édito', '', 'inherit', 'closed', 'closed', '', '62-revision-5', '', '', '2013-01-21 15:41:55', '2013-01-21 14:41:55', '', 62, 'http://localhost/~blee/LGBT/?p=143', 0, 'revision', '', 0),
(144, 1, '2013-01-28 15:53:00', '2013-01-28 14:53:00', '<div>\r\n<ul class="slideshow">\r\n<li><img src="wp-content/uploads/2013/01/EN_COLOricco-1024x670.jpg" alt="En Coloricco"></li>\r\n<li><img src="wp-content/uploads/2013/01/I_cant_think_straight_001-1024x682.jpg" alt="I cant think straight"></li>\r\n<li><img src="wp-content/uploads/2013/01/OMAR_-1024x682.jpg" alt="Omar"></li>\r\n</ul>\r\n\r\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\r\n\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\n\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\n\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\n\r\nChristel Guillard, coordinatrice générale.\r\n\r\n</div>', 'Édito', '', 'inherit', 'closed', 'closed', '', '62-revision-6', '', '', '2013-01-28 15:53:00', '2013-01-28 14:53:00', '', 62, 'http://localhost/~blee/LGBT/?p=144', 0, 'revision', '', 0),
(145, 1, '2013-01-28 16:10:44', '2013-01-28 15:10:44', '<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>\r\n<script src="responsiveslides.min.js"></script>\r\n<div>\r\n<ul class="slideshow">\r\n<li><img src="wp-content/uploads/2013/01/EN_COLOricco-1024x670.jpg" alt="En Coloricco"></li>\r\n<li><img src="wp-content/uploads/2013/01/I_cant_think_straight_001-1024x682.jpg" alt="I cant think straight"></li>\r\n<li><img src="wp-content/uploads/2013/01/OMAR_-1024x682.jpg" alt="Omar"></li>\r\n</ul>\r\n\r\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\r\n\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\n\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\n\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\n\r\nChristel Guillard, coordinatrice générale.\r\n\r\n</div>', 'Édito', '', 'inherit', 'closed', 'closed', '', '62-revision-7', '', '', '2013-01-28 16:10:44', '2013-01-28 15:10:44', '', 62, 'http://localhost/~blee/LGBT/?p=145', 0, 'revision', '', 0),
(146, 1, '2013-01-28 16:11:14', '2013-01-28 15:11:14', '<div>\r\n<ul class="slideshow">\r\n<li><img src="wp-content/uploads/2013/01/EN_COLOricco-1024x670.jpg" alt="En Coloricco"></li>\r\n<li><img src="wp-content/uploads/2013/01/I_cant_think_straight_001-1024x682.jpg" alt="I cant think straight"></li>\r\n<li><img src="wp-content/uploads/2013/01/OMAR_-1024x682.jpg" alt="Omar"></li>\r\n</ul>\r\n\r\nAprès trois ans d’affirmation dans le paysage culturel orléanais et une année sabbatique, le Festival de films gays &amp; lesbiens revient sous une nouvelle identité. Relayant le Groupe Action Gay &amp; Lesbien – Loiret, l’association culturelle Ciné Mundi axée sur le cinéma indépendant, lance en 2010 le festival de films LGBT D’un bord à l’autre sur un week-end de trois jours, format similaire aux éditions précédentes. Cette année, l’événement aura pour thème la sensibilisation des jeunes à la lutte contre les discriminations liées à l’orientation sexuelle et au genre.\r\n\r\nAu programme de ce rendez-vous : 5 séances inédites au cinéma Les Carmes à Orléans.\r\n\r\nEn ouverture : une sélection de courts métrages dont trois ont été réalisés dans le cadre de Jeune et homo sous le regard des autres, concours organisé en 2009 par le Ministère de la Santé et l’INPES contre l’homophobie.\r\nAutre temps fort de ce week-end : It’s elementary, talking about gays issues in school (C’est élémentaire – Parler de l’homosexualité à l’école), documentaire de Debra Chasnoff, qui déchaîna les mêmes passions que le film d’animation Le baiser de la lune en France 12 en 2010. La projection sera suivie d’un débat avec l’association G.A.G.L 45, sur les Interventions en Milieu Scolaire.\r\n\r\nEnfin, ce sera aussi l’occasion de découvrir 3 fictions avec Ander, un long métrage espagnol mettant en scène une histoire d’amour entre un paysan basque et un immigré péruvien, El niño pez, un surprenant road-movie lesbien version argentine et I can’t think straight, une savoureuse comédie britannique qui clôturera cette édition.\r\nBon festival !\r\n\r\nChristel Guillard, coordinatrice générale.\r\n\r\n</div>', 'Édito', '', 'inherit', 'closed', 'closed', '', '62-revision-8', '', '', '2013-01-28 16:11:14', '2013-01-28 15:11:14', '', 62, 'http://localhost/~blee/LGBT/?p=146', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'films', 'films-lm', 0),
(3, 'courts-métrages', 'court-metrage', 0),
(4, 'Édito', 'edito', 0),
(6, 'LGBT', 'lgbt', 0),
(7, 'Infos Pratiques', 'infos-pratiques', 0),
(8, 'Partenaires', 'partenaires', 0),
(9, 'Remerciements', 'remerciements', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(5, 1, 0),
(8, 3, 0),
(10, 3, 0),
(12, 3, 0),
(14, 3, 0),
(16, 3, 0),
(19, 3, 0),
(21, 3, 0),
(23, 2, 0),
(27, 2, 0),
(29, 2, 0),
(31, 2, 0),
(33, 1, 0),
(67, 6, 0),
(68, 6, 0),
(69, 6, 0),
(115, 6, 0),
(119, 6, 0),
(122, 6, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', 'Catégorie des films long métrages du festival LGBT', 0, 4),
(3, 3, 'category', 'Catégorie des films courts métrages du festival LGBT', 0, 7),
(4, 4, 'category', 'Édito du festival LGBT', 0, 0),
(6, 6, 'nav_menu', '', 0, 6),
(7, 7, 'category', 'Les informations pratiques concernant le festival LGBT', 0, 0),
(8, 8, 'category', 'Retrouvez tous les partenaires du festival LGBT', 0, 0),
(9, 9, 'category', 'Les livre d''or de LGBT Project', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'blee'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '142'),
(15, 1, 'wp_user-settings', 'editor=html&libraryContent=browse&align=none&imgsize=medium&urlbutton=post&widgets_access=on'),
(16, 1, 'wp_user-settings-time', '1358849168'),
(17, 1, 'managenav-menuscolumnshidden', 'a:3:{i:0;s:11:"link-target";i:1;s:3:"xfn";i:2;s:11:"description";}'),
(18, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(19, 1, 'nav_menu_recently_edited', '6'),
(20, 1, 'meta-box-order_page', 'a:3:{s:4:"side";s:36:"submitdiv,pageparentdiv,postimagediv";s:6:"normal";s:70:"postcustom,commentstatusdiv,commentsdiv,slugdiv,authordiv,revisionsdiv";s:8:"advanced";s:0:"";}'),
(21, 1, 'screen_layout_page', '2'),
(22, 1, 'closedpostboxes_page', 'a:0:{}'),
(23, 1, 'metaboxhidden_page', 'a:6:{i:0;s:10:"postcustom";i:1;s:16:"commentstatusdiv";i:2;s:11:"commentsdiv";i:3;s:7:"slugdiv";i:4;s:9:"authordiv";i:5;s:12:"revisionsdiv";}'),
(24, 1, 'closedpostboxes_post', 'a:0:{}'),
(25, 1, 'metaboxhidden_post', 'a:7:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:10:"postcustom";i:3;s:11:"commentsdiv";i:4;s:7:"slugdiv";i:5;s:9:"authordiv";i:6;s:12:"revisionsdiv";}'),
(26, 1, 'closedpostboxes_nav-menus', 'a:0:{}');

-- --------------------------------------------------------

--
-- Structure de la table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'blee', '$P$BZCJTLMnOqYh.kwfMESIPCFiI4jdnM0', 'blee', 'vincent.blee@etu.univ-orleans.fr', '', '2013-01-14 15:00:55', '', 0, 'blee');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
