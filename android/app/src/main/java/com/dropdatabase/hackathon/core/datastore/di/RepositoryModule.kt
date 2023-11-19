package com.dropdatabase.hackathon.core.datastore.di

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import com.dropdatabase.hackathon.core.datastore.DataStoreRepository
import com.dropdatabase.hackathon.core.datastore.DataStoreRepositoryImpl
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object RepositoryModule {

    @Singleton
    @Provides
    fun providesDataStoreRepository(dataStore: DataStore<Preferences>): DataStoreRepository =
        DataStoreRepositoryImpl(dataStore)
}