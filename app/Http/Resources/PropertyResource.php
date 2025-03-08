<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PropertyResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        //return parent::toArray($request);
        return [
            'id' => $this->id,
            'name' => $this->name,
            'address' => $this->address,
            'costPerNight' => $this->cost_per_night,
            'availableRooms' => $this->available_rooms,
            'image' => !empty($this->image) ? asset('/images')."/".$this->image : '',
            'averageRating' => $this->average_rating,
            'descriptions' => $this->property_description,
            'isActive' => $this->is_active,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
