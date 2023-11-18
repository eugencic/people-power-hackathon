package com.dropdatabase.hackathon.common.network

import javax.inject.Qualifier

@Qualifier
@Retention(AnnotationRetention.RUNTIME)
annotation class Dispatcher(val hackathonDispatcher: HackathonDispatchers)

enum class HackathonDispatchers {
    Default,
    IO
}