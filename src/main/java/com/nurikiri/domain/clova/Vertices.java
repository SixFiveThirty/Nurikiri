package com.nurikiri.domain.clova;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data  
public class Vertices {

   @SerializedName("x")
   int x;

   @SerializedName("y")
   int y;
}