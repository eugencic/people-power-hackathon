package com.dropdatabase.hackathon.core.network.datasource

import com.dropdatabase.hackathon.core.network.model.ProjectsResponse
import com.dropdatabase.hackathon.core.network.model.RegionResponse
import retrofit2.Response

interface HackathonDataSource {
    suspend fun getRegionProjects(regionId: Int, year: Int): Response<ProjectsResponse>

    suspend fun getRegions(): Response<List<RegionResponse>>
}