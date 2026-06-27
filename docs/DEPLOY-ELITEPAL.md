# نشر Fanoon على elitepal.net

دليل النشر عبر **Git pull** على استضافة مشتركة (cPanel).

---

## 1. البنية على السيرفر

```
/home/baitpait/public_html/elitepalnet/     ← جذر Laravel (artisan, app/, config/, …)
/home/baitpait/public_html/elitepalnet/public/  ← Document Root للدومين
```

في cPanel → Domains → `elitepal.net` → Document Root:

```
/home/baitpait/public_html/elitepalnet/public
```

---

## 2. إعداد قاعدة البيانات (cPanel)

1. MySQL Databases → أنشئ قاعدة: `baitpait_elitepal`
2. أنشئ مستخدماً: `baitpait_elitepal`
3. اربط المستخدم بالقاعدة بصلاحيات **ALL PRIVILEGES**
4. كلمة المرور في `deploy/env.elitepal.net`

---

## 3. أول نشر — من الشيل

```bash
cd /home/baitpait/public_html

# استنساخ (SSH)
git clone git@github.com:baitpait/Fanoon.git elitepalnet

cd elitepalnet

# إعداد كامل: composer + .env + DB import + passport + cache
chmod +x deploy/server_setup.sh
REMOVE_DEPLOY_ENV=1 ./deploy/server_setup.sh
```

### ماذا يفعل `server_setup.sh`؟

1. ينسخ `deploy/env.elitepal.net` → `.env`
2. `composer install --no-dev`
3. يستورد `database/fanoun_dump.sql` (افتراضياً `IMPORT_DB=1`)
4. `php artisan migrate --force`
5. `php artisan passport:keys --force`
6. `php artisan storage:link`
7. يبني كاش الإنتاج
8. (اختياري) يحذف `deploy/env.elitepal.net` إذا `REMOVE_DEPLOY_ENV=1`

### بدون استيراد dump (قاعدة فارغة)

```bash
IMPORT_DB=0 ./deploy/server_setup.sh
php artisan db:seed --class=BaitPaitSeeder --force
```

---

## 4. تحديثات لاحقة

```bash
cd /home/baitpait/public_html/elitepalnet
git pull origin main
composer install --no-dev --optimize-autoloader --no-interaction
php artisan migrate --force
php artisan optimize:clear
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

---

## 5. متغيرات البيئة المهمة

| المتغير | القيمة |
|---------|--------|
| `APP_URL` | `https://elitepal.net` |
| `FORCE_HTTPS` | `true` |
| `DB_DATABASE` | `baitpait_elitepal` |
| `CORS_ALLOWED_ORIGINS` | `https://elitepal.net,https://www.elitepal.net` |
| `GOOGLE_TRANSLATE_API_KEY` | مضبوط في `deploy/env.elitepal.net` |

لإضافة نطاق CORS (مثلاً تطبيق Flutter Web):

```env
CORS_ALLOWED_ORIGINS=https://elitepal.net,https://www.elitepal.net,https://app.elitepal.net
```

ثم: `php artisan config:cache`

---

## 6. الصور والتخزين

- مجلد `storage/app/public` **غير مُتعقّب في Git**
- بعد النشر: `php artisan storage:link`
- ارفع صور المنتجات لاحقاً عبر لوحة Admin أو انسخ من نسخة محلية

---

## 7. Passport و API

```bash
php artisan passport:keys --force
```

- **Base URL للـ API:** `https://elitepal.net`
- **مثال:** `https://elitepal.net/api/v1/config`

---

## 8. استكشاف الأخطاء

| المشكلة | الحل |
|---------|------|
| 500 Error | تحقق من `.env` وصلاحيات `storage` و `bootstrap/cache` (775) |
| DB connection failed | `DB_HOST=localhost` — راجع بيانات cPanel |
| صور لا تظهر | `php artisan storage:link` |
| CORS من Flutter | أضف النطاق في `CORS_ALLOWED_ORIGINS` + `config:cache` |
| صفحة بيضاء | مؤقتاً `APP_DEBUG=true` في `.env` لرؤية الخطأ ثم أعد `false` |

---

## 9. أمان

- Document Root = `public/` فقط
- `APP_DEBUG=false` في الإنتاج
- احذف `deploy/env.elitepal.net` بعد الإعداد
- لا ترفع `.env` إلى GitHub

---

## 10. الدخول الافتراضي (من dump)

| | |
|---|---|
| البريد | `info@baitpait.com` |
| كلمة المرور | `100200300` |
| الرابط | `/admin/auth/login` |

**غيّر كلمة المرور فوراً بعد أول دخول.**
