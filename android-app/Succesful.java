package com.example.livrable;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class Succesful extends AppCompatActivity {

    private TextView Success;
    private String user = Subscribe.getUser();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_succesful);


        Success = (TextView) findViewById(R.id.HUMMM);
        Success.setText("I love You " + user);
    }


}