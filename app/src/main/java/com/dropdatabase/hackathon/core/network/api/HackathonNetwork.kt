package com.dropdatabase.hackathon.core.network.api

import com.dropdatabase.hackathon.core.network.datasource.HackathonDataSource
import kotlinx.serialization.json.Json
import okhttp3.Call
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class HackathonNetwork @Inject constructor(
    networkJson: Json,
    okHttpCallFactory: Call.Factory
): HackathonDataSource {

}