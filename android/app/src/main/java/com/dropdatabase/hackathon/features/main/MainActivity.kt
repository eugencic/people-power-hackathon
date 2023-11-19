package com.dropdatabase.hackathon.features.main

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.navigation.compose.rememberNavController
import com.dropdatabase.hackathon.common.composeui.navigation.HackathonNavHost
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            AppTheme {
                val navController = rememberNavController()
                HackathonNavHost(navController = navController)
            }
        }
    }
}