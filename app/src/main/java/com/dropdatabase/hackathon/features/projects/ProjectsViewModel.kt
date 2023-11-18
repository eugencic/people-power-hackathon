package com.dropdatabase.hackathon.features.projects

import androidx.lifecycle.ViewModel
import javax.inject.Inject

class ProjectsViewModel @Inject constructor() : ViewModel() {
    val mdRegions = listOf(
        "Bălți",
        "Cahul",
        "Chișinău",
        "Edineț",
        "Gagauzia",
        "Lăpușna",
        "Orhei",
        "Soroca",
        "Strășeni",
        "Tighina",
        "Ungheni"
    )

    fun getRegionTitle(regionId: Int) = mdRegions.filterIndexed { index, s -> index == regionId }

    
}