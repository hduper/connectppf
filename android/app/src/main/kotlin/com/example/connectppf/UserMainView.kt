package com.example.client

import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.database.Cursor
import android.net.Uri
import android.os.AsyncTask
import android.os.Bundle
import android.provider.OpenableColumns
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.BaseAdapter
import android.widget.Button
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import java.io.BufferedReader
import java.io.File
import java.io.IOException
import java.io.InputStream
import java.io.InputStreamReader
import java.io.PrintWriter
import java.net.InetAddress
import java.net.Socket
import java.util.ArrayList
import java.util.Optional

class UserMainView : AppCompatActivity() {
    private var fileUri: Uri? = null
    private var filePath_local: String? = null
    private val context: Context? = null
    private var inputStream1: InputStream? = null
    private var ipaddress: String? = null
    private val adapter: MyCustomAdapter? = null
    var fileslist: ArrayList<String>? = null
    private val list: ArrayList<String> = ArrayList<String>()
    @Override
    protected fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.listview_files)
        val intent: Intent = getIntent()
        val fileslist: ArrayList<String> = intent.getSerializableExtra("files_list") as ArrayList<String>
        ipaddress = intent.getStringExtra("ipaddress")

        //Client myClient = new Client("192.168.1.11",3210);
        //myClient.execute();
        //instantiate custom adapter
        val adapter: MyCustomAdapter = MyCustomAdapter(fileslist, this)

        //handle listview and assign adapter
        val lView: ListView = findViewById(R.id.my_listview) as ListView
        lView.setAdapter(adapter)
        val fab: FloatingActionButton = findViewById(R.id.floating_action_button)
        fab.setOnClickListener(object : OnClickListener() {
            @Override
            fun onClick(view: View?) {
//                Snackbar.make(view, "Here's a Snackbar", Snackbar.LENGTH_LONG)
//                        .setAction("Action", null).show();
                var chooseFile = Intent(Intent.ACTION_GET_CONTENT)
                chooseFile.setType("*/*")
                chooseFile = Intent.createChooser(chooseFile, "Choose a file")
                startActivityForResult(chooseFile, PICKFILE_RESULT_CODE)
            }
        })
    }

    @Override
    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            PICKFILE_RESULT_CODE -> if (resultCode == -1) {
                fileUri = data.getData()
                filePath_local = fileUri.getPath()
                val returnCursor: Cursor = getContentResolver().query(fileUri, null, null, null, null)
                val nameIndex: Int = returnCursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                val sizeIndex: Int = returnCursor.getColumnIndex(OpenableColumns.SIZE)
                returnCursor.moveToFirst()
                val filename: String = returnCursor.getString(nameIndex)
                val filesize = returnCursor.getLong(sizeIndex) as Int
                System.out.println(returnCursor.getString(nameIndex))
                System.out.println(toString(returnCursor.getLong(sizeIndex)))
                try {
                    inputStream1 = this.getContentResolver().openInputStream(fileUri)
                    System.out.println(inputStream1)
                    if (inputStream1 == null) return
                } catch (e: IOException) {
                    e.printStackTrace()
                }
                val builder: AlertDialog.Builder = Builder(this)
                builder.setTitle("Upload Alert")
                        .setMessage("Are you sure want to continue uploadfile $filename")
                        .setCancelable(false)
                        .setPositiveButton("Yes", object : OnClickListener() {
                            @Override
                            fun onClick(dialog: DialogInterface?, which: Int) {
                                //Toast.makeText(UserMainView.this,"Selected Option: YES",Toast.LENGTH_SHORT).show();
                                //InputStream inputStream = this.getContentResolver().openInputStream(fileUri);
                                val post: PostFile.Post = Post(ipaddress, 3210, filename, filesize, inputStream1)
                                post.execute()
                                list.add(filename)
                                //adapter.notifyDataSetChanged();
                                //fileslist.add(filename);
                                //adapter.notifyDataSetChanged();
                                // ClientFiles.execute();
                                // Client myClient = new Client("192.168.1.11",3210);
                                //myClient.execute();
                            }
                        })
                        .setNegativeButton("No", object : OnClickListener() {
                            @Override
                            fun onClick(dialog: DialogInterface?, which: Int) {
                                Toast.makeText(this@UserMainView, "Selected Option: No", Toast.LENGTH_SHORT).show()
                            }
                        })
                //Creating dialog box
                val dialog: AlertDialog = builder.create()
                dialog.show()

                //tvItemPath.setText(filePath);
                // File file = new File(fileUri.getPath());//create path from uri
                // final String[] split = file.getPath().split(":");//split the path.
                //filePath_local = split[1];//assign it to a string(your choice).
                System.out.println(filePath_local)
            }
        }
    }

    inner class MyCustomAdapter(list: ArrayList<String?>, context: Context) : BaseAdapter(), ListAdapter {
        private val list: ArrayList<String>
        private val context: Context

        @get:Override
        val count: Int
            get() = list.size()

        @Override
        fun getItem(pos: Int): Object {
            return list.get(pos)
        }

        @Override
        fun getItemId(i: Int): Long {
            return 0
        }

        //        @Override
        //        public long getItemId(int pos) {
        //            return list.get(pos).getId();
        //            //just return 0 if your list items do not have an Id variable.
        //        }
        @Override
        fun getView(position: Int, convertView: View?, parent: ViewGroup?): View? {
            var view: View? = convertView
            if (view == null) {
                val inflater: LayoutInflater = context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
                view = inflater.inflate(R.layout.usermainview, null)
            }

            //Handle TextView and display string from your list
            val listItemText: TextView = view.findViewById(R.id.list_item_string) as TextView
            listItemText.setText(list.get(position))

            //Handle buttons and add onClickListeners
            val deleteBtn: Button = view.findViewById(R.id.delete_btn) as Button
            val addBtn: Button = view.findViewById(R.id.add_btn) as Button
            deleteBtn.setOnClickListener(object : OnClickListener() {
                @Override
                fun onClick(v: View?) {
                    //do something
                    val filename: Object = getItem(position)
                    val file: String = String.valueOf(filename)
                    val del: DeleteFiles.Delete = Delete(ipaddress, 3210, "/$file")
                    del.execute()
                    list.remove(position) //or some other task
                    notifyDataSetChanged()
                    Toast.makeText(this@UserMainView, "Deleted$file", Toast.LENGTH_SHORT).show()
                }
            })
            addBtn.setOnClickListener(object : OnClickListener() {
                @Override
                fun onClick(v: View?) {
                    //download the file
                    val filename: Object = getItem(position)
                    val file: String = String.valueOf(filename)
                    //list.add(file);
                    notifyDataSetChanged()
                    System.out.println(file)
                    val get: GetFile.Get = Get(ipaddress, 3210, "/$file")
                    get.execute()
                    Toast.makeText(this@UserMainView, "Downloaded$file", Toast.LENGTH_SHORT).show()
                }
            })
            return view
        }

        init {
            this.list = list
            this.context = context
        }
    }

    internal inner class Client(private val dstAddress: String, private val dstPort: Int) : AsyncTask<Void?, Void?, ArrayList<String?>?>() {
        private var serverResponse = ""
        private var clientSocket: Socket? = null
        @Override
        protected fun doInBackground(vararg voids: Void?): ArrayList<String> {
            val files_server: ArrayList<String> = ArrayList<String>()
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
                    var data: String?
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
            val intent = Intent(this@UserMainView, UserMainView::class.java)
            intent.putExtra("files_list", Result)
            startActivity(intent)
        }
    }

    companion object {
        const val PICKFILE_RESULT_CODE = 1
    }
}