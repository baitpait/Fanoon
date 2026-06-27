#!/bin/bash
# ============================================
# تحديث السيرفر بعد git pull — elitepal.net
# ============================================
# الاستخدام:
#   cd /home/baitpait/public_html/elitepalnet
#   chmod +x deploy/pull_update.sh
#   ./deploy/pull_update.sh
# ============================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT"

PHP_BIN="${PHP_BIN:-php}"
COMPOSER_BIN="${COMPOSER_BIN:-composer}"
REPO_DIR="$ROOT"

green()  { printf '\033[0;32m%s\033[0m\n' "$*"; }
yellow() { printf '\033[0;33m%s\033[0m\n' "$*"; }

read_env_value() {
  local key="$1"
  local line value
  line="$(grep -E "^${key}=" .env | tail -1 || true)"
  [ -n "$line" ] || return 1
  value="${line#*=}"
  value="${value%\"}"
  value="${value#\"}"
  value="${value%\'}"
  value="${value#\'}"
  printf '%s' "$value"
}

green "==> إصلاح ملكية Git (root على cPanel)"
git config --global --add safe.directory "$REPO_DIR" 2>/dev/null || true
chown -R baitpait:baitpait "$REPO_DIR" 2>/dev/null || true

green "==> git pull"
git pull origin main

green "==> composer install"
COMPOSER_ALLOW_SUPERUSER=1 "$COMPOSER_BIN" install --no-dev --optimize-autoloader --no-interaction

if [ -f deploy/sync_migrations_after_dump.sql ]; then
  green "==> مزامنة سجل migrations (بعد dump)"
  DB_USER="$(read_env_value DB_USERNAME)"
  DB_PASS="$(read_env_value DB_PASSWORD)"
  DB_NAME="$(read_env_value DB_DATABASE)"
  DB_HOST="$(read_env_value DB_HOST)"
  DB_HOST="${DB_HOST:-localhost}"
  if command -v mysql >/dev/null 2>&1; then
    MYSQL_PWD="$DB_PASS" mysql -h "$DB_HOST" -u "$DB_USER" "$DB_NAME" < deploy/sync_migrations_after_dump.sql
  else
    yellow "تخطّي sync migrations — mysql CLI غير متوفر"
  fi
fi

green "==> migrate (الجديد فقط)"
"$PHP_BIN" artisan migrate --force

green "==> كاش الإنتاج"
"$PHP_BIN" artisan config:cache
"$PHP_BIN" artisan route:cache
"$PHP_BIN" artisan view:cache

chown -R baitpait:baitpait storage bootstrap/cache 2>/dev/null || true
chmod -R 775 storage bootstrap/cache 2>/dev/null || true

green "تم التحديث بنجاح."
