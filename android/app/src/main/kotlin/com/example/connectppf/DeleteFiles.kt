package com.example.client

import android.os.AsyncTask
import android.os.Build
import android.os.Environment
import android.util.Log
import androidx.annotation.RequiresApi
import java.io.BufferedInputStream
import java.io.BufferedReader
import java.io.IOException
import java.io.InputStreamReader
import java.io.PrintWriter
import java.net.Socket

class DeleteFiles {
    internal class Delete     //        protected void onPostExecute(ArrayList<String> Result) {
    //            //showDialog("Downloaded " + result + " bytes");
    //            Intent intent = new Intent(ConnectToUserActivity.this, UserMainView.class);
    //            intent.putExtra("files_list", Result);
    //            startActivity(intent);
    //        }
    (private val dstAddress: String, private val dstPort: Int, private val filename: String) : AsyncTask<Void?, Void?, String?>() {
        private var serverResponse = ""
        private var clientSocket: Socket? = null
        var fw: MyFileWriter = MyFileWriter()
        @RequiresApi(api = Build.VERSION_CODES.R)
        @Override
        protected fun doInBackground(vararg voids: Void?): String {
            //String fileName = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)+filename;
            //String fileName = Environment.DIRECTORY_DOWNLOADS+filename;
            // String fileName = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS) +filename;
            // System.out.println("file location on device"+" "+fileName);
            try {
                Log.e("CLIENT", "Before Connection")
                clientSocket = Socket(dstAddress, dstPort)
                if (clientSocket != null) {
                    val out = PrintWriter(clientSocket.getOutputStream(), true)
                    out.println("del$filename")
                    Log.e("CLIENT", "After Connection del")


                    //MainActivity.userArrayList.add(user);
                }
                try {
                    val input = BufferedReader(InputStreamReader(clientSocket.getInputStream()))
                    var data: String
                    while (input.readLine().also { data = it } != null) {
                        // System.out.println("\r\nMessage from " + clientAddress + ": " + data);
                        System.out.println(data)
                    }
                    serverResponse = data

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
    }
}