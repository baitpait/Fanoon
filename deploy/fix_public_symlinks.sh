#!/bin/bash
# ============================================
# إصلاح روابط الملفات العامة عندما Document Root
# = /home/baitpait/public_html/elitepalnet (بدون /public)
# ============================================
# الاستخدام:
#   cd /home/baitpait/public_html/elitepalnet
#   chmod +x deploy/fix_public_symlinks.sh
#   ./deploy/fix_public_symlinks.sh
# ============================================

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

green() { printf '\033[0;32m%s\033[0m\n' "$*"; }

green "==> Laravel index من جذر المشروع"
cat > index.php << 'EOF'
<?php
require __DIR__.'/public/index.php';
EOF

cp public/.htaccess .htaccess

green "==> روابط للملفات الثابتة (css, js, assets, storage)"
ln -sfn public/assets assets
ln -sfn public/css css
ln -sfn public/js js
ln -sfn public/images images 2>/dev/null || true
ln -sfn public/fonts fonts 2>/dev/null || true

green "==> storage:link داخل public"
php artisan storage:link --force 2>/dev/null || php artisan storage:link

green "==> رابط storage من جذر المشروع"
ln -sfn public/storage storage

green "==> مجلدات الرفع + صلاحيات"
mkdir -p storage/app/public/{admin,profile,product,category,ecommerce,banner,notification}
chmod -R 775 storage bootstrap/cache
chown -R baitpait:baitpait storage bootstrap/cache index.php .htaccess assets css js storage 2>/dev/null || true

green "==> اختبار"
for path in assets/admin/css/style.css css/demo.css; do
  if [ -f "public/${path#assets/}" ] 2>/dev/null; then :; fi
  if [ -f "public/assets/admin/css/style.css" ] && [ "$path" = "assets/admin/css/style.css" ]; then
    [ -e "$path" ] && green "OK: $path" || echo "MISSING: $path"
  fi
  if [ -f "public/css/demo.css" ] && [ "$path" = "css/demo.css" ]; then
    [ -e "$path" ] && green "OK: $path" || echo "MISSING: $path"
  fi
done

[ -L storage ] && green "OK: storage -> $(readlink storage)" || echo "WARN: storage link missing"
[ -d storage/app/public/admin ] && green "OK: storage/app/public/admin writable" || true

green "تم. جرّب:"
echo "  curl -sI -H 'Host: elitepal.net' http://127.0.0.1/css/demo.css | head -1"
echo "  curl -sI -H 'Host: elitepal.net' http://127.0.0.1/assets/admin/css/style.css | head -1"
