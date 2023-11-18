@file:OptIn(ExperimentalMaterial3Api::class)

package com.dropdatabase.hackathon.features.projects

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Tab
import androidx.compose.material3.TabRow
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.hilt.navigation.compose.hiltViewModel
import com.dropdatabase.hackathon.common.composeui.components.AppBar
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme

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
    var selectedTabIndex by remember { mutableStateOf(0) }
    val tabs = listOf("Proiecte de stat", "Proiecte obstesti")

    Scaffold(
        topBar = {
            AppBar(
                modifier = modifier,
                navigation = {
                    IconButton(onClick = { onNavigateBack() }) {
                        Icon(
                            imageVector = Icons.Default.ArrowBack,
                            contentDescription = "Back",
                            tint = AppTheme.colors.primaryVariant
                        )
                    }
                },
                title = {
                    Row(
                        horizontalArrangement = Arrangement.Center
                    ) {
                        Text(text = regionName, color = AppTheme.colors.primaryVariant)
                    }
                }
            )
        },
        bottomBar = {
            TabRow(selectedTabIndex = selectedTabIndex) {
                tabs.forEachIndexed { index, title ->
                    Tab(
                        selected = selectedTabIndex == index,
                        onClick = {
                            selectedTabIndex = index
                        },
                        text = {
                            Text(text = title, color = AppTheme.colors.primaryVariant)
                        }
                    )
                }
            }
        }
    ) { paddingValues ->
        Surface(
            modifier = modifier
                .padding(paddingValues)
                .fillMaxSize(),
            color = AppTheme.colors.background
        ) {

        }
    }
}

@Preview
@Composable
private fun PreviewScreen() {
    ProjectsScreen(onNavigateBack = { /*TODO*/ }, regionName = "Balti")
}