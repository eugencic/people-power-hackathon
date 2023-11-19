package com.dropdatabase.hackathon.core.data.repository

import com.dropdatabase.hackathon.core.data.model.Projects
import com.dropdatabase.hackathon.core.data.model.Regions
import kotlinx.coroutines.flow.Flow

interface HackathonRepository {
    fun getProjects(regionId: Int, year: Int): Flow<Projects>

    fun getRegions(): Flow<Regions>
}