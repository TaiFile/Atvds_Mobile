package com.example.pc05.data.remote

import retrofit2.http.GET
import retrofit2.http.Query

interface BookApiInterface {
    @GET("search.json")
    suspend fun searchBooks(
        @Query("q") query: String,
        @Query("limit") limit: Int = 5
    ): BookResponse
}
