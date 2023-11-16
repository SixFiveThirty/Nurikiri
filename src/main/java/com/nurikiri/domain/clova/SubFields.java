package com.nurikiri.domain.clova;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class SubFields {

   @SerializedName("boundingPoly")
   BoundingPoly boundingPoly;

   @SerializedName("inferText")
   String inferText;

   @SerializedName("inferConfidence")
   int inferConfidence;

   @SerializedName("lineBreak")
   boolean lineBreak;
   
}