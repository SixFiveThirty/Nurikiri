package com.nurikiri.domain.clovaOcr;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class MatchedTemplate {

   @SerializedName("id")
   int id;

   @SerializedName("name")
   String name;
}