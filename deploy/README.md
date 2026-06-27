# نشر Fanoon على elitepal.net — مرجع سريع

> **دليل مفصّل:** [docs/DEPLOY-ELITEPAL.md](../docs/DEPLOY-ELITEPAL.md)

## معلومات السيرفر

| البند | القيمة |
|-------|--------|
| النطاق | `elitepal.net` |
| المسار | `/home/baitpait/public_html/elitepalnet` |
| Document Root المفضّل | `.../elitepalnet/public` |
| DB | `baitpait_elitepal` / `baitpait_elitepal` |

---

## أول نشر

```bash
cd /home/baitpait/public_html
git clone https://github.com/baitpait/Fanoon.git elitepalnet
cd elitepalnet
chown -R baitpait:baitpait .
chmod +x deploy/*.sh
COMPOSER_ALLOW_SUPERUSER=1 REMOVE_DEPLOY_ENV=1 ./deploy/server_setup.sh
./deploy/fix_public_symlinks.sh
php artisan route:cache && php artisan config:cache
```

---

## تحديث لاحق

```bash
cd /home/baitpait/public_html/elitepalnet
git config --global --add safe.directory "$(pwd)"
COMPOSER_ALLOW_SUPERUSER=1 ./deploy/pull_update.sh
./deploy/fix_public_symlinks.sh
php artisan route:cache && php artisan config:cache
```

---

## سكربتات `deploy/`

| السكربت | متى |
|---------|-----|
| `server_setup.sh` | أول إعداد |
| `pull_update.sh` | بعد `git pull` |
| `fix_public_symlinks.sh` | CSS/JS/storage لا تعمل |
| `sync_migrations_after_dump.sql` | خطأ `Table already exists` |
| `env.elitepal.net` | قالب `.env` — احذفه بعد الإعداد |
| `htaccess.project-root` | `.htaccess` لجذر المشروع |

---

## تحقق سريع

```bash
curl -sI "https://elitepal.net/css/demo.css" | head -1
curl -sI "https://elitepal.net/api/v1/config" | head -1
```

---

## روابط

- الموقع: https://elitepal.net
- Admin: https://elitepal.net/admin/auth/login
- API: https://elitepal.net/api/v1/config

**الدخول (من dump):** `info@baitpait.com` / `100200300`
