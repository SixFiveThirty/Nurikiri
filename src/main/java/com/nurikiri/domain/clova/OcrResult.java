package com.nurikiri.domain.clova;
import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class OcrResult {

   @SerializedName("version")
   String version;

   @SerializedName("requestId")
   String requestId;

   @SerializedName("timestamp")
   int timestamp;

   @SerializedName("images")
   List<Images> images;

}