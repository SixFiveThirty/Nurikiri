package com.nurikiri.domain.clova;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class ConvertedImageInfo {

   @SerializedName("width")
   int width;

   @SerializedName("height")
   int height;

   @SerializedName("pageIndex")
   int pageIndex;

   @SerializedName("longImage")
   boolean longImage;

}