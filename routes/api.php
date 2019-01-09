<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


use Illuminate\Http\Request;

Route::namespace('Api')->name('api.')->group(function () {

    // Backend Api
    Route::namespace('Admin')->prefix('admin')->name('admin.')->group(function () {

        // auth related
        Route::namespace('Auth')->group(function () {
            Route::post('/login', 'LoginController@authenticate');
        });

        Route::middleware('auth:api')->group(function () {

            // category
            Route::get('/categories/all', 'CategoryController@allCategories');
            Route::apiResource('categories', 'CategoryController');

            // question
            Route::apiResource('questions', 'QuestionController');

            // user
            Route::get('/users/roles', 'UserController@roles');
            Route::apiResource('users', 'UserController')->except('create');

            // support
            Route::get('/supports', 'SupportController@index');

            // settings
            Route::get('/settings', 'SettingController@index');
            Route::post('/settings', 'SettingController@update');
        });
    });

    Route::namespace('Auth')->group(function () {
        Route::post('/check-user', 'LoginController@checkUser')->name('checkUser');
        Route::post('/login', 'LoginController@authenticate')->name('login');
        Route::post('/register', 'RegisterController@register')->name('register');
        Route::post('/verify-mobile', 'RegisterController@verifyMobile')->name('verifyMobile');
        Route::post('/forgot-password', 'RegisterController@sendResetLinkEmail')->name('forgotPassword');

        Route::post('social/login', 'SocialLoginController@authenticate')->name('social.authenticate');
    });

    Route::post('/support', 'SupportController@store')->name('support.store');

    // system wide settings
    Route::get('/settings', 'SettingController@index')->name('setting.index');

    Route::middleware('auth:api')->group(function () {
        Route::get('/user', 'UserController@show')->name('user.show');
        Route::put('/user', 'UserController@update')->name('user.update');

        Route::get('/category', 'CategoryController@index')->name('category.index');

        /* Customer related APIs */
        Route::namespace('Customer')->prefix('customer')->name('customer.')->group(function () {

            /* provider related */
            Route::get('/providers', 'ProviderController@index')->name('provider.index');
            Route::get('/providers/{provider}', 'ProviderController@show')->name('provider.show');
            Route::get('/providers/{provider}/ratings', 'ProviderController@ratings')->name('provider.ratings');
            Route::post('/providers/{provider}/ratings', 'ProviderController@rate')->name('provider.rate');

            /* address related */
            Route::get('/address', 'AddressController@index')->name('address.index');
            Route::post('/address', 'AddressController@store')->name('address.store');
            Route::get('/address/{address}', 'AddressController@show')->name('address.show');
            Route::put('/address/{address}/update', 'AddressController@update')->name('address.update');

            /* appointment related */
            Route::get('/appointment', 'AppointmentController@index')->name('appointment.index');
            Route::post('/appointment', 'AppointmentController@store')->name('appointment.store');
            Route::post('/appointment/{appointment}/cancel', 'AppointmentController@cancel')->name('appointment.cancel');
        });

        /* Provider related APIs */
        Route::namespace('Provider')->prefix('provider')->name('provider.')->group(function () {

            /* profile related */
            Route::get('/profile', 'ProviderController@index')->name('profile.index');
            Route::put('/profile', 'ProviderController@update')->name('profile.update');

            /* appointment related */
            Route::get('/appointment', 'AppointmentController@index')->name('appointment.index');
            Route::put('/appointment/{appointment}', 'AppointmentController@update')->name('appointment.update');
        });
    });
});
