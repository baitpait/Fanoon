# دليل رفع المشروع — elitepal.net

**دليل مفصّل:** [docs/DEPLOY-ELITEPAL.md](docs/DEPLOY-ELITEPAL.md)  
**أوامر سريعة:** [deploy/README.md](deploy/README.md)

## معلومات الاستضافة

| البند | القيمة |
|-------|--------|
| النطاق | elitepal.net |
| المسار | `/home/baitpait/public_html/elitepalnet` |
| Document Root | `.../elitepalnet/public` (مفضّل) |
| DB | `baitpait_elitepal` |

---

## نشر سريع

```bash
cd /home/baitpait/public_html
git clone https://github.com/baitpait/Fanoon.git elitepalnet
cd elitepalnet
chmod +x deploy/*.sh
COMPOSER_ALLOW_SUPERUSER=1 REMOVE_DEPLOY_ENV=1 ./deploy/server_setup.sh
./deploy/fix_public_symlinks.sh
```

---

## تحديث

```bash
cd /home/baitpait/public_html/elitepalnet
./deploy/pull_update.sh
./deploy/fix_public_symlinks.sh
php artisan route:cache && php artisan config:cache
```

---

## مشاكل شائعة (ملخّص)

| المشكلة | الحل |
|---------|------|
| Git SSH فشل | `git clone https://github.com/baitpait/Fanoon.git` |
| CSS 404 | `./deploy/fix_public_symlinks.sh` |
| صور لا تظهر | `storage:link` + `route:cache` |
| migrate `users exists` | `deploy/sync_migrations_after_dump.sql` |
| DNS NXDOMAIN | A record للدومين |

---

راجع [docs/DEPLOY-ELITEPAL.md](docs/DEPLOY-ELITEPAL.md) للتفاصيل الكاملة وسجل النشر في `PROJECT_LOG.md`.
