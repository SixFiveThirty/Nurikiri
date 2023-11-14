package com.nurikiri.domain.kakaomap;
import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class LocalSameName {

   @SerializedName("keyword")
   String keyword;

   @SerializedName("region")
   List<String> region;

   @SerializedName("selected_region")
   String selectedRegion;
}