package com.dropdatabase.hackathon.features.home

import com.dropdatabase.hackathon.common.state.NetworkState
import com.dropdatabase.hackathon.core.data.model.Region
import javax.annotation.concurrent.Immutable

@Immutable
data class HomeScreenState(
    val networkState: NetworkState = NetworkState.None,
    val regionList: List<Region> = emptyList()
)
