package com.example.pc05

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.pc05.ui.theme.PC05Theme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            PC05Theme {
                Surface(modifier = Modifier.fillMaxSize()) {
                    BookSearchApp()
                }
            }
        }
    }
}

@Composable
fun BookSearchApp(vm: MainViewModel = viewModel()) {
    val books by vm.books.collectAsState()
    val logs by vm.logs.collectAsState()
    var query by remember { mutableStateOf("") }

    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        item {
            TextField(
                value = query,
                onValueChange = { query = it },
                label = { Text("Search books") },
                modifier = Modifier.fillMaxWidth()
            )
            Spacer(modifier = Modifier.height(8.dp))
            Button(onClick = { vm.search(query) }, modifier = Modifier.fillMaxWidth()) {
                Text("Search")
            }
            Spacer(modifier = Modifier.height(16.dp))
            Text("Results:", style = MaterialTheme.typography.titleMedium)
        }
        items(books) { book ->
            Text("${book.title} — ${book.authorName?.firstOrNull() ?: "Unknown"}")
            HorizontalDivider()
        }
        item {
            Spacer(modifier = Modifier.height(16.dp))
            Text("Search History:", style = MaterialTheme.typography.titleMedium)
        }
        items(logs) { log ->
            Text("${log.query}  •  ${log.timestamp}")
            HorizontalDivider()
        }
    }
}
