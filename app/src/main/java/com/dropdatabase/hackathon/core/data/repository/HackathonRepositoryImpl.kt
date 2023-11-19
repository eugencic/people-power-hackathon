package com.dropdatabase.hackathon.core.data.repository

import android.content.Context
import com.dropdatabase.hackathon.common.network.Dispatcher
import com.dropdatabase.hackathon.common.network.HackathonDispatchers
import com.dropdatabase.hackathon.core.data.model.Expense
import com.dropdatabase.hackathon.core.data.model.Project
import com.dropdatabase.hackathon.core.data.model.Region
import com.dropdatabase.hackathon.core.data.model.Regions
import com.dropdatabase.hackathon.core.network.api.HackathonNetwork
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOn
import javax.inject.Inject

class HackathonRepositoryImpl @Inject constructor(
    @Dispatcher(HackathonDispatchers.IO) private val IODispatcher: CoroutineDispatcher,
    private val network: HackathonNetwork,
    @ApplicationContext private val applicationContext: Context
) : HackathonRepository {
    override fun getProjects(regionId: Int, year: Int): Flow<List<Project>> = flow {
        val getProjectsResult = try {
            network.getRegionProjects(regionId, year)
        } catch (e: Exception) {
            emit(emptyList())
            return@flow
        }

        val result = getProjectsResult.body()?.let { response ->
            response.map { responseBody ->
                Project(
                    allocatedBudget = responseBody.allocatedBudget,
                    budgetId = responseBody.budgetId,
                    categoryId = responseBody.categoryId,
                    categoryName = responseBody.categoryName,
                    dislikes = responseBody.dislikes,
                    expenses = responseBody.expenses.map { expense ->
                        Expense(
                            expenseAmount = expense.expenseAmount,
                            expenseId = expense.expenseId,
                            expenseName = expense.expenseName,
                            expensePdfFileName = expense.expensePdfFileName
                        )
                    },
                    likes = responseBody.likes,
                    necessaryBudget = responseBody.necessaryBudget,
                    projectDescription = responseBody.projectDescription,
                    projectId = responseBody.projectId,
                    projectName = responseBody.projectName,
                    projectPdfFileName = responseBody.projectPdfFileName,
                    projectStatus = responseBody.projectStatus,
                    rbBudgetAmount = responseBody.rbBudgetAmount,
                    rbBudgetId = responseBody.rbBudgetId,
                    rbBudgetYear = responseBody.rbBudgetYear,
                    rbRegionId = responseBody.rbRegionId,
                    usedBudget = responseBody.usedBudget,
                    votes = responseBody.votes
                )
            }
        } ?: emptyList()

        emit(result)
    }.flowOn(IODispatcher)

    override fun getRegions(): Flow<Regions> = flow {
        val getRegionsResult = try {
            network.getRegions()
        } catch (e: Exception) {
            emit(Regions(listOf()))
            return@flow
        }
        val result = getRegionsResult.body()?.let { responseBody ->
            Regions(
                regions = responseBody.map {
                    Region(regionId = it.regionId, regionName = it.regionName)
                }
            )
        } ?: Regions(listOf())

        emit(result)
    }.flowOn(IODispatcher)
}