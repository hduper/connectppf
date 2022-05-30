package com.example.client

import android.content.Intent
import android.os.AsyncTask
import android.os.Bundle
import android.util.Log
import android.view.Gravity
import android.widget.Button
import android.widget.EditText
import android.view.View
import android.widget.FrameLayout
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.snackbar.Snackbar
import java.io.BufferedReader
import java.io.IOException
import java.io.InputStreamReader
import java.io.PrintWriter
import java.net.Socket
import java.util.ArrayList

class ConnectToUserActivity : AppCompatActivity() {
    private var ipInput: EditText? = null
    private var portInput: EditText? = null
    private var connectBtn: Button? = null
    private val scanBtn: Button? = null
    private val clientSocket: Socket? = null
    private var data: String? = null
    var files_server: ArrayList<String> = ArrayList<String>()
    fun myClient11(ipInput: String?, portInput: Int) {
        myClient = Client(ipInput, portInput)
        myClient.execute()
    }

    @Override
    protected fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_connect)
        ipInput = findViewById(R.id.ipInput)
        portInput = findViewById(R.id.portInput)
        connectBtn = findViewById(R.id.connectBtn)
    }

    fun connectBtnListener(view: View) {
        var view: View = view
        if (portInput.getText().length() < 2 || ipInput.getText().length() < 2) {
            val snackbar: Snackbar = Snackbar
                    .make(ipInput, "Please Enter Valid IP Address and/or Port number.", Snackbar.LENGTH_LONG)
            view = snackbar.getView()
            val params: FrameLayout.LayoutParams = view.getLayoutParams() as FrameLayout.LayoutParams
            params.gravity = Gravity.TOP
            view.setLayoutParams(params)
            snackbar.show()
            return
        }
        myClient = Client(ipInput.getText().toString(), Integer.parseInt(portInput.getText().toString()))
        myClient.execute()
    }

    // Client connection with server code
    internal inner class Client(private val dstAddress: String, private val dstPort: Int) : AsyncTask<Void?, Void?, ArrayList<String?>?>() {
        private var serverResponse = ""
        private var clientSocket: Socket? = null
        @Override
        protected fun doInBackground(vararg voids: Void?): ArrayList<String> {
            try {
                Log.e("CLIENT", "Before Connection")
                clientSocket = Socket(dstAddress, dstPort)
                if (clientSocket != null) {
                    val out = PrintWriter(clientSocket.getOutputStream(), true)
                    out.println("index")
                    Log.e("CLIENT", "After Connection")


                    //MainActivity.userArrayList.add(user);
                }
                try {
                    val input = BufferedReader(InputStreamReader(clientSocket.getInputStream()))
                    while (input.readLine().also { data = it } != null) {
                        // System.out.println("\r\nMessage from " + clientAddress + ": " + data);
                        System.out.println(data)
                        if (!files_server.contains(data)) {
                            files_server.add(data)
                        }
                    }
                    //serverResponse = input.readLine();
                    val connected_name: String = serverResponse.substring(serverResponse.indexOf('_') + 1)
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
            return files_server
        }

        @Override
        protected fun onPostExecute(Result: ArrayList<String?>?) {
            //showDialog("Downloaded " + result + " bytes");
            val intent = Intent(this@ConnectToUserActivity, UserMainView::class.java)
            intent.putExtra("files_list", Result)
            intent.putExtra("ipaddress", dstAddress)
            startActivity(intent)
        }
    }

    companion object {
        var myClient: Client? = null
    }
}