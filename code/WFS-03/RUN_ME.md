# Product Management and WHERE Search

PHP 8.0+ and the **pdo_mysql** extension, MySQL 8.0+/MariaDB.

1. Import `schema.sql` using phpMyAdmin or the `mysql` command line.
2. Configure `DB_HOST`, `DB_USER`, `DB_PASSWORD` environment variables (or edit defaults in `db.php` for local development).
3. From this program folder run `php -S 127.0.0.1:8000`.
4. Visit http://127.0.0.1:8000/index.php and test create/edit/delete.
5. Search using the form with a product name or category.

Do not deploy the default local root/blank-password database configuration to production.
This package has passed PHP syntax checks, not database-backed runtime tests.
