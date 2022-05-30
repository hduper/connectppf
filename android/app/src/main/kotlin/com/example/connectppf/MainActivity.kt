package com.example.client

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import androidx.appcompat.app.AppCompatActivity
import androidx.loader.content.AsyncTaskLoader
import android.content.Intent
import android.os.AsyncTask
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import java.io.IOException
import java.io.PrintWriter
import java.net.Socket

class MainActivity : AppCompatActivity() {
    private val CHANNEL ="com.flutter.ftp/ftp";
    private val et: EditText? = null
    private var continueBtn: Button? = null

    @Override
    protected fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { methodCall, result ->
            if (methodCall.method == "Printy") {


                setContentView(R.layout.activity_main)

                // et = (EditText) findViewById(R.id.message);
                continueBtn = findViewById(R.id.button)
                continueBtn.setOnClickListener(object : OnClickListener() {
                    @Override
                    fun onClick(view: View?) {
                        val intent = Intent(getApplicationContext(), ConnectToUserActivity::class.java)
                        startActivity(intent)
                        finish()
                    }
                })
            }
        }
        } //    public void send_data(View v){
    //        String message = et.getText().toString();
    //        BackgroundTask b1 = new BackgroundTask();
    //        b1.execute(message);
    //    }
    //    class BackgroundTask extends AsyncTask<String,Void,Void> {
    //        Socket s;
    //        PrintWriter writer;
    //        @Override
    //        protected Void doInBackground(String... voids){
    //
    //            try {
    //                String message = voids[0];
    //                s = new Socket("192.168.1.11",54644);
    //
    //
    //                writer = new PrintWriter(s.getOutputStream());
    //                writer.write(message);
    //                writer.flush();
    //               writer.close();
    //               // s.close();
    //
    //            }catch (IOException e){
    //                e.printStackTrace();
    //            }
    //
    //            return null;
    //        }
    //
    //    }
}