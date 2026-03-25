<?php

use App\Http\Controllers\PublicStoreLocationController;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;

Route::get('/store-location', PublicStoreLocationController::class)->name('public.store-location');

Route::get('/image-proxy', function () {
    $url = request('url');
    if (!$url) {
        return response('Missing url parameter', 400);
    }

    $parsed = parse_url($url);
    $path = $parsed['path'] ?? '';
    $hasScheme = !empty($parsed['scheme']);
    $isRelative = !$hasScheme && $path !== '';

    if ($isRelative) {
        $isSameOrigin = true;
    } elseif (!$hasScheme || !in_array(strtolower($parsed['scheme']), ['http', 'https'], true)) {
        return response('Invalid url', 400);
    } else {
        $appUrl = rtrim(config('app.url', request()->getScheme() . '://' . request()->getHost()), '/');
        $appParsed = parse_url($appUrl);
        $requestPort = $parsed['port'] ?? (strtolower($parsed['scheme']) === 'https' ? 443 : 80);
        $appPort = $appParsed['port'] ?? (strtolower($appParsed['scheme'] ?? 'http') === 'https' ? 443 : 80);
        $isSameOrigin = strtolower($parsed['host'] ?? '') === strtolower($appParsed['host'] ?? '')
            && (int) $requestPort === (int) $appPort;
    }

    if ($isSameOrigin) {
        $fullPath = null;
        if (str_starts_with($path, '/storage/')) {
            $relativePath = ltrim(substr($path, strlen('/storage/')), '/');
            if (str_contains($relativePath, '..')) {
                return response('Invalid path', 400);
            }
            $fullPath = storage_path('app/public/' . $relativePath);
            $publicDir = realpath(storage_path('app/public'));
            if (!$publicDir || !str_starts_with(realpath($fullPath) ?: $fullPath, $publicDir) || !is_file($fullPath)) {
                // ملف غير موجود — إرجاع placeholder بدل 404 لتجنب أخطاء الكونسول
                $placeholderPath = public_path('assets/admin/img/160x160/img2.jpg');
                if (is_file($placeholderPath)) {
                    return response()->file($placeholderPath);
                }
                return response('Not found', 404);
            }
        } elseif (str_starts_with($path, '/assets/')) {
            $relativePath = ltrim($path, '/');
            if (str_contains($relativePath, '..')) {
                return response('Invalid path', 400);
            }
            $fullPath = public_path($relativePath);
            $publicDir = realpath(public_path());
            if (!$publicDir || !str_starts_with(realpath($fullPath) ?: $fullPath, $publicDir) || !is_file($fullPath)) {
                return response('Not found', 404);
            }
        } else {
            return response('Not found', 404);
        }
        $mimes = [
            'jpg' => 'image/jpeg', 'jpeg' => 'image/jpeg', 'png' => 'image/png',
            'gif' => 'image/gif', 'webp' => 'image/webp', 'svg' => 'image/svg+xml',
            'ico' => 'image/x-icon',
        ];
        $ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
        $contentType = $mimes[$ext] ?? 'application/octet-stream';

        return response()->file($fullPath, ['Content-Type' => $contentType]);
    }

    try {
        $response = Http::withHeaders(['User-Agent' => 'Laravel-Image-Proxy'])->timeout(15)->get($url);
        $contentType = $response->header('Content-Type') ?: 'application/octet-stream';

        return response($response->body(), $response->status())
            ->header('Content-Type', $contentType);
    } catch (\Illuminate\Http\Client\ConnectionException $e) {
        return response('Upstream request failed', 502);
    } catch (\Illuminate\Http\Client\RequestException $e) {
        return response('Upstream request failed', 502);
    } catch (\Throwable $e) {
        return response('Proxy error', 503);
    }
});

Route::get('/', function () {
    return redirect(\route('admin.dashboard'));
});

// لوحة الفرع معطّلة — إعادة توجيه أي طلب /branch/* إلى لوحة المشرف
Route::any('/branch/{path?}', function () {
    return redirect()->route('admin.auth.login');
})->where('path', '.*');

Route::get('time_zome', function () {
    return config('app.timezone');
});


Route::get('authentication-failed', function () {
    $errors = [];
    $errors[] = ['code' => 'auth-001', 'message' => 'Unauthenticated.'];
    return response()->json([
        'errors' => $errors
    ], 401);
})->name('authentication-failed');
