package com.dropdatabase.hackathon.common.composeui.navigation

sealed class HackathonRoutes(val route: String) {
    object Home: HackathonRoutes("home")
    object Projects: HackathonRoutes("projects")
    object Project: HackathonRoutes("project")
}
