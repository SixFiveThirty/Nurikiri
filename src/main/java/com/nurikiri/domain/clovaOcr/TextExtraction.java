package com.nurikiri.domain.clovaOcr;
import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class TextExtraction {

   @SerializedName("version")
   String version;

   @SerializedName("requestId")
   String requestId;

   @SerializedName("timestamp")
   Long timestamp;

   @SerializedName("images")
   List<Images> images;
}