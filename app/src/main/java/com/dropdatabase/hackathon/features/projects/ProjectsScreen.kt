@file:OptIn(ExperimentalMaterial3Api::class)

package com.dropdatabase.hackathon.features.projects

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Done
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FilterChip
import androidx.compose.material3.FilterChipDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SheetState
import androidx.compose.material3.Surface
import androidx.compose.material3.Tab
import androidx.compose.material3.TabRow
import androidx.compose.material3.Text
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.dropdatabase.hackathon.common.composeui.components.AppBar
import com.dropdatabase.hackathon.common.composeui.components.AppCircularProgressIndicator
import com.dropdatabase.hackathon.common.composeui.components.AppFloatingActionButton
import com.dropdatabase.hackathon.common.composeui.components.AppListItem
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme
import com.dropdatabase.hackathon.common.state.NetworkState
import com.dropdatabase.hackathon.core.data.model.Project

private const val CURRENT_YEAR = 2023

@Composable
fun ProjectsScreenRoute(
    viewModel: ProjectsViewModel = hiltViewModel(),
    regionId: String?,
    regionName: String?,
    onNavigateBack: () -> Unit,
    onProjectSelected: (projectId: Int, regionId: Int, year: Int) -> Unit
) {

    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    if (!regionId.isNullOrEmpty()) {
        LaunchedEffect(key1 = regionId) {
            viewModel.getProjectsList(regionId.toInt(), CURRENT_YEAR)
        }
        ProjectsScreen(
            onNavigateBack = onNavigateBack,
            regionName = regionName!!,
            networkState = uiState.networkState,
            projectList = uiState.projectsList,
            onYearChange = { year -> viewModel.getProjectsList(regionId.toInt(), year) },
            onProjectSelected = { projectId, year ->
                onProjectSelected(
                    projectId,
                    regionId.toInt(),
                    year
                )
            }
        )
    }
}

@Composable
private fun ProjectsScreen(
    modifier: Modifier = Modifier,
    regionName: String,
    networkState: NetworkState,
    projectList: List<Project>,
    onNavigateBack: () -> Unit,
    onYearChange: (Int) -> Unit,
    onProjectSelected: (projectId: Int, year: Int) -> Unit
) {
    var selectedTabIndex by remember { mutableIntStateOf(0) }
    val tabs = listOf("Proiecte de stat", "Proiecte obstesti")
    var showBottomSheet by remember { mutableStateOf(false) }
    val sheetState = rememberModalBottomSheetState()
    var selectedYear by remember { mutableIntStateOf(CURRENT_YEAR) }

    LaunchedEffect(key1 = selectedYear) {
        onYearChange(selectedYear)
    }

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
        },
        floatingActionButton = {
            AppFloatingActionButton(onClick = {
                showBottomSheet = true
            })
        }
    ) { paddingValues ->
        Surface(
            modifier = modifier
                .padding(paddingValues)
                .fillMaxSize(),
            color = AppTheme.colors.background
        ) {
            when (networkState) {
                NetworkState.Loading -> Row(
                    modifier = modifier
                        .fillMaxWidth()
                        .padding(top = 5.dp),
                    horizontalArrangement = Arrangement.Center
                ) {
                    AppCircularProgressIndicator()
                }

                NetworkState.Content -> LazyColumn(
                    modifier = modifier.padding(
                        top = 5.dp,
                        start = 10.dp,
                        end = 10.dp
                    )
                ) {
                    items(projectList, key = { it.projectId }) {
                        AppListItem(itemText = it.projectName, modifier = modifier.clickable {
                            onProjectSelected(it.projectId, selectedYear)
                        })
                    }
                }

                else -> {}
            }

            if (showBottomSheet) {
                BottomSheet(
                    modifier = modifier,
                    selectedYear = selectedYear,
                    sheetState = sheetState,
                    onDismissRequest = {
                        showBottomSheet = false
                    },
                    onSelectYear = { year -> selectedYear = year })
            }
        }
    }
}

@Composable
private fun BottomSheet(
    modifier: Modifier,
    sheetState: SheetState,
    selectedYear: Int,
    onDismissRequest: () -> Unit,
    onSelectYear: (selectedYear: Int) -> Unit,
) {

    val yearList = listOf(2023, 2022, 2021, 2020, 2019)

    ModalBottomSheet(
        modifier = Modifier.height(150.dp),
        onDismissRequest = onDismissRequest,
        sheetState = sheetState
    ) {
        LazyRow(
            modifier = modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly,
        ) {
            items(yearList) {
                FilterChip(
                    onClick = {
                        onSelectYear(it)
                    },
                    label = {
                        Text(it.toString())
                    },
                    selected = selectedYear == it,
                    leadingIcon = if (selectedYear == it) {
                        {
                            Icon(
                                imageVector = Icons.Filled.Done,
                                contentDescription = "Done icon",
                                modifier = Modifier.size(FilterChipDefaults.IconSize)
                            )
                        }
                    } else {
                        null
                    },
                )
            }
        }
    }
}

@Preview
@Composable
private fun PreviewScreen() {
    ProjectsScreen(
        onNavigateBack = { /*TODO*/ },
        regionName = "Balti",
        networkState = NetworkState.Content,
        projectList = emptyList(),
        onYearChange = {},
        onProjectSelected = {_, _ ->}
    )
}

