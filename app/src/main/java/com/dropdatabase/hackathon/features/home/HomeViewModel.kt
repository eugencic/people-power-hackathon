package com.dropdatabase.hackathon.features.home

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.dropdatabase.hackathon.common.network.Dispatcher
import com.dropdatabase.hackathon.common.network.HackathonDispatchers
import com.dropdatabase.hackathon.common.state.NetworkState
import com.dropdatabase.hackathon.core.data.repository.HackathonRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class HomeViewModel @Inject constructor(
    @Dispatcher(HackathonDispatchers.IO) private val IODispatcher: CoroutineDispatcher,
    private val hackathonRepository: HackathonRepository
): ViewModel() {
    private val _uiState = MutableStateFlow(HomeScreenState())
    val uiState = _uiState.asStateFlow()

    init {
        getRegions()
    }

    private fun getRegions() {
        _uiState.update {
            it.copy(
                networkState = NetworkState.Loading
            )
        }
        val regionsResult = hackathonRepository.getRegions()
        viewModelScope.launch(IODispatcher) {
            regionsResult.collect { result ->
                if (result.regions.isEmpty()) {
                    _uiState.update {
                        it.copy(
                            networkState = NetworkState.Error
                        )
                    }
                    return@collect
                }
                _uiState.update {
                    it.copy(
                        networkState = NetworkState.Content,
                        regionList = result.regions
                    )
                }
            }
        }
    }
}