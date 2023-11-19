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
private const val REGION_NAME = "regionName"

@Composable
fun HackathonNavHost(
    navController: NavHostController,
    startDestination: HackathonRoutes = HackathonRoutes.Home
) {
    NavHost(navController = navController, startDestination = startDestination.route) {
        composable(HackathonRoutes.Home.route) {
            HomeScreenRoute(onItemClick = { regionId, regionName -> navController.navigate("${HackathonRoutes.Projects.route}/$regionId/$regionName") })
        }

        val projectsRoute = "${HackathonRoutes.Projects.route}/{$REGION_ID}/{$REGION_NAME}"
        composable(
            route = projectsRoute,
            arguments = listOf(
                navArgument(REGION_ID) { type = NavType.StringType },
                navArgument(REGION_NAME) { type = NavType.StringType }
            )
        ) {
            ProjectsScreenRoute(
                regionId = it.arguments?.getString(REGION_ID),
                regionName = it.arguments?.getString(REGION_NAME),
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