package com.dropdatabase.hackathon.core.data.model

data class Projects(
    val allocatedBudget: Int,
    val budgetId: Int,
    val categoryId: Int,
    val categoryName: String,
    val dislikes: Int,
    val expenses: List<Expense>,
    val likes: Int,
    val necessaryBudget: Int,
    val projectDescription: String,
    val projectId: Int,
    val projectName: String,
    val projectPdfFileName: String,
    val projectStatus: String,
    val rbBudgetAmount: Int,
    val rbBudgetId: Int,
    val rbBudgetYear: Int,
    val rbRegionId: Int,
    val usedBudget: Int,
    val votes: Int
)

data class Expense(
    val expenseAmount: Int,
    val expenseId: Int,
    val expenseName: String,
    val expensePdfFileName: String
)
