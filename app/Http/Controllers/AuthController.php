<?php

namespace App\Http\Controllers;

use App\Helpers\ResponseHelper;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Laravel\Socialite\Facades\Socialite;


class AuthController extends Controller
{

    protected ResponseHelper $rh;

    public function __construct(ResponseHelper $rh) 
    {
        $this->rh = $rh;
    }

    public function login(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email',
                'password' => 'required',
            ]);
    
            if ($validator->fails()) {
                throw ValidationException::withMessages($validator->errors()->toArray());
            }

            $credentials = $request->only('email', 'password');
            if (Auth::attempt($credentials)) {
                $user = Auth::user();
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
            }
    
            return $this->rh->sendResponse(
                statusCode: 200,
                errorMessage: 'Password or Email not correct!',
            );
        }
        catch (\Illuminate\Validation\ValidationException $e) {
            
            return $this->rh->sendResponse(
                statusCode: 400,
                errorMessage: $e->getMessage(),
            );

        } catch (\Exception $e) {

            return $this->rh->sendResponse(
                statusCode: 500,
                errorMessage: $e,
            );
        }
    }


    public function register(Request $request) {

        try {
            $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|string|min:8',
            ]);
    
            // Create the user
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
            ]);
    
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

        }
        catch (\Illuminate\Validation\ValidationException $e) {
            
            return $this->rh->sendResponse(
                statusCode: 400,
                errorMessage: $e->getMessage(),
            );

        } catch (\Exception $e) {

            return $this->rh->sendResponse(
                statusCode: 500,
                errorMessage: $e,
            );
        }
    }

    public function getAuthProfile(Request $request) {
        try {
            $user = Auth::user();
            if ($user === null) {
                return $this->rh->sendResponse(
                    statusCode: 401,
                    errorMessage: 'No authenticated user found',
                );
            }
    
           $request->user()->tokens()->delete();

            return $this->rh->sendResponse(
                isSuccess: true,
                statusCode: 200,
                errorMessage: '',
                responseData: $user
            );

        } catch (\Exception $e) {
            return $this->rh->sendResponse(
                statusCode: 500,
            );
        }
    }

    public function logout(Request $request) {
        try {
            $user = Auth::user();
            if ($user === null) {
                return $this->rh->sendResponse(
                    statusCode: 401,
                    errorMessage: 'No authenticated user found',
                );
            }
    
           $request->user()->tokens()->delete();

            return $this->rh->sendResponse(
                isSuccess: true,
                statusCode: 200,
                errorMessage: '',
                responseData: 'Logged out successfully'
            );

        } catch (\Exception $e) {
            return $this->rh->sendResponse(
                statusCode: 500,
            );
        }
    }



}
