package com.polyread.cagnaz

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.provider.OpenableColumns
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream

class MainActivity : FlutterActivity() {

    private val CHANNEL = "polyread/epub"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        handleIntent(intent, flutterEngine)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        handleIntent(intent, flutterEngine!!)
    }

    private fun handleIntent(intent: Intent?, flutterEngine: FlutterEngine?) {
        if (intent?.action == Intent.ACTION_VIEW) {

            val uri: Uri? = intent.data

            uri?.let {
                val result = copyUriToCache(it)

                result?.let { pair ->
                    val filePath = pair.first
                    val fileName = pair.second

                    MethodChannel(
                        flutterEngine!!.dartExecutor.binaryMessenger,
                        CHANNEL
                    ).invokeMethod(
                        "openEpub",
                        mapOf(
                            "path" to filePath,
                            "name" to fileName
                        )
                    )
                }
            }
        }
    }

    private fun copyUriToCache(uri: Uri): Pair<String, String>? {
        return try {
            val inputStream: InputStream? = contentResolver.openInputStream(uri)

            // Gerçek dosya adını almaya çalış
            var fileName = "external_${System.currentTimeMillis()}.epub"

            contentResolver.query(uri, null, null, null, null)?.use { cursor ->
                val nameIndex = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                if (cursor.moveToFirst() && nameIndex != -1) {
                    fileName = cursor.getString(nameIndex)
                }
            }

            // Dosya adını güvenli hale getir
            fileName = fileName.replace("[^a-zA-Z0-9._-]".toRegex(), "_")

            val outFile = File(cacheDir, fileName)

            val outputStream = FileOutputStream(outFile)

            inputStream?.use { input ->
                outputStream.use { output ->
                    val buffer = ByteArray(8192)
                    var bytesRead: Int
                    while (input.read(buffer).also { bytesRead = it } != -1) {
                        output.write(buffer, 0, bytesRead)
                    }
                    output.flush()
                }
            }

            Pair(outFile.absolutePath, fileName)

        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
}
