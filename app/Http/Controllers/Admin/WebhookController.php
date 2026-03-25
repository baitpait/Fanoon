<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\WebhookEndpoint;
use App\Services\WebhookService;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\View\View;

class WebhookController extends Controller
{
    public function __construct()
    {
        if (config('feature_flags.hide_webhooks', true)) {
            abort(403, __('This feature is disabled.'));
        }
    }

    public function list(): View
    {
        $endpoints = WebhookEndpoint::orderByDesc('created_at')->paginate(20);
        return view('admin-views.webhook.list', compact('endpoints'));
    }

    public function create(): View
    {
        $events = [
            WebhookService::EVENT_ORDER_CREATED => translate('order_created'),
            WebhookService::EVENT_ORDER_STATUS_CHANGED => translate('order_status_changed'),
        ];
        return view('admin-views.webhook.form', compact('events'));
    }

    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => 'nullable|string|max:255',
            'url' => 'required|url|max:500',
            'events' => 'required|array|min:1',
            'events.*' => 'in:' . WebhookService::EVENT_ORDER_CREATED . ',' . WebhookService::EVENT_ORDER_STATUS_CHANGED,
        ]);

        WebhookEndpoint::create([
            'name' => $request->name,
            'url' => $request->url,
            'events' => $request->events,
            'secret' => $request->filled('secret') ? $request->secret : Str::random(32),
            'is_active' => $request->boolean('is_active', true),
        ]);

        Toastr::success(translate('Webhook added successfully!'));
        return redirect()->route('admin.webhook.list');
    }

    public function edit(WebhookEndpoint $webhook): View
    {
        $events = [
            WebhookService::EVENT_ORDER_CREATED => translate('order_created'),
            WebhookService::EVENT_ORDER_STATUS_CHANGED => translate('order_status_changed'),
        ];
        return view('admin-views.webhook.form', compact('webhook', 'events'));
    }

    public function update(Request $request, WebhookEndpoint $webhook): RedirectResponse
    {
        $request->validate([
            'name' => 'nullable|string|max:255',
            'url' => 'required|url|max:500',
            'events' => 'required|array|min:1',
            'events.*' => 'in:' . WebhookService::EVENT_ORDER_CREATED . ',' . WebhookService::EVENT_ORDER_STATUS_CHANGED,
        ]);

        $webhook->update([
            'name' => $request->name,
            'url' => $request->url,
            'events' => $request->events,
            'is_active' => $request->boolean('is_active', true),
        ]);

        if ($request->filled('secret')) {
            $webhook->update(['secret' => $request->secret]);
        }

        Toastr::success(translate('Webhook updated successfully!'));
        return redirect()->route('admin.webhook.list');
    }

    public function delete(WebhookEndpoint $webhook): RedirectResponse
    {
        $webhook->delete();
        Toastr::success(translate('Webhook removed!'));
        return back();
    }

    public function status(WebhookEndpoint $webhook): RedirectResponse
    {
        $webhook->update(['is_active' => !$webhook->is_active]);
        Toastr::success(translate('Webhook status updated!'));
        return back();
    }
}
