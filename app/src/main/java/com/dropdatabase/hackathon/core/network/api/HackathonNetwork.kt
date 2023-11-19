package com.dropdatabase.hackathon.core.network.api

import com.dropdatabase.hackathon.BuildConfig
import com.dropdatabase.hackathon.core.network.datasource.HackathonDataSource
import com.dropdatabase.hackathon.core.network.model.ProjectsResponse
import com.dropdatabase.hackathon.core.network.model.RegionResponse
import com.jakewharton.retrofit2.converter.kotlinx.serialization.asConverterFactory
import kotlinx.serialization.json.Json
import okhttp3.Call
import okhttp3.MediaType.Companion.toMediaType
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.http.GET
import retrofit2.http.Path
import javax.inject.Inject
import javax.inject.Singleton

private interface HackathonApi {
    @GET("region/{regionId}/{year}")
    suspend fun getRegionProjects(
        @Path("regionId") regionId: Int,
        @Path("year") year: Int
    ): Response<List<ProjectsResponse>>

    @GET("region")
    suspend fun getRegions(): Response<List<RegionResponse>>
}

private const val BaseUrl = BuildConfig.API_URL

@Singleton
class HackathonNetwork @Inject constructor(
    networkJson: Json,
    okHttpCallFactory: Call.Factory
) : HackathonDataSource {

    private val networkApi = Retrofit.Builder()
        .baseUrl(BaseUrl)
        .callFactory(okHttpCallFactory)
        .addConverterFactory(
            networkJson.asConverterFactory("application/json".toMediaType())
        )
        .build()
        .create(HackathonApi::class.java)

    override suspend fun getRegionProjects(regionId: Int, year: Int): Response<List<ProjectsResponse>> =
        networkApi.getRegionProjects(regionId, year)

    override suspend fun getRegions(): Response<List<RegionResponse>> = networkApi.getRegions()
}