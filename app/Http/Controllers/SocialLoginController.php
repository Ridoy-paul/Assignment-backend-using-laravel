<?php

namespace App\Http\Controllers;

use App\Helpers\ResponseHelper;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class SocialLoginController extends Controller
{
    protected ResponseHelper $rh;

    public function __construct(ResponseHelper $rh) 
    {
        $this->rh = $rh;
    }

    public function handleGoogleCallback(Request $request)
    {
        try {
            $googleUser = Socialite::driver('google')->stateless()->userFromToken($request->token);

            $user = User::firstOrCreate(
                ['google_id' => $googleUser->getId()],
                [
                    'name' => $googleUser->getName(),
                    'email' => $googleUser->getEmail(),
                ]
            );

            Auth::login($user);

            $accessToken = $user->createToken('authToken')->accessToken;
    
            $responseData = [
                'userData' => $user,
                '_token' => $accessToken,
            ];

            return $this->rh->sendResponse(
                isSuccess: true,
                statusCode: 200,
                errorMessage: '',
                responseData: $responseData
            );

        } catch (\Exception $e) {
            return $this->rh->sendResponse(
                statusCode: 500,
            );
        }
    }
}
