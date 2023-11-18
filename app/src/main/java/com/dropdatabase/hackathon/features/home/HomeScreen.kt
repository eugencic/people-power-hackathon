@file:OptIn(ExperimentalMaterial3Api::class)

package com.dropdatabase.hackathon.features.home

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.dropdatabase.hackathon.common.composeui.components.AppBar
import com.dropdatabase.hackathon.common.composeui.components.AppListItem
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme

@Composable
fun HomeScreenRoute(
    viewModel: HomeViewModel = hiltViewModel(),
    onItemClick: (id: Int) -> Unit
) {

    HomeScreen(
        regions = viewModel.mdRegions,
        onItemClick = { regionId -> onItemClick(regionId) }
    )
}

@Composable
private fun HomeScreen(
    modifier: Modifier = Modifier,
    regions: List<String>,
    onItemClick: (id: Int) -> Unit
) {

    Scaffold(
        topBar = {
            AppBar(modifier = modifier, navigation = {}, actions = {
                Row(modifier = modifier.padding(end = 10.dp)) {
                    Icon(
                        imageVector = Icons.Default.Search,
                        contentDescription = "Search",
                        tint = AppTheme.colors.primaryVariant
                    )
                }
            })
        }
    ) { paddingValues ->
        Surface(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            color = AppTheme.colors.background
        ) {
            LazyColumn(modifier = Modifier.padding(top = 5.dp, start = 10.dp, end = 10.dp)) {
                itemsIndexed(items = regions) { index, it ->
                    AppListItem(modifier = Modifier.clickable {
                        onItemClick(index)
                    }, itemText = it)
                }
            }
        }
    }
}

@Preview
@Composable
private fun PreviewHomeScreen() {
    HomeScreen(regions = listOf("Bacioi", "Hincesti"), onItemClick = {})
}

