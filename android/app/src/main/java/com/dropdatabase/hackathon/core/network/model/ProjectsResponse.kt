package com.dropdatabase.hackathon.core.network.model

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class ProjectsResponse(
    @SerialName("allocated_budget") val allocatedBudget: Int,
    @SerialName("budget_id") val budgetId: Int,
    @SerialName("category_id") val categoryId: Int,
    @SerialName("category_name") val categoryName: String,
    @SerialName("dislikes") val dislikes: Int,
    @SerialName("expenses") val expenses: List<Expense>,
    @SerialName("likes") val likes: Int,
    @SerialName("necessary_budget") val necessaryBudget: Int,
    @SerialName("project_description") val projectDescription: String,
    @SerialName("project_id") val projectId: Int,
    @SerialName("project_name") val projectName: String,
    @SerialName("project_pdf_file_name") val projectPdfFileName: String,
    @SerialName("project_status") val projectStatus: String,
    @SerialName("rb_budget_amount") val rbBudgetAmount: Int,
    @SerialName("rb_budget_id") val rbBudgetId: Int,
    @SerialName("rb_budget_year") val rbBudgetYear: Int,
    @SerialName("rb_region_id") val rbRegionId: Int,
    @SerialName("used_budget") val usedBudget: Int,
    @SerialName("votes") val votes: Int
)

@Serializable
data class Expense(
    @SerialName("expense_amount") val expenseAmount: Int,
    @SerialName("expense_id") val expenseId: Int,
    @SerialName("expense_name") val expenseName: String,
    @SerialName("expense_pdf_file_name") val expensePdfFileName: String
)

