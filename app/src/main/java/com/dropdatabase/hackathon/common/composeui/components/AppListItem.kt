package com.dropdatabase.hackathon.common.composeui.components

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun AppListItem(
    modifier: Modifier = Modifier,
    itemText: String
) {
    Surface(
        modifier = modifier
            .padding(bottom = 10.dp)
            .fillMaxSize()
            .clip(RoundedCornerShape(10.dp)),
        shadowElevation = 1.dp,
        color = MaterialTheme.colorScheme.primary

    ) {
        Text(
            modifier = Modifier.padding(15.dp),
            text = itemText
        )
    }
}

@Preview
@Composable
private fun PreviewItem() {
    AppListItem(itemText = "test")
}