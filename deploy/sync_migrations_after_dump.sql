-- تسجيل migrations موجودة فعلياً في الـ dump (تجنب خطأ Table already exists)
-- شغّل مرة واحدة بعد استيراد database/fanoun_dump.sql
-- الاستخدام: mysql -u USER -p DATABASE < deploy/sync_migrations_after_dump.sql

INSERT INTO migrations (migration, batch)
SELECT '0001_01_01_000000_create_users_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '0001_01_01_000000_create_users_table');

INSERT INTO migrations (migration, batch)
SELECT '0001_01_01_000001_create_cache_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '0001_01_01_000001_create_cache_table');

INSERT INTO migrations (migration, batch)
SELECT '0001_01_01_000002_create_jobs_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '0001_01_01_000002_create_jobs_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_144213_create_templates_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_144213_create_templates_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_144214_create_designs_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_144214_create_designs_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_144214_create_orders_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_144214_create_orders_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_144215_create_cart_items_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_144215_create_cart_items_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_144215_create_order_items_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_144215_create_order_items_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_144216_create_company_profiles_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_144216_create_company_profiles_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_144222_add_account_fields_to_users_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_144222_add_account_fields_to_users_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_160000_create_settings_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_160000_create_settings_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_170000_create_admin_feature_tables', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_170000_create_admin_feature_tables');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_200001_create_categories_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_200001_create_categories_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_200002_create_subcategories_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_200002_create_subcategories_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_200003_create_products_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_200003_create_products_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_200004_create_product_templates_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_200004_create_product_templates_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_200005_add_product_template_to_designs_and_cart', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_200005_add_product_template_to_designs_and_cart');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_300001_add_sizes_to_products_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_300001_add_sizes_to_products_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_07_400001_add_shipping_to_orders_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_07_400001_add_shipping_to_orders_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_08_091950_make_designs_fabric_json_nullable', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_08_091950_make_designs_fabric_json_nullable');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_08_120000_add_admin_role_to_users_table', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_08_120000_add_admin_role_to_users_table');

INSERT INTO migrations (migration, batch)
SELECT '2026_06_08_130000_add_product_id_to_designs_and_cart_items', 99 FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM migrations WHERE migration = '2026_06_08_130000_add_product_id_to_designs_and_cart_items');
