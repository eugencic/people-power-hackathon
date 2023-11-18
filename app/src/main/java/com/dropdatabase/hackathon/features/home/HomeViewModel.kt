package com.dropdatabase.hackathon.features.home

import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class HomeViewModel @Inject constructor(): ViewModel() {
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

}