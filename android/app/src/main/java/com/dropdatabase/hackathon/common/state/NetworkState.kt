package com.dropdatabase.hackathon.common.state

sealed class NetworkState {
    object Error: NetworkState()
    object Content: NetworkState()
    object Loading: NetworkState()
    object Success: NetworkState()
    object None: NetworkState()
}
