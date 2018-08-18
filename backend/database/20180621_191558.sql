-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "user_roles" -------------------------------
-- CREATE TABLE "user_roles" -----------------------------------
CREATE TABLE `user_roles` ( 
	`user_id` Int( 10 ) UNSIGNED NOT NULL,
	`role_id` Int( 10 ) UNSIGNED NOT NULL,
	PRIMARY KEY ( `user_id`, `role_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "user_roles" -------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "user_roles_role_id_index" -----------------
-- CREATE INDEX "user_roles_role_id_index" ---------------------
CREATE INDEX `user_roles_role_id_index` USING BTREE ON `user_roles`( `role_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "user_roles_user_id_index" -----------------
-- CREATE INDEX "user_roles_user_id_index" ---------------------
CREATE INDEX `user_roles_user_id_index` USING BTREE ON `user_roles`( `user_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "nsync_stores" -----------------------------
-- CREATE TABLE "nsync_stores" ---------------------------------
CREATE TABLE `nsync_stores` ( 
	`id` Int( 11 ) NOT NULL,
	`marketplace_id` Int( 11 ) NULL,
	`status` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "nsync_stores" -----------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_stores_marketplaces_1" -----------------
-- CREATE INDEX "fk_stores_marketplaces_1" ---------------------
CREATE INDEX `fk_stores_marketplaces_1` USING BTREE ON `nsync_stores`( `marketplace_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "users" ------------------------------------
-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`role_id` Int( 10 ) UNSIGNED NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`avatar` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'users/default.png',
	`password` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`status` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`marketplace` Int( 11 ) NULL,
	`store_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`remember_token` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`settings` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `users_email_unique` UNIQUE( `email` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
INSERT INTO `users`(`id`,`role_id`,`name`,`email`,`avatar`,`password`,`status`,`marketplace`,`store_name`,`remember_token`,`settings`,`created_at`,`updated_at`) VALUES ( '1', '1', 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$AAs9xSAem254ag3LugczG.eT92hxG4bSMPVzt7DeEEIQg3IXWmyn2', NULL, NULL, NULL, 'GLGDEwAljGrIsor6ji6z3LwGT4j5jTq5ZCftPTyYpu7OhqMrr4p1UsgUvmgG', NULL, '2018-06-21 19:52:48', '2018-06-21 19:52:48' );
INSERT INTO `users`(`id`,`role_id`,`name`,`email`,`avatar`,`password`,`status`,`marketplace`,`store_name`,`remember_token`,`settings`,`created_at`,`updated_at`) VALUES ( '2', '2', 'demo-nwadigital', 'interno@nwa.digital', 'users/default.png', '$2y$10$U3PovVugOcCYHP2qSkQHP.JwC.1MAH3AGDs3v.yUAZOw8fFUMDvim', '1', '1', 'Tienda Nube', NULL, NULL, '2018-06-21 20:17:40', '2018-06-21 20:17:40' );
-- ---------------------------------------------------------


-- CREATE INDEX "users_role_id_foreign" --------------------
-- CREATE INDEX "users_role_id_foreign" ------------------------
CREATE INDEX `users_role_id_foreign` USING BTREE ON `users`( `role_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "data_types" -------------------------------
-- CREATE TABLE "data_types" -----------------------------------
CREATE TABLE `data_types` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`slug` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`display_name_singular` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`display_name_plural` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`icon` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`model_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`policy_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`controller` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`description` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`generate_permissions` TinyInt( 1 ) NOT NULL DEFAULT '0',
	`server_side` TinyInt( 4 ) NOT NULL DEFAULT '0',
	`details` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `data_types_name_unique` UNIQUE( `name` ),
	CONSTRAINT `data_types_slug_unique` UNIQUE( `slug` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "data_types" -------------------------------
INSERT INTO `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) VALUES ( '1', 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', '1', '0', NULL, '2018-06-21 19:52:27', '2018-06-21 19:52:27' );
INSERT INTO `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) VALUES ( '2', 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', '1', '0', NULL, '2018-06-21 19:52:27', '2018-06-21 19:52:27' );
INSERT INTO `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) VALUES ( '3', 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', '1', '0', NULL, '2018-06-21 19:52:27', '2018-06-21 19:52:27' );
INSERT INTO `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) VALUES ( '4', 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', '1', '0', NULL, '2018-06-21 19:52:45', '2018-06-21 19:52:45' );
INSERT INTO `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) VALUES ( '5', 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', '1', '0', NULL, '2018-06-21 19:52:48', '2018-06-21 19:52:48' );
INSERT INTO `data_types`(`id`,`name`,`slug`,`display_name_singular`,`display_name_plural`,`icon`,`model_name`,`policy_name`,`controller`,`description`,`generate_permissions`,`server_side`,`details`,`created_at`,`updated_at`) VALUES ( '6', 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', '1', '0', NULL, '2018-06-21 19:52:52', '2018-06-21 19:52:52' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "posts" ------------------------------------
-- CREATE TABLE "posts" ----------------------------------------
CREATE TABLE `posts` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`author_id` Int( 11 ) NOT NULL,
	`category_id` Int( 11 ) NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`seo_title` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`excerpt` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`body` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`image` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`slug` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`meta_description` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`meta_keywords` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`status` Enum( 'PUBLISHED', 'DRAFT', 'PENDING' ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
	`featured` TinyInt( 1 ) NOT NULL DEFAULT '0',
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `posts_slug_unique` UNIQUE( `slug` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "posts" ------------------------------------
INSERT INTO `posts`(`id`,`author_id`,`category_id`,`title`,`seo_title`,`excerpt`,`body`,`image`,`slug`,`meta_description`,`meta_keywords`,`status`,`featured`,`created_at`,`updated_at`) VALUES ( '1', '0', NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', '0', '2018-06-21 19:52:51', '2018-06-21 19:52:51' );
INSERT INTO `posts`(`id`,`author_id`,`category_id`,`title`,`seo_title`,`excerpt`,`body`,`image`,`slug`,`meta_description`,`meta_keywords`,`status`,`featured`,`created_at`,`updated_at`) VALUES ( '2', '0', NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>
                <h2>We can use all kinds of format!</h2>
                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', '0', '2018-06-21 19:52:51', '2018-06-21 19:52:51' );
INSERT INTO `posts`(`id`,`author_id`,`category_id`,`title`,`seo_title`,`excerpt`,`body`,`image`,`slug`,`meta_description`,`meta_keywords`,`status`,`featured`,`created_at`,`updated_at`) VALUES ( '3', '0', NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', '0', '2018-06-21 19:52:51', '2018-06-21 19:52:51' );
INSERT INTO `posts`(`id`,`author_id`,`category_id`,`title`,`seo_title`,`excerpt`,`body`,`image`,`slug`,`meta_description`,`meta_keywords`,`status`,`featured`,`created_at`,`updated_at`) VALUES ( '4', '0', NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>
<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>
<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', '0', '2018-06-21 19:52:51', '2018-06-21 19:52:51' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "data_rows" --------------------------------
-- CREATE TABLE "data_rows" ------------------------------------
CREATE TABLE `data_rows` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`data_type_id` Int( 10 ) UNSIGNED NOT NULL,
	`field` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`display_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`required` TinyInt( 1 ) NOT NULL DEFAULT '0',
	`browse` TinyInt( 1 ) NOT NULL DEFAULT '1',
	`read` TinyInt( 1 ) NOT NULL DEFAULT '1',
	`edit` TinyInt( 1 ) NOT NULL DEFAULT '1',
	`add` TinyInt( 1 ) NOT NULL DEFAULT '1',
	`delete` TinyInt( 1 ) NOT NULL DEFAULT '1',
	`details` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`order` Int( 11 ) NOT NULL DEFAULT '1',
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 56;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "data_rows" --------------------------------
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '1', '1', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '2', '1', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '2' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '3', '1', 'email', 'text', 'Email', '1', '1', '1', '1', '1', '1', '', '3' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '4', '1', 'password', 'password', 'Password', '1', '0', '0', '1', '1', '0', '', '4' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '5', '1', 'remember_token', 'text', 'Remember Token', '0', '0', '0', '0', '0', '0', '', '5' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '6', '1', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '0', '0', '0', '', '6' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '7', '1', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '7' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '8', '1', 'avatar', 'image', 'Avatar', '0', '1', '1', '1', '1', '1', '', '8' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '9', '1', 'user_belongsto_role_relationship', 'relationship', 'Role', '0', '1', '1', '1', '1', '0', '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0"}', '10' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '10', '1', 'user_belongstomany_role_relationship', 'relationship', 'Roles', '0', '1', '1', '1', '1', '0', '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', '11' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '11', '1', 'locale', 'text', 'Locale', '0', '1', '1', '1', '1', '0', '', '12' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '12', '2', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '13', '2', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '2' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '14', '2', 'created_at', 'timestamp', 'Created At', '0', '0', '0', '0', '0', '0', '', '3' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '15', '2', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '4' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '16', '3', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '17', '3', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '2' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '18', '3', 'created_at', 'timestamp', 'Created At', '0', '0', '0', '0', '0', '0', '', '3' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '19', '3', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '4' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '20', '3', 'display_name', 'text', 'Display Name', '1', '1', '1', '1', '1', '1', '', '5' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '21', '1', 'role_id', 'text', 'Role', '1', '1', '1', '1', '1', '1', '', '9' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '22', '4', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '23', '4', 'parent_id', 'select_dropdown', 'Parent', '0', '0', '1', '1', '1', '1', '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', '2' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '24', '4', 'order', 'text', 'Order', '1', '1', '1', '1', '1', '1', '{"default":1}', '3' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '25', '4', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '4' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '26', '4', 'slug', 'text', 'Slug', '1', '1', '1', '1', '1', '1', '{"slugify":{"origin":"name"}}', '5' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '27', '4', 'created_at', 'timestamp', 'Created At', '0', '0', '1', '0', '0', '0', '', '6' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '28', '4', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '7' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '29', '5', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '30', '5', 'author_id', 'text', 'Author', '1', '0', '1', '1', '0', '1', '', '2' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '31', '5', 'category_id', 'text', 'Category', '1', '0', '1', '1', '1', '0', '', '3' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '32', '5', 'title', 'text', 'Title', '1', '1', '1', '1', '1', '1', '', '4' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '33', '5', 'excerpt', 'text_area', 'Excerpt', '1', '0', '1', '1', '1', '1', '', '5' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '34', '5', 'body', 'rich_text_box', 'Body', '1', '0', '1', '1', '1', '1', '', '6' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '35', '5', 'image', 'image', 'Post Image', '0', '1', '1', '1', '1', '1', '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', '7' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '36', '5', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', '8' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '37', '5', 'meta_description', 'text_area', 'Meta Description', '1', '0', '1', '1', '1', '1', '', '9' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '38', '5', 'meta_keywords', 'text_area', 'Meta Keywords', '1', '0', '1', '1', '1', '1', '', '10' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '39', '5', 'status', 'select_dropdown', 'Status', '1', '1', '1', '1', '1', '1', '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', '11' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '40', '5', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '0', '0', '0', '', '12' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '41', '5', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '', '13' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '42', '5', 'seo_title', 'text', 'SEO Title', '0', '1', '1', '1', '1', '1', '', '14' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '43', '5', 'featured', 'checkbox', 'Featured', '1', '1', '1', '1', '1', '1', '', '15' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '44', '6', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '45', '6', 'author_id', 'text', 'Author', '1', '0', '0', '0', '0', '0', '', '2' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '46', '6', 'title', 'text', 'Title', '1', '1', '1', '1', '1', '1', '', '3' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '47', '6', 'excerpt', 'text_area', 'Excerpt', '1', '0', '1', '1', '1', '1', '', '4' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '48', '6', 'body', 'rich_text_box', 'Body', '1', '0', '1', '1', '1', '1', '', '5' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '49', '6', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', '6' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '50', '6', 'meta_description', 'text', 'Meta Description', '1', '0', '1', '1', '1', '1', '', '7' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '51', '6', 'meta_keywords', 'text', 'Meta Keywords', '1', '0', '1', '1', '1', '1', '', '8' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '52', '6', 'status', 'select_dropdown', 'Status', '1', '1', '1', '1', '1', '1', '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', '9' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '53', '6', 'created_at', 'timestamp', 'Created At', '1', '1', '1', '0', '0', '0', '', '10' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '54', '6', 'updated_at', 'timestamp', 'Updated At', '1', '0', '0', '0', '0', '0', '', '11' );
INSERT INTO `data_rows`(`id`,`data_type_id`,`field`,`type`,`display_name`,`required`,`browse`,`read`,`edit`,`add`,`delete`,`details`,`order`) VALUES ( '55', '6', 'image', 'image', 'Page Image', '0', '1', '1', '1', '1', '1', '', '12' );
-- ---------------------------------------------------------


-- CREATE INDEX "data_rows_data_type_id_foreign" -----------
-- CREATE INDEX "data_rows_data_type_id_foreign" ---------------
CREATE INDEX `data_rows_data_type_id_foreign` USING BTREE ON `data_rows`( `data_type_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_product_image" -------------------------
-- CREATE TABLE "tn_product_image" -----------------------------
CREATE TABLE `tn_product_image` ( 
	`id` Int( 11 ) NOT NULL,
	`tn_store_id` Int( 11 ) NULL,
	`product_id` Int( 11 ) NULL,
	`src` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`position` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`alt` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`created_at` DateTime NULL,
	`updated_at` DateTime NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_product_image" -------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_product_image_tn_products_1" --------
-- CREATE INDEX "fk_tn_product_image_tn_products_1" ------------
CREATE INDEX `fk_tn_product_image_tn_products_1` USING BTREE ON `tn_product_image`( `product_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "tn_store_id" ------------------------------
-- CREATE INDEX "tn_store_id" ----------------------------------
CREATE INDEX `tn_store_id` USING BTREE ON `tn_product_image`( `tn_store_id`, `product_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_products" ------------------------------
-- CREATE TABLE "tn_products" ----------------------------------
CREATE TABLE `tn_products` ( 
	`id` Int( 11 ) NOT NULL,
	`tn_store_id` Int( 11 ) NULL,
	`category_id` Int( 11 ) NULL,
	`mage_entity_id` Int( 11 ) NULL,
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`description` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`handle` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`published` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`free_shipping` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`seo_title` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`seo_description` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`brand` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	`tags` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`status` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_products" ------------------------------
INSERT INTO `tn_products`(`id`,`tn_store_id`,`category_id`,`mage_entity_id`,`name`,`description`,`handle`,`published`,`free_shipping`,`seo_title`,`seo_description`,`brand`,`created_at`,`updated_at`,`tags`,`status`) VALUES ( '17947844', '356557', NULL, NULL, 'Celulares Sin variantesbbbbbbbbb', 'No tiene descripción asociada', 'celulares-sin-variantesbbbbbbbbb', '1', '0', '', '', '', '2018-06-21 20:41:26', '2018-06-21 20:41:26', '', NULL );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_products_tn_categories_1" -----------
-- CREATE INDEX "fk_tn_products_tn_categories_1" ---------------
CREATE INDEX `fk_tn_products_tn_categories_1` USING BTREE ON `tn_products`( `category_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "tn_store_id" ------------------------------
-- CREATE INDEX "tn_store_id" ----------------------------------
CREATE INDEX `tn_store_id` USING BTREE ON `tn_products`( `tn_store_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_store" ---------------------------------
-- CREATE TABLE "tn_store" -------------------------------------
CREATE TABLE `tn_store` ( 
	`id` Int( 11 ) NOT NULL COMMENT 'Tienda Nube Store Id',
	`nsync_store_id` Int( 11 ) NULL,
	`token` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`app_status` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_store" ---------------------------------
INSERT INTO `tn_store`(`id`,`nsync_store_id`,`token`,`app_status`) VALUES ( '356557', NULL, '7054b1c871539e35db3e20ecfac5391100141357', '1' );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_store_stores_1" ---------------------
-- CREATE INDEX "fk_tn_store_stores_1" -------------------------
CREATE INDEX `fk_tn_store_stores_1` USING BTREE ON `tn_store`( `nsync_store_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "menus" ------------------------------------
-- CREATE TABLE "menus" ----------------------------------------
CREATE TABLE `menus` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `menus_name_unique` UNIQUE( `name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "menus" ------------------------------------
INSERT INTO `menus`(`id`,`name`,`created_at`,`updated_at`) VALUES ( '1', 'admin', '2018-06-21 19:52:29', '2018-06-21 19:52:29' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "mage_catalog_category_entity" -------------
-- CREATE TABLE "mage_catalog_category_entity" -----------------
CREATE TABLE `mage_catalog_category_entity` ( 
	`id` Int( 11 ) NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`attribute_set_id` Int( 11 ) NULL,
	`updated_at` Date NULL,
	`parent_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "mage_catalog_category_entity" -------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_mage_catalog_category_entity_mage_catalog_category_entity_1" 
-- CREATE INDEX "fk_mage_catalog_category_entity_mage_catalog_category_entity_1" 
CREATE INDEX `fk_mage_catalog_category_entity_mage_catalog_category_entity_1` USING BTREE ON `mage_catalog_category_entity`( `parent_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_mage_catalog_category_entity_mage_eav_entity_attribute_1" 
-- CREATE INDEX "fk_mage_catalog_category_entity_mage_eav_entity_attribute_1" 
CREATE INDEX `fk_mage_catalog_category_entity_mage_eav_entity_attribute_1` USING BTREE ON `mage_catalog_category_entity`( `attribute_set_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "fk_mage_catalog_category_entity_mage_catalog_category_entity_1" 
-- CREATE LINK "fk_mage_catalog_category_entity_mage_catalog_category_entity_1" 
ALTER TABLE `mage_catalog_category_entity`
	ADD CONSTRAINT `fk_mage_catalog_category_entity_mage_catalog_category_entity_1` FOREIGN KEY ( `parent_id` )
	REFERENCES `mage_catalog_category_entity`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "settings" ---------------------------------
-- CREATE TABLE "settings" -------------------------------------
CREATE TABLE `settings` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`key` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`display_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`value` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`details` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`order` Int( 11 ) NOT NULL DEFAULT '1',
	`group` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `settings_key_unique` UNIQUE( `key` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 11;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "settings" ---------------------------------
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '1', 'site.title', 'Site Title', 'Site Title', '', 'text', '1', 'Site' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '2', 'site.description', 'Site Description', 'Site Description', '', 'text', '2', 'Site' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '3', 'site.logo', 'Site Logo', '', '', 'image', '3', 'Site' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '4', 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', '4', 'Site' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '5', 'admin.bg_image', 'Admin Background Image', '', '', 'image', '5', 'Admin' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '6', 'admin.title', 'Admin Title', 'Voyager', '', 'text', '1', 'Admin' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '7', 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', '2', 'Admin' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '8', 'admin.loader', 'Admin Loader', '', '', 'image', '3', 'Admin' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '9', 'admin.icon_image', 'Admin Icon Image', '', '', 'image', '4', 'Admin' );
INSERT INTO `settings`(`id`,`key`,`display_name`,`value`,`details`,`type`,`order`,`group`) VALUES ( '10', 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', '1', 'Admin' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "roles" ------------------------------------
-- CREATE TABLE "roles" ----------------------------------------
CREATE TABLE `roles` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`display_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `roles_name_unique` UNIQUE( `name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "roles" ------------------------------------
INSERT INTO `roles`(`id`,`name`,`display_name`,`created_at`,`updated_at`) VALUES ( '1', 'admin', 'Administrator', '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `roles`(`id`,`name`,`display_name`,`created_at`,`updated_at`) VALUES ( '2', 'user', 'Normal User', '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "password_resets" --------------------------
-- CREATE TABLE "password_resets" ------------------------------
CREATE TABLE `password_resets` ( 
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`token` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "password_resets" --------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "password_resets_email_index" --------------
-- CREATE INDEX "password_resets_email_index" ------------------
CREATE INDEX `password_resets_email_index` USING BTREE ON `password_resets`( `email` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_product_categories" --------------------
-- CREATE TABLE "tn_product_categories" ------------------------
CREATE TABLE `tn_product_categories` ( 
	`id` Int( 11 ) NOT NULL,
	`tn_store_id` Int( 11 ) NULL,
	`product_id` Int( 11 ) NULL,
	`category_id` Int( 11 ) NULL,
	`mage_catalog_category_product_entity_id` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT 'Da rapidez a la hora de encontrar la relacion producto categoria en la tabla catalog_category_product. Esa tabla se puede traer como tabla federada',
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_product_categories" --------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_product_categories_tn_categories_1" -
-- CREATE INDEX "fk_tn_product_categories_tn_categories_1" -----
CREATE INDEX `fk_tn_product_categories_tn_categories_1` USING BTREE ON `tn_product_categories`( `category_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_product_categories_tn_product_image_1" 
-- CREATE INDEX "fk_tn_product_categories_tn_product_image_1" --
CREATE INDEX `fk_tn_product_categories_tn_product_image_1` USING BTREE ON `tn_product_categories`( `product_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "tn_store_id" ------------------------------
-- CREATE INDEX "tn_store_id" ----------------------------------
CREATE INDEX `tn_store_id` USING BTREE ON `tn_product_categories`( `tn_store_id`, `product_id`, `category_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "nsync_marketplaces" -----------------------
-- CREATE TABLE "nsync_marketplaces" ---------------------------
CREATE TABLE `nsync_marketplaces` ( 
	`id` Int( 11 ) NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "nsync_marketplaces" -----------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "mage_eav_entity_attribute" ----------------
-- CREATE TABLE "mage_eav_entity_attribute" --------------------
CREATE TABLE `mage_eav_entity_attribute` ( 
	`attribute_set_id` Int( 11 ) NOT NULL,
	`attribute_id` Int( 11 ) NULL,
	PRIMARY KEY ( `attribute_set_id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "mage_eav_entity_attribute" ----------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_mage_eav_entity_attribute_mage_eav_attribute_1" 
-- CREATE INDEX "fk_mage_eav_entity_attribute_mage_eav_attribute_1" 
CREATE INDEX `fk_mage_eav_entity_attribute_mage_eav_attribute_1` USING BTREE ON `mage_eav_entity_attribute`( `attribute_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_attributes" ----------------------------
-- CREATE TABLE "tn_attributes" --------------------------------
CREATE TABLE `tn_attributes` ( 
	`id` Int( 11 ) NOT NULL,
	`tn_store_id` Int( 11 ) NULL,
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`mage_attribute_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_attributes" ----------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_attributes_mage_attributes_1" -------
-- CREATE INDEX "fk_tn_attributes_mage_attributes_1" -----------
CREATE INDEX `fk_tn_attributes_mage_attributes_1` USING BTREE ON `tn_attributes`( `mage_attribute_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_attributes_tn_store_1" --------------
-- CREATE INDEX "fk_tn_attributes_tn_store_1" ------------------
CREATE INDEX `fk_tn_attributes_tn_store_1` USING BTREE ON `tn_attributes`( `tn_store_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_variants" ------------------------------
-- CREATE TABLE "tn_variants" ----------------------------------
CREATE TABLE `tn_variants` ( 
	`id` Int( 11 ) NOT NULL,
	`tn_store_id` Int( 11 ) NULL,
	`product_id` Int( 11 ) NULL,
	`image_id` Int( 11 ) NULL,
	`position` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`price` Decimal( 10, 2 ) NULL,
	`promotional_price` Decimal( 10, 2 ) NULL,
	`stock_management` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`stock` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`weight` Double( 22, 0 ) NULL,
	`width` Double( 22, 0 ) NULL,
	`height` Double( 22, 0 ) NULL,
	`depth` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`sku` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`barcode` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL ON UPDATE CURRENT_TIMESTAMP,
	`status` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_variants" ------------------------------
INSERT INTO `tn_variants`(`id`,`tn_store_id`,`product_id`,`image_id`,`position`,`price`,`promotional_price`,`stock_management`,`stock`,`weight`,`width`,`height`,`depth`,`sku`,`barcode`,`created_at`,`updated_at`,`status`) VALUES ( '35442031', '356557', '17947844', NULL, '1', '200.00', NULL, '1', '3', '900', '0', '0', '0.00', NULL, NULL, '2018-06-21 20:41:27', '2018-06-21 20:41:27', '1' );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_variants_tn_products_1" -------------
-- CREATE INDEX "fk_tn_variants_tn_products_1" -----------------
CREATE INDEX `fk_tn_variants_tn_products_1` USING BTREE ON `tn_variants`( `product_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_variants_tn_product_image_1" --------
-- CREATE INDEX "fk_tn_variants_tn_product_image_1" ------------
CREATE INDEX `fk_tn_variants_tn_product_image_1` USING BTREE ON `tn_variants`( `image_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "tn_store_id" ------------------------------
-- CREATE INDEX "tn_store_id" ----------------------------------
CREATE INDEX `tn_store_id` USING BTREE ON `tn_variants`( `tn_store_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_categories" ----------------------------
-- CREATE TABLE "tn_categories" --------------------------------
CREATE TABLE `tn_categories` ( 
	`id` Int( 11 ) NOT NULL,
	`tn_store_id` Int( 11 ) NULL,
	`name` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`description` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`handle` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`parent` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`seo_title` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`seo_description` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`created_at` DateTime NULL,
	`updated_at` DateTime NULL,
	`mage_category_entity_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_categories" ----------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_categories_mage_catalog_category_entity_1" 
-- CREATE INDEX "fk_tn_categories_mage_catalog_category_entity_1" 
CREATE INDEX `fk_tn_categories_mage_catalog_category_entity_1` USING BTREE ON `tn_categories`( `mage_category_entity_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_store_categories_tn_store_1" --------
-- CREATE INDEX "fk_tn_store_categories_tn_store_1" ------------
CREATE INDEX `fk_tn_store_categories_tn_store_1` USING BTREE ON `tn_categories`( `tn_store_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "pages" ------------------------------------
-- CREATE TABLE "pages" ----------------------------------------
CREATE TABLE `pages` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`author_id` Int( 11 ) NOT NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`excerpt` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`body` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`image` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`slug` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`meta_description` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`meta_keywords` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`status` Enum( 'ACTIVE', 'INACTIVE' ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `pages_slug_unique` UNIQUE( `slug` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "pages" ------------------------------------
INSERT INTO `pages`(`id`,`author_id`,`title`,`excerpt`,`body`,`image`,`slug`,`meta_description`,`meta_keywords`,`status`,`created_at`,`updated_at`) VALUES ( '1', '0', 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>
<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2018-06-21 19:52:54', '2018-06-21 19:52:54' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "migrations" -------------------------------
-- CREATE TABLE "migrations" -----------------------------------
CREATE TABLE `migrations` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`migration` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`batch` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 77;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "migrations" -------------------------------
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '1', '2014_10_12_000000_create_users_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '2', '2014_10_12_100000_create_password_resets_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '3', '2016_01_01_000000_add_voyager_user_fields', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '4', '2016_01_01_000000_create_data_types_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '5', '2016_05_19_173453_create_menu_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '6', '2016_10_21_190000_create_roles_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '7', '2016_10_21_190000_create_settings_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '8', '2016_11_30_135954_create_permission_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '9', '2016_11_30_141208_create_permission_role_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '10', '2016_12_26_201236_data_types__add__server_side', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '11', '2017_01_13_000000_add_route_to_menu_items_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '12', '2017_01_14_005015_create_translations_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '13', '2017_01_15_000000_make_table_name_nullable_in_permissions_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '14', '2017_03_06_000000_add_controller_to_data_types_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '15', '2017_04_21_000000_add_order_to_data_rows_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '16', '2017_07_05_210000_add_policyname_to_data_types_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '17', '2017_08_05_000000_add_group_to_settings_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '18', '2017_11_26_013050_add_user_role_relationship', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '19', '2017_11_26_015000_create_user_roles_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '20', '2018_03_11_000000_add_user_settings', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '21', '2018_03_14_000000_add_details_to_data_types_table', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '22', '2018_03_16_000000_make_settings_value_nullable', '1' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '23', '2016_01_01_000000_create_pages_table', '2' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '24', '2016_01_01_000000_create_posts_table', '2' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '25', '2016_02_15_204651_create_categories_table', '2' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '26', '2017_04_11_000000_alter_post_nullable_fields_table', '2' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '27', '2018_06_21_200520_create_categories_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '28', '2018_06_21_200520_create_data_rows_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '29', '2018_06_21_200520_create_data_types_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '30', '2018_06_21_200520_create_mage_catalog_category_entity_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '31', '2018_06_21_200520_create_mage_eav_attribute_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '32', '2018_06_21_200520_create_mage_eav_attribute_option_value_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '33', '2018_06_21_200520_create_mage_eav_entity_attribute_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '34', '2018_06_21_200520_create_menu_items_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '35', '2018_06_21_200520_create_menus_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '36', '2018_06_21_200520_create_nsync_marketplaces_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '37', '2018_06_21_200520_create_nsync_stores_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '38', '2018_06_21_200520_create_pages_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '39', '2018_06_21_200520_create_password_resets_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '40', '2018_06_21_200520_create_permission_role_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '41', '2018_06_21_200520_create_permissions_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '42', '2018_06_21_200520_create_posts_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '43', '2018_06_21_200520_create_roles_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '44', '2018_06_21_200520_create_settings_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '45', '2018_06_21_200520_create_tn_attributes_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '46', '2018_06_21_200520_create_tn_attributes_values_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '47', '2018_06_21_200520_create_tn_categories_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '48', '2018_06_21_200520_create_tn_product_categories_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '49', '2018_06_21_200520_create_tn_product_image_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '50', '2018_06_21_200520_create_tn_products_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '51', '2018_06_21_200520_create_tn_store_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '52', '2018_06_21_200520_create_tn_variants_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '53', '2018_06_21_200520_create_tn_webhooks_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '54', '2018_06_21_200520_create_translations_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '55', '2018_06_21_200520_create_user_roles_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '56', '2018_06_21_200520_create_users_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '57', '2018_06_21_200530_add_foreign_keys_to_categories_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '58', '2018_06_21_200530_add_foreign_keys_to_data_rows_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '59', '2018_06_21_200530_add_foreign_keys_to_mage_catalog_category_entity_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '60', '2018_06_21_200530_add_foreign_keys_to_mage_eav_attribute_option_value_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '61', '2018_06_21_200530_add_foreign_keys_to_mage_eav_entity_attribute_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '62', '2018_06_21_200530_add_foreign_keys_to_menu_items_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '63', '2018_06_21_200530_add_foreign_keys_to_nsync_stores_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '64', '2018_06_21_200530_add_foreign_keys_to_permission_role_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '65', '2018_06_21_200530_add_foreign_keys_to_tn_attributes_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '66', '2018_06_21_200530_add_foreign_keys_to_tn_attributes_values_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '67', '2018_06_21_200530_add_foreign_keys_to_tn_categories_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '68', '2018_06_21_200530_add_foreign_keys_to_tn_product_categories_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '69', '2018_06_21_200530_add_foreign_keys_to_tn_product_image_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '70', '2018_06_21_200530_add_foreign_keys_to_tn_products_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '71', '2018_06_21_200530_add_foreign_keys_to_tn_store_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '72', '2018_06_21_200530_add_foreign_keys_to_tn_variants_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '73', '2018_06_21_200530_add_foreign_keys_to_tn_webhooks_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '74', '2018_06_21_200530_add_foreign_keys_to_user_roles_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '75', '2018_06_21_200530_add_foreign_keys_to_users_table', '3' );
INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES ( '76', '2018_06_21_210315_update_tn_attributes_id_auto_increment', '4' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "categories" -------------------------------
-- CREATE TABLE "categories" -----------------------------------
CREATE TABLE `categories` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`parent_id` Int( 10 ) UNSIGNED NULL,
	`order` Int( 11 ) NOT NULL DEFAULT '1',
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`slug` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `categories_slug_unique` UNIQUE( `slug` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "categories" -------------------------------
INSERT INTO `categories`(`id`,`parent_id`,`order`,`name`,`slug`,`created_at`,`updated_at`) VALUES ( '1', NULL, '1', 'Category 1', 'category-1', '2018-06-21 19:52:47', '2018-06-21 19:52:47' );
INSERT INTO `categories`(`id`,`parent_id`,`order`,`name`,`slug`,`created_at`,`updated_at`) VALUES ( '2', NULL, '1', 'Category 2', 'category-2', '2018-06-21 19:52:47', '2018-06-21 19:52:47' );
-- ---------------------------------------------------------


-- CREATE INDEX "categories_parent_id_foreign" -------------
-- CREATE INDEX "categories_parent_id_foreign" -----------------
CREATE INDEX `categories_parent_id_foreign` USING BTREE ON `categories`( `parent_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE LINK "categories_parent_id_foreign" --------------
-- CREATE LINK "categories_parent_id_foreign" ------------------
ALTER TABLE `categories`
	ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY ( `parent_id` )
	REFERENCES `categories`( `id` )
	ON DELETE Set NULL
	ON UPDATE Cascade;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "permissions" ------------------------------
-- CREATE TABLE "permissions" ----------------------------------
CREATE TABLE `permissions` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`key` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`table_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 42;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "permissions" ------------------------------
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '1', 'browse_admin', NULL, '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '2', 'browse_bread', NULL, '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '3', 'browse_database', NULL, '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '4', 'browse_media', NULL, '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '5', 'browse_compass', NULL, '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '6', 'browse_menus', 'menus', '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '7', 'read_menus', 'menus', '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '8', 'edit_menus', 'menus', '2018-06-21 19:52:30', '2018-06-21 19:52:30' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '9', 'add_menus', 'menus', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '10', 'delete_menus', 'menus', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '11', 'browse_roles', 'roles', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '12', 'read_roles', 'roles', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '13', 'edit_roles', 'roles', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '14', 'add_roles', 'roles', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '15', 'delete_roles', 'roles', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '16', 'browse_users', 'users', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '17', 'read_users', 'users', '2018-06-21 19:52:31', '2018-06-21 19:52:31' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '18', 'edit_users', 'users', '2018-06-21 19:52:32', '2018-06-21 19:52:32' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '19', 'add_users', 'users', '2018-06-21 19:52:32', '2018-06-21 19:52:32' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '20', 'delete_users', 'users', '2018-06-21 19:52:32', '2018-06-21 19:52:32' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '21', 'browse_settings', 'settings', '2018-06-21 19:52:32', '2018-06-21 19:52:32' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '22', 'read_settings', 'settings', '2018-06-21 19:52:32', '2018-06-21 19:52:32' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '23', 'edit_settings', 'settings', '2018-06-21 19:52:32', '2018-06-21 19:52:32' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '24', 'add_settings', 'settings', '2018-06-21 19:52:32', '2018-06-21 19:52:32' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '25', 'delete_settings', 'settings', '2018-06-21 19:52:32', '2018-06-21 19:52:32' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '26', 'browse_categories', 'categories', '2018-06-21 19:52:46', '2018-06-21 19:52:46' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '27', 'read_categories', 'categories', '2018-06-21 19:52:46', '2018-06-21 19:52:46' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '28', 'edit_categories', 'categories', '2018-06-21 19:52:46', '2018-06-21 19:52:46' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '29', 'add_categories', 'categories', '2018-06-21 19:52:46', '2018-06-21 19:52:46' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '30', 'delete_categories', 'categories', '2018-06-21 19:52:47', '2018-06-21 19:52:47' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '31', 'browse_posts', 'posts', '2018-06-21 19:52:50', '2018-06-21 19:52:50' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '32', 'read_posts', 'posts', '2018-06-21 19:52:51', '2018-06-21 19:52:51' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '33', 'edit_posts', 'posts', '2018-06-21 19:52:51', '2018-06-21 19:52:51' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '34', 'add_posts', 'posts', '2018-06-21 19:52:51', '2018-06-21 19:52:51' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '35', 'delete_posts', 'posts', '2018-06-21 19:52:51', '2018-06-21 19:52:51' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '36', 'browse_pages', 'pages', '2018-06-21 19:52:53', '2018-06-21 19:52:53' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '37', 'read_pages', 'pages', '2018-06-21 19:52:53', '2018-06-21 19:52:53' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '38', 'edit_pages', 'pages', '2018-06-21 19:52:54', '2018-06-21 19:52:54' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '39', 'add_pages', 'pages', '2018-06-21 19:52:54', '2018-06-21 19:52:54' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '40', 'delete_pages', 'pages', '2018-06-21 19:52:54', '2018-06-21 19:52:54' );
INSERT INTO `permissions`(`id`,`key`,`table_name`,`created_at`,`updated_at`) VALUES ( '41', 'browse_hooks', NULL, '2018-06-21 19:53:00', '2018-06-21 19:53:00' );
-- ---------------------------------------------------------


-- CREATE INDEX "permissions_key_index" --------------------
-- CREATE INDEX "permissions_key_index" ------------------------
CREATE INDEX `permissions_key_index` USING BTREE ON `permissions`( `key` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "mage_eav_attribute_option_value" ----------
-- CREATE TABLE "mage_eav_attribute_option_value" --------------
CREATE TABLE `mage_eav_attribute_option_value` ( 
	`value_id` Int( 11 ) NOT NULL,
	`attribute_id` Int( 11 ) NULL,
	`option_id` Int( 11 ) NULL,
	`value` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	PRIMARY KEY ( `value_id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "mage_eav_attribute_option_value" ----------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_mage_eav_attribute_option_value_mage_eav_attributes_1" 
-- CREATE INDEX "fk_mage_eav_attribute_option_value_mage_eav_attributes_1" 
CREATE INDEX `fk_mage_eav_attribute_option_value_mage_eav_attributes_1` USING BTREE ON `mage_eav_attribute_option_value`( `attribute_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "mage_eav_attribute" -----------------------
-- CREATE TABLE "mage_eav_attribute" ---------------------------
CREATE TABLE `mage_eav_attribute` ( 
	`id` Int( 11 ) NOT NULL,
	`frontend_label` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "mage_eav_attribute" -----------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "permission_role" --------------------------
-- CREATE TABLE "permission_role" ------------------------------
CREATE TABLE `permission_role` ( 
	`permission_id` Int( 10 ) UNSIGNED NOT NULL,
	`role_id` Int( 10 ) UNSIGNED NOT NULL,
	PRIMARY KEY ( `permission_id`, `role_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "permission_role" --------------------------
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '1', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '2', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '3', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '4', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '5', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '6', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '7', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '8', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '9', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '10', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '11', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '12', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '13', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '14', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '15', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '16', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '17', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '18', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '19', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '20', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '21', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '22', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '23', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '24', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '25', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '26', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '27', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '28', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '29', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '30', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '31', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '32', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '33', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '34', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '35', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '36', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '37', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '38', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '39', '1' );
INSERT INTO `permission_role`(`permission_id`,`role_id`) VALUES ( '40', '1' );
-- ---------------------------------------------------------


-- CREATE INDEX "permission_role_permission_id_index" ------
-- CREATE INDEX "permission_role_permission_id_index" ----------
CREATE INDEX `permission_role_permission_id_index` USING BTREE ON `permission_role`( `permission_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "permission_role_role_id_index" ------------
-- CREATE INDEX "permission_role_role_id_index" ----------------
CREATE INDEX `permission_role_role_id_index` USING BTREE ON `permission_role`( `role_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "menu_items" -------------------------------
-- CREATE TABLE "menu_items" -----------------------------------
CREATE TABLE `menu_items` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`menu_id` Int( 10 ) UNSIGNED NULL,
	`title` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`url` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`target` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
	`icon_class` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`color` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`parent_id` Int( 11 ) NULL,
	`order` Int( 11 ) NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	`route` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`parameters` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 14;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "menu_items" -------------------------------
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '1', '1', 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, '1', '2018-06-21 19:52:29', '2018-06-21 19:52:29', 'voyager.dashboard', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '2', '1', 'Media', '', '_self', 'voyager-images', NULL, NULL, '5', '2018-06-21 19:52:29', '2018-06-21 19:52:29', 'voyager.media.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '3', '1', 'Users', '', '_self', 'voyager-person', NULL, NULL, '3', '2018-06-21 19:52:29', '2018-06-21 19:52:29', 'voyager.users.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '4', '1', 'Roles', '', '_self', 'voyager-lock', NULL, NULL, '2', '2018-06-21 19:52:29', '2018-06-21 19:52:29', 'voyager.roles.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '5', '1', 'Tools', '', '_self', 'voyager-tools', NULL, NULL, '9', '2018-06-21 19:52:29', '2018-06-21 19:52:29', NULL, NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '6', '1', 'Menu Builder', '', '_self', 'voyager-list', NULL, '5', '10', '2018-06-21 19:52:29', '2018-06-21 19:52:29', 'voyager.menus.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '7', '1', 'Database', '', '_self', 'voyager-data', NULL, '5', '11', '2018-06-21 19:52:30', '2018-06-21 19:52:30', 'voyager.database.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '8', '1', 'Compass', '', '_self', 'voyager-compass', NULL, '5', '12', '2018-06-21 19:52:30', '2018-06-21 19:52:30', 'voyager.compass.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '9', '1', 'Settings', '', '_self', 'voyager-settings', NULL, NULL, '14', '2018-06-21 19:52:30', '2018-06-21 19:52:30', 'voyager.settings.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '10', '1', 'Categories', '', '_self', 'voyager-categories', NULL, NULL, '8', '2018-06-21 19:52:46', '2018-06-21 19:52:46', 'voyager.categories.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '11', '1', 'Posts', '', '_self', 'voyager-news', NULL, NULL, '6', '2018-06-21 19:52:50', '2018-06-21 19:52:50', 'voyager.posts.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '12', '1', 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, '7', '2018-06-21 19:52:53', '2018-06-21 19:52:53', 'voyager.pages.index', NULL );
INSERT INTO `menu_items`(`id`,`menu_id`,`title`,`url`,`target`,`icon_class`,`color`,`parent_id`,`order`,`created_at`,`updated_at`,`route`,`parameters`) VALUES ( '13', '1', 'Hooks', '', '_self', 'voyager-hook', NULL, '5', '13', '2018-06-21 19:53:00', '2018-06-21 19:53:00', 'voyager.hooks', NULL );
-- ---------------------------------------------------------


-- CREATE INDEX "menu_items_menu_id_foreign" ---------------
-- CREATE INDEX "menu_items_menu_id_foreign" -------------------
CREATE INDEX `menu_items_menu_id_foreign` USING BTREE ON `menu_items`( `menu_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_attributes_values" ---------------------
-- CREATE TABLE "tn_attributes_values" -------------------------
CREATE TABLE `tn_attributes_values` ( 
	`id` Int( 11 ) NOT NULL,
	`tn_store_id` Int( 11 ) NOT NULL,
	`attribute_id` Int( 11 ) NOT NULL,
	`product_id` Int( 11 ) NULL,
	`variant_id` Int( 11 ) NULL,
	`value` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`mage_value_id` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_attributes_values" ---------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_attributes_values_mage_eav_attribute_option_1" 
-- CREATE INDEX "fk_tn_attributes_values_mage_eav_attribute_option_1" 
CREATE INDEX `fk_tn_attributes_values_mage_eav_attribute_option_1` USING BTREE ON `tn_attributes_values`( `mage_value_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_attributes_values_tn_attributes_1" --
-- CREATE INDEX "fk_tn_attributes_values_tn_attributes_1" ------
CREATE INDEX `fk_tn_attributes_values_tn_attributes_1` USING BTREE ON `tn_attributes_values`( `attribute_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_attributes_values_tn_products_1" ----
-- CREATE INDEX "fk_tn_attributes_values_tn_products_1" --------
CREATE INDEX `fk_tn_attributes_values_tn_products_1` USING BTREE ON `tn_attributes_values`( `product_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_attributes_values_tn_store_1" -------
-- CREATE INDEX "fk_tn_attributes_values_tn_store_1" -----------
CREATE INDEX `fk_tn_attributes_values_tn_store_1` USING BTREE ON `tn_attributes_values`( `tn_store_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_attributes_values_tn_variants_1" ----
-- CREATE INDEX "fk_tn_attributes_values_tn_variants_1" --------
CREATE INDEX `fk_tn_attributes_values_tn_variants_1` USING BTREE ON `tn_attributes_values`( `variant_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "translations" -----------------------------
-- CREATE TABLE "translations" ---------------------------------
CREATE TABLE `translations` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`table_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`column_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`foreign_key` Int( 10 ) UNSIGNED NOT NULL,
	`locale` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`value` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `translations_table_name_column_name_foreign_key_locale_unique` UNIQUE( `table_name`, `column_name`, `foreign_key`, `locale` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 31;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "translations" -----------------------------
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '1', 'data_types', 'display_name_singular', '5', 'pt', 'Post', '2018-06-21 19:52:55', '2018-06-21 19:52:55' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '2', 'data_types', 'display_name_singular', '6', 'pt', 'Página', '2018-06-21 19:52:55', '2018-06-21 19:52:55' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '3', 'data_types', 'display_name_singular', '1', 'pt', 'Utilizador', '2018-06-21 19:52:56', '2018-06-21 19:52:56' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '4', 'data_types', 'display_name_singular', '4', 'pt', 'Categoria', '2018-06-21 19:52:57', '2018-06-21 19:52:57' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '5', 'data_types', 'display_name_singular', '2', 'pt', 'Menu', '2018-06-21 19:52:57', '2018-06-21 19:52:57' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '6', 'data_types', 'display_name_singular', '3', 'pt', 'Função', '2018-06-21 19:52:57', '2018-06-21 19:52:57' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '7', 'data_types', 'display_name_plural', '5', 'pt', 'Posts', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '8', 'data_types', 'display_name_plural', '6', 'pt', 'Páginas', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '9', 'data_types', 'display_name_plural', '1', 'pt', 'Utilizadores', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '10', 'data_types', 'display_name_plural', '4', 'pt', 'Categorias', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '11', 'data_types', 'display_name_plural', '2', 'pt', 'Menus', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '12', 'data_types', 'display_name_plural', '3', 'pt', 'Funções', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '13', 'categories', 'slug', '1', 'pt', 'categoria-1', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '14', 'categories', 'name', '1', 'pt', 'Categoria 1', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '15', 'categories', 'slug', '2', 'pt', 'categoria-2', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '16', 'categories', 'name', '2', 'pt', 'Categoria 2', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '17', 'pages', 'title', '1', 'pt', 'Olá Mundo', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '18', 'pages', 'slug', '1', 'pt', 'ola-mundo', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '19', 'pages', 'body', '1', 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>
<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '20', 'menu_items', 'title', '1', 'pt', 'Painel de Controle', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '21', 'menu_items', 'title', '2', 'pt', 'Media', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '22', 'menu_items', 'title', '11', 'pt', 'Publicações', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '23', 'menu_items', 'title', '3', 'pt', 'Utilizadores', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '24', 'menu_items', 'title', '10', 'pt', 'Categorias', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '25', 'menu_items', 'title', '12', 'pt', 'Páginas', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '26', 'menu_items', 'title', '4', 'pt', 'Funções', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '27', 'menu_items', 'title', '5', 'pt', 'Ferramentas', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '28', 'menu_items', 'title', '6', 'pt', 'Menus', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '29', 'menu_items', 'title', '7', 'pt', 'Base de dados', '2018-06-21 19:52:58', '2018-06-21 19:52:58' );
INSERT INTO `translations`(`id`,`table_name`,`column_name`,`foreign_key`,`locale`,`value`,`created_at`,`updated_at`) VALUES ( '30', 'menu_items', 'title', '9', 'pt', 'Configurações', '2018-06-21 19:52:59', '2018-06-21 19:52:59' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


-- CREATE TABLE "tn_webhooks" ------------------------------
-- CREATE TABLE "tn_webhooks" ----------------------------------
CREATE TABLE `tn_webhooks` ( 
	`id` Int( 11 ) NULL COMMENT 'Tienda Nube Webhook ID',
	`tn_store_id` Int( 11 ) NULL,
	`event` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
	`url` VarChar( 255 ) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------
-- ---------------------------------------------------------


-- Dump data of "tn_webhooks" ------------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "fk_tn_webhooks_tn_store_1" ----------------
-- CREATE INDEX "fk_tn_webhooks_tn_store_1" --------------------
CREATE INDEX `fk_tn_webhooks_tn_store_1` USING BTREE ON `tn_webhooks`( `tn_store_id` );
-- -------------------------------------------------------------
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


