package com.nurikiri.domain.kakaomap;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class LocalMeta {

   @SerializedName("is_end")
   boolean isEnd;

   @SerializedName("pageable_count")
   int pageableCount;

   @SerializedName("same_name")
   LocalSameName sameName;

   @SerializedName("total_count")
   int totalCount;
}