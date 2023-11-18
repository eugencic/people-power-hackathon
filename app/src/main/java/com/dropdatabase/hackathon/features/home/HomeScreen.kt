package com.dropdatabase.hackathon.features.home

import android.content.Context
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext

@Composable
fun HomeScreenRoute() {

    val context = LocalContext.current
    HomeScreen(context = context)
}

@Composable
private fun HomeScreen(
    context: Context
) {
    Surface(
        modifier = Modifier.fillMaxSize()
    ) {
    }
}
