package com.dropdatabase.hackathon.core.network.api

import kotlinx.serialization.json.Json
import okhttp3.Call
import javax.inject.Inject

class HackathonNetwork @Inject constructor(
    networkJson: Json,
    okHttpCallFactory: Call.Factory
) {

}