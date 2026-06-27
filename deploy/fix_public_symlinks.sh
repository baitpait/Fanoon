#!/bin/bash
# ============================================
# إصلاح روابط الملفات العامة عندما Document Root
# = /home/baitpait/public_html/elitepalnet (بدون /public)
# ============================================

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

green() { printf '\033[0;32m%s\033[0m\n' "$*"; }
yellow() { printf '\033[0;33m%s\033[0m\n' "$*"; }

green "==> Laravel index من جذر المشروع"
cat > index.php << 'EOF'
<?php
require __DIR__.'/public/index.php';
EOF

green "==> .htaccess لجذر المشروع (يشمل /storage/ للصور المرفوعة)"
cp "$SCRIPT_DIR/htaccess.project-root" .htaccess

green "==> روابط للملفات الثابتة (css, js, assets)"
ln -sfn public/assets assets
ln -sfn public/css css
ln -sfn public/js js
ln -sfn public/images images 2>/dev/null || true
ln -sfn public/fonts fonts 2>/dev/null || true

green "==> storage:link داخل public"
php artisan storage:link --force 2>/dev/null || php artisan storage:link

yellow "ملاحظة: لا يمكن symlink باسم storage في الجذر (يتعارض مع مجلد Laravel storage/)"
yellow "الصور تُخدم عبر قاعدة RewriteRule في .htaccess"

green "==> مجلدات الرفع + صلاحيات"
mkdir -p storage/app/public/{admin,profile,product,category,ecommerce,banner,notification}
chmod -R 775 storage bootstrap/cache
chown -R baitpait:baitpait storage bootstrap/cache index.php .htaccess assets css js 2>/dev/null || true

green "==> اختبار"
[ -e assets/admin/css/style.css ] && green "OK: assets/admin/css/style.css" || yellow "MISSING: assets/admin/css/style.css"
[ -e css/demo.css ] && green "OK: css/demo.css" || yellow "MISSING: css/demo.css"
[ -L public/storage ] && green "OK: public/storage -> $(readlink public/storage)" || yellow "MISSING: public/storage link"

SAMPLE="$(ls storage/app/public/admin/*.* 2>/dev/null | head -1 || true)"
if [ -n "$SAMPLE" ]; then
  BASENAME="$(basename "$SAMPLE")"
  yellow "اختبر صورة مرفوعة:"
  echo "  curl -sI -H 'Host: elitepal.net' http://127.0.0.1/storage/admin/$BASENAME | head -1"
fi

green "تم."
