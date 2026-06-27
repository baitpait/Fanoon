# دليل رفع المشروع على الاستضافة — elitepal.net

## معلومات الاستضافة

| البند | القيمة |
|-------|--------|
| النطاق | elitepal.net |
| مسار المشروع | `/home/baitpait/public_html/elitepalnet` |
| Document Root | `/home/baitpait/public_html/elitepalnet/public` |
| قاعدة البيانات | `baitpait_elitepal` |
| المستخدم | `baitpait_elitepal` |

> **ملاحظة:** كلمة مرور قاعدة البيانات في `deploy/env.elitepal.net` — استخدم علامات تنصيص للرموز الخاصة.

---

## النشر السريع (Git + Shell)

```bash
cd /home/baitpait/public_html
git clone git@github.com:baitpait/Fanoon.git elitepalnet
cd elitepalnet
chmod +x deploy/server_setup.sh
REMOVE_DEPLOY_ENV=1 ./deploy/server_setup.sh
```

**دليل مفصّل:** [docs/DEPLOY-ELITEPAL.md](docs/DEPLOY-ELITEPAL.md)  
**أوامر مختصرة:** [deploy/README.md](deploy/README.md)

---

## ما يُجهَّز في الريبو

| الملف | الوظيفة |
|-------|---------|
| `deploy/env.elitepal.net` | `.env` جاهز للإنتاج |
| `deploy/server_setup.sh` | إعداد تلقائي كامل |
| `database/fanoun_dump.sql` | بيانات أولية |
| `.env.hosting.example` | قالب بدون أسرار |

---

## خطوات cPanel (قبل الشيل)

1. أنشئ قاعدة `baitpait_elitepal` ومستخدم `baitpait_elitepal`
2. فعّل SSL
3. Document Root → `elitepalnet/public`

---

## تحديث لاحق

```bash
cd /home/baitpait/public_html/elitepalnet
git pull origin main
composer install --no-dev --optimize-autoloader --no-interaction
php artisan migrate --force
php artisan config:cache && php artisan route:cache && php artisan view:cache
```

---

## صلاحيات المجلدات

```bash
chmod -R 775 storage bootstrap/cache
```

---

## SSL

- `FORCE_HTTPS=true`
- `APP_URL=https://elitepal.net`

---

## استكشاف الأخطاء

| المشكلة | الحل |
|---------|------|
| 500 Internal Server Error | `.env` + صلاحيات `storage` و `bootstrap/cache` |
| قاعدة البيانات لا تتصل | `DB_HOST=localhost` وبيانات cPanel |
| الصور لا تظهر | `php artisan storage:link` |
| CORS | `CORS_ALLOWED_ORIGINS` في `.env` ثم `config:cache` |

---

## أمان

- احذف `deploy/env.elitepal.net` بعد الإعداد على السيرفر
- `APP_DEBUG=false` في الإنتاج
- Document Root = مجلد `public/` فقط
