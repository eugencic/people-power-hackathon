package com.dropdatabase.hackathon.features.projects

import com.dropdatabase.hackathon.common.state.NetworkState
import com.dropdatabase.hackathon.core.data.model.Project
import javax.annotation.concurrent.Immutable

@Immutable
data class ProjectsScreenState(
    val networkState: NetworkState = NetworkState.None,
    val projectsList: List<Project> = emptyList()
)
