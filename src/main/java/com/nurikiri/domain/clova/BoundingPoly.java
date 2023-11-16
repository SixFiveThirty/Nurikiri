package com.nurikiri.domain.clova;
import java.util.List;

import com.google.gson.annotations.SerializedName;

   
public class BoundingPoly {

   @SerializedName("vertices")
   List<Vertices> vertices;


    public void setVertices(List<Vertices> vertices) {
        this.vertices = vertices;
    }
    public List<Vertices> getVertices() {
        return vertices;
    }
    
}