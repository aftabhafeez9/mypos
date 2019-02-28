CREATE TABLE `configuration` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`company_name` varchar NOT NULL,
	`company_address` varchar NOT NULL,
	`contact_no` varchar NOT NULL,
	`website` varchar NOT NULL,
	`owner` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `customers` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	`contact_no` varchar NOT NULL,
	`address` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `purchases` (
	`id` BINARY NOT NULL,
	`supplier_id` BINARY NOT NULL,
	`product_id` BINARY NOT NULL,
	`quantity` INT NOT NULL,
	`invoice_number` INT NOT NULL,
	`purchase_price` INT NOT NULL,
	`amount_paid` INT NOT NULL,
	`amount_remaining` INT NOT NULL,
	`product_image` INT NOT NULL
);

CREATE TABLE `products` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	`selling_price` FLOAT NOT NULL,
	`category_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `supplier` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`name` BINARY NOT NULL AUTO_INCREMENT,
	`addressv` BINARY NOT NULL AUTO_INCREMENT,
	`address` varchar NOT NULL AUTO_INCREMENT,
	`contact` varchar NOT NULL AUTO_INCREMENT,
	`business_name` varchar NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sales` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`customer` BINARY NOT NULL AUTO_INCREMENT,
	`total_bill` FLOAT NOT NULL,
	`discount` FLOAT NOT NULL,
	`bill_paid` FLOAT NOT NULL,
	`remaining` FLOAT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order_products` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`orders_id` BINARY NOT NULL,
	`products_id` BINARY NOT NULL,
	`quantity` BINARY NOT NULL,
	`product_price` BINARY NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_categories` (
	`id` BINARY NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `purchases` ADD CONSTRAINT `purchases_fk0` FOREIGN KEY (`supplier_id`) REFERENCES `supplier`(`id`);

ALTER TABLE `purchases` ADD CONSTRAINT `purchases_fk1` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`);

ALTER TABLE `products` ADD CONSTRAINT `products_fk0` FOREIGN KEY (`category_id`) REFERENCES `product_categories`(`id`);

ALTER TABLE `sales` ADD CONSTRAINT `sales_fk0` FOREIGN KEY (`customer`) REFERENCES `customers`(`id`);

ALTER TABLE `order_products` ADD CONSTRAINT `order_products_fk0` FOREIGN KEY (`orders_id`) REFERENCES `sales`(`id`);

ALTER TABLE `order_products` ADD CONSTRAINT `order_products_fk1` FOREIGN KEY (`products_id`) REFERENCES `products`(`id`);

