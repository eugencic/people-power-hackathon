package com.dropdatabase.hackathon.features.project

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.dropdatabase.hackathon.common.network.Dispatcher
import com.dropdatabase.hackathon.common.network.HackathonDispatchers
import com.dropdatabase.hackathon.common.state.NetworkState
import com.dropdatabase.hackathon.core.data.model.Project
import com.dropdatabase.hackathon.core.data.repository.HackathonRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class ProjectViewModel @Inject constructor(
    @Dispatcher(HackathonDispatchers.IO) private val IODispatcher: CoroutineDispatcher,
    private val hackathonRepository: HackathonRepository
) : ViewModel() {

    private val _uiState = MutableStateFlow(ProjectScreenState())
    val uiState = _uiState.asStateFlow()

    fun getProject(projectId: Int, regionId: Int, year: Int) {
        _uiState.update {
            it.copy(
                networkState = NetworkState.Loading
            )
        }

        val projectResponse = hackathonRepository.getProjects(regionId, year)
        viewModelScope.launch(IODispatcher) {
            projectResponse.collect { result ->
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
                        project = try {
                            result.first { it.projectId == projectId }
                        } catch (e: NoSuchElementException) {
                            defaultProject()
                        }
                    )
                }
            }
        }
    }

    private fun defaultProject(): Project {
        return Project(
            0, 0, 0, "", 0, listOf(), 0, 0, "", 0, "", "", "", 0, 0, 0, 0, 0, 0
        )
    }
}