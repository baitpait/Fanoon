# نشر Fanoon على elitepal.net

## معلومات السيرفر

| البند | القيمة |
|-------|--------|
| النطاق | `elitepal.net` |
| مسار المشروع | `/home/baitpait/public_html/elitepalnet` |
| Document Root | `/home/baitpait/public_html/elitepalnet/public` |
| قاعدة البيانات | `baitpait_elitepal` |
| المستخدم | `baitpait_elitepal` |

---

## أوامر السيرفر (نسخ ولصق)

### أول مرة — استنساخ

```bash
cd /home/baitpait/public_html
git clone git@github.com:baitpait/Fanoon.git elitepalnet
cd elitepalnet
chmod +x deploy/server_setup.sh
./deploy/server_setup.sh
```

### تحديث لاحق — بعد تعديلات على GitHub

```bash
cd /home/baitpait/public_html/elitepalnet
chmod +x deploy/pull_update.sh
./deploy/pull_update.sh
```

أو يدوياً:

```bash
git config --global --add safe.directory /home/baitpait/public_html/elitepalnet
chown -R baitpait:baitpait /home/baitpait/public_html/elitepalnet
git pull origin main
COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader --no-interaction
mysql -u baitpait_elitepal -p baitpait_elitepal < deploy/sync_migrations_after_dump.sql
php artisan migrate --force
php artisan config:cache && php artisan route:cache && php artisan view:cache
```

### أول إعداد + حذف ملف البيئة من Git فوراً

```bash
REMOVE_DEPLOY_ENV=1 ./deploy/server_setup.sh
```

---

## قبل الرفع (cPanel)

1. أنشئ قاعدة بيانات `baitpait_elitepal` والمستخدم `baitpait_elitepal` بكلمة المرور من `deploy/env.elitepal.net`
2. امنح المستخدم صلاحيات كاملة على القاعدة
3. فعّل SSL لـ `elitepal.net`
4. اضبط **Document Root** → `elitepalnet/public`

---

## ملفات مهمة

| الملف | الغرض |
|-------|--------|
| `deploy/env.elitepal.net` | بيئة الإنتاج — يُنسخ إلى `.env` |
| `deploy/server_setup.sh` | سكربت الإعداد الكامل |
| `database/fanoun_dump.sql` | بيانات أولية (منتجات، إعدادات، admin) |
| `docs/DEPLOY-ELITEPAL.md` | دليل مفصّل |

---

## بعد الإعداد

- الموقع: https://elitepal.net
- Admin: https://elitepal.net/admin/auth/login
- API: https://elitepal.net/api/v1/config

**احذف** `deploy/env.elitepal.net` من السيرفر بعد التأكد من عمل الموقع.
