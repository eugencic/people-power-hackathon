@file:OptIn(ExperimentalMaterial3Api::class)

package com.dropdatabase.hackathon.features.projects

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.hilt.navigation.compose.hiltViewModel
import com.dropdatabase.hackathon.common.composeui.components.AppBar

@Composable
fun ProjectsScreenRoute(
    viewModel: ProjectsViewModel = hiltViewModel(),
    regionId: String?,
    onNavigateBack: () -> Unit
) {
    if (!regionId.isNullOrEmpty()) {
        ProjectsScreen(
            onNavigateBack = onNavigateBack,
            regionName = viewModel.getRegionTitle(regionId.toInt()).first()
        )
    }
}

@Composable
private fun ProjectsScreen(
    modifier: Modifier = Modifier,
    onNavigateBack: () -> Unit,
    regionName: String
) {
    Scaffold(
        topBar = {
            AppBar(
                modifier = modifier,
                navigation = {
                    IconButton(onClick = { onNavigateBack() }) {
                        Icon(
                            imageVector = Icons.Default.ArrowBack,
                            contentDescription = "Back",
                            tint = Color.White
                        )
                    }
                },
                title = { Row(modifier = modifier.fillMaxWidth(), horizontalArrangement = Arrangement.Center) {
                    Text(text = regionName, color = Color.White)
                }  }
            )
        }
    ) { paddingValues ->
        Surface(modifier = modifier.padding(paddingValues)) {

        }
    }
}