package com.dropdatabase.hackathon.common.composeui.theme

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.compose.runtime.staticCompositionLocalOf
import androidx.compose.ui.graphics.Color

class AppColors(
    primary: Color,
    secondary: Color,
    primaryVariant: Color,
    secondaryVaraint: Color,
    background: Color,
) {
    var primary by mutableStateOf(primary)
        private set
    var secondary by mutableStateOf(secondary)
        private set
    var primaryVariant by mutableStateOf(primaryVariant)
        private set
    var secondaryVaraint by mutableStateOf(secondaryVaraint)
        private set
    var background by mutableStateOf(background)
        private set

    fun copy(
        primary: Color = this.primary,
        primaryVariant: Color = this.primaryVariant,
        secondary: Color = this.secondary,
        secondaryVaraint: Color = this.secondaryVaraint,
        background: Color = this.background
    ): AppColors = AppColors(
        primary, secondary, primaryVariant, secondaryVaraint, background
    )

    fun updateColorsFrom(other: AppColors) {
        primary = other.primary
        primaryVariant = other.primaryVariant
        secondary = other.secondary
        secondaryVaraint = other.secondaryVaraint
        background = other.background
    }
}

private val colorPrimary = White
private val colorPrimaryVariant = Black
private val colorSecondary = Violet
private val colorSecondaryVariant = White
private val colorBackground = Blue

fun lightColors(
    primary: Color = colorPrimary,
    primaryVariant: Color = colorPrimaryVariant,
    secondary: Color = colorSecondary,
    secondaryVaraint: Color = colorSecondaryVariant,
    background: Color = colorBackground
): AppColors = AppColors(
    primary, secondary, primaryVariant, secondaryVaraint, background
)

internal val LocalColors = staticCompositionLocalOf { lightColors() }