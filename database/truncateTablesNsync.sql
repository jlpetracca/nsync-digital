set foreign_key_checks = 0;
truncate `tn_attributes`;
truncate `tn_attributes_values`;
truncate `tn_categories`;
truncate `tn_category_product`;
truncate `tn_product_image`;
truncate `tn_products`;
truncate `tn_store`;
truncate `tn_variants`;
truncate `tn_variants_attributes`;
truncate `tn_webhooks`;
delete from users where id !=1;
set foreign_key_checks=1;