package com.dropdatabase.hackathon.common.composeui.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.NavType
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.navArgument
import com.dropdatabase.hackathon.features.home.HomeScreenRoute
import com.dropdatabase.hackathon.features.projects.ProjectsScreenRoute

private const val REGION_ID = "regionId"

@Composable
fun HackathonNavHost(
    navController: NavHostController,
    startDestination: HackathonRoutes = HackathonRoutes.Home
) {
    NavHost(navController = navController, startDestination = startDestination.route) {
        composable(HackathonRoutes.Home.route) {
            HomeScreenRoute(onItemClick = { regionId -> navController.navigate("${HackathonRoutes.Projects.route}/$regionId") })
        }

        val projectsRoute = "${HackathonRoutes.Projects.route}/{$REGION_ID}"
        composable(
            route = projectsRoute,
            arguments = listOf(navArgument(REGION_ID) { type = NavType.StringType })
        ) {
            ProjectsScreenRoute(
                regionId = it.arguments?.getString(REGION_ID),
                onNavigateBack = {
                    navController.navigate(HackathonRoutes.Home.route) {
                        popUpTo(HackathonRoutes.Home.route) {
                            inclusive = true
                        }
                    }
                }
            )
        }
    }
}