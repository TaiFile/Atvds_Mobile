package com.example.pc05.data.local

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "search_logs")
data class SearchLogEntity(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val query: String,
    val timestamp: String
)
