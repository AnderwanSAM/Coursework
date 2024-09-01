package com.example.livrable;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class Subscribe extends AppCompatActivity {

    private EditText Id, password, number;
    private Button Creation;
    private static String user;
    private static String pass;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_subscribe);

        Id = (EditText) findViewById(R.id.setID);
        password = (EditText) findViewById(R.id.setPassword);
        number = (EditText) findViewById(R.id.setPhoneNumber);
        Creation = (Button) findViewById(R.id.Creation);

        Creation.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                user = Id.getText().toString();
                pass = password.getText().toString();
               MainActivity.setClient(user, pass);

                Intent accepted = new Intent(getApplicationContext(), MainActivity.class);
                startActivityForResult(accepted, 0);
            }
        });



    }

    public static String getUser(){
        return user;
    }
}