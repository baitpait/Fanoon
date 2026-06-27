#!/bin/bash
# ============================================
# Fanoon — إعداد السيرفر بعد git pull
# elitepal.net → /home/baitpait/public_html/elitepalnet
# ============================================
# الاستخدام (من جذر المشروع):
#   chmod +x deploy/server_setup.sh
#   ./deploy/server_setup.sh
#
# استيراد قاعدة البيانات (أول مرة — افتراضي):
#   IMPORT_DB=1 ./deploy/server_setup.sh
#
# بدون استيراد — migrations فقط:
#   IMPORT_DB=0 ./deploy/server_setup.sh
#
# حذف ملف البيئة من deploy بعد الإعداد:
#   REMOVE_DEPLOY_ENV=1 ./deploy/server_setup.sh
# ============================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT"

ENV_SOURCE="${ENV_SOURCE:-$SCRIPT_DIR/env.elitepal.net}"
IMPORT_DB="${IMPORT_DB:-1}"
REMOVE_DEPLOY_ENV="${REMOVE_DEPLOY_ENV:-0}"
PHP_BIN="${PHP_BIN:-php}"
COMPOSER_BIN="${COMPOSER_BIN:-composer}"

green()  { printf '\033[0;32m%s\033[0m\n' "$*"; }
yellow() { printf '\033[0;33m%s\033[0m\n' "$*"; }
red()    { printf '\033[0;31m%s\033[0m\n' "$*"; }

step() {
  echo ""
  green "==> $1"
}

fail() {
  red "خطأ: $1"
  exit 1
}

read_env_value() {
  local key="$1"
  local file="$2"
  local line value
  line="$(grep -E "^${key}=" "$file" | tail -1 || true)"
  [ -n "$line" ] || return 1
  value="${line#*=}"
  value="${value%\"}"
  value="${value#\"}"
  value="${value%\'}"
  value="${value#\'}"
  printf '%s' "$value"
}

step "التحقق من المتطلبات"
command -v "$PHP_BIN" >/dev/null 2>&1 || fail "PHP غير موجود. جرّب: PHP_BIN=/usr/local/bin/php82 ./deploy/server_setup.sh"
command -v "$COMPOSER_BIN" >/dev/null 2>&1 || fail "Composer غير موجود على السيرفر"

PHP_VERSION="$("$PHP_BIN" -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')"
step "PHP $PHP_VERSION"

for ext in pdo_mysql mbstring openssl tokenizer xml ctype json bcmath fileinfo curl gd zip; do
  "$PHP_BIN" -m 2>/dev/null | grep -qi "^${ext}$" || yellow "تحذير: امتداد PHP مفقود: $ext"
done

[ -f "$ENV_SOURCE" ] || fail "ملف البيئة غير موجود: $ENV_SOURCE"

step "نسخ ملف البيئة → .env"
cp "$ENV_SOURCE" .env
green "تم: .env"

step "تثبيت تبعيات Composer (إنتاج)"
"$COMPOSER_BIN" install --no-dev --optimize-autoloader --no-interaction

step "إنشاء مجلدات التخزين"
mkdir -p storage/framework/{cache/data,sessions,views,testing}
mkdir -p storage/logs
mkdir -p bootstrap/cache
mkdir -p storage/app/public/{product,category,category/banner,ecommerce,banner,profile,review,notification,conversation,delivery-man,branch,admin,flash-sale,payment_modules/gateway_image,design-template}

step "صلاحيات المجلدات"
chmod -R ug+rwx storage bootstrap/cache 2>/dev/null || chmod -R 775 storage bootstrap/cache

if [ "$IMPORT_DB" = "1" ]; then
  step "استيراد قاعدة البيانات من database/fanoun_dump.sql"
  [ -f database/fanoun_dump.sql ] || fail "database/fanoun_dump.sql غير موجود"

  DB_USER="$(read_env_value DB_USERNAME .env)"
  DB_PASS="$(read_env_value DB_PASSWORD .env)"
  DB_NAME="$(read_env_value DB_DATABASE .env)"
  DB_HOST="$(read_env_value DB_HOST .env)"
  DB_HOST="${DB_HOST:-localhost}"

  if command -v mysql >/dev/null 2>&1; then
    MYSQL_PWD="$DB_PASS" mysql -h "$DB_HOST" -u "$DB_USER" "$DB_NAME" < database/fanoun_dump.sql
    green "تم استيراد قاعدة البيانات."
  else
    yellow "mysql CLI غير متوفر — استورد يدوياً عبر phpMyAdmin:"
    yellow "  الملف: database/fanoun_dump.sql"
    yellow "  القاعدة: $DB_NAME"
  fi
fi

step "تشغيل migrations (أي تحديثات جديدة فوق الـ dump)"
"$PHP_BIN" artisan migrate --force

step "مفاتيح Passport (API)"
"$PHP_BIN" artisan passport:keys --force

step "رابط التخزين public/storage"
if [ -L public/storage ] || [ -d public/storage ]; then
  "$PHP_BIN" artisan storage:link --force 2>/dev/null || "$PHP_BIN" artisan storage:link
else
  "$PHP_BIN" artisan storage:link
fi

step "مسح وبناء الكاش"
"$PHP_BIN" artisan optimize:clear
"$PHP_BIN" artisan config:cache
"$PHP_BIN" artisan route:cache
"$PHP_BIN" artisan view:cache

step "التحقق السريع"
if "$PHP_BIN" artisan --version >/dev/null 2>&1; then
  green "Laravel يعمل."
else
  fail "فشل تشغيل artisan"
fi

if [ "$REMOVE_DEPLOY_ENV" = "1" ] && [ -f "$ENV_SOURCE" ]; then
  step "حذف ملف البيئة من deploy (أمان)"
  rm -f "$ENV_SOURCE"
  green "تم حذف $ENV_SOURCE"
fi

echo ""
green "============================================"
green " اكتمل الإعداد على السيرفر"
green "============================================"
echo ""
echo "  الموقع:     https://elitepal.net"
echo "  لوحة Admin: https://elitepal.net/admin/auth/login"
echo "  API:        https://elitepal.net/api/v1/config"
echo ""
echo "  Document Root يجب أن يكون:"
echo "  /home/baitpait/public_html/elitepalnet/public"
echo ""
echo "  بيانات الدخول (من الـ dump):"
echo "  info@baitpait.com / 100200300"
echo ""
if [ "$REMOVE_DEPLOY_ENV" != "1" ]; then
  yellow "  تذكير: احذف deploy/env.elitepal.net بعد التأكد من عمل الموقع:"
  yellow "  rm deploy/env.elitepal.net"
fi
echo ""
