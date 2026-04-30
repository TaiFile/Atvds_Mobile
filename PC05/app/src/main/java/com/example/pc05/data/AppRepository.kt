package com.example.pc05.data

import android.content.Context
import com.example.pc05.data.local.AppDatabase
import com.example.pc05.data.local.SearchLogEntity
import com.example.pc05.data.remote.BookItem
import com.example.pc05.data.remote.RetrofitInstance
import kotlinx.coroutines.flow.Flow
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

class AppRepository(context: Context) {

    private val dao = AppDatabase.getInstance(context).searchLogDao()

    suspend fun searchBooks(query: String): List<BookItem> {
        val response = RetrofitInstance.api.searchBooks(query)
        val timestamp = SimpleDateFormat("dd/MM/yyyy HH:mm", Locale.getDefault()).format(Date())
        dao.insert(SearchLogEntity(query = query, timestamp = timestamp))
        return response.docs
    }

    fun getAllLogs(): Flow<List<SearchLogEntity>> = dao.getAllLogs()
}
