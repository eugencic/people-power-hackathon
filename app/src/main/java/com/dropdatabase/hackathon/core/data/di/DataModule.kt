package com.dropdatabase.hackathon.core.data.di

import com.dropdatabase.hackathon.core.data.repository.HackathonRepository
import com.dropdatabase.hackathon.core.data.repository.HackathonRepositoryImpl
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
interface DataModule {
    @Binds
    fun bindsHackathonRepository(hackathonRepository: HackathonRepositoryImpl): HackathonRepository
}