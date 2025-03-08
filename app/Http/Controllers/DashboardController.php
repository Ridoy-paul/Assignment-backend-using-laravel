<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;
use App\Http\Resources\PropertyResource;
use App\Models\Properties;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    protected ResponseHelper $rh;

    public function __construct(ResponseHelper $rh) 
    {
        $this->rh = $rh;
    }

    public function getDashboardReport(Request $request)
    {
        $user = Auth::user();

        if ($user === null) {
            return $this->rh->sendResponse(
                statusCode: 401,
                errorMessage: 'No authenticated user found'
            );
        }

        $totalProperties = Properties::where('user_id', $user->id)->count('id');
        $statusCounts = Properties::where('user_id', $user->id)
                                ->selectRaw('
                                    sum(is_active = 1) as active_count,
                                    sum(is_active = 0) as inactive_count
                                ')
                                ->first();

        $activePropertyCount = $statusCounts->active_count ?? 0;
        $deactivePropertyCount = $statusCounts->inactive_count ?? 0;

        return $this->rh->sendResponse(
            isSuccess: true,
            statusCode: 200,
            errorMessage: '',
            responseData: [
                'userInfo' => ['name' => $user->name, 'email' => $user->email],
                'totalProperty' => $totalProperties,
                'activeProperty' => $activePropertyCount,
                'deactiveProperty' => $deactivePropertyCount,
            ]
        );
    }


}
