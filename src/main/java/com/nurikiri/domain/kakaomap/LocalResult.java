package com.nurikiri.domain.kakaomap;
import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class LocalResult {

   @SerializedName("documents")
   List<Local> documents;

   @SerializedName("meta")
   LocalMeta meta;
}