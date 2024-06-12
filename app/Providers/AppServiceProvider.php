<?php

namespace App\Providers;

use App\Models\SmtpSetting;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // if(config('app.env') === 'local'){
        //     URL::forceScheme('https');
        // }

        if (\Schema::hasTable('smtp_settings')) {
            $smtpsetting = SmtpSetting::first();

            if ($smtpsetting) {
            $data = [
                'driver' => $smtpsetting->mailer,
                'host' => $smtpsetting->host,
                'port' => $smtpsetting->port,
                'username' => $smtpsetting->username,
                'password' => $smtpsetting->password,
                'encryption' => $smtpsetting->encryption,
                'from' => [
                    'address' => $smtpsetting->from_address,
                    'name' => 'Easycourselms'
                ]

                ];
                Config::set('mail',$data);
            }
       } // end if
    }
}
