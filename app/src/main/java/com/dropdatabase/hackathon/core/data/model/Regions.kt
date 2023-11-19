package com.dropdatabase.hackathon.core.data.model

data class Regions(
    val regions: List<Region>
)

data class Region(
    val regionId: Int,
    val regionName: String
)