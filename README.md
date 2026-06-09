# Fanoon — لوحة تحكم المتجر الإلكتروني

[![Laravel](https://img.shields.io/badge/Laravel-12.x-FF2D20?logo=laravel&logoColor=white)](https://laravel.com)
[![PHP](https://img.shields.io/badge/PHP-8.2%2B-777BB4?logo=php&logoColor=white)](https://www.php.net/)
[![License](https://img.shields.io/badge/License-Proprietary-blue.svg)](LICENSE)

نسخة جاهزة للتطوير من **لوحة التحكم + REST API** لمتجر إلكتروني (منتجات، طلبات، عملاء، تقارير، إعدادات).

> هذه النسخة **لا تتضمن** بيانات قاعدة بيانات إنتاجية ولا ملفات الوسائط المرفوعة (`storage`). ابدأ بقاعدة بيانات فارغة عبر `migrate` و`seed`.

| العنصر | الوصف |
|--------|--------|
| **لوحة التحكم** | إدارة المنتجات، الطلبات، العملاء، التقارير، الإعدادات، المدن والمناطق |
| **API** | `api/v1/*` — مصادقة **Laravel Passport** (OAuth2) |
| **الاستهداف** | تطبيقات Flutter / Web تتصل بالـ API |

---

## المتطلبات

- PHP **8.2+** (امتدادات: `pdo_mysql`, `openssl`, `mbstring`, `json`, `curl`, `gd`, …)
- Composer 2.x
- MySQL 8+ أو MariaDB 10.6+
- Node.js (اختياري — لبناء الـ assets الأمامية)

---

## التثبيت السريع (محلي)

```bash
git clone https://github.com/baitpait/Fanoon.git
cd Fanoon

composer install

cp .env.example .env
php artisan key:generate

# عدّل .env: DB_*, APP_URL, CORS_ALLOWED_ORIGINS

php artisan migrate --force
php artisan db:seed --class=BaitPaitSeeder
php artisan passport:keys --force
php artisan storage:link

php artisan serve
```

- **تسجيل دخول لوحة التحكم:** `/admin/auth/login`
- بعد `BaitPaitSeeder`: استخدم بيانات المشرف الافتراضية من `database/seeders/BaitPaitSeeder.php`

---

## البذور المفيدة

| الأمر | الغرض |
|--------|--------|
| `php artisan db:seed --class=BaitPaitSeeder` | مشرف افتراضي + فرع + عملاء Passport |
| `php artisan db:seed --class=WestBankPalestineCitiesSeeder` | مدن الضفة الغربية |
| `php artisan db:seed --class=InsideArabTownsCitiesSeeder` | بلدات عرب الداخل |
| `php artisan db:seed --class=JerusalemDeliveryCitySeeder` | القدس ضمن منطقة القدس |

---

## هيكل المشروع (مختصر)

```
app/Http/Controllers/Admin/   # لوحة التحكم
app/Http/Controllers/Api/V1/ # API التطبيق
config/cors.php
database/migrations/
database/seeders/
docs/DEVELOPER-ONBOARDING.md
routes/admin.php
routes/api/v1/api.php
```

---

## الأمان

- **لا** ترفع ملف `.env` أو مفاتيح `storage/*.key` إلى Git.
- صلاحيات `storage/` و`bootstrap/cache/` قابلة للكتابة على السيرفر فقط.
- لا تضمّن نسخ SQL إنتاجية أو أرشيفات رفع في المستودع.

---

## التوثيق

- [docs/DEVELOPER-ONBOARDING.md](docs/DEVELOPER-ONBOARDING.md)
- [docs/DEPLOY-ANAGHEEMHOME.md](docs/DEPLOY-ANAGHEEMHOME.md) — مرجع نشر الإنتاج

---

## الحقوق

© Bait Pait — مشروع خاص. الاستخدام والنشر بإذن صاحب المشروع.

**مستودع GitHub:** [github.com/baitpait/Fanoon](https://github.com/baitpait/Fanoon)
