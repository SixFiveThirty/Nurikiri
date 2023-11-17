package com.nurikiri.domain.clova;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data  
public class Fields {

   @SerializedName("name")
   String name;

   @SerializedName("valueType")
   String valueType;

   @SerializedName("boundingPoly")
   BoundingPoly boundingPoly;

   @SerializedName("inferText")
   String inferText;

   @SerializedName("inferConfidence")
   double inferConfidence;

   @SerializedName("type")
   String type;
}