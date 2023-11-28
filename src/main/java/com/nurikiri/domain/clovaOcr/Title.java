package com.nurikiri.domain.clovaOcr;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class Title {
   @SerializedName("name")
   String name;

   @SerializedName("bounding")
   Bounding bounding;

   @SerializedName("inferText")
   String inferText;

   @SerializedName("inferConfidence")
   double inferConfidence;
}