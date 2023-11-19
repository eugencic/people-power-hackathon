package com.dropdatabase.hackathon.common.composeui.components

import androidx.compose.foundation.layout.RowScope
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme

@ExperimentalMaterial3Api
@Composable
fun AppBar(
    modifier: Modifier = Modifier,
    actions: @Composable RowScope.() -> Unit = {},
    navigation: @Composable () -> Unit,
    title: @Composable () -> Unit = {}
) {
    TopAppBar(
        modifier = modifier,
        title = title,
        actions = actions,
        navigationIcon = navigation,
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = AppTheme.colors.primary
        )
    )
}