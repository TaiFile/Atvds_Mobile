package com.example.pc05.data.remote

import com.google.gson.annotations.SerializedName

data class BookResponse(
    @SerializedName("docs") val docs: List<BookItem>
)

data class BookItem(
    @SerializedName("title") val title: String = "",
    @SerializedName("author_name") val authorName: List<String>? = null
)
