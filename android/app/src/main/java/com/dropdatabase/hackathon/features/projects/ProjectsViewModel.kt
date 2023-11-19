package com.dropdatabase.hackathon.features.projects

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
class ProjectsViewModel @Inject constructor(
    @Dispatcher(HackathonDispatchers.IO) private val IODispatcher: CoroutineDispatcher,
    private val hackathonRepository: HackathonRepository
) : ViewModel() {
    private val _uiState = MutableStateFlow(ProjectsScreenState())
    val uiState = _uiState.asStateFlow()

    fun getProjectsList(regionId: Int, year: Int) {
        _uiState.update {
            it.copy(
                networkState = NetworkState.Loading
            )
        }

        val projectsResult = hackathonRepository.getProjects(regionId, year)
        viewModelScope.launch(IODispatcher) {
            projectsResult.collect { result ->
                if (result.isEmpty()) {
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
                        projectsList = result
                    )
                }
            }
        }
    }
}