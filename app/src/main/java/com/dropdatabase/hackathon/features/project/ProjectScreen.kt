@file:OptIn(ExperimentalMaterial3Api::class)

package com.dropdatabase.hackathon.features.project

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Autorenew
import androidx.compose.material.icons.filled.CheckCircle
import androidx.compose.material.icons.filled.Event
import androidx.compose.material.icons.filled.ThumbDown
import androidx.compose.material.icons.filled.ThumbUp
import androidx.compose.material.icons.filled.VerifiedUser
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.dropdatabase.hackathon.common.composeui.components.AppBar
import com.dropdatabase.hackathon.common.composeui.theme.AppTheme
import com.dropdatabase.hackathon.common.state.NetworkState
import com.dropdatabase.hackathon.core.data.model.Project

private const val IN_PROGRESS = "În desfășurare"
private const val APPROVED = "Aprobat"
private const val DONE = "Finalizat"
private const val PLANNED = "Planificat"

@Composable
fun ProjectScreenRoute(
    viewModel: ProjectViewModel = hiltViewModel(),
    projectId: String?,
    regionId: String?,
    year: String?,
    onNavigateBack: () -> Unit
) {

    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    if (!projectId.isNullOrEmpty()) {
        LaunchedEffect(projectId) {
            viewModel.getProject(projectId.toInt(), regionId?.toInt()!!, year?.toInt()!!)
        }
        ProjectScreen(
            onNavigateBack = onNavigateBack,
            project = uiState.project,
            networkState = uiState.networkState
        )
    }
}

@Composable
private fun ProjectScreen(
    modifier: Modifier = Modifier,
    project: Project,
    networkState: NetworkState,
    onNavigateBack: () -> Unit
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
                            tint = AppTheme.colors.primaryVariant
                        )
                    }
                }
            )
        },
        containerColor = AppTheme.colors.background
    ) { paddingValues ->
        Surface(
            modifier = modifier
                .padding(paddingValues)
                .fillMaxWidth(),
            color = AppTheme.colors.background
        ) {
            Column(
                modifier = modifier
                    .padding(vertical = 5.dp, horizontal = 10.dp)
                    .fillMaxWidth()
                    .clip(RoundedCornerShape(10.dp))
                    .background(AppTheme.colors.primary),
            ) {

                Text(
                    modifier = modifier
                        .fillMaxWidth()
                        .padding(top = 10.dp, start = 10.dp, end = 10.dp, bottom = 10.dp),
                    text = project.projectName,
                    style = AppTheme.typography.h2
                )

                Row(
                    modifier = modifier
                        .fillMaxWidth()
                        .padding(horizontal = 10.dp), verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = when (project.projectStatus) {
                            IN_PROGRESS -> Icons.Default.Autorenew
                            APPROVED -> Icons.Default.VerifiedUser
                            DONE -> Icons.Default.CheckCircle
                            PLANNED -> Icons.Default.Event
                            else -> {
                                Icons.Default.Autorenew
                            }
                        },
                        contentDescription = "In progress",
                        tint = when (project.projectStatus) {
                            IN_PROGRESS -> Color.Red
                            APPROVED -> Color.Blue
                            DONE -> Color.Green
                            PLANNED -> Color.Blue
                            else -> {
                                Color.Red
                            }
                        }
                    )
                    Text(
                        modifier = modifier.padding(start = 5.dp),
                        text = "${project.projectStatus} - Categorie: ${project.categoryName}",
                        style = AppTheme.typography.body2,
                        color = Color.Gray
                    )
                }

                Text(
                    modifier = modifier.padding(horizontal = 10.dp, vertical = 10.dp),
                    text = project.projectDescription,
                    style = AppTheme.typography.body
                )

                when (project.projectStatus) {
                    IN_PROGRESS -> project.expenses.forEach {
                        Surface(
                            modifier = modifier
                                .padding(bottom = 10.dp)
                                .fillMaxWidth()
                                .clip(RoundedCornerShape(10.dp)),
                            color = AppTheme.colors.primary
                        ) {
                            Column {
                                Text(
                                    modifier = Modifier.padding(
                                        horizontal = 15.dp,
                                        vertical = 5.dp
                                    ),
                                    text = it.expenseName,
                                    color = Color.Gray,
                                    style = AppTheme.typography.body2,
                                )
                                Text(
                                    modifier = Modifier.padding(
                                        vertical = 5.dp,
                                        horizontal = 15.dp
                                    ),
                                    text = "${it.expenseAmount} MDL",
                                    color = AppTheme.colors.primaryVariant,
                                    style = AppTheme.typography.body
                                )
                            }
                        }
                    }

                    APPROVED -> {
                        val minValue = project.allocatedBudget
                        val maxValue = project.necessaryBudget
                        val newMinValue = 0.1
                        val newMaxValue = 1.0

                        val currentProgress = project.allocatedBudget

                        val mappedValue = if (maxValue - minValue == 0) {
                            0
                        } else {
                            (currentProgress - minValue) / (maxValue - minValue) * (newMaxValue - newMinValue) + newMinValue
                        }

                        LinearProgressIndicator(
                            modifier = modifier
                                .padding(horizontal = 15.dp, vertical = 10.dp)
                                .fillMaxWidth(),
                            progress = mappedValue.toFloat(),
                            color = AppTheme.colors.secondary
                        )
                    }

                    PLANNED -> {
                        Row(
                            modifier = modifier
                                .padding(vertical = 15.dp, horizontal = 15.dp)
                                .fillMaxWidth(), horizontalArrangement = Arrangement.End
                        ) {
                            IconButton(onClick = { /*TODO*/ }) {
                                Icon(
                                    imageVector = Icons.Default.ThumbUp,
                                    contentDescription = "Like",
                                    tint = Color.Green
                                )
                            }

                            IconButton(onClick = { /*TODO*/ }) {
                                Icon(
                                    imageVector = Icons.Default.ThumbDown,
                                    contentDescription = "Like",
                                    tint = Color.Red
                                )
                            }
                        }
                    }

                    DONE -> {
                        project.expenses.forEach {
                            Surface(
                                modifier = modifier
                                    .padding(bottom = 10.dp)
                                    .fillMaxWidth()
                                    .clip(RoundedCornerShape(10.dp)),
                                color = AppTheme.colors.primary
                            ) {
                                Column {
                                    Text(
                                        modifier = Modifier.padding(
                                            horizontal = 15.dp,
                                            vertical = 5.dp
                                        ),
                                        text = it.expenseName,
                                        color = Color.Gray,
                                        style = AppTheme.typography.body2,
                                    )
                                    Text(
                                        modifier = Modifier.padding(
                                            vertical = 5.dp,
                                            horizontal = 15.dp
                                        ),
                                        text = "${it.expenseAmount} MDL",
                                        color = AppTheme.colors.primaryVariant,
                                        style = AppTheme.typography.body
                                    )
                                }
                            }
                        }

                        Row(
                            modifier = modifier
                                .padding(vertical = 15.dp, horizontal = 15.dp)
                                .fillMaxWidth(), horizontalArrangement = Arrangement.End
                        ) {
                            IconButton(onClick = { /*TODO*/ }) {
                                Icon(
                                    imageVector = Icons.Default.ThumbUp,
                                    contentDescription = "Like",
                                    tint = Color.Green
                                )
                            }

                            IconButton(onClick = { /*TODO*/ }) {
                                Icon(
                                    imageVector = Icons.Default.ThumbDown,
                                    contentDescription = "Like",
                                    tint = Color.Red
                                )
                            }
                        }
                    }

                }
            }
        }
    }
}