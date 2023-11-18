package com.dropdatabase.hackathon.common.composeui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.dropdatabase.hackathon.features.home.HomeScreenRoute

@Composable
fun HackathonNavHost(
    navController: NavHostController,
    startDestination: String = HackathonRoutes.Home.route
) {
    NavHost(navController = navController, startDestination = startDestination) {
        composable(HackathonRoutes.Home.route) {
            HomeScreenRoute()
        }
    }
}