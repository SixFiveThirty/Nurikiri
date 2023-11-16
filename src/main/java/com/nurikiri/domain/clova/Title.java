package com.nurikiri.domain.clova;
import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data 
public class Title {

   @SerializedName("name")
   String name;

   @SerializedName("boundingPoly")
   BoundingPoly boundingPoly;

   @SerializedName("inferText")
   String inferText;

   @SerializedName("inferConfidence")
   double inferConfidence;

   @SerializedName("subFields")
   List<SubFields> subFields;
}