/* =-=-=-= Copyright © 2018 eMarket =-=-=-=  
  |    GNU GENERAL PUBLIC LICENSE v.3.0    |
  |  https://github.com/musicman3/eMarket  |
  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* Add tables */

DROP TABLE IF EXISTS emkt_administrators;
CREATE TABLE emkt_administrators (
	login varchar(128) binary NOT NULL,
	password varchar(256) NOT NULL,
	language varchar(64) NOT NULL,
	permission varchar(20) NOT NULL,
	note varchar(256),
	status int DEFAULT '0' NOT NULL,
PRIMARY KEY (login))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_basic_settings;
CREATE TABLE emkt_basic_settings (
	id int NOT NULL auto_increment,
	lines_on_page int DEFAULT '20' NOT NULL,
        session_expr_time int DEFAULT '60' NOT NULL,
        debug int DEFAULT '0' NOT NULL,
        host_email varchar(128) DEFAULT 'smtp.localhost' NOT NULL,
        username_email varchar(128) DEFAULT 'login' NOT NULL,
        password_email varchar(128) DEFAULT '' NOT NULL,
        smtp_secure varchar(64) DEFAULT 'ssl' NOT NULL,
        smtp_port int DEFAULT '465' NOT NULL,
        smtp_auth int DEFAULT '0' NOT NULL,
        smtp_status int DEFAULT '0' NOT NULL,
        email varchar(128) DEFAULT 'sale@localhost' NOT NULL,
        email_name varchar(128) DEFAULT 'eMarket' NOT NULL,
        primary_language varchar(128) DEFAULT '' NOT NULL,
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_categories;
CREATE TABLE emkt_categories (
	id int NOT NULL,
	name varchar(256),
	language varchar(64),
	parent_id int DEFAULT '0' NOT NULL,
        logo json,
	date_added datetime,
	last_modified datetime,
	sort_category int DEFAULT '0' NOT NULL,
	status int,
        logo_general varchar(128),
        attributes json,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_countries;
CREATE TABLE emkt_countries (
	id int NOT NULL,
	name varchar(256),
	language varchar(64),
        alpha_2 varchar(2),
        alpha_3 varchar(3),
        address_format varchar(256) NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_currencies;
CREATE TABLE emkt_currencies (
	id int NOT NULL,
	name varchar(64),
        code varchar(16),
        iso_4217 varchar(3),
	language varchar(64),
        value decimal(20,10),
        default_value int NOT NULL,
        symbol varchar(16),
        symbol_position varchar(16),
        decimal_places char(1),
        last_updated datetime NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_customers;
CREATE TABLE emkt_customers (
        id int NOT NULL auto_increment,
        address_book json,
        gender char(1),
        firstname varchar(32) NOT NULL,
        lastname varchar(32) NOT NULL,
        middle_name varchar(32),
        date_account_created datetime,
        date_account_last_modified datetime,
        date_last_logon datetime,
        default_address_id int,
        date_of_birth datetime,
        email varchar(128) NOT NULL,
        fax varchar(32),
        global_product_notifications int DEFAULT '0',
        ip_address varchar(64),
        newsletter char(1),
        number_of_logons int,
        password varchar(256) NOT NULL,
        status int DEFAULT '0',
        telephone varchar(32),
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_customers_activation;
CREATE TABLE emkt_customers_activation (
        id int NOT NULL,
        activation_code varchar(64),
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_length;
CREATE TABLE emkt_length (
	id int NOT NULL,
	name varchar(64),
        code varchar(8),
	language varchar(64),
        value_length decimal(14,7),
        default_length int NOT NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_manufacturers;
CREATE TABLE emkt_manufacturers (
	id int NOT NULL,
	name varchar(256),
	language varchar(64),
        logo json,
        logo_general varchar(128),
        site varchar(256),
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_modules;
CREATE TABLE emkt_modules (
	id int NOT NULL auto_increment,
	name varchar(256),
	type varchar(256),
        active int(64),
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_order_status;
CREATE TABLE emkt_order_status (
	id int NOT NULL,
	name varchar(256),
	language varchar(64),
        default_order_status int NOT NULL,
        sort int NOT NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_orders;
CREATE TABLE emkt_orders (
        id int NOT NULL auto_increment,
        email varchar(128) NOT NULL,
        customer_data json,
        orders_status_history json,
        products_order json,
        order_total json,
        invoice json,
        orders_transactions_history json,
        customer_ip_address varchar(30),
        payment_method json,
        shipping_method json,
        last_modified datetime,
        date_purchased datetime,
        uid varchar(64),
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_password_recovery;
CREATE TABLE emkt_password_recovery (
        id int NOT NULL auto_increment,
        customer_id int NOT NULL,
        recovery_code varchar(64),
        recovery_code_created datetime,
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_products;
CREATE TABLE emkt_products (
	id int DEFAULT '0' NOT NULL,
        name varchar(256),
        description text,
        language varchar(64),
        status int DEFAULT '1' NOT NULL,
	parent_id int DEFAULT '0' NOT NULL,
	logo json,
        logo_general varchar(128),
	date_added datetime,
	last_modified datetime,
        keyword varchar(256),
        tags varchar(256),
        price decimal(12,2),
        currency int,
        tax int,
        quantity int,
        unit int,
        model varchar(64), 
        date_available date,
        manufacturer int,
        barcode varchar(256),
        barcode_value varchar(256),
        vendor_code varchar(64),
        vendor_code_value varchar(64),
        weight int,
        weight_value decimal(5,2),
        min_quantity int,
        dimension int,
        length decimal(12,2),
        width decimal(12,2),
        height decimal(12,2),
        type int,
        ordered int default '0',
        viewed int default '0',
        download_file varchar(256),
        downloads_stat int default '0',
        discount json,
        attributes json,
        sticker varchar(64),
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_regions;
CREATE TABLE emkt_regions (
	id int NOT NULL,
        country_id int NOT NULL,
        region_code varchar(8),
	name varchar(256),
	language varchar(64),
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_stickers;
CREATE TABLE emkt_stickers (
	id int NOT NULL,
	name varchar(256),
	language varchar(64),
        default_stickers int NOT NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_slideshow;
CREATE TABLE emkt_slideshow (
	id int NOT NULL auto_increment,
	language varchar(64),
	logo json,
        logo_general varchar(128),
        animation int DEFAULT '1' NOT NULL,
        color text,
        url text,
        name varchar(256),
        heading text,
        date_start datetime,
        date_finish datetime,
        status int DEFAULT '1' NOT NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_slideshow_pref;
CREATE TABLE emkt_slideshow_pref (
	id int NOT NULL auto_increment,
	show_interval varchar(64),
	mouse_stop varchar(64),
	autostart varchar(64),
	cicles varchar(64),
	indicators varchar(64),
	navigation varchar(64),
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_staff_manager;
CREATE TABLE emkt_staff_manager (
	id int NOT NULL,
        language varchar(64),
	name varchar(256),
        note varchar(256),
        permissions json,
        mode varchar(256),
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_taxes;
CREATE TABLE emkt_taxes (
	id int NOT NULL,
	name varchar(256),
	language varchar(64),
        rate decimal(4,2),
        tax_type int NOT NULL,
        zones_id int NOT NULL,
        fixed int NOT NULL,
        currency int,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_template_constructor;
CREATE TABLE emkt_template_constructor (
        id int UNSIGNED NOT NULL auto_increment,
	url varchar(256),
        group_id varchar(32),
        value varchar(32),
        page varchar(256),
        template_name varchar(256),
        sort int NOT NULL,
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_units;
CREATE TABLE emkt_units (
	id int NOT NULL,
	name varchar(256),
	language varchar(64),
        unit varchar(256),
        default_unit int NOT NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_vendor_codes;
CREATE TABLE emkt_vendor_codes (
	id int NOT NULL,
	name varchar(256),
	language varchar(64),
        vendor_code varchar(256),
        default_vendor_code int NOT NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_weight;
CREATE TABLE emkt_weight (
	id int NOT NULL,
	name varchar(64),
        code varchar(8),
	language varchar(64),
        value_weight decimal(14,7),
        default_weight int NOT NULL,
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_zones;
CREATE TABLE emkt_zones (
	id int NOT NULL,
	name varchar(256),
        note varchar(256),
	language varchar(64),
PRIMARY KEY (id, language))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS emkt_zones_value;
CREATE TABLE emkt_zones_value (
	id int NOT NULL auto_increment,
        country_id int NOT NULL,
        regions_id int NOT NULL,
        zones_id int NOT NULL,
PRIMARY KEY (id))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Load data */
/* vietnam */
INSERT INTO emkt_countries VALUES (1,'Vietnam','vietnam','VN','VNM','');

INSERT INTO emkt_regions VALUES(1, 1, 'HN', 'Hà Nội', 'vietnam');
INSERT INTO emkt_regions VALUES(2, 1, 'SG', 'Hồ Chí Minh', 'vietnam');

/* Basic Settings */
INSERT INTO emkt_basic_settings VALUES (1, 20, 60, 0, 'smtp.mail.ru', 'login', 'password', 'ssl', 465, 0, 0, 'sale@localhost.ru', 'eMarket', '');

/* Zones */
INSERT INTO emkt_zones VALUES (1, 'Vietnam', null, 'vietnam');

/* Zones value */

/* Taxes */
INSERT INTO emkt_taxes VALUES (1, 'VAT', 'vietnam', '20.00', '1', '1', '1', '1');

/* Length */
INSERT INTO emkt_length VALUES (1, 'Meter', 'm.', 'vietnam', '1.0000000', '1');
INSERT INTO emkt_length VALUES (2, 'Centimeter', 'cm.', 'vietnam', '0.0100000', '0');
INSERT INTO emkt_length VALUES (3, 'Millimeter', 'mm.', 'vietnam', '0.0010000', '0');
INSERT INTO emkt_length VALUES (4, 'Inch', 'in.', 'vietnam', '0.0254000', '0');

/* Weight */
INSERT INTO emkt_weight VALUES (1, 'Kilogram', 'kg.', 'vietnam', '1.0000000', '1');
INSERT INTO emkt_weight VALUES (2, 'Gram', 'g.', 'vietnam', '0.0010000', '0');

/* Vendor codes */
INSERT INTO emkt_vendor_codes VALUES (1, 'SKU', 'vietnam', '', '1');
INSERT INTO emkt_vendor_codes VALUES (2, 'UPC', 'vietnam', '', '0');
INSERT INTO emkt_vendor_codes VALUES (3, 'EAN', 'vietnam', '', '0');

/* Units */
INSERT INTO emkt_units VALUES (1, 'Pieces', 'vietnam', 'pcs.', '1');
INSERT INTO emkt_units VALUES (2, 'Packing', 'vietnam', 'pkg.', '0');

/* Statuses */
INSERT INTO emkt_order_status VALUES (1, 'Hoàn tiền', 'vietnam', '0', '1');
INSERT INTO emkt_order_status VALUES (2, 'Đã giao hàng', 'vietnam', '0', '2');
INSERT INTO emkt_order_status VALUES (3, 'Đang xử lý', 'vietnam', '0', '3');
INSERT INTO emkt_order_status VALUES (4, 'Trả hàng', 'vietnam', '0', '4');
INSERT INTO emkt_order_status VALUES (5, 'Chưa thanh toán', 'vietnam', '1', '5');


/* Currencies */
INSERT INTO emkt_currencies VALUES (1, 'Việt Nam Đồng', 'vnđ', 'VND', 'vietnam', '1', '1', '.đ', 'right', '0', NULL);

/* Template constructor */
/* ADMIN */
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/admin/header.php', 'admin', 'header', 'all', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/admin/footer.php', 'admin', 'footer', 'all', 'default', '0');
/* INSTALL */
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/install/footer.php', 'install', 'footer', 'all', 'default', '0');
/* CATALOG ALL PAGES */
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/navbar.php', 'catalog', 'header', 'all', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/logo_search.php', 'catalog', 'header', 'all', 'default', '1');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/breadcrumb.php', 'catalog', 'header', 'all', 'default', '2');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/slide_show.php', 'catalog', 'header', 'all', 'default', '3');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/copyright.php', 'catalog', 'footer', 'all', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories.php', 'catalog', 'boxes-left', 'all', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/welcome.php', 'catalog', 'content-basket', 'all', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories_listing.php', 'catalog', 'content-basket', 'all', 'default', '1');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/new_products.php', 'catalog', 'content-basket', 'all', 'default', '2');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories_index.php', 'catalog', 'content-basket', 'all', 'default', '3');
/* CATALOG */
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/navbar.php', 'catalog', 'header', 'catalog', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/logo_search.php', 'catalog', 'header', 'catalog', 'default', '1');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/breadcrumb.php', 'catalog', 'header', 'catalog', 'default', '2');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/slide_show.php', 'catalog', 'header', 'catalog', 'default', '3');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/copyright.php', 'catalog', 'footer', 'catalog', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories.php', 'catalog', 'boxes-left', 'catalog', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/welcome.php', 'catalog', 'content', 'catalog', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories_index.php', 'catalog', 'content-basket', 'catalog', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories_listing.php', 'catalog', 'content-basket', 'catalog', 'default', '1');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/new_products.php', 'catalog', 'content', 'catalog', 'default', '2');
/* LISTING */
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/navbar.php', 'catalog', 'header', 'listing', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/logo_search.php', 'catalog', 'header', 'listing', 'default', '1');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/breadcrumb.php', 'catalog', 'header', 'listing', 'default', '2');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/slide_show.php', 'catalog', 'header', 'listing', 'default', '3');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/copyright.php', 'catalog', 'footer', 'listing', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories.php', 'catalog', 'boxes-left', 'listing', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/welcome.php', 'catalog', 'content-basket', 'listing', 'default', '0');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/new_products.php', 'catalog', 'content-basket', 'listing', 'default', '1');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories_index.php', 'catalog', 'content-basket', 'listing', 'default', '2');
INSERT INTO emkt_template_constructor (url, group_id, value, page, template_name, sort) VALUES ('/controller/catalog/layouts/categories_listing.php', 'catalog', 'content', 'listing', 'default', '1');
/* SLIDESHOW PREF */
INSERT INTO emkt_slideshow_pref (id, show_interval, mouse_stop, autostart, cicles, indicators, navigation) VALUES ('1', '2000', '0', '1', '0', '0', '0');
/* SAMPLES */
INSERT INTO emkt_categories (id, name, language, parent_id, logo, date_added, last_modified, sort_category, status, logo_general, attributes) VALUES
(1, 'Máy tính bảng', 'vietnam', 0, '[]', '2019-10-08 23:22:18', '2019-10-09 00:04:05', 2, 1, '[]', '[]');

INSERT INTO emkt_manufacturers (id, name, language, logo, logo_general, site) VALUES
(1, 'HP', 'vietnam', '["1570567320_HP_New_Logo_2D-svg.png"]', '1570567320_HP_New_Logo_2D-svg.png', 'http://www.hp.com');

INSERT INTO emkt_products (id, name, description, language, status, parent_id, logo, logo_general, date_added, last_modified, keyword, tags, price, currency, tax, quantity, unit, model, date_available, manufacturer, barcode, barcode_value, vendor_code, vendor_code_value, weight, weight_value, min_quantity, dimension, length, width, height, type, ordered, viewed, download_file, downloads_stat, discount, attributes) VALUES
(1, 'HP EliteBook 840 G6', '<div _ngcontent-c7=\"\" class=\"hp-sub-title-lowercase feature-label\"><b><span style=\"font-size: 18px;\">Brilliant design</span></b></div><p _ngcontent-c7=\"\" class=\"hp-default-text feature-description\">\r\n Balance design, power, and mobility with this ultraslim distinctively \r\ndesigned aluminum laptop with a narrow border display. This light and \r\ncompact PC is built for the professional who requires top performance \r\nwhile on the go. </p><div _ngcontent-c7=\"\" class=\"hp-sub-title-lowercase feature-label\"><b><span style=\"font-size: 18px;\">Built on a secure foundation</span></b></div><p _ngcontent-c7=\"\" class=\"hp-default-text feature-description\">\r\n Protect your PC against the evolving malware threats of the future, \r\nwith self-healing, hardware-enforced, manageable security solutions from\r\n HP. From the BIOS to the browser HP Sure Start Gen5 and HP Sure \r\nClick help secure your PC. </p><div _ngcontent-c7=\"\" class=\"hp-sub-title-lowercase feature-label\"><b><span style=\"font-size: 18px;\">Crystal-clear collaboration</span></b></div><p _ngcontent-c7=\"\" class=\"hp-default-text feature-description\">\r\n Calls sound clear and crisp with advanced collaboration features like \r\nHP Noise Cancellation. Loud top-firing speakers produce rich sound. The \r\nworld-facing third microphone and collaboration keys help make PC calls \r\nproductive. </p>', 'vietnam', 1, 1, '["1570568968_NBKHNB4496528__1.jpg","1570568968_NBKHNB4496528__2.jpg","1570568968_NBKHNB4496528__3.jpg","1570568968_NBKHNB4496528__4.jpg","1570568968_NBKHNB4496528__5.jpg"]', '1570568968_NBKHNB4496528__1.jpg', '2019-10-09 00:09:28', NULL, '', '', '30000000', 1, 1, 10, 1, '', NULL, 1, NULL, NULL, '1', '', 1, '1.48', NULL, 2, '23.43', '32.60', '2.50', NULL, 0, 0, NULL, 0, '[]', '[]');
