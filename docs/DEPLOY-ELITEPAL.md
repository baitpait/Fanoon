# نشر Fanoon على elitepal.net

دليل النشر الفعلي على السيرفر `server1` — استضافة مشتركة، مستخدم `baitpait`، نشر عبر **Git + Shell**.

**آخر تحديث:** 2026-06-27 (بعد نشر إنتاجي ناجح)

---

## 1. معلومات السيرفر

| البند | القيمة |
|-------|--------|
| النطاق | `elitepal.net` |
| مسار المشروع | `/home/baitpait/public_html/elitepalnet` |
| Document Root **المفضّل** | `/home/baitpait/public_html/elitepalnet/public` |
| قاعدة البيانات | `baitpait_elitepal` |
| مستخدم MySQL | `baitpait_elitepal` |
| الريبو | `https://github.com/baitpait/Fanoon` |
| فرع النشر | `main` |

---

## 2. البنية على القرص

```
/home/baitpait/public_html/elitepalnet/
├── app/ config/ routes/ vendor/ artisan   ← Laravel
├── public/                                 ← Document Root المفضّل
│   ├── index.php
│   ├── assets/ css/ js/
│   └── storage → ../storage/app/public    ← symlink
├── storage/app/public/                     ← صور مرفوعة (admin/, product/, …)
├── deploy/                                 ← سكربتات النشر
├── database/fanoun_dump.sql                ← بيانات أولية
├── index.php                               ← fallback إن كان الجذر = elitepalnet
├── .htaccess                               ← fallback (deploy/htaccess.project-root)
├── assets → public/assets                  ← symlink (fallback)
└── css → public/css                        ← symlink (fallback)
```

---

## 3. إعداد cPanel / MySQL (قبل الشيل)

1. أنشئ قاعدة `baitpait_elitepal` ومستخدم `baitpait_elitepal` بصلاحيات **ALL PRIVILEGES**
2. فعّل SSL لـ `elitepal.net`
3. اضبط **DNS** (A record → IP السيرفر) — بدون DNS يظهر `DNS_PROBE_FINISHED_NXDOMAIN`
4. Document Root → `elitepalnet/public` (انظر القسم 8 إن تعذّر)

---

## 4. أول نشر — استنساخ وإعداد

### 4.1 استنساخ (HTTPS — يعمل كـ root)

SSH كـ `root` **لا يملك** مفتاح GitHub. استخدم HTTPS:

```bash
cd /home/baitpait/public_html
git clone https://github.com/baitpait/Fanoon.git elitepalnet
cd elitepalnet
chown -R baitpait:baitpait .
```

> `su - baitpait` يفشل غالباً (`This account is currently not available`) — shell معطّل في cPanel. استخدم `runuser -u baitpait --` أو نفّذ كـ root مع `chown`.

### 4.2 إعداد كامل

```bash
chmod +x deploy/server_setup.sh deploy/fix_public_symlinks.sh
COMPOSER_ALLOW_SUPERUSER=1 REMOVE_DEPLOY_ENV=1 ./deploy/server_setup.sh
./deploy/fix_public_symlinks.sh
php artisan route:cache && php artisan config:cache
```

### 4.3 استيراد قاعدة البيانات يدوياً (إن فشل في السكربت)

```bash
mysql -u baitpait_elitepal -p baitpait_elitepal < database/fanoun_dump.sql
mysql -u baitpait_elitepal -p baitpait_elitepal < deploy/sync_migrations_after_dump.sql
php artisan migrate --force
```

### 4.4 ماذا يفعل كل سكربت؟

| السكربت | الوظيفة |
|---------|---------|
| `deploy/server_setup.sh` | composer، `.env`، استيراد DB، passport، storage:link، cache |
| `deploy/fix_public_symlinks.sh` | symlinks لـ css/assets/js + `.htaccess` لجذر المشروع |
| `deploy/pull_update.sh` | git pull + composer + sync migrations + migrate + cache |
| `deploy/sync_migrations_after_dump.sql` | تسجيل migrations موجودة لتجنب `Table already exists` |

---

## 5. تحديثات لاحقة

```bash
cd /home/baitpait/public_html/elitepalnet
git config --global --add safe.directory /home/baitpait/public_html/elitepalnet
chmod +x deploy/pull_update.sh
COMPOSER_ALLOW_SUPERUSER=1 ./deploy/pull_update.sh
./deploy/fix_public_symlinks.sh
php artisan route:cache && php artisan config:cache
```

---

## 6. متغيرات البيئة (`.env`)

| المتغير | القيمة |
|---------|--------|
| `APP_URL` | `https://elitepal.net` |
| `APP_ENV` | `production` |
| `APP_DEBUG` | `false` |
| `FORCE_HTTPS` | `true` |
| `DB_HOST` | `localhost` |
| `DB_DATABASE` | `baitpait_elitepal` |
| `DB_USERNAME` | `baitpait_elitepal` |
| `CORS_ALLOWED_ORIGINS` | `https://elitepal.net,https://www.elitepal.net` |
| `GOOGLE_TRANSLATE_API_KEY` | مضبوط في `deploy/env.elitepal.net` |

