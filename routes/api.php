<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PropertiesController;
use App\Http\Controllers\SocialLoginController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;




Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
Route::post('refresh', [AuthController::class, 'refresh']);

// This route for Social Login, Ex. Google
Route::post('auth/google/callback', [SocialLoginController::class, 'handleGoogleCallback']);

// Public Property Item Info.
Route::get('get-property-item', [PropertiesController::class, 'getPropertyItem']);

Route::middleware('auth:api')->group( function () {
    Route::get('get-auth-profile', [AuthController::class, 'getAuthProfile']);
    Route::get('logout', [AuthController::class, 'logout']);
    

    

    // Property Route 
    Route::post('save-property', [PropertiesController::class, 'saveProperty']);
    Route::get('get-all-properties', [PropertiesController::class, 'getAllProperties']);
    Route::get('delete-property', [PropertiesController::class, 'deleteProperty']);

    //Dashboard Report
    Route::get('get-dashboard-report', [DashboardController::class, 'getDashboardReport']);
    
    
    
    
    
});

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');