package com.nurikiri.domain.clovaOcr;
import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class Images {

   @SerializedName("uid")
   String uid;

   @SerializedName("name")
   String name;

   @SerializedName("inferResult")
   String inferResult;

   @SerializedName("message")
   String message;

   @SerializedName("matchedTemplate")
   MatchedTemplate matchedTemplate;

   @SerializedName("validationResult")
   ValidationResult validationResult;

   @SerializedName("fields")
   List<Fields> fields;

   @SerializedName("title")
   Title title;   
}