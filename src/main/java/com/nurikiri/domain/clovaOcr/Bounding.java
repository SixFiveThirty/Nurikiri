package com.nurikiri.domain.clovaOcr;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class Bounding {

   @SerializedName("top")
   int top;

   @SerializedName("left")
   int left;

   @SerializedName("width")
   int width;

   @SerializedName("height")
   int height;
}