-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: lms
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES (5,'HTML CSS JS','html-css-js',NULL,NULL),(6,'PHP MySql','php-mysql',NULL,NULL),(7,'Laravel Framework','laravel-framework',NULL,NULL),(8,'Python','python','2024-05-21 01:18:07',NULL);
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blogcat_id` int NOT NULL,
  `post_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci,
  `post_tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_posts`
--

LOCK TABLES `blog_posts` WRITE;
/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
INSERT INTO `blog_posts` VALUES (1,7,'The PHP Framework for Web Artisans','the-php-framework-for-web-artisans','upload/post/1799649001618643.jpg','<p>Laravel is a web application framework with expressive, elegant syntax. We&rsquo;ve already laid the foundation &mdash; freeing you to create without sweating the small things. Laravel values beauty.</p>\r\n<p>We love clean code just as much as you do. Simple, elegant syntax puts amazing functionality at your fingertips. Every feature has been thoughtfully considered to provide a wonderful developer experience.&nbsp;</p>\r\n<p class=\"mt-6 text-gray-700 leading-relaxed\">Build robust, full-stack applications in PHP using Laravel and&nbsp;<a class=\"underline\" href=\"https://livewire.laravel.com/\">Livewire</a>. Love JavaScript? Build a monolithic React or Vue driven frontend by pairing Laravel with&nbsp;<a class=\"underline\" href=\"https://inertiajs.com/\">Inertia</a>.</p>\r\n<p class=\"mt-6 text-gray-700 leading-relaxed\">Or, let Laravel serve as a robust backend API for your Next.js application, mobile application, or other frontend. Either way, our starter kits will have you productive in minutes.</p>\r\n<p class=\"mt-6 text-gray-700 leading-relaxed\">Out of the box, Laravel has elegant solutions for the common features needed by all modern web applications. It\'s time to start building amazing applications and stop wasting time searching for packages and reinventing the wheel.</p>\r\n<p class=\"mt-6 text-gray-700 leading-relaxed\">We\'ve just scratched the surface. Laravel has you covered for everything you will need to build a web application, including email verification, rate limiting, and custom console commands. Check out the&nbsp;<a class=\"text-red-600 underline hover:no-underline\" href=\"https://laravel.com/docs\">Laravel documentation</a> to keep learning.</p>\r\n<p class=\"mt-6 text-gray-700 leading-relaxed\">Laravel is committed to delivering the best testing experience you can imagine. No more brittle tests that are a nightmare to maintain. Beautiful testing APIs, database seeding, and painless browser testing let you ship with confidence.</p>\r\n<p class=\"mt-6 text-gray-700 leading-relaxed\">Our vast library of meticulously maintained packages means you\'re ready for anything. Let&nbsp;<a class=\"underline\" href=\"https://laravel.com/docs/octane\">Laravel Octane</a>&nbsp;supercharge your application\'s performance, and experience infinite scale on&nbsp;<a class=\"underline\" href=\"https://vapor.laravel.com/\">Laravel Vapor</a>, our serverless deployment platform powered by AWS Lambda.</p>','progamming,framework,laravel,php','2024-05-21 01:16:49',NULL),(2,5,'Learn Web Development Basics ΓÇô HTML, CSS, and JavaScript Explained for Beginners','learn-web-development-basics-ΓÇô-html,-css,-and-javascript-explained-for-beginners','upload/post/1799649187257902.png','<h2 id=\"what-is-html\">What is HTML?</h2>\r\n<p>HTML stands for&nbsp;<strong>Hyper Text Markup Language.</strong></p>\r\n<p><a href=\"https://www.dictionary.com/browse/markup\">Dictionary.com</a>&nbsp;defines a Markup as:</p>\r\n<blockquote><em>a set of detailed instructions, usually written on a manuscript to be typeset, concerning style of type, makeup of pages, and the like.</em></blockquote>\r\n<p>So you can think of HTML as the language used for creating detailed instructions concerning style, type, format, structure and the makeup of a web page before it gets printed (shown to you).</p>\r\n<p>But in the context of web development, we can replace the term &lsquo;printed&rsquo; with &lsquo;rendered&rsquo; as a more accurate term.</p>\r\n<p>HTML helps you structure your page into elements such as paragraphs, sections, headings, navigation bars, and so on. &nbsp;</p>\r\n<h2 id=\"what-is-css\">What is CSS?</h2>\r\n<p>While HTML is a&nbsp;<strong>markup language</strong>&nbsp;used to format/structure a web page, CSS is a&nbsp;<strong>design language</strong>&nbsp;that you use to make your web page look nice and presentable.</p>\r\n<p>CSS stands for&nbsp;<strong>Cascading Style Sheets</strong>, and you use it to improve the appearance of a web page. By adding thoughtful CSS styles, you make your page more attractive and pleasant for the end user to view and use.</p>\r\n<p>Imagine if human beings were just made to have skeletons and bare bones &ndash; how would that look? Not nice if you ask me. So CSS is like our skin, hair, and general physical appearance.</p>\r\n<p>You can also use CSS to layout elements by positioning them in specified areas of your page.</p>\r\n<p>To access these elements, you have to &ldquo;select&rdquo; them. You can select a single or multiple web elements and specify how you want them to look or be positioned.</p>\r\n<p>The rules that govern this process are called&nbsp;<a href=\"https://www.freecodecamp.org/news/use-css-selectors-to-style-webpage/\">CSS&nbsp;<strong>selectors</strong></a><strong>.</strong></p>\r\n<p>With CSS you can set the colour and background of your elements, as well as the typeface, margins, spacing, padding and so much more.</p>\r\n<p>If you remember our example HTML page, we had elements which were pretty self-explanatory. For example, I stated that I would change the color of the level one heading&nbsp;<code>h1</code> to red.</p>\r\n<h2 id=\"what-is-javascript\">What is JavaScript?</h2>\r\n<p>Now, if HTML is the&nbsp;<strong>markup language</strong>&nbsp;and CSS is the&nbsp;<strong>design language</strong>, then JavaScript is the&nbsp;<strong>programming language.</strong></p>\r\n<p>If you don&rsquo;t know what programming is, think of certain actions you take in your daily life:</p>\r\n<p>When you sense danger, you run. When you are hungry, you eat. When you are tired, you sleep. When you are cold, you look for warmth. When crossing a busy road, you calculate the distance of vehicles away from you.</p>\r\n<p>Your brain has been programmed to react in a certain way or do certain things whenever something happens. In this same way, you can program your web page or individual elements to react a certain way and to do something when something else (an event) happens.</p>\r\n<p>You can program actions, conditions, calculations, network requests, concurrent tasks and many other kinds of instructions.</p>\r\n<p>You can access any elements through the&nbsp;<a href=\"https://www.freecodecamp.org/news/how-to-manipulate-the-dom-beginners-guide/\">Document Object Model API (DOM)</a>&nbsp;and make them change however you want them to.</p>\r\n<p>The DOM is a tree-like representation of the web page that gets loaded into the browser.</p>','progamming,html,css,js','2024-05-21 01:16:50','2024-05-21 01:41:57'),(3,6,'Tutorial PHP dan MySQL: Membuat Aplikasi CRUD [Studi Kasus Pendaftaran Siswa Baru]','tutorial-php-dan-mysql:-membuat-aplikasi-crud-[studi-kasus-pendaftaran-siswa-baru]','upload/post/1799651045232906.jpeg','<p>PHP sering dijodohkan dengan MySQL untuk membangun aplikasi web. MySQL berperan sebagai tempat menyimpan data (basis data) sedangkan PHP adalah program yang mengelola data tersebut.</p>\r\n<p>Sebenarnya PHP tidak hanya bisa dijodohkan dengan MySQL saja. PHP juga bisa dijodohkan dengan SQLite, PostgreSQL, MongoDB, Ms. Access, dsb.</p>\r\n<p>Pada kesempatan ini, kita akan belajar menggunakan PHP dan MySQL untuk membuat aplikasi sederhana.</p>\r\n<h2 id=\"bagaimana-php-dan-mysql-dihubungkan\">Bagaimana PHP dan MySQL dihubungkan?</h2>\r\n<p>PHP dan MySQL dapat saling berhubungan melalui perantara API&nbsp;<em>(Application Programming Interface)</em>.</p>\r\n<p>Ada tiga jenis API MySQL yang disediakan di PHP:</p>\r\n<ol>\r\n<li><code>mysql</code>&nbsp;API ini sudah tidak didukung/dikembangkan lagi (kadaluarsa).</li>\r\n<li><code>mysqli</code>&nbsp;<em>(mysql improvement)</em>&nbsp;peningkatan dari API&nbsp;<code>mysql</code></li>\r\n<li>PDO&nbsp;<em>(PHP Data Object)</em></li>\r\n</ol>\r\n<p>API yang pertama sudah tidak didukung lagi sejak PHP versi 5.5.x dan digantikan dengan&nbsp;<code>mysqli</code>&nbsp;yang lebih canggih. Karena&nbsp;<code>mysqli</code>&nbsp;dapat digunakan secara&nbsp;<a class=\"font-medium hover:text-teal-600 active:text-teal-500 dark:hover:text-teal-400 dark:active:text-teal-300\" href=\"https://www.petanikode.com/topik/oop/\">OOP</a>&nbsp;dan prosedural.</p>\r\n<p>Sedangkan API PDO digunakan untuk menghubungkan PHP dengan vendor database yang lainnya. Jadi tidak hanya untuk MySQL saja.</p>\r\n<p>Pada tutorial ini, kita akan belajar cara menghubungkan PHP dan MySQL menggunakan API&nbsp;<code>mysqli</code> secara prosedural.</p>\r\n<figure class=\"not-prose mb-4\"></figure>','progamming,php,mysql','2024-05-21 01:16:51','2024-05-21 01:43:00'),(4,8,'WhatΓÇÖs New In Python 3.12','whatΓÇÖs-new-in-python-3.12','upload/post/1799649587805717.png','<p>Python 3.12 is the latest stable release of the Python programming language, with a mix of changes to the language and the standard library. The library changes focus on cleaning up deprecated APIs, usability, and correctness. Of note, the&nbsp;<code class=\"xref py py-mod docutils literal notranslate\"><span class=\"pre\">distutils</span></code>&nbsp;package has been removed from the standard library. Filesystem support in&nbsp;<a class=\"reference internal\" title=\"os: Miscellaneous operating system interfaces.\" href=\"https://docs.python.org/3/library/os.html#module-os\"><code class=\"xref py py-mod docutils literal notranslate\"><span class=\"pre\">os</span></code></a>&nbsp;and&nbsp;<a class=\"reference internal\" title=\"pathlib: Object-oriented filesystem paths\" href=\"https://docs.python.org/3/library/pathlib.html#module-pathlib\"><code class=\"xref py py-mod docutils literal notranslate\"><span class=\"pre\">pathlib</span></code></a>&nbsp;has seen a number of improvements, and several modules have better performance.</p>\r\n<p>The language changes focus on usability, as&nbsp;<a class=\"reference internal\" href=\"https://docs.python.org/3/glossary.html#term-f-string\"><span class=\"xref std std-term\">f-strings</span></a>&nbsp;have had many limitations removed and &lsquo;Did you mean &hellip;&rsquo; suggestions continue to improve. The new&nbsp;<a class=\"reference internal\" href=\"https://docs.python.org/3/whatsnew/3.12.html#whatsnew312-pep695\"><span class=\"std std-ref\">type parameter syntax</span></a>&nbsp;and&nbsp;<a class=\"reference internal\" href=\"https://docs.python.org/3/reference/simple_stmts.html#type\"><code class=\"xref std std-keyword docutils literal notranslate\"><span class=\"pre\">type</span></code></a>&nbsp;statement improve ergonomics for using&nbsp;<a class=\"reference internal\" href=\"https://docs.python.org/3/glossary.html#term-generic-type\"><span class=\"xref std std-term\">generic types</span></a>&nbsp;and&nbsp;<a class=\"reference internal\" href=\"https://docs.python.org/3/glossary.html#term-type-alias\"><span class=\"xref std std-term\">type aliases</span></a>&nbsp;with static type checkers.</p>\r\n<p>This article doesn&rsquo;t attempt to provide a complete specification of all new features, but instead gives a convenient overview. For full details, you should refer to the documentation, such as the&nbsp;<a class=\"reference internal\" href=\"https://docs.python.org/3/library/index.html#library-index\"><span class=\"std std-ref\">Library Reference</span></a>&nbsp;and&nbsp;<a class=\"reference internal\" href=\"https://docs.python.org/3/reference/index.html#reference-index\"><span class=\"std std-ref\">Language Reference</span></a>. If you want to understand the complete implementation and design rationale for a change, refer to the PEP for a particular new feature; but note that PEPs usually are not kept up-to-date once a feature has been fully implemented.</p>','progamming,python','2024-05-21 01:19:50',NULL);
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (9,'Development','development','upload/category/1791574550694346.jpg',NULL,NULL),(11,'IT and Software','it-and-software','upload/category/1791574590020947.jpg',NULL,NULL),(12,'Personality Development','personality-development','upload/category/1791574716898201.jpg',NULL,'2024-02-21 15:13:13'),(13,'Design','design','upload/category/1791574621524407.jpg',NULL,'2024-02-22 20:56:16'),(14,'Finance and Accounting','finance-and-accounting','upload/category/1791574644110026.jpg',NULL,NULL),(15,'Business','business','upload/category/1791574738587256.jpg',NULL,NULL),(16,'Marketing','marketing','upload/category/1792040208002397.jpeg',NULL,'2024-02-26 18:32:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned DEFAULT NULL COMMENT 'user_id',
  `receiver_id` bigint unsigned DEFAULT NULL COMMENT 'instructor_id',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
INSERT INTO `chat_messages` VALUES (10,3,2,'help me','2024-06-13 01:04:46','2024-06-13 01:04:46'),(11,2,3,'what?','2024-06-13 01:05:03','2024-06-13 01:05:03'),(12,3,2,'asu','2024-06-13 01:11:13','2024-06-13 01:11:13'),(13,2,3,'opo cok','2024-06-13 01:11:23','2024-06-13 01:11:23'),(14,3,2,'bantu cok error inii','2024-06-13 01:15:10','2024-06-13 01:15:10'),(15,2,3,'apa errornya cok','2024-06-13 01:15:21','2024-06-13 01:15:21'),(16,3,2,'ini cok','2024-06-13 01:15:28','2024-06-13 01:15:28'),(17,2,3,'ini apa cok','2024-06-13 01:15:35','2024-06-13 01:15:35');
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_validity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `instructor_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'QWERTY','30','2024-03-19',1,NULL,NULL,'2024-03-14 06:22:03','2024-03-14 06:22:03'),(3,'ZXCVBN','20','2024-03-19',1,NULL,NULL,'2024-03-14 06:21:55','2024-03-14 06:21:55'),(5,'UIOPL','40','2024-03-21',1,NULL,NULL,'2024-03-20 00:15:07','2024-03-20 00:15:07'),(6,'LKJHG','50','2024-03-20',1,NULL,NULL,'2024-03-17 21:14:52',NULL),(7,'17MEI2024','17','2024-05-17',1,2,21,'2024-05-14 02:13:42','2024-05-14 02:13:42'),(8,'TUJUHBELAS','17','2024-05-17',1,2,14,'2024-05-14 01:55:07',NULL),(9,'MELMEI','17','2024-05-17',1,2,17,'2024-05-14 01:57:36',NULL),(10,'MLNG.MEI','17','2024-05-17',1,2,20,'2024-05-14 02:13:34','2024-05-14 02:13:34');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_goals`
--

DROP TABLE IF EXISTS `course_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_goals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `goal_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_goals`
--

LOCK TABLES `course_goals` WRITE;
/*!40000 ALTER TABLE `course_goals` DISABLE KEYS */;
INSERT INTO `course_goals` VALUES (23,14,'Lorem, ipsum dolor sit amet consectetur adipisicing elit','2024-02-28 18:25:00','2024-02-28 18:25:00'),(24,14,'Dolore porro neque excepturi laboriosam at earum voluptates alias','2024-02-28 18:25:00','2024-02-28 18:25:00'),(25,14,'recusandae quos eum magnam nihil eveniet accusantium laudantium dolor distinctio reiciendis voluptas ex','2024-02-28 18:25:00','2024-02-28 18:25:00'),(26,15,'Lorem ipsum','2024-02-28 18:27:22','2024-02-28 18:27:22'),(27,15,'dolor sit amet consectetur adipisicing elit','2024-02-28 18:27:22','2024-02-28 18:27:22'),(28,15,'Ex facilis inventore et laborum quas ducimus ipsa','2024-02-28 18:27:22','2024-02-28 18:27:22'),(32,17,'dolorem vel sunt fugiat','2024-02-28 18:30:34','2024-02-28 18:30:34'),(33,17,'repellendus accusantium','2024-02-28 18:30:34','2024-02-28 18:30:34'),(34,17,'nemo molestias nulla','2024-02-28 18:30:34','2024-02-28 18:30:34'),(40,16,'Lorem ipsum','2024-02-28 19:18:23','2024-02-28 19:18:23'),(41,16,'it amet consectetur doloremque','2024-02-28 19:18:23','2024-02-28 19:18:23'),(42,16,'dolor amet consectetu','2024-02-28 19:18:23','2024-02-28 19:18:23'),(50,20,'ste fugiat magni ab','2024-03-03 02:24:37','2024-03-03 02:24:37'),(51,20,'voluptatem magnam consequatur','2024-03-03 02:24:37','2024-03-03 02:24:37'),(52,20,'perferendis nemo illo','2024-03-03 02:24:37','2024-03-03 02:24:37'),(53,20,'at natus voluptatibus','2024-03-03 02:24:37','2024-03-03 02:24:37'),(54,21,'HTML Dasar','2024-03-06 22:15:07','2024-03-06 22:15:07'),(55,21,'CSS Dasar','2024-03-06 22:15:07','2024-03-06 22:15:07'),(56,21,'JavaScript Dasar','2024-03-06 22:15:07','2024-03-06 22:15:07'),(57,22,'Lead more effectively by matching your leadership style to the competence of your follower','2024-03-06 22:29:07','2024-03-06 22:29:07'),(58,22,'Understand the need for four different leadership styles and how to use them effectively','2024-03-06 22:29:07','2024-03-06 22:29:07'),(59,22,'Increase the motivation of your team members','2024-03-06 22:29:07','2024-03-06 22:29:07'),(60,22,'Understand the four different competence levels and how they affect your leadership','2024-03-06 22:29:07','2024-03-06 22:29:07'),(61,22,'Free up their time by leading each team member or follower they way they need to be led to achieve their full potential','2024-03-06 22:29:07','2024-03-06 22:29:07'),(62,23,'Design Websites','2024-03-06 22:40:04','2024-03-06 22:40:04'),(63,23,'You will have a fully interactive design and prototype at the end of this course','2024-03-06 22:40:04','2024-03-06 22:40:04'),(64,23,'Design mobile and desktop apps','2024-03-06 22:40:04','2024-03-06 22:40:04'),(65,23,'You will learn how to reuse design elements for future projects','2024-03-06 22:40:04','2024-03-06 22:40:04'),(66,24,'Fundamentals of corporate finance including financial statement analysis','2024-03-06 22:56:45','2024-03-06 22:56:45'),(67,24,'Capital budgeting methods to evaluate investment decisions','2024-03-06 22:56:45','2024-03-06 22:56:45'),(68,24,'Risk management strategies and tools to mitigate financial risks','2024-03-06 22:56:45','2024-03-06 22:56:45'),(69,24,'Techniques for valuing companies, including DCF and comparables','2024-03-06 22:56:45','2024-03-06 22:56:45'),(70,24,'Financial modeling and forecasting to support strategic planning','2024-03-06 22:56:45','2024-03-06 22:56:45'),(71,25,'Understand How Bitcoin Works As A Globally Based Cryptocurrency, And Get Involved With It Practically As Well As Learning The Theoretical Side Of The Currency.','2024-03-06 23:02:30','2024-03-06 23:02:30'),(72,25,'Realise How Anyone Can Get Involved In Bitcoin Mining, Whether ItΓÇÖs For Profit Or Just For Fun, You Will Be Able To Start Mining Your Very Own Bitcoins With Everything','2024-03-06 23:02:30','2024-03-06 23:02:30'),(73,26,'Help your clients find clarity about their business ideas and goals','2024-03-06 23:16:14','2024-03-06 23:16:14'),(74,26,'Help your clients launch a start-up quickly or quantum leap their existing business','2024-03-06 23:16:14','2024-03-06 23:16:14'),(75,26,'Help your clients stop wasting time and laser focus on income producing results','2024-03-06 23:16:14','2024-03-06 23:16:14'),(76,26,'Coach your clients to write epic marketing copy and sell their product or service','2024-03-06 23:16:14','2024-03-06 23:16:14'),(77,26,'Coach your clients to set actionable short and long term goals and REACH THEM','2024-03-06 23:16:14','2024-03-06 23:16:14'),(78,27,'Confidently Evaluate the Return Potential of Any Real Estate Investment Opportunity','2024-03-06 23:27:32','2024-03-06 23:27:32'),(79,27,'Use Professional Grade Investment Models to Evaluate Your Deals','2024-03-06 23:27:32','2024-03-06 23:27:32'),(80,27,'Evaluate Fix & Flips','2024-03-06 23:27:32','2024-03-06 23:27:32'),(81,27,'Evaluate Airbnb Properties','2024-03-06 23:27:32','2024-03-06 23:27:32'),(82,27,'Understand and Use Professional Real Estate Investment Strategies & Techniques','2024-03-06 23:27:32','2024-03-06 23:27:32'),(83,27,'Know a \"Good\" Investment from a \"Bad\" Investment','2024-03-06 23:27:32','2024-03-06 23:27:32'),(84,27,'Evaluate Rental Income Properties','2024-03-06 23:27:32','2024-03-06 23:27:32'),(85,27,'Evaluate Commercial Properties','2024-03-06 23:27:32','2024-03-06 23:27:32'),(86,27,'Use Smart Investment Deal Structures With Business Partners','2024-03-06 23:27:32','2024-03-06 23:27:32'),(87,28,'Build a complete Social Media Strategy for your business','2024-03-06 23:37:01','2024-03-06 23:37:01'),(88,28,'Practical advice on incorporating mobile strategies into your marketing mix','2024-03-06 23:37:01','2024-03-06 23:37:01'),(89,28,'Measure and Monitor the Results','2024-03-06 23:37:01','2024-03-06 23:37:01'),(90,28,'Generate leads using Social Media','2024-03-06 23:37:01','2024-03-06 23:37:01'),(91,28,'Create content that increases conversion rates','2024-03-06 23:37:01','2024-03-06 23:37:01'),(92,29,'Most complete and thorough SEO course on the market','2024-03-06 23:43:53','2024-03-06 23:43:53'),(93,29,'Dominate Google search as well as other search platforms','2024-03-06 23:43:53','2024-03-06 23:43:53'),(94,29,'Smart SEO strategies used only by very savvy marketers','2024-03-06 23:43:53','2024-03-06 23:43:53'),(95,29,'Create a very good SEO strategy for your business','2024-03-06 23:43:53','2024-03-06 23:43:53'),(96,29,'Use different search engines mentioned above to your advantage to dominate everywhere on the web','2024-03-06 23:43:53','2024-03-06 23:43:53'),(97,29,'Go from a beginner to very intelligent about SEO','2024-03-06 23:43:53','2024-03-06 23:43:53'),(98,29,'Learn WordPress SEO, Shopify SEO, and SEO for any other platform like Wix','2024-03-06 23:43:53','2024-03-06 23:43:53');
/*!40000 ALTER TABLE `course_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_lectures`
--

DROP TABLE IF EXISTS `course_lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_lectures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `section_id` bigint unsigned NOT NULL,
  `lecture_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_lectures`
--

LOCK TABLES `course_lectures` WRITE;
/*!40000 ALTER TABLE `course_lectures` DISABLE KEYS */;
INSERT INTO `course_lectures` VALUES (8,17,7,'About IT Support',NULL,'https://www.youtube.com/','About IT SupportAbout IT SupportAbout IT Support','2024-02-29 19:42:06','2024-02-29 19:42:06'),(9,20,8,'Pengenalan Basis Data part 1',NULL,'https://www.youtube.com/watch?v=FqaX6T-Dapk&list=PLeiYvgDork3Zpia07NcaZKpnTga1z_FZe','Pengertian Data dan Basis Data | Basis Data','2024-03-01 19:22:02','2024-03-01 19:22:02'),(12,21,9,'Pengenalan HTML',NULL,'https://www.udemy.com/course/pemrograman-javascript-pemula-sampai-mahir/learn/lecture/36486684#overview','Slide : https://docs.google.com/presentation/d/1j3-mkgXmazIrQdJFhSQp5XK1NqeTIsA03UfST77Tinw/edit?usp=sharing\n\nSource Code : https://github.com/ProgrammerZamanNow/belajar-html-dasar','2024-03-06 22:19:21','2024-03-06 22:19:21'),(13,21,13,'Pengenalan CSS',NULL,'https://www.udemy.com/course/pemrograman-javascript-pemula-sampai-mahir/learn/lecture/40835960#overview','Source Code : https://github.com/ProgrammerZamanNow/belajar-css-dasar\n\nSlide : https://docs.google.com/presentation/d/12FFSrcueNzmXzX5TvDc5lzD2raABvLzRntdmEjFzZaY/edit?usp=sharing','2024-03-06 22:20:01','2024-03-06 22:20:01'),(14,21,14,'Pengenalan JavaScript',NULL,'https://www.udemy.com/course/pemrograman-javascript-pemula-sampai-mahir/learn/lecture/24820760#overview','Source Code : https://github.com/ProgrammerZamanNow/belajar-javascript-dasar\n\nSlide : https://docs.google.com/presentation/d/1dTIkYD_keBljJS78WxU-3ZneJDLdWt5nReO2CUXfFKg/edit','2024-03-06 22:21:35','2024-03-06 22:21:35'),(15,22,15,'The Roots of Competence',NULL,'https://youtu.be/oPo6HdDe__A','The Roots of Competence is a fundamental concept of Matched Leadership and this lecture explains how you can view different aspects of competence to better be able to see where somebody is lacking and needs your support.','2024-03-06 22:32:34','2024-03-06 22:32:34'),(16,22,16,'Matching Levels and Styles',NULL,'https://youtu.be/gvsiYHr573c','Updated lecture where you learn how to match your Leadership Style to the Competence Level of the follower in order to become more effective as a leader.','2024-03-06 22:33:45','2024-03-06 22:33:45'),(17,22,17,'Introduction to the Guide',NULL,'https://www.youtube.com/watch?v=9zC2Bc22QfA','Get an introduction to the Guide and what you will learn from the following lectures. Also attached to this lecture as a resource is a PDF-version of the Guide to Matched Leadership that you can download and follow along in for the following lectures.','2024-03-06 22:34:38','2024-03-06 22:34:38'),(18,23,18,'What is Figma?',NULL,'https://www.youtube.com/embed/PaPIsyO1t3Q?si=63iaiqGa0RCKn_SK','Lecture description\r\nIs Figma Right for You?\r\n\r\nIf you\'re wondering if Figma is right for you it\'s important to understand what Figma is. Figma is an online design tool (akin to google docs) that lets you design & prototype screens and gather feedback all in one place.\r\n\r\nBecause Figma is online, there\'s no need to install a program or upload or download project files. Your projects all live inside the Figma cloud which also helps with one of Figma\'s biggest advantages. Being able to collaborate live with many designers at the same time.\r\n\r\nYou can also share links with developers or stakeholders who can view your work in real-time or copy and paste code to use for development.\r\n\r\nFigma works best for large design teams that want to work closely together without friction or versioning nightmares. This is the only design tool with this amount of collaborative design power.\r\n\r\nIf this feels like the right tool for you, join me in this course as I explain all these benefits in more detail.','2024-03-06 22:42:13','2024-04-15 23:59:28'),(19,23,19,'Creating a New Project and File',NULL,'https://www.youtube.com/embed/1PQU3OrVafI?si=D2ew9ycmPoYLJy2o','Setting up a project - Figma for UX/UI Design tutorial','2024-03-06 22:43:22','2024-04-16 00:00:03'),(20,23,20,'Working with Frames',NULL,'https://www.youtube.com/embed/f0mnnDBj1-c?si=eH-ShAWVBhNOWd67','Set up frames and working with pages - Figma for UX/UI Design tutorial','2024-03-06 22:44:21','2024-04-16 00:00:52'),(21,24,21,'CFA┬« Level I Corporate Finance - AGM and Election of Directors',NULL,'https://www.youtube.com/watch?v=3XiRqno0wao&list=PL5C4op9wSllhvTpPFUZOFrU-546C7wolE','CFA┬« Level I Corporate Finance - AGM and Election of Directors','2024-03-06 22:58:20','2024-03-06 22:58:20'),(22,24,22,'CFA┬« Level I Corporate Finance - ESG Considerations for Investors',NULL,'https://www.youtube.com/watch?v=b-VeamJ2p30&list=PL5C4op9wSllhvTpPFUZOFrU-546C7wolE&index=2','CFA┬« Level I Corporate Finance - ESG Considerations for Investors','2024-03-06 22:58:37','2024-03-06 22:58:37'),(23,24,23,'CFA┬« Level I Corporate Finance - NPV and IRR',NULL,'https://www.youtube.com/watch?v=FaLzZ-6Zf0I&list=PL5C4op9wSllhvTpPFUZOFrU-546C7wolE&index=3','CFA┬« Level I Corporate Finance - NPV and IRR','2024-03-06 22:58:52','2024-03-06 22:58:52'),(24,25,24,'Intro',NULL,'https://www.youtube.com/watch?v=SXqfFTmYmT0&t=2s','Intro','2024-03-06 23:08:43','2024-03-06 23:08:43'),(25,25,24,'Digital Cash',NULL,'https://www.youtube.com/watch?v=SXqfFTmYmT0&t=2s','Digital Cash','2024-03-06 23:08:57','2024-03-06 23:08:57'),(26,25,24,'Software',NULL,'https://www.youtube.com/watch?v=SXqfFTmYmT0&t=2s','Software','2024-03-06 23:09:09','2024-03-06 23:09:09'),(27,25,24,'Nodes and Miners',NULL,'https://www.youtube.com/watch?v=SXqfFTmYmT0&t=2s','Nodes and Miners','2024-03-06 23:09:26','2024-03-06 23:09:26'),(28,25,24,'Public Key Encryption',NULL,'https://www.youtube.com/watch?v=SXqfFTmYmT0&t=2s','Public Key Encryption','2024-03-06 23:09:40','2024-03-06 23:09:40'),(29,25,24,'Custody',NULL,'https://www.youtube.com/watch?v=SXqfFTmYmT0&t=2s','Custody','2024-03-06 23:09:54','2024-03-06 23:09:54'),(30,25,24,'Conclusion',NULL,'https://www.youtube.com/watch?v=SXqfFTmYmT0&t=2s','Conclusion','2024-03-06 23:10:07','2024-03-06 23:10:07'),(31,26,25,'Crash Course Business: Entrepreneurship Preview',NULL,'https://www.youtube.com/watch?v=YHBVjv4MYXE&list=PL8dPuuaLjXtNamNKW5qlS-nKgA0on7Qze&index=1','Next week we start our series on Entrepreneurship with Anna Akana at the helm! We\'ll be talking about what Entrepreneurs are, what you need to be one, the pitfalls of running your own business, as well as the real benefits! Plus we get to hear Anna say \"Entrepreneur\" maybe a thousand times.','2024-03-06 23:20:08','2024-03-06 23:20:08'),(32,26,26,'Who Even Is An Entrepreneur?: Crash Course Business - Entrepreneurship #1',NULL,'https://www.youtube.com/watch?v=aozlwC3XwfY&list=PL8dPuuaLjXtNamNKW5qlS-nKgA0on7Qze&index=2','You\'ve probably heard the word \"Entrepreneur\" thrown around a lot in business. It conjures images of Elon Musk, Bill Gates, or Oprah Winfrey. But, it goes way beyond that. In this episode of Crash Course Business: Entrepreneurship, Anna helps us to figure out who Entrepreneurs are, and what that title actually means.','2024-03-06 23:20:34','2024-03-06 23:20:34'),(33,26,27,'How to Develop a Business Idea: Crash Course Business - Entrepreneurship #2',NULL,'https://www.youtube.com/watch?v=iywvlUk2Wfg&list=PL8dPuuaLjXtNamNKW5qlS-nKgA0on7Qze&index=3','So, where do ideas come from? And what do you do with them once you have them? In this episode of Crash Course Entrepreneurship, Anna helps to answer these questions (and more) as we figure out what we need to do to launch our business.','2024-03-06 23:20:53','2024-03-06 23:20:53'),(34,26,28,'Value Proposition and Customer Segments: Crash Course Business - Entrepreneurship #3 Playlist pelajaran',NULL,'https://www.youtube.com/watch?v=m2IPvT920XM&list=PL8dPuuaLjXtNamNKW5qlS-nKgA0on7Qze&index=4','Value is the core of any business, and it directs all future decisions, innovations, and customers that get targeted. Even if weΓÇÖve thought about the big picture, if we canΓÇÖt explain how an idea makes someoneΓÇÖs life better, then why should anyone pay attention? In this episode of Entrepreneurship, Anna helps us ask the questions: \"What value do I deliver?\" and \"Who are my customers?\"','2024-03-06 23:21:20','2024-03-06 23:21:20'),(35,26,29,'What Can You Learn from Your Competition?: Crash Course Business Entrepreneurship #4',NULL,'https://www.youtube.com/watch?v=5hL66Xl6W6M&list=PL8dPuuaLjXtNamNKW5qlS-nKgA0on7Qze&index=5','WeΓÇÖre used to competitions with clear winners and losers: baseball games, math olympiads, pie-eating contests, and games involving thrones. We crown a victor and everyone else goes home empty-handed! \n\nIn business, though, there isnΓÇÖt just one winner. So as entrepreneurs, we have to take stock in the middle of the competition, and ask the question: ΓÇ£how competitive am I?ΓÇ¥','2024-03-06 23:21:43','2024-03-06 23:21:43'),(36,27,30,'W2 EMPLOYEES: How to Pay Less Taxes (I saved $80k in 2022)',NULL,'https://www.youtube.com/watch?v=D84hK5L1BPA&list=PL35LzTfXVYYEvCRK93Bqm30qmIQAk3kJY&index=1','Are you a high-paid W2 employee, working 9 to 5, uninspired, and looking for financial freedom?\n\nThe traditional method of saving and maxing out your retirement accounts WORK - but not NEARLY FAST enough - so hear me out: \n\nOn this channel,  we only focus on THE MOST IMPACTFUL concepts that significantly move the needle toward financial freedom WHILE YOUΓÇÖRE STILL YOUNG AND ABLE TO ENJOY IT:\nΓÇöΓÇö Description of the video ΓÇöΓÇöΓÇöΓÇöΓÇöΓÇöΓÇöΓÇöΓÇöΓÇöΓÇöΓÇöΓÇö\n\nThis is how I was able to save 80k in taxes in 2022. \n\n0:00 Introduction\n1:08 What is a deduction?\n2:49 High-Level Overview\n5:26 What is cost segregation?\n9:13 How to use losses against W2 income?\n13:23 The catch: Depreciation Recapture\n13:40 Schedule a 1-1 call! Link in bio\n\n\nIn summary: \n1. Buy rentals\n2. Claim Real Estate Professional Status\n3. Materially Participate\n4. Cost Segregate to generate large passive losses\n5. Apply passive losses against W2 income.','2024-03-06 23:28:31','2024-03-06 23:28:31'),(37,27,31,'Calculating Numbers on a Rental Property [Using The Four Square Method!]',NULL,'https://www.youtube.com/watch?v=T_7vhsSBi7c&list=PL35LzTfXVYYEvCRK93Bqm30qmIQAk3kJY&index=2','Learn how to analyze a rental property with the unique \"four square\" method and make sure your next rental property investment is a cash cow! \n\nIn this video from BiggerPockets.com, Brandon Turner (author of The Book on Rental Property Investing and co-host of the BiggerPockets Podcast) shares with you the step by step real estate investing method for determining the monthly cash flow and cash on cash return for any rental property investment. \n\nCalculating the numbers on a rental property doesn\'t need to be difficult - and this video proves it.\n\nThis is a must-watch for anyone investing in real estate.','2024-03-06 23:29:05','2024-03-06 23:29:05'),(38,27,32,'How To Become A Millionaire Through Real Estate Investing (Newbies!)',NULL,'https://www.youtube.com/watch?v=naZAknwNgkY&list=PL35LzTfXVYYEvCRK93Bqm30qmIQAk3kJY&index=3','Learn how to become a millionaire through the wealth-generating powers of real estate investing!\n\nIn this video, Brandon Turner breaks down the simple math of how real estate can build massive wealth through the 4 wealth-generating factors that real estate investing has.\n\nWe hope you enjoy this video and if you do, make sure to like, comment, and subscribe!','2024-03-06 23:29:41','2024-03-06 23:29:41'),(39,28,33,'7 Effective Marketing Strategies for 2024 (TIPS, TRICKS & TACTICS)',NULL,'https://www.youtube.com/watch?v=4ajmfzj9G1g&list=PLxb4RhBMfU_Gbwmv3k3E8RUH8H3xgT1bV','In this video I want to share with you a few of the most important marketing strategies, tactics, tips and tricks. \n\nBut more than that I also want to show you some of the principles and foundational elements behind what makes these things so important. And what can happen to your business and marketing when you finally understand how all this works and fits together!\n\nIt\'s pretty cool stuff!\n\nSo, let me show you how it\'s done.','2024-03-06 23:37:43','2024-03-06 23:37:43'),(40,28,34,'10 Marketing Strategies Guaranteed to Grow ANY Business (PROVEN & PROFITABLE)',NULL,'https://www.youtube.com/watch?v=IjS9eTpmhgk&list=PLxb4RhBMfU_Gbwmv3k3E8RUH8H3xgT1bV&index=2','Marketing and growing a business doesn\'t have to be hard. And what you\'ll find is that with the right strategies, systems, and pieces in place, it can actually be a whole lot easier (and more fun... and more profitable!) than you ever imagined.\n\nThe key though is to focus on only the most important things you need to succeed. Which is why in this video I\'ve boiled business and marketing down to a simple to follow, step by step system that you can follow. A complete list of 10 marketing strategies that will allow you to start, build, grow and scale ANY business that you apply them to.\n\nSo, let me show you how it\'s done.','2024-03-06 23:38:09','2024-03-06 23:38:09'),(41,28,35,'15 Psychological Marketing Triggers to MAKE PEOPLE BUY From YOU!',NULL,'https://www.youtube.com/watch?v=hYZG8qnS2T4&list=PLxb4RhBMfU_Gbwmv3k3E8RUH8H3xgT1bV&index=3','In this episode IΓÇÖm going to unpack 15 different psychological sales and marketing triggers and cognitive biases that we, as marketers use on a daily basis to help influence, persuade, and guide people in the direction that we want. \n\nIf you have a business and want to get more customers, clients and make more sales. These will help.\n\nIf you work for a business and want to help them get more customers, clients, and make more sales, these will help.\n\nAnd if youΓÇÖve ever shopped at a business, then these triggers and cognitive biases are important for you to know so you can arm yourself against unethical and unscrupulous marketers trying to sell you things you just donΓÇÖt need.\n\nSo... letΓÇÖs get to it.','2024-03-06 23:38:36','2024-03-06 23:38:36'),(42,29,36,'Welcome to the SEO Unlocked! Free SEO Course with Neil Patel | SEO Training',NULL,'https://www.youtube.com/watch?v=Q_lySNxCag0&list=PLJR61fXkAx11Oi6EpqJ9Es4rVOIZhwlSG','Welcome to SEO Unlocked. This is my free SEO Course, and IΓÇÖm going to release new videos on Mondays, Thursdays, and Saturdays. Whether youΓÇÖre a beginner or a professional SEO, youΓÇÖll learn the exact search engine optimization techniques I use in my own business and with my consulting clients. This is the SEO training youΓÇÖve been looking for, and over the next few weeks, I\'m going to teach you how to get a flood of traffic to your website without having to spend a dollar on advertising.','2024-03-06 23:44:33','2024-03-06 23:44:33'),(43,29,37,'What is SEO? An Introduction to SEO',NULL,'https://www.youtube.com/watch?v=pIbQfOcsEsE&list=PLJR61fXkAx11Oi6EpqJ9Es4rVOIZhwlSG&index=2','This is the second lesson of my free SEO course called SEO Unlocked. Today I\'m going to be going over SEO and why it\'s important. Did you know that 93% of online experiences start with a search engine? You may think, \"All right, there are these search engines out there.\" \"Yeah, sure we know Google.\" But for a minute, just think about how many times you go on Google or search, or YouTube and search, or Kayak and look for hotels or flights, there are search engines all around us and we\'re constantly using them. Before we get started into going over SEO, there are a few things I wanted to cover: There\'s a lot of people saying false information out there, so I wanted to play a little fun little game called Fact or Fiction.','2024-03-06 23:45:04','2024-03-06 23:45:04'),(44,29,38,'Keyword Research Part 1 - SEO Unlocked - Free SEO Course with Neil Patel',NULL,'https://www.youtube.com/watch?v=CYicoAcAi0A&list=PLJR61fXkAx11Oi6EpqJ9Es4rVOIZhwlSG&index=3','Welcome to another day of SEO Unlocked. Today is very exciting because we\'re going to start the journey into keyword research. This is one of the most fundamental steps of SEO and the reason being is keywords is where it all starts. That\'s how people find you.','2024-03-06 23:45:31','2024-03-06 23:45:31'),(45,29,39,'Keyword Research Part 2 - SEO Unlocked - Free SEO Course with Neil Patel',NULL,'https://www.youtube.com/watch?v=U655ixy-sdE&list=PLJR61fXkAx11Oi6EpqJ9Es4rVOIZhwlSG&index=4','Today I\'m going to be breaking down how you can do keyword research. In this training module I\'m going to be breaking down keyword metrics, as well as how to match your keyword to a customer journey, and how you can refine your keyword list.','2024-03-06 23:46:14','2024-03-06 23:46:14'),(46,23,18,'Figma is',NULL,NULL,'Figma is a very powerful application that runs online. There are virtually no platform boundaries when it comes to using figma because you can design within a web browser or using their desktop application made for windows and macs. Figma is similar to Sketch and Adobe XD but is the more powerful of the three when it comes to team collaboration and responsive, fast paced design. \r\n\r\nThis course will cover user interface designing using the powerful tools within Figma. In the first section, I\'ll cover the Figma interface and where you can find powerful tools like constraints to make your designs responsive, and components to build a library of design elements to use throughout your projects. I\'ll also go over real-time team collaboration and how you can use figma to work closely with others in the same project.\r\n\r\nLater on I will guide you through designing and prototyping a \"Chef\'s Recipes\" App which will include multiple artboards, custom icon designs, editing images and text, and everything else you need to create a polished realistic design.\r\n\r\nPlease join me as a beginner in design or as a seasoned UI/UX designer wanting to switch from other tools like Sketch or Adobe XD','2024-04-16 20:24:17','2024-04-16 20:25:13');
/*!40000 ALTER TABLE `course_lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_sections`
--

DROP TABLE IF EXISTS `course_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `section_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_sections`
--

LOCK TABLES `course_sections` WRITE;
/*!40000 ALTER TABLE `course_sections` DISABLE KEYS */;
INSERT INTO `course_sections` VALUES (7,17,'Section 1 : About IT Support',NULL,NULL),(8,20,'section 1 : Database',NULL,NULL),(9,21,'Section 1 : HTML Dasar',NULL,NULL),(13,21,'Section 2 : CSS Dasar',NULL,NULL),(14,21,'Section 3 : JavaScript Dasar',NULL,NULL),(15,22,'Definiton',NULL,NULL),(16,22,'Matching Your Leadership Style',NULL,NULL),(17,22,'The Guide to Matched Leadership',NULL,NULL),(18,23,'Learning Figma Interface',NULL,NULL),(19,23,'Setting up a new project',NULL,NULL),(20,23,'Adding and Editing Content',NULL,NULL),(21,24,'Introduction to Corporate Finance',NULL,NULL),(22,24,'A Corporate Finance Roadmap',NULL,NULL),(23,24,'Pitching Your Story for Money',NULL,NULL),(24,25,'Explain BITCOIN to Complete Beginners: Ultimate Guide!!',NULL,NULL),(25,26,'Crash Course Business: Entrepreneurship Preview',NULL,NULL),(26,26,'Who Even Is An Entrepreneur?: Crash Course Business - Entrepreneurship #1',NULL,NULL),(27,26,'How to Develop a Business Idea: Crash Course Business - Entrepreneurship #2',NULL,NULL),(28,26,'Value Proposition and Customer Segments: Crash Course Business - Entrepreneurship #3',NULL,NULL),(29,26,'What Can You Learn from Your Competition?: Crash Course Business Entrepreneurship #4',NULL,NULL),(30,27,'W2 EMPLOYEES: How to Pay Less Taxes (I saved $80k in 2022)',NULL,NULL),(31,27,'Calculating Numbers on a Rental Property [Using The Four Square Method!]',NULL,NULL),(32,27,'How To Become A Millionaire Through Real Estate Investing (Newbies!)',NULL,NULL),(33,28,'7 Effective Marketing Strategies for 2024 (TIPS, TRICKS & TACTICS)',NULL,NULL),(34,28,'10 Marketing Strategies Guaranteed to Grow ANY Business (PROVEN & PROFITABLE)',NULL,NULL),(35,28,'15 Psychological Marketing Triggers to MAKE PEOPLE BUY From YOU!',NULL,NULL),(36,29,'Welcome to the SEO Unlocked! Free SEO Course with Neil Patel | SEO Training',NULL,NULL),(37,29,'What is SEO? An Introduction to SEO',NULL,NULL),(38,29,'Keyword Research Part 1 - SEO Unlocked - Free SEO Course with Neil Patel',NULL,NULL),(39,29,'Keyword Research Part 2 - SEO Unlocked - Free SEO Course with Neil Patel',NULL,NULL);
/*!40000 ALTER TABLE `course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `subcategory_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `course_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `course_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `course_name_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price` int DEFAULT NULL,
  `discount_price` int DEFAULT NULL,
  `prerequisites` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bestseller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highestrated` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (14,9,4,2,'upload/course/thumbnail/1792220961275501.png','Laravel 9 For Beginer','Laravel 9 For Beginer','laravel-9-for-beginer','<div>\r\n<div>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolore porro neque excepturi laboriosam at earum voluptates alias, recusandae quos eum magnam nihil eveniet accusantium laudantium dolor distinctio reiciendis voluptas ex.\r\n<div>\r\n<div>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolore porro neque excepturi laboriosam at earum voluptates alias, recusandae quos eum magnam nihil eveniet accusantium laudantium dolor distinctio reiciendis voluptas ex.</div>\r\n</div>\r\n</div>\r\n</div>','upload/course/video/1709196019.mp4','Beginner','9','3','Yes',20000,16000,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolore porro neque excepturi laboriosam at earum voluptates alias, recusandae quos eum magnam nihil eveniet accusantium laudantium dolor distinctio reiciendis voluptas ex.','1',NULL,'1',1,'2024-02-28 18:25:00','2024-03-03 02:16:49'),(15,13,15,2,'upload/course/thumbnail/1792221110139343.jpg','Graphic Design','Graphic Design','graphic-design','<div>\r\n<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex facilis inventore et laborum quas ducimus ipsa, quis expedita placeat? Ipsum fugit quam facere optio, rerum sunt vel maxime ea officia?\r\n<div>\r\n<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex facilis inventore et laborum quas ducimus ipsa, quis expedita placeat? Ipsum fugit quam facere optio, rerum sunt vel maxime ea officia?\r\n<div>\r\n<div>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex facilis inventore et laborum quas ducimus ipsa, quis expedita placeat? Ipsum fugit quam facere optio, rerum sunt vel maxime ea officia?</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>','upload/course/video/1709196055.mp4','Beginner','5','6','Yes',100000,70000,'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex facilis inventore et laborum quas ducimus ipsa, quis expedita placeat? Ipsum fugit quam facere optio, rerum sunt vel maxime ea officia?','1',NULL,NULL,1,'2024-02-28 18:27:22','2024-03-03 02:16:35'),(16,12,18,2,'upload/course/thumbnail/1792221218314712.jpg','Personal Development','Personal Development','personal-development','<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo incidunt atque doloremque dignissimos vel, fugiat explicabo aperiam quae consequuntur error minus vitae harum culpa voluptatum cumque totam quisquam nobis! Dolorum.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo incidunt atque doloremque dignissimos vel, fugiat explicabo aperiam quae consequuntur error minus vitae harum culpa voluptatum cumque totam quisquam nobis! Dolorum.Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo incidunt atque doloremque dignissimos vel, fugiat explicabo aperiam quae consequuntur error minus vitae harum culpa voluptatum cumque totam quisquam nobis! Dolorum.</p>','upload/course/video/1709196030.mp4','Middle','5','6','Yes',200000,NULL,'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo incidunt atque doloremque dignissimos vel, fugiat explicabo aperiam quae consequuntur error minus vitae harum culpa voluptatum cumque totam quisquam nobis! Dolorum.',NULL,NULL,'1',1,'2024-02-28 18:29:05','2024-03-03 02:16:28'),(17,11,10,2,'upload/course/thumbnail/1792221312032062.jpg','IT Support Certification','IT Support Certification','it-support-certification','<div>\r\n<div>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse, pariatur. Labore quas nisi animi facere cumque voluptatum esse culpa tenetur ducimus nemo molestias nulla, repellendus accusantium dolorem vel sunt fugiat?\r\n<div>\r\n<div>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse, pariatur. Labore quas nisi animi facere cumque voluptatum esse culpa tenetur ducimus nemo molestias nulla, repellendus accusantium dolorem vel sunt fugiat?\r\n<div>\r\n<div>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse, pariatur. Labore quas nisi animi facere cumque voluptatum esse culpa tenetur ducimus nemo molestias nulla, repellendus accusantium dolorem vel sunt fugiat?</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>','upload/course/video/1709195994.mp4','Advance','5','6','Yes',200000,110000,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Esse, pariatur. Labore quas nisi animi facere cumque voluptatum esse culpa tenetur ducimus nemo molestias nulla, repellendus accusantium dolorem vel sunt fugiat?',NULL,NULL,NULL,1,'2024-02-28 18:30:34','2024-03-03 02:16:18'),(20,11,10,2,'upload/course/thumbnail/1792291604607936.jpeg','Database MySQL Dasar','Database MySQL Dasar','database-mysql-dasar','<div>\r\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis incidunt debitis perferendis nemo illo ut corrupti qui vitae soluta quia at natus voluptatibus voluptatem magnam consequatur, iste fugiat magni ab.\r\n<div>\r\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis incidunt debitis perferendis nemo illo ut corrupti qui vitae soluta quia at natus voluptatibus voluptatem magnam consequatur, iste fugiat magni ab.\r\n<div>\r\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis incidunt debitis perferendis nemo illo ut corrupti qui vitae soluta quia at natus voluptatibus voluptatem magnam consequatur, iste fugiat magni ab.</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>','upload/course/video/1709262470.mp4','Beginner','8','8','Yes',30000,20000,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis incidunt debitis perferendis nemo illo ut corrupti qui vitae soluta quia at natus voluptatibus voluptatem magnam consequatur, iste fugiat magni ab.','1',NULL,'1',1,'2024-02-29 13:07:50','2024-03-13 11:36:43'),(21,9,4,2,'upload/course/thumbnail/1792843192413046.png','HTML, CSS dan JavaScript dari Pemula sampai Mahir.','HTML, CSS dan JavaScript dari Pemula sampai Mahir.','html,-css-dan-javascript-dari-pemula-sampai-mahir.','<p>Selamat datang di course HTML, CSS&nbsp;dan JavaScript dari Pemula sampai Mahir. Disini kita akan belajar Web dasar dari HTML, CSS dan JavaScript dari tingkat dasar sampai tingkat mahir, disertai dengan studi kasus. Akan banyak materi yang akan dibahas di course ini seperti :</p>\r\n<ul>\r\n<li>\r\n<p>HTML&nbsp;Dasar, disini kita akan belajar tentang dasar-dasar web menggunakan HTML. Bagaimana membuat web menggunakan HTML</p>\r\n</li>\r\n<li>\r\n<p>HTML&nbsp;Form, disini kita akan belajar bagaimana membuat Form menggunakan HTML. Form adalah salah satu bagian untuk berinteraksi dengan pengguna web</p>\r\n</li>\r\n<li>\r\n<p>CSS&nbsp;Dasar, disini kita akan belajar tentang CSS, untuk menambahkan gaya dan tampilan ke halaman HTML&nbsp;agar lebih menarik</p>\r\n</li>\r\n<li>\r\n<p>CSS&nbsp;Layout, disini kita akan belajar tentang cara melakukan tata telak posisi element-element HTML&nbsp;mengggunakan CSS</p>\r\n</li>\r\n<li>\r\n<p>Pemrograman JavaScript Dasar, disini kita akan belajar tentang dasar-dasar pemrograman JavaScript. Ini adalah materi awal yang wajib dikuasai</p>\r\n</li>\r\n<li>\r\n<p>Pemrograman JavaScript Object Oriented Programming, disini kita akan belajar pemrograman berorientasi objek di JavaScript, salah satu paradigma paling populer saat ini</p>\r\n</li>\r\n<li>\r\n<p>Pemrograman JavaScript Modules, disini kita akan belajar cara membuat aplikasi javascript yang modular, sehingga mudah digunakan</p>\r\n</li>\r\n<li>\r\n<p>Pemrograman JavaScript Document Object Model, disini kita akan belajar bagaimana interaksi antara javascript dan html dan juga css, sehingga bisa membuat halaman web lebih kaya akan interaksi</p>\r\n</li>\r\n<li>\r\n<p>Pemrograman JavaScript Async, disini kita akan belajar bagaimana asynchronous programming di javascript, seperti mengambil data dari server, dan lain-lain</p>\r\n</li>\r\n<li>\r\n<p>Pemrograman JavaScript Web API, kita akan bahas banyak web api yang tersedia di javascript</p>\r\n</li>\r\n<li>\r\n<p>Studi Kasus&nbsp;Menggunakan JavaScript, dan course ini akan dilengkapi banyak studi kasus</p>\r\n</li>\r\n</ul>\r\n<p>Materi akan selalu di update secara berkala, dan ketika materi di update, harga course pun akan diupdate dengan harga baru. Jadi pastikan untuk secepatnya membeli course ini, makin cepat, makin murah harga pembelian course ini.</p>\r\n<p>Course ini juga didukung dengan private group DISCORD sehingga kita bisa berdiskusi sesama member ketika terjadi masalah di course ini.</p>\r\n<p>Fokus pemrograman JavaScript ini akan mengarah ke frontend, sedangkan untuk materi javascript backend akan dibuat dalam course terpisah dengan tema NodeJS.</p>','upload/course/video/1709788507.mp4','Beginner','9','10','Yes',500000,129000,'Programmer Pemula yang Ingin Belajar HTML\r\nProgrammer Pemula yang Ingin Belajar CSS\r\nProgrammer Pemula yang Ingin Belajar Pemrograman JavaScript','1','1','1',1,'2024-03-06 22:15:07','2024-03-13 11:36:42'),(22,12,20,2,'upload/course/thumbnail/1792844074457482.png','How to Use Leadership Styles Effectively: Matched Leadership','How to Use Leadership Styles Effectively: Matched Leadership','how-to-use-leadership-styles-effectively:-matched-leadership','<p>In this course I will walk you through how you can effectively use and match four different leadership styles.</p>\r\n<p>Throughout the years I have seen so many leaders waste their time and talent by not matching their leadership style effectively, resulting in high costs, both financially as well as health and relationship wise.</p>\r\n<p>Through clearly explained videos and downloadable materials I will walk you through step by step how to identify the different competence levels of your followers and match your leadership effectively.</p>','upload/course/video/1709789347.mp4','Middle','1','8','Yes',349000,129000,'People who are leaders, either in a formal position of a manager or in informal circumstance\r\nThis course is for leaders in businesses, non-profits or other types of organisations\r\nIf you do not lead, or wish to lead, one or more people in some way, then this is not a course for you','1',NULL,NULL,1,'2024-03-06 22:29:07','2024-03-13 11:36:42'),(23,13,16,2,'upload/course/thumbnail/1792844763784728.jpeg','Learn Figma UI UX Design Essential Training','Learn Figma UI UX Design Essential Training','learn-figma-ui-ux-design-essential-training','<p>Figma is a very powerful application that runs online. There are virtually no platform boundaries when it comes to using figma because you can design within a web browser or using their desktop application made for windows and macs. Figma&nbsp;is similar to Sketch and Adobe XD but is the more powerful of the three when it comes to team collaboration and responsive, fast paced design.&nbsp;</p>\r\n<p>This course will cover user interface designing using the powerful tools within Figma.&nbsp;In the first section, I\'ll cover the Figma interface and where you can find powerful tools like constraints to make your designs responsive, and components to build a library of design elements to use throughout your projects. I\'ll also go over real-time team collaboration and how you can use figma to work closely with others in the same project.</p>\r\n<p>Later on I will guide you through designing and prototyping a \"Chef\'s Recipes\" App which will include multiple artboards, custom icon designs, editing images and text, and everything else you need to create a polished realistic design.</p>\r\n<p>Please join me as a beginner in design or as a seasoned UI/UX designer wanting to switch from other tools like Sketch or Adobe XD</p>','upload/course/video/1709790004.mp4','Beginner','3','7','Yes',329000,160000,'User Interface designers\r\nWeb Designers\r\nGraphic Designers\r\nUX Designers\r\nBeginners looking to get into the UI/UX field',NULL,'1','1',1,'2024-03-06 22:40:04','2024-03-13 11:36:41'),(24,14,3,2,'upload/course/thumbnail/1792845813564384.jpeg','Corporate Finance Analyst (CFA)','Corporate Finance Analyst (CFA)','corporate-finance-analyst-(cfa)','<p>Embark on a comprehensive journey through the essentials and advanced concepts of&nbsp;<strong>Corporate Finance</strong>&nbsp;with our meticulously designed course. This curriculum is tailored for aspiring&nbsp;<strong>corporate finance analysts</strong>, financial professionals, and anyone keen on navigating the complex world of finance with ease and expertise.</p>\r\n<p>Dive deep into what sets&nbsp;<strong>Corporate Finance</strong>&nbsp;apart, exploring its unique landscape and the pivotal role it plays in shaping businesses. From the foundational tales of finance to sophisticated&nbsp;<strong>risk management</strong>&nbsp;strategies, this course covers the full spectrum of corporate finance essentials. You\'ll learn how to craft compelling narratives for financial backing, master&nbsp;<strong>financial statements</strong>, and balance the intricacies of&nbsp;<strong>income</strong>&nbsp;and&nbsp;<strong>cash flow management</strong>.</p>','upload/course/video/1709791005.mp4','Middle','40','18','Yes',799000,229000,'Aspiring finance analysts seeking a career in corporate finance\r\nBusiness students wanting to deepen their finance knowledge\r\nProfessionals in finance needing to upgrade their skills\r\nEntrepreneurs looking to understand finance for business decisions\r\nNon-finance managers aiming to learn financial analysis\r\nAnyone interested in the financial workings of companies','1','1','1',1,'2024-03-06 22:56:45','2024-03-13 11:36:41'),(25,14,13,2,'upload/course/thumbnail/1792846174486883.jpg','Crypto Condensed: The Complete Guide To Bitcoin','Crypto Condensed: The Complete Guide To Bitcoin','crypto-condensed:-the-complete-guide-to-bitcoin','<p>Crypto Condensed&trade;: The Complete Guide To Bitcoin - is the only online course that lets you learn about Bitcoin right from the grassroots level, to actually getting involved with it by getting some Bitcoin of your own.</p>\r\n<p><strong>More About The Complete Bitcoin Course</strong></p>\r\n<p>You will be gaining a whole host of practical experience with Bitcoin, as well as theoretical within this course, and that&rsquo;s going to start from the very first section. So you&rsquo;ll be jumping straight into the deep end within the first part of this course.</p>','upload/course/video/1709791349.mp4','Advance','6','5','Yes',249000,119000,'Anyone Who Wants To Get Involved With Bitcoin Practically, As Well As Theoretically And Learn Further About How This Cryptocurrency Works.\r\nAs Bitcoin Is A Globally Based Currency You Can Be From Any Country, Of Any Age, And Any Ability To Gain Maximum Value From This Course.\r\nThis Course Is Targeted Towards Newbies In The Bitcoin Field, And Those Who Wish To Expand Their Knowledge Further On Bitcoin.',NULL,NULL,'1',1,'2024-03-06 23:02:29','2024-03-13 11:36:55'),(26,15,8,2,'upload/course/thumbnail/1792847038925995.jpeg','Entrepreneurship and Business Life Coach Certification','Entrepreneurship and Business Life Coach Certification','entrepreneurship-and-business-life-coach-certification','<p>Students who complete this course will receive an official life coach CERTIFICATION from Transformation Academy. This course is also accredited&nbsp;by a internationally recognized the Continuing Professional Development Standards Agency (Provider No: 50134), and 20 CPD or CEU credits are available upon request. Details for how to request the official certification and optional 20 CPD/CEU credits will be provided at the end of the course.</p>','upload/course/video/1709792174.mp4','Advance','11','9','Yes',599000,169000,'You are (or want to be) a business or entrepreneurship life coach\r\nLife coach who wants to help start-up or existing businesses implement a new business idea quickly\r\nLife coach who wants to help employees break free from the corporate rate race\r\nLife coach who wants to coach indiepreneurs or small businesses to make more money\r\nLife coach who wants to help heart-centered small business owners who want to make money while making a difference in the world\r\nYou are en entrepreneur or business owner who wants to coach others to start or grow their business','1',NULL,'1',1,'2024-03-06 23:16:14','2024-03-13 11:36:55'),(27,15,9,2,'upload/course/thumbnail/1792847749521139.jpeg','Fundamentals of Analyzing Real Estate Investments','Fundamentals of Analyzing Real Estate Investments','fundamentals-of-analyzing-real-estate-investments','<p>Welcome to&nbsp;<strong><em>Fundamentals of Analyzing Real Estate Investments</em></strong><em>,</em>&nbsp;my practical course on how to use professional techniques to evaluate investment opportunities in real estate. This course has been propelling students from total beginners to confident practitioners in a matter of weeks.</p>','upload/course/video/1709792852.mp4','Beginner','18','18','Yes',899000,229000,'Newbie real estate investors\r\nExperienced commercial and/or residential real estate investors\r\nPeople that want to invest in House Flips, Rental Properties or Apartments\r\nThose that want to invest in commercial warehouses, parking lots, retail properties, etc...\r\nGreat for private investors and investment teams\r\nReal Estate Agents Seeking Tools to Appeal to Investor Audience\r\nThose who want to make BANK with Airbnb\r\nMBA Students, iBankers, Financial Analysts\r\nSomeone who wants an in depth and broad coverage of real estate investment analysis concepts and techniques','1','1','1',1,'2024-03-06 23:27:32','2024-03-13 11:36:40'),(28,16,21,2,'upload/course/thumbnail/1792848346149506.jpg','Social Media For Business Strategy','Social Media For Business Strategy','social-media-for-business-strategy','<p><strong>In today\'s digital age, businesses are facing a challenge in connecting with their tech-savvy customers through social media.</strong></p>\r\n<p>However, with the right tools and knowledge, businesses can not only stay relevant but also thrive in this environment. Social Media Marketing is a powerful tool that can provide businesses with valuable customer data and flexible marketing platforms to stay ahead of their competitors.</p>','upload/course/video/1709793421.mp4','Beginner','7','6','Yes',399000,129000,'Internet Marketers\r\nProfessional Marketers\r\nBusiness Owners\r\nCMO\r\nDigital Start Up','1','1','1',1,'2024-03-06 23:37:01','2024-03-13 11:37:49'),(29,16,22,2,'upload/course/thumbnail/1792848779042643.jpg','SEO Training Masterclass 2024: Beginner To Advanced SEO','SEO Training Masterclass 2024: Beginner To Advanced SEO','seo-training-masterclass-2024:-beginner-to-advanced-seo','<p><strong><em>Do better SEO than your competitors or any freelancer! Get SEO&nbsp;traffic that fuels your business growth!</em></strong></p>\r\n<p><strong><em>Updated almost every month with the latest Google search&nbsp;developments.</em></strong></p>\r\n<p><em>LATEST&nbsp;Updates:</em>&nbsp;</p>\r\n<ul>\r\n<li>\r\n<p><em>Most recent big changes in Google SEO&nbsp;algorithm</em></p>\r\n</li>\r\n<li>\r\n<p><em>Site speed case study where I show how to get a fast boost in rankings</em></p>\r\n</li>\r\n<li>\r\n<p><em>How to use authoritative SEO sites to rank</em></p>\r\n</li>\r\n<li>\r\n<p><em>Write better headlines that increase click-through rates with WordPress SEO and Shopify SEO</em></p>\r\n</li>\r\n<li>\r\n<p><em>Use social media to boost the SEO rankings of your web pages</em></p>\r\n</li>\r\n<li>\r\n<p><em>Weglot multilingual SEO plugin that will automatically translate your site to 100+&nbsp;languages so you can rank in SEO in for hundreds of more keywords</em></p>\r\n</li>\r\n<li>\r\n<p><em>Google trends for additional keyword research</em></p>\r\n</li>\r\n<li>\r\n<p><em>SEO&nbsp;article writing and SEO&nbsp;copywriting for writing SEO content as a freelancer</em></p>\r\n</li>\r\n</ul>\r\n<p>Learn the SEO strategies I used to reach over a million people by combining SEO with social media, publicity, and using savvy techniques to side-step competition and get lots of traffic to my products!&nbsp;</p>\r\n<p>This course is meant to make you strong at SEO and inbound marketing. In the course, I share knowledge from my 10+ years of doing SEO for various websites and helping many entrepreneurs learn SEO.&nbsp;I\'ll also share the latest SEO industry developments and Google search algorithm updates.</p>','upload/course/video/1709793833.mp4','Beginner','18','6','Yes',599000,129000,'Entrepreneurs, bloggers and website owners who want to grow through SEO\r\nPeople learning WordPress SEO or Shopify SEO\r\nSEO freelancers\r\nPeople who want to learn the latest Google trends','1','1','1',1,'2024-03-06 23:43:53','2024-03-13 11:37:49');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_02_21_015958_create_categories_table',1),(6,'2024_02_22_071203_create_sub_categories_table',1),(7,'2024_02_23_084812_create_courses_table',1),(8,'2024_02_23_090050_create_course_goals_table',1),(9,'2024_03_01_034929_create_course_sections_table',1),(10,'2024_03_01_035001_create_course_lectures_table',1),(11,'2024_03_08_070114_create_wishlists_table',2),(12,'2024_03_13_201757_create_coupons_table',3),(13,'2024_03_18_073432_create_payments_table',4),(14,'2024_03_18_073454_create_orders_table',4),(15,'2024_03_19_082502_create_smtp_settings_table',5),(16,'2024_04_17_073647_create_questions_table',6),(17,'2024_05_15_082252_create_reviews_table',7),(18,'2024_05_21_035251_create_blog_categories_table',8),(19,'2024_05_21_050456_create_blog_posts_table',9),(20,'2024_05_30_075738_create_notifications_table',10),(21,'2024_05_31_081609_create_site_settings_table',11),(22,'2024_06_11_085020_create_chat_messages_table',12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',10),(3,'App\\Models\\User',11),(1,'App\\Models\\User',12),(1,'App\\Models\\User',14),(1,'App\\Models\\User',15),(1,'App\\Models\\User',17),(1,'App\\Models\\User',19),(1,'App\\Models\\User',20),(2,'App\\Models\\User',1),(3,'App\\Models\\User',18);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('1ad2327d-77b9-4ad2-a5da-b538ee77ec1a','App\\Notifications\\OrderComplete','App\\Models\\User',6,'{\"message\":\"New COD Enrollment In Course\"}',NULL,'2024-05-30 01:24:43','2024-05-30 01:24:43'),('305a7bba-0b56-4709-9fcb-e0ef92ae3638','App\\Notifications\\OrderComplete','App\\Models\\User',6,'{\"message\":\"New COD Enrollment In Course\"}',NULL,'2024-05-30 01:16:30','2024-05-30 01:16:30'),('984c4c70-e1ee-4856-9bb4-c92e19eb26d7','App\\Notifications\\OrderComplete','App\\Models\\User',2,'{\"message\":\"New COD Enrollment In Course\"}','2024-05-30 01:41:09','2024-05-30 01:16:30','2024-05-30 01:41:09'),('cc2007f9-a1f0-41b5-9cd0-4b756a79a2f1','App\\Notifications\\OrderComplete','App\\Models\\User',2,'{\"message\":\"New COD Enrollment In Course\"}','2024-05-30 01:42:00','2024-05-30 01:24:43','2024-05-30 01:42:00');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  `course_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (86,88,3,29,2,'SEO Training Masterclass 2024: Beginner To Advanced SEO','129000',NULL,NULL),(87,89,3,28,2,'Social Media For Business Strategy','129000','2024-05-30 01:16:22','2024-05-30 01:16:22'),(88,90,3,27,2,'Fundamentals of Analyzing Real Estate Investments','229000','2024-05-30 01:24:37','2024-05-30 01:24:37');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_delivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (88,'User','user@lms.com','628123456789','Jl. Kenanga',NULL,'129000','Midtrans Payment','MID25225070','17 May 2024','May','2024','pending','2024-05-17 00:49:34',NULL),(89,'User','user@lms.com','628123456789','Jl. Kenanga','handcash','129000','Direct Payment','EOS84846616','30 May 2024','May','2024','pending','2024-05-30 01:16:22','2024-05-30 01:16:22'),(90,'User','user@lms.com','628123456789','Jl. Kenanga','handcash','229000','Direct Payment','EOS40490910','30 May 2024','May','2024','pending','2024-05-30 01:24:37','2024-05-30 01:24:37');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (2,'category.all','web','Category','2024-06-02 01:54:55','2024-06-02 01:54:55'),(3,'category.menu','web','Category','2024-06-03 00:36:47','2024-06-03 00:36:47'),(4,'subcategory.all','web','Category','2024-06-03 01:17:55','2024-06-03 01:17:55'),(5,'subcategory.menu','web','Category','2024-06-03 01:17:55','2024-06-03 01:17:55'),(6,'instructor.all','web','Instructor','2024-06-03 01:27:06','2024-06-03 01:27:06'),(7,'instructor.menu','web','Instructor','2024-06-03 01:27:06','2024-06-03 01:27:06'),(8,'courses.all','web','Courses','2024-06-03 01:27:06','2024-06-03 01:27:06'),(9,'courses.menu','web','Courses','2024-06-03 01:27:06','2024-06-03 01:27:06'),(10,'category.add','web','Category','2024-06-03 23:30:45','2024-06-03 23:30:45'),(11,'category.edit','web','Category','2024-06-03 23:30:45','2024-06-03 23:30:45'),(12,'category.delete','web','Category','2024-06-03 23:30:45','2024-06-03 23:30:45'),(13,'subcategory.add','web','Category','2024-06-03 23:30:45','2024-06-03 23:30:45'),(14,'subcategory.edit','web','Category','2024-06-03 23:30:45','2024-06-03 23:30:45'),(15,'subcategory.delete','web','Category','2024-06-03 23:30:45','2024-06-03 23:30:45'),(16,'coupon.all','web','Coupon','2024-06-03 23:30:45','2024-06-03 23:30:45'),(17,'coupon.menu','web','Coupon','2024-06-03 23:30:45','2024-06-03 23:30:45'),(18,'coupon.add','web','Coupon','2024-06-03 23:30:45','2024-06-03 23:30:45'),(19,'coupon.edit','web','Coupon','2024-06-03 23:30:45','2024-06-03 23:30:45'),(20,'coupon.delete','web','Coupon','2024-06-03 23:30:45','2024-06-03 23:30:45'),(21,'setting.all','web','Setting','2024-06-03 23:30:45','2024-06-03 23:30:45'),(22,'setting.menu','web','Setting','2024-06-03 23:30:45','2024-06-03 23:30:45'),(23,'setting.smtp','web','Setting','2024-06-03 23:30:45','2024-06-03 23:30:45'),(24,'setting.site','web','Setting','2024-06-03 23:30:45','2024-06-03 23:30:45'),(25,'order.all','web','Orders','2024-06-03 23:30:45','2024-06-03 23:30:45'),(26,'order.menu','web','Orders','2024-06-03 23:30:45','2024-06-03 23:30:45'),(27,'order.pending','web','Orders','2024-06-03 23:30:45','2024-06-03 23:30:45'),(28,'order.confirm','web','Orders','2024-06-03 23:30:45','2024-06-03 23:30:45'),(29,'report.menu','web','Report','2024-06-03 23:30:45','2024-06-03 23:30:45'),(30,'review.all','web','Review','2024-06-03 23:30:45','2024-06-03 23:30:45'),(31,'review.menu','web','Review','2024-06-03 23:30:45','2024-06-03 23:30:45'),(32,'review.pending','web','Review','2024-06-03 23:30:45','2024-06-03 23:30:45'),(33,'review.active','web','Review','2024-06-03 23:30:45','2024-06-03 23:30:45'),(34,'all.user.all','web','All User','2024-06-03 23:30:45','2024-06-03 23:30:45'),(35,'all.user.menu','web','All User','2024-06-03 23:30:45','2024-06-03 23:30:45'),(36,'all.user.instructor','web','All User','2024-06-03 23:30:45','2024-06-03 23:30:45'),(37,'all.user.user','web','All User','2024-06-03 23:30:45','2024-06-03 23:30:45'),(38,'blog.all','web','Blog','2024-06-03 23:30:45','2024-06-03 23:30:45'),(39,'blog.menu','web','Blog','2024-06-03 23:30:45','2024-06-03 23:30:45'),(40,'blog.category.add','web','Blog','2024-06-03 23:30:45','2024-06-03 23:30:45'),(41,'blog.category.edit','web','Blog','2024-06-03 23:30:45','2024-06-03 23:30:45'),(42,'blog.category.delete','web','Blog','2024-06-03 23:30:45','2024-06-03 23:30:45'),(43,'blog.post.add','web','Blog','2024-06-03 23:30:45','2024-06-03 23:30:45'),(44,'blog.post.edit','web','Blog','2024-06-03 23:30:45','2024-06-03 23:30:45'),(45,'blog.post.delete','web','Blog','2024-06-03 23:30:45','2024-06-03 23:30:45'),(46,'role.permission.all','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(47,'role.permission.menu','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(48,'permission.add','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(49,'permission.edit','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(50,'permission.delete','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(51,'role.add','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(52,'role.edit','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(53,'role.delete','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(54,'permission.import','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(55,'permission.export','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(56,'role.import','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45'),(57,'role.export','web','Role and Permission','2024-06-03 23:30:45','2024-06-03 23:30:45');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `question` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,23,3,2,NULL,'i need help','why my application has errors?','2024-04-17 00:58:11',NULL),(2,23,3,2,NULL,'help me','my video can\'t displayed please help!','2024-04-17 01:00:55',NULL),(3,23,3,2,2,NULL,'tell me more detail about this issues','2024-04-17 02:34:09',NULL),(5,23,3,2,1,NULL,'give me your email address','2024-04-17 03:11:44',NULL),(6,23,3,2,2,NULL,'hahaha','2024-05-13 23:05:53',NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructor_id` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_course_id_foreign` (`course_id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,29,3,'Great!!!','5',2,'1','2024-05-15 02:13:53',NULL),(2,29,3,'good','4',2,'1','2024-05-15 02:14:20',NULL),(3,29,3,'oke','3',2,'1','2024-05-15 02:14:32',NULL),(4,29,3,'bad','2',2,'0','2024-05-15 02:14:45','2024-05-17 02:24:01'),(5,29,3,'very very badddd!!!!!!!!','1',2,'0','2024-05-15 02:14:59','2024-05-17 02:23:31'),(6,26,3,'sangat membantu','4',2,'1','2024-05-16 01:43:49',NULL),(7,29,3,'very good','5',2,'1','2024-05-17 01:12:27',NULL),(8,29,3,'ok','3',2,'1','2024-05-17 01:14:26',NULL),(9,29,3,'good','4',2,'1','2024-05-17 01:14:42',NULL),(10,29,3,'great','5',2,'1','2024-05-17 01:15:33',NULL),(11,29,3,'asd','5',2,'1','2024-05-17 01:15:43',NULL),(12,29,3,'asdasd','5',2,'1','2024-05-17 01:16:04',NULL),(13,29,3,'qwe','4',2,'1','2024-05-17 01:16:18',NULL),(14,29,3,'qweqew','4',2,'1','2024-05-17 01:16:28',NULL),(15,29,3,'qwewer','3',2,'1','2024-05-17 01:16:38',NULL),(16,29,3,'qwe','5',2,'1','2024-05-17 01:16:49','2024-05-17 02:23:50'),(17,29,3,'qwe','4',2,'1','2024-05-17 01:16:57','2024-05-17 02:23:49'),(18,29,3,'qwezxc','3',2,'1','2024-05-17 01:17:15','2024-05-17 02:23:48'),(19,29,3,'zxczc','2',2,'0','2024-05-17 01:17:24',NULL),(20,28,3,'greaddddd','5',2,'1','2024-05-17 01:22:34','2024-05-17 02:19:04');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (2,3),(3,3),(4,3),(5,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(6,3),(7,3),(8,3),(9,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(33,3),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(45,3),(2,2),(3,2),(4,2),(5,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(6,2),(7,2),(8,2),(9,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(25,6),(26,6),(27,6),(28,6),(29,6),(30,6),(31,6),(32,6),(33,6),(38,6),(39,6),(40,6),(41,6),(42,6),(43,6),(44,6),(45,6),(2,1),(3,1),(4,1),(5,1),(10,1),(11,1),(13,1),(14,1),(6,1),(7,1),(8,1),(9,1),(16,1),(17,1),(18,1),(19,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(38,1),(39,1),(40,1),(41,1),(43,1),(44,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Manager','web','2024-06-03 02:03:46','2024-06-03 02:03:46'),(2,'Super Admin','web','2024-06-03 02:04:36','2024-06-03 02:04:36'),(3,'Admin','web','2024-06-03 02:04:42','2024-06-03 02:04:42'),(6,'Support','web','2024-06-03 02:25:04','2024-06-03 02:25:04');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'upload/logo/1800822953775491.jpeg','08123456789','support@lms.com','Bekasi, Jawa Barat, Indonesia','https://www.instagram.com/','https://github.com/','┬⌐ 2024 Lim LMS.',NULL,'2024-06-03 00:09:59');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smtp_settings`
--

DROP TABLE IF EXISTS `smtp_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smtp_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mailer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encryption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smtp_settings`
--

LOCK TABLES `smtp_settings` WRITE;
/*!40000 ALTER TABLE `smtp_settings` DISABLE KEYS */;
INSERT INTO `smtp_settings` VALUES (1,'smtp','sandbox.smtp.mailtrap.io','2525','2a7c3664c3f206','1ed2b747b096e5','tls','support@lms.com',NULL,'2024-03-19 02:12:11');
/*!40000 ALTER TABLE `smtp_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `subcategory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (3,14,'Accounting','accounting',NULL,'2024-02-21 18:36:02'),(4,9,'Web Development','web-development',NULL,NULL),(5,9,'Mobile Apps','mobile-apps',NULL,NULL),(6,9,'Game Development','game-development',NULL,NULL),(7,15,'Finance','finance',NULL,NULL),(8,15,'Enterpreneurship','enterpreneurship',NULL,NULL),(9,15,'Real Eastate','real-eastate',NULL,NULL),(10,11,'IT Certification','it-certification',NULL,NULL),(11,11,'Hardware','hardware',NULL,NULL),(12,11,'Network and Security','network-and-security',NULL,NULL),(13,14,'Cryptocurrency','cryptocurrency',NULL,NULL),(14,14,'Blockchain','blockchain',NULL,NULL),(15,13,'Graphic Design','graphic-design',NULL,NULL),(16,13,'Web Design','web-design',NULL,NULL),(17,13,'Design Tools','design-tools',NULL,NULL),(18,12,'Personal Transformation','personal-transformation',NULL,NULL),(19,12,'Productivity','productivity',NULL,NULL),(20,12,'Leadership','leadership',NULL,NULL),(21,16,'Digital Marketing','digital-marketing',NULL,NULL),(22,16,'Search Engine Optimation','search-engine-optimation',NULL,NULL),(23,16,'Social Media Marketing','social-media-marketing',NULL,NULL);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','instructor','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `last_login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','superadmin','superadmin@lms.com',NULL,'$2y$12$pb/8he2YBx5AEO3LVCZkq.f8eg6tu5NQaeLCV0IQa4sKh7uYs/4DW','202402190545avatar-3.png','6281122334455','Jl. Baru','admin','1','2024-06-12 07:39:38',NULL,'2024-02-14 20:44:22','2024-06-12 00:39:38'),(2,'Instructor','instructor','instructor@lms.com',NULL,'$2y$12$xWQlYqsRQf/QXrLyOkE5suyO6UzLYos.Jba87UazZeGnqITtSqy3S','202402190640avatar-2.png','62812345678','Jl. Lama banget','instructor','1','2024-06-13 08:35:44',NULL,'2024-02-14 20:44:22','2024-06-13 01:35:44'),(3,'User','user','user@lms.com',NULL,'$2y$12$BuWNxiRvI7OjtVnB0eRtUOnMaAuIxATIOv2XReu1NhK9Ib6I2Ym1O','202406130352avatar-1.png','628123456789','Jl. Kenanga','user','1','2024-06-13 08:32:24',NULL,'2024-02-14 20:44:22','2024-06-13 01:32:24'),(4,'lim',NULL,'lim@lms.com',NULL,'$2y$12$wHN.aJdX01HPmL7uS/yqpePsMCaxjrAmu7.n88lI91hdUY1yZ8J1S',NULL,NULL,NULL,'user','1','',NULL,'2024-02-14 20:44:22','2024-02-14 20:44:22'),(5,'Sal',NULL,'sal@lms.com',NULL,'$2y$12$ZwNJCENPHhmhVLKpGswh1.NMuGRbngXiOOrMHBb.o/vP9KDupuA16',NULL,NULL,NULL,'user','1','',NULL,'2024-02-18 19:24:33','2024-02-18 19:24:33'),(6,'Rama','rama','rama@lms.com',NULL,'$2y$12$/7V1eCU6sSYDTDDbALXr3uIlbUahZ7U4BpzUzBQZEZ3wF6OPCk6D2',NULL,'62111222333','Jl. Indo','instructor','1','',NULL,'2024-02-18 19:24:33','2024-05-17 02:06:37'),(18,'Admin','admin','admin@lms.com',NULL,'$2y$12$xghN.E6fMa9kY8CM3kaxMeIdNLIIQEIHfnNCVmxEiy.ZtUOx4ctt.',NULL,'56423181','Jakarta Timur, Jakarta, Indonesia','admin','1','2024-06-13 08:35:53',NULL,'2024-06-05 02:32:53','2024-06-13 01:35:53'),(19,'Manager','manager','manager@lms.com',NULL,'$2y$12$WLOT0CHqcuZZhnJ4F9Pb4.IxdfPrc9Pdp/MeLML9sStZxJ5HM/VQ6',NULL,'8523389','Jakarta Timur, Jakarta, Indonesia','admin','1','2024-06-07 09:02:44',NULL,'2024-06-05 02:35:22','2024-06-07 02:02:44'),(20,'Udemy','udemy@lms.com','udemy@lms.com',NULL,'$2y$12$SYIUF1oLdjeFBI4o.JDZ2OiIIXt8vRRIbnr5e9Li24cN/kvLAKAMC',NULL,'321564982','Jakarta Timur, Jakarta, Indonesia','admin','1','2024-06-07 07:54:04',NULL,'2024-06-07 00:12:43','2024-06-07 00:54:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (13,3,14,'2024-03-11 01:23:15',NULL),(27,3,23,'2024-03-12 00:35:15',NULL),(28,3,29,'2024-03-12 21:48:22',NULL);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-13 15:38:30
