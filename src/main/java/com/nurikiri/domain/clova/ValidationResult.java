package com.nurikiri.domain.clova;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class ValidationResult {

   @SerializedName("result")
   String result;
}