package com.example.pc05.data.local

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import kotlinx.coroutines.flow.Flow

@Dao
interface SearchLogDao {
    @Insert
    suspend fun insert(log: SearchLogEntity)

    @Query("SELECT * FROM search_logs ORDER BY id DESC")
    fun getAllLogs(): Flow<List<SearchLogEntity>>
}
