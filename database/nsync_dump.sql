/*
 Navicat Premium Data Transfer

 Source Server         : NWA Python
 Source Server Type    : MySQL
 Source Server Version : 100133
 Source Host           : 67.227.194.243
 Source Database       : nwadigi_balanz

 Target Server Type    : MySQL
 Target Server Version : 100133
 File Encoding         : utf-8

 Date: 05/28/2018 23:02:50 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `mage_catalog_category_entity`
-- ----------------------------
DROP TABLE IF EXISTS `mage_catalog_category_entity`;
CREATE TABLE `mage_catalog_category_entity` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `attribute_set_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mage_catalog_category_entity_mage_catalog_category_entity_1` (`parent_id`),
  KEY `fk_mage_catalog_category_entity_mage_eav_entity_attribute_1` (`attribute_set_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `mage_eav_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `mage_eav_attribute`;
CREATE TABLE `mage_eav_attribute` (
  `id` int(11) NOT NULL,
  `frontend_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `mage_eav_attribute_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `mage_eav_attribute_option_value`;
CREATE TABLE `mage_eav_attribute_option_value` (
  `value_id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  KEY `fk_mage_eav_attribute_option_value_mage_eav_attributes_1` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `mage_eav_entity_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `mage_eav_entity_attribute`;
CREATE TABLE `mage_eav_entity_attribute` (
  `attribute_set_id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`attribute_set_id`),
  KEY `fk_mage_eav_entity_attribute_mage_eav_attribute_1` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `nsync_marketplaces`
-- ----------------------------
DROP TABLE IF EXISTS `nsync_marketplaces`;
CREATE TABLE `nsync_marketplaces` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `nsync_stores`
-- ----------------------------
DROP TABLE IF EXISTS `nsync_stores`;
CREATE TABLE `nsync_stores` (
  `id` int(11) NOT NULL,
  `marketplace_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stores_marketplaces_1` (`marketplace_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `tn_attributes`;
CREATE TABLE `tn_attributes` (
  `id` int(11) NOT NULL,
  `tn_store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mage_attribute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tn_attributes_tn_store_1` (`tn_store_id`),
  KEY `fk_tn_attributes_mage_attributes_1` (`mage_attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_attributes_values`
-- ----------------------------
DROP TABLE IF EXISTS `tn_attributes_values`;
CREATE TABLE `tn_attributes_values` (
  `id` int(11) NOT NULL,
  `tn_store_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `mage_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tn_attributes_values_tn_store_1` (`tn_store_id`),
  KEY `fk_tn_attributes_values_tn_attributes_1` (`attribute_id`),
  KEY `fk_tn_attributes_values_tn_products_1` (`product_id`),
  KEY `fk_tn_attributes_values_tn_variants_1` (`variant_id`),
  KEY `fk_tn_attributes_values_mage_eav_attribute_option_1` (`mage_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_categories`
-- ----------------------------
DROP TABLE IF EXISTS `tn_categories`;
CREATE TABLE `tn_categories` (
  `id` int(11) NOT NULL,
  `tn_store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `mage_category_entity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tn_store_categories_tn_store_1` (`tn_store_id`),
  KEY `fk_tn_categories_tn_categories_1` (`parent`),
  KEY `fk_tn_categories_mage_catalog_category_entity_1` (`mage_category_entity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_product_categories`
-- ----------------------------
DROP TABLE IF EXISTS `tn_product_categories`;
CREATE TABLE `tn_product_categories` (
  `id` int(11) NOT NULL,
  `tn_store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `mage_catalog_category_product_entity_id` varchar(255) DEFAULT NULL COMMENT 'Da rapidez a la hora de encontrar la relacion producto categoria en la tabla catalog_category_product. Esa tabla se puede traer como tabla federada',
  PRIMARY KEY (`id`),
  KEY `fk_tn_product_categories_tn_store_1` (`tn_store_id`),
  KEY `fk_tn_product_categories_tn_product_image_1` (`product_id`),
  KEY `fk_tn_product_categories_tn_categories_1` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_product_image`
-- ----------------------------
DROP TABLE IF EXISTS `tn_product_image`;
CREATE TABLE `tn_product_image` (
  `id` int(11) NOT NULL,
  `tn_store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tn_product_image_tn_store_1` (`tn_store_id`),
  KEY `fk_tn_product_image_tn_products_1` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_products`
-- ----------------------------
DROP TABLE IF EXISTS `tn_products`;
CREATE TABLE `tn_products` (
  `id` int(11) NOT NULL,
  `tn_store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `published` varchar(255) DEFAULT NULL,
  `free_shipping` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tn_products` (`tn_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_store`
-- ----------------------------
DROP TABLE IF EXISTS `tn_store`;
CREATE TABLE `tn_store` (
  `id` int(11) NOT NULL,
  `nsync_store_id` int(11) DEFAULT NULL,
  `external_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `app_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tn_store_stores_1` (`nsync_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_variants`
-- ----------------------------
DROP TABLE IF EXISTS `tn_variants`;
CREATE TABLE `tn_variants` (
  `id` int(11) NOT NULL,
  `tn_store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `promotional_price` decimal(10,2) DEFAULT NULL,
  `stock_management` varchar(255) DEFAULT NULL,
  `stock` varchar(255) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `depth` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_tn_variants_tn_store_1` (`tn_store_id`),
  KEY `fk_tn_variants_tn_products_1` (`product_id`),
  KEY `fk_tn_variants_tn_product_image_1` (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tn_webhooks`
-- ----------------------------
DROP TABLE IF EXISTS `tn_webhooks`;
CREATE TABLE `tn_webhooks` (
  `id` int(11) NOT NULL,
  `tn_store_id` int(11) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tn_webhooks_tn_store_1` (`tn_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
