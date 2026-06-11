<?php

<<<<<<< HEAD
return [
    /*
    |--------------------------------------------------------------------------
    | Application Service Providers
    |--------------------------------------------------------------------------
    */

    App\Providers\AppServiceProvider::class,
    App\Providers\AuthServiceProvider::class,
    // App\Providers\BroadcastServiceProvider::class,
    App\Providers\EventServiceProvider::class,
    App\Providers\RouteServiceProvider::class,
    App\Providers\ConfigServiceProvider::class,

    /*
    |--------------------------------------------------------------------------
    | Third-Party Service Providers
    |--------------------------------------------------------------------------
    */
    Barryvdh\DomPDF\ServiceProvider::class,
    Kreait\Laravel\Firebase\ServiceProvider::class,
=======
use App\Providers\AppServiceProvider;

return [
    AppServiceProvider::class,
>>>>>>> 234599e73e73522fe1ac606664f852ec8702d836
];
