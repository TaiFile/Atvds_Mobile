package com.example.pc05

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.viewModelScope
import com.example.pc05.data.AppRepository
import com.example.pc05.data.local.SearchLogEntity
import com.example.pc05.data.remote.BookItem
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch

class MainViewModel(application: Application) : AndroidViewModel(application) {

    private val repository = AppRepository(application)

    private val _books = MutableStateFlow<List<BookItem>>(emptyList())
    val books: StateFlow<List<BookItem>> = _books.asStateFlow()

    private val _logs = MutableStateFlow<List<SearchLogEntity>>(emptyList())
    val logs: StateFlow<List<SearchLogEntity>> = _logs.asStateFlow()

    init {
        viewModelScope.launch {
            repository.getAllLogs().collect { _logs.value = it }
        }
    }

    fun search(query: String) {
        if (query.isBlank()) return
        viewModelScope.launch {
            try {
                _books.value = repository.searchBooks(query)
            } catch (e: Exception) {
                _books.value = emptyList()
            }
        }
    }
}