القالب: `deploy/env.elitepal.net` → يُنسخ إلى `.env` عبر `server_setup.sh`.

**أمان:** احذف `deploy/env.elitepal.net` من السيرفر بعد الإعداد.

---

## 7. الصور والملفات المرفوعة

### المسار الفعلي للملفات

```
storage/app/public/admin/2026-06-27-xxxxx.webp
```

### URL في المتصفح

```
https://elitepal.net/storage/admin/2026-06-27-xxxxx.webp
```

### آلية التقديم (ثلاث طبقات)

1. **Apache + `public/storage` symlink** — عند Document Root = `public/`
2. **`.htaccess` في جذر المشروع** — يوجّه `/storage/*` → `public/storage/*` (fallback)
3. **Route Laravel** `GET storage/{path}` في `routes/web.php` — fallback عند فشل Apache

بعد أي تعديل على routes:

```bash
php artisan route:clear && php artisan route:cache
```

### صلاحيات

```bash
chmod -R 775 storage bootstrap/cache
chown -R baitpait:baitpait storage bootstrap/cache
php artisan storage:link --force
```

---

## 8. Document Root غير قياسي (مشكلة شائعة)

إذا كان Apache يخدم من `/home/baitpait/public_html/elitepalnet` **بدون** `/public`:

| العرض | السبب | الحل |
|--------|--------|------|
| CSS/JS 404 (`style.css`, `demo.css`) | الملفات في `public/css` | `./deploy/fix_public_symlinks.sh` |
| صورة تُرفع لكن لا تظهر | `/storage/` لا يصل للملف | `.htaccess` + route Laravel |
| `curl 127.0.0.1` → 404 | vhost مختلف عن localhost | اختبر بـ `https://elitepal.net` |

**الحل الأفضل:** Document Root = `elitepalnet/public`

**الحل البديل (مُطبّق):** `fix_public_symlinks.sh` + `deploy/htaccess.project-root`

---

## 9. Passport و API

```bash
php artisan passport:keys --force
```

| | |
|---|---|
| Base URL | `https://elitepal.net` |
| Config API | `https://elitepal.net/api/v1/config` |
| Admin | `https://elitepal.net/admin/auth/login` |

---

## 10. استكشاف الأخطاء

| المشكلة | الحل |
|---------|------|
| `Repository not found` (git SSH) | استخدم `git clone https://github.com/baitpait/Fanoon.git` |
| `dubious ownership` | `git config --global --add safe.directory ...` |
| `Access denied` MySQL | راجع cPanel — كلمة المرور في `.env` بين `"..."` |
| `Table 'users' already exists` | `mysql ... < deploy/sync_migrations_after_dump.sql` |
| `--fake` does not exist | Laravel 12 — استخدم SQL sync بدلاً من `--fake` |
| `DNS_PROBE_FINISHED_NXDOMAIN` | اضبط DNS A record للدومين |
| CSS 404 | `./deploy/fix_public_symlinks.sh` |
| صورة 500/404 | `route:cache` + اختبر `curl -sI https://elitepal.net/storage/admin/FILE.webp` |
| Composer كـ root | `COMPOSER_ALLOW_SUPERUSER=1` |

### أوامر تحقق

```bash
# يجب 200 OK — استخدم الدومين الحقيقي
curl -sI "https://elitepal.net/css/demo.css" | head -1
curl -sI "https://elitepal.net/storage/admin/SOME_FILE.webp" | head -1

# Laravel
php artisan --version
tail -30 storage/logs/laravel.log
```

---

## 11. الدخول الافتراضي (من dump)

| | |
|---|---|
| البريد | `info@baitpait.com` |
| كلمة المرور | `100200300` |

**غيّر كلمة المرور فوراً بعد أول دخول.**

---

## 12. ملفات النشر في الريبو

| الملف | الغرض |
|-------|--------|
| `deploy/env.elitepal.net` | قالب `.env` للإنتاج |
| `deploy/server_setup.sh` | إعداد أولي كامل |
| `deploy/pull_update.sh` | تحديث من GitHub |
| `deploy/fix_public_symlinks.sh` | إصلاح CSS/JS/storage على استضافة غير قياسية |
| `deploy/htaccess.project-root` | `.htaccess` لجذر المشروع |
| `deploy/sync_migrations_after_dump.sql` | مزامنة جدول migrations |
| `database/fanoun_dump.sql` | بيانات أولية |
| `DEPLOYMENT_HOSTING.md` | ملخص سريع |

---

## 13. سجل النشر

راجع `PROJECT_LOG.md` — قسم `[2026-06-27] deploy — elitepal.net`.
