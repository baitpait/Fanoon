# Admin Anagheem Home

[![Laravel](https://img.shields.io/badge/Laravel-12.x-FF2D20?logo=laravel&logoColor=white)](https://laravel.com)
[![PHP](https://img.shields.io/badge/PHP-8.2%2B-777BB4?logo=php&logoColor=white)](https://www.php.net/)
[![License](https://img.shields.io/badge/License-Proprietary-blue.svg)](LICENSE)

Backend رسمي لمتجر **Anagheem Home**: **لوحة تحكم إدارية** + **REST API** للتطبيقات والواجهات الخارجية (Flutter / Web).

| العنصر | الوصف |
|--------|--------|
| **لوحة التحكم** | منتجات، طلبات، عملاء، تقارير، إعدادات، مدن ومناطق توصيل |
| **API** | `api/v1/*` — مصادقة **Laravel Passport** (OAuth2) |
| **النشر المستهدف** | `https://admin.anagheemhome.com` (جذر الويب = مجلد `public`) |

---

## المتطلبات

- PHP **8.2+** (امتدادات: `pdo_mysql`, `openssl`, `mbstring`, `json`, `curl`, `gd`, …)
- Composer 2.x
- MySQL 8+ أو MariaDB 10.6+
- Node.js (اختياري — لبناء الـ assets الأمامية)

---

## التثبيت السريع (محلي)

```bash
git clone https://github.com/baitpait/AdminAnagheemHome.git
cd AdminAnagheemHome

composer install

cp .env.example .env
php artisan key:generate

# عدّل .env: DB_*, APP_URL, CORS_ALLOWED_ORIGINS (للإنتاج)

php artisan migrate --force
php artisan passport:keys --force
php artisan storage:link

php artisan serve
```

- **تسجيل دخول لوحة التحكم:** `/admin/auth/login`  
- بعد أول تشغيل: أنشئ مشرفاً عبر البذور أو من قاعدة البيانات حسب إعدادكم (انظر `database/seeders/`).

---

## البذور المفيدة

| الأمر | الغرض |
|--------|--------|
| `php artisan db:seed --class=BaitPaitSeeder` | مشرف افتراضي + فرع + عملاء Passport |
| `php artisan db:seed --class=WestBankPalestineCitiesSeeder` | مدن الضفة الغربية |
| `php artisan db:seed --class=InsideArabTownsCitiesSeeder` | بلدات عرب الداخل |
| `php artisan db:seed --class=JerusalemDeliveryCitySeeder` | القدس ضمن منطقة القدس |

---

## استيراد من WooCommerce (WordPress)

```bash
php artisan import:wordpress-woocommerce \
  --sql=/مسار/للتصدير.sql \
  --uploads=/مسار/wp-content/uploads \
  --wipe --import-sql
```

يتطلب إعداد اتصال `wordpress_import` في `config/database.php` / `.env` (راجع `.env.example`).

---

## النشر على الإنتاج

دليل تفصيلي: **[docs/DEPLOY-ANAGHEEMHOME.md](docs/DEPLOY-ANAGHEEMHOME.md)**

ملخص:

1. جذر المشروع على السيرفر ≠ جذر الويب؛ **Document root** يجب أن يشير إلى **`public/`**.
2. `APP_ENV=production`, `APP_DEBUG=false`, `APP_URL` و`FORCE_HTTPS=true`.
3. `CORS_ALLOWED_ORIGINS` يضم كل نطاقات الواجهات التي تستدعي الـ API.
4. بعد الرفع: `composer install --no-dev`, `php artisan storage:link`, كاش الإعدادات.

**أساس API للعميل:** `https://admin.anagheemhome.com/api/v1/` (يُحدَّد حسب `APP_URL`).

---

## هيكل المشروع (مختصر)

```
app/Http/Controllers/Admin/   # لوحة التحكم
app/Http/Controllers/Api/V1/ # API التطبيق
config/cors.php              # CORS + أنماط *.anagheemhome.com
database/migrations/         # الهجرة الموحّدة + تعديلات Bait Pait
docs/DEPLOY-ANAGHEEMHOME.md  # نشر الإنتاج
routes/admin.php
routes/api/v1/api.php
```

---

## الأمان

- **لا** ترفع ملف `.env` أو مفاتيح `storage/*.key` إلى Git.
- صلاحيات `storage/` و`bootstrap/cache/` قابلة للكتابة على السيرفر فقط.
- بعد تسريب أي **Personal Access Token** لـ GitHub: ألغِه فوراً من الإعدادات وأنشئ رمزاً جديداً.

---

## التوثيق الداخلي

- [docs/DEVELOPER-ONBOARDING.md](docs/DEVELOPER-ONBOARDING.md)
- [docs/DEPLOY-ANAGHEEMHOME.md](docs/DEPLOY-ANAGHEEMHOME.md)

---

## الحقوق

© Bait Pait — مشروع خاص (Anagheem Home). الاستخدام والنشر بإذن صاحب المشروع.

---

**مستودع GitHub:** [github.com/baitpait/AdminAnagheemHome](https://github.com/baitpait/AdminAnagheemHome)
