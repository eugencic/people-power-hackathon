package com.dropdatabase.hackathon.common.composeui.components

import androidx.compose.foundation.layout.size
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme

@Composable
fun AppCircularProgressIndicator(
    modifier: Modifier = Modifier
) {
    CircularProgressIndicator(
        modifier = modifier.size(20.dp),
        color = AppTheme.colors.secondary,
        strokeWidth = 2.dp
    )
}