-- Run this against the existing foodapplication schema before using checkout.
-- Safe to run whether delivery_address is already present or not.
USE foodapplication;
SET @delivery_address_exists = (
  SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'orders'
    AND COLUMN_NAME = 'delivery_address'
);
SET @delivery_address_sql = IF(
  @delivery_address_exists = 0,
  'ALTER TABLE orders ADD COLUMN delivery_address TEXT NULL',
  'SELECT ''delivery_address column already exists'' AS status'
);
PREPARE delivery_address_stmt FROM @delivery_address_sql;
EXECUTE delivery_address_stmt;
DEALLOCATE PREPARE delivery_address_stmt;
