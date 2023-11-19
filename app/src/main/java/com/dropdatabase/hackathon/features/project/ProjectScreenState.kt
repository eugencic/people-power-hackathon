package com.dropdatabase.hackathon.features.project

import com.dropdatabase.hackathon.common.state.NetworkState
import com.dropdatabase.hackathon.core.data.model.Project
import javax.annotation.concurrent.Immutable

@Immutable
data class ProjectScreenState(
    val networkState: NetworkState = NetworkState.None,
    val project: Project = defaultProject()
)

private fun defaultProject(): Project {
    return Project(
        0, 0, 0, "", 0, listOf(), 0, 0, "", 0, "", "", "", 0, 0, 0, 0, 0, 0
    )
}