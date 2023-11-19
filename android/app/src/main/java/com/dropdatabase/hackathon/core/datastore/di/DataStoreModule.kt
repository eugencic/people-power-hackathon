package com.dropdatabase.hackathon.core.datastore.di

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.core.handlers.ReplaceFileCorruptionHandler
import androidx.datastore.preferences.SharedPreferencesMigration
import androidx.datastore.preferences.core.PreferenceDataStoreFactory
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.emptyPreferences
import androidx.datastore.preferences.preferencesDataStoreFile
import com.dropdatabase.hackathon.common.network.Dispatcher
import com.dropdatabase.hackathon.common.network.HackathonDispatchers
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.SupervisorJob
import javax.inject.Singleton

private const val USER_PREFERENCES = "user_preferences"

@Module
@InstallIn(SingletonComponent::class)
object DataStoreModule {

    @Singleton
    @Provides
    fun providesPreferenceDataStore(
        @ApplicationContext applicationContext: Context,
        @Dispatcher(HackathonDispatchers.IO) ioDispatcher: CoroutineDispatcher
    ): DataStore<Preferences> =
        PreferenceDataStoreFactory.create(
            corruptionHandler = ReplaceFileCorruptionHandler(
                produceNewData = { emptyPreferences() }
            ),
            migrations = listOf(SharedPreferencesMigration(applicationContext, USER_PREFERENCES)),
            scope = CoroutineScope(ioDispatcher + SupervisorJob()),
            produceFile = { applicationContext.preferencesDataStoreFile(USER_PREFERENCES) }
        )
}