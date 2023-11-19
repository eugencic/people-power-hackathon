package com.dropdatabase.hackathon.core.datastore

import androidx.datastore.preferences.core.Preferences
import kotlinx.coroutines.flow.Flow

interface DataStoreRepository {
    suspend fun set(key: Preferences.Key<String>, value: String)
    fun get(key: Preferences.Key<String>): Flow<String?>
}