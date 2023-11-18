package com.dropdatabase.hackathon.common.composeui.navigation

sealed class HackathonRoutes(val route: String) {
    object Home: HackathonRoutes("home")

}
