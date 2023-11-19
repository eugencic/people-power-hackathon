package com.dropdatabase.hackathon.common.composeui.components

import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.FilterAlt
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme

@Composable
fun AppFloatingActionButton(
    modifier: Modifier = Modifier,
    onClick: () -> Unit,
) {
    FloatingActionButton(
        modifier = modifier,
        shape = CircleShape,
        contentColor = AppTheme.colors.primary,
        onClick = onClick,
        containerColor = AppTheme.colors.primary
    ) {
        Icon(
            Icons.Default.FilterAlt,
            contentDescription = null,
            tint = AppTheme.colors.primaryVariant
        )
    }
}