package com.dropdatabase.hackathon.core.network.model

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class RegionResponse(
    @SerialName("region_id") val regionId: Int,
    @SerialName("region_name") val regionName: String
)