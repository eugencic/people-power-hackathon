@file:OptIn(ExperimentalMaterial3Api::class)

package com.dropdatabase.hackathon.features.home

import android.content.Context
import android.util.Log
import android.widget.Toast
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.dropdatabase.hackathon.common.composeui.components.AppBar
import com.dropdatabase.hackathon.common.composeui.components.AppCircularProgressIndicator
import com.dropdatabase.hackathon.common.composeui.components.AppListItem
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme
import com.dropdatabase.hackathon.common.state.NetworkState
import com.dropdatabase.hackathon.core.data.model.Region

@Composable
fun HomeScreenRoute(
    viewModel: HomeViewModel = hiltViewModel(),
    onItemClick: (id: Int, name: String) -> Unit
) {

    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val context = LocalContext.current
    HomeScreen(
        regions = uiState.regionList,
        context = context,
        networkState = uiState.networkState,
        onItemClick = { regionId, name -> onItemClick(regionId, name) }
    )
}

@Composable
private fun HomeScreen(
    modifier: Modifier = Modifier,
    context: Context,
    regions: List<Region>,
    networkState: NetworkState,
    onItemClick: (id: Int, name: String) -> Unit
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
            Log.d("HUI", networkState.toString())
            when (networkState) {
                NetworkState.Loading -> Row(
                    modifier = modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.Center
                ) {
                    AppCircularProgressIndicator()
                }

                NetworkState.Content -> LazyColumn(
                    modifier = Modifier.padding(
                        top = 5.dp,
                        start = 10.dp,
                        end = 10.dp
                    )
                ) {
                    items(regions, key = { it.regionId }) {
                        AppListItem(modifier = Modifier.clickable {
                            onItemClick(it.regionId, it.regionName)
                        }, itemText = it.regionName)
                    }
                }

                else -> Toast.makeText(
                    context,
                    "Something wrong happened",
                    Toast.LENGTH_LONG
                ).show()
            }
        }
    }
}

@Preview
@Composable
private fun PreviewHomeScreen() {
    val context = LocalContext.current
    HomeScreen(regions = emptyList(), onItemClick = {_, _ ->}, context = context, networkState = NetworkState.Content)
}

