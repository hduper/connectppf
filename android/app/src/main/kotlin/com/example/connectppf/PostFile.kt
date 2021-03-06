package com.example.client

import android.os.AsyncTask
import android.os.Build
import android.os.Environment
import android.util.Log
import androidx.annotation.RequiresApi
import java.io.BufferedInputStream
import java.io.IOException
import java.io.InputStream
import java.io.PrintWriter
import java.net.Socket

class PostFile {
    internal class Post(private val dstAddress: String, private val dstPort: Int, private val filename: String, filesize: Int, inputStream: InputStream) : AsyncTask<Void?, Void?, String?>() {
        private var serverResponse = ""
        private val filesize: Int
        private val inputStream: InputStream
        private var clientSocket: Socket? = null
        var fw: MyFileWriter = MyFileWriter()
        @RequiresApi(api = Build.VERSION_CODES.R)
        @Override
        protected fun doInBackground(vararg voids: Void?): String {
            //String fileName = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)+filename;
            //String fileName = Environment.DIRECTORY_DOWNLOADS+filename;
            //String fileName = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS) +filename;
            try {
                Log.e("CLIENT", "Before Connection")
                clientSocket = Socket(dstAddress, dstPort)
                if (clientSocket != null) {
                    val out = PrintWriter(clientSocket.getOutputStream(), true)
                    out.println("Post$filename")
                    Log.e("CLIENT", "After Connection Upload file")


                    //MainActivity.userArrayList.add(user);
                }
                try {
                    //BufferedInputStream bis = new BufferedInputStream(clientSocket.getInputStream());
                    // Send binary data over the TCP/IP socket connection
                    val fileData = ByteArray(filesize)
                    var bytesRead = 0
                    var b: Int
                    while (inputStream.read().also { b = it } != -1) {
                        fileData[bytesRead++] = b.toByte()
                    }
                    for (i in fileData) {
                        clientSocket.getOutputStream().write(i)
                    }

                    //System.out.println("\r\nSent " + data.length + " bytes to server.");
                    //int fileSize = fw.writeFile(fileName, bis);
                    //bis.close();
                    //System.out.println("\r\nWrote " + fileSize + " bytes to file " + fileName);
                    //serverResponse = input.readLine();

                    //String connected_name = serverResponse.substring(serverResponse.indexOf('_')+1);
                } catch (e: IOException) {
                    e.printStackTrace()
                    Log.e("CLIENT", "Could not read socket")
                }
            } catch (e: Exception) {
                e.printStackTrace()
                Log.e("CLIENT", "Could not connect to socket")
                serverResponse = e.getCause().toString()
            } finally {
                if (clientSocket != null) {
                    try {
                        clientSocket.close()
                    } catch (e: IOException) {
                        Log.e("CLIENT", "Could Not Close Client")
                        e.printStackTrace()
                    }
                }
            }
            Log.e("ended", "not working")
            return serverResponse
        } //        @Override

        //        protected void onPostExecute(ArrayList<String> Result) {
        //            //showDialog("Downloaded " + result + " bytes");
        //            Intent intent = new Intent(ConnectToUserActivity.this, UserMainView.class);
        //            intent.putExtra("files_list", Result);
        //            startActivity(intent);
        //        }
        init {
            this.inputStream = inputStream
            this.filesize = filesize
        }
    }
}