package com.dropdatabase.hackathon.features.projects

import androidx.lifecycle.ViewModel
import com.dropdatabase.hackathon.core.data.repository.HackathonRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject
@HiltViewModel
class ProjectsViewModel @Inject constructor(
    private val hackathonRepository: HackathonRepository
) : ViewModel() {
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