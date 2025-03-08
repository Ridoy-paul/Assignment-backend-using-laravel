<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;
use App\Http\Resources\PropertyResource;
use App\Models\Properties;
use Exception;
use Illuminate\Support\Facades\Auth;

class PropertiesController extends Controller
{

    protected ResponseHelper $rh;

    public function __construct(ResponseHelper $rh) 
    {
        $this->rh = $rh;
    }


    /**
     * Display a listing of the resource.
     */
    public function getAllProperties(Request $request)
    {
        $user = Auth::user();
        if ($user === null) {
            return $this->rh->sendResponse(
                statusCode: 401,
                errorMessage: 'No authenticated user found',
            );
        }

        $page = $request->input('page', 1);
        $limit = $request->input('limit', 8);

        $properties = Properties::where('user_id', $user->id)
                                ->orderByDesc('id')
                                ->paginate($limit, ['*'], 'page', $page);

        return $this->rh->sendResponse(
            isSuccess: true,
            statusCode: 200,
            errorMessage: '',
            responseData: [
                'properties' => PropertyResource::collection($properties),
                'totalPages' => $properties->lastPage(),
                'currentPage' => $properties->currentPage(),
                'totalItems' => $properties->total(),
            ]
        );
    }

    public function getPropertyItem(Request $request)
    {
        $id = $request->id ?? null;
        $propertyItem = Properties::find($id);

        if ($propertyItem === null) {
            return $this->rh->sendResponse(
                statusCode: 404,
                errorMessage: 'Property not found',
            );
        }
        
        return $this->rh->sendResponse(
            isSuccess: true,
            statusCode: 200,
            errorMessage: '',
            responseData: new PropertyResource($propertyItem)
        );
    }


    /**
     * Store a newly created resource in storage.
     */
    public function saveProperty(Request $request)              
    {
        try {

            // Input Validation:
            $requestData = $request->validate([
                'name' => 'required|string|max:255',
                'address' => 'required|string|max:500',
                'cost_per_night' => 'required|numeric|min:0',
                'available_rooms' => 'required|integer|min:0',
                'property_image0' => 'nullable|image|max:5024',
                'average_rating' => 'nullable|numeric',
                'property_description' => 'nullable|string|max:1000',
            ], [
                'name.required' => 'Property Name is required.',
                'address.required' => 'Address is required.',
                'cost_per_night.required' => 'Cost per night is required.',
                'available_rooms.required' => 'Available rooms are required.',
                'image.max' => 'The image must not be greater than 5MB.',
                'property_description.string' => 'Property description must be a string.',
                'property_description.max' => 'Property description must not exceed 1000 characters.',
            ]);

            $name = $request->name;
            $address = $request->address ?? '';
            $cost_per_night = $request->cost_per_night ?? 0;
            $available_rooms = $request->available_rooms ?? 0;
            $average_rating = $request->average_rating ?? 0;
            $property_description = $request->property_description ?? '';
            $is_active = isset($request->is_active) ? 1 : 0;
            $property_id = $request->property_id ?? null;

            // Check if it's an update or a new property
            if ($property_id != null) {
                $property = Properties::where('id', $property_id)->where('user_id', Auth::user()->id)->first();
                if ($property === null) {
                    return $this->rh->sendResponse(
                        statusCode: 404,
                        errorMessage: 'Property not found',
                    );
                }
            } else {
                $property = new Properties();
                $property->user_id = Auth::user()->id;
            }

            // Save Property Info.
            $property->name = $name;
            $property->address = $address;
            $property->cost_per_night = $cost_per_night;
            $property->available_rooms = $available_rooms;
            $property->average_rating = $average_rating;
            $property->property_description = $property_description;
            $property->is_active = $is_active;

            //image upload
            if ($request->hasFile('property_image0')) {
                $imageFile = $request->file('property_image0');
                
                $imageName = time() . rand(10000, 99999) . '.' . $imageFile->getClientOriginalExtension();

                $destinationPath = public_path('images/');
                $imageFile->move($destinationPath, $imageName);

                // Remove the old image if it exists (for updates)
                if (!empty($property->image) && is_file(public_path('images/' . $property->image))) {
                    unlink(public_path('images/' . $property->image));
                }

                $property->image = $imageName;

            } elseif ($property_id == null) {
                $property->image = '';
            }

            if ($property->save()) {
                return $this->rh->sendResponse(
                    isSuccess: true,
                    statusCode: 200,
                    errorMessage: 'Property saved successfully.',
                );
            }

        } catch (\Illuminate\Validation\ValidationException $e) {
            return $this->rh->sendResponse(
                statusCode: 400,
                errorMessage: $e->getMessage(),
            );

        } catch (\Exception $e) {
            return $this->rh->sendResponse(
                statusCode: 500,
                errorMessage: $e->getMessage(),
            );
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function deleteProperty(Request $request)
    {
        $user = Auth::user();
        if ($user === null) {
            return $this->rh->sendResponse(
                statusCode: 401,
                errorMessage: 'No authenticated user found',
            );
        }

        $id = $request->id;

        $property = Properties::where('user_id', $user->id)->where('id', $id)->first();
        if ($property === null) {
            return $this->rh->sendResponse(
                statusCode: 404,
                errorMessage: 'Property not found',
            );
        }

        if ($property->delete()) {
            return $this->rh->sendResponse(
                isSuccess: true,
                statusCode: 200,
            );
        }

        return $this->rh->sendResponse(
            statusCode: 500,
            errorMessage: 'Failed to delete property',
        );

        
    }
}
