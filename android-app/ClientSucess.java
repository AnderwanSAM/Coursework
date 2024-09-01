package com.example.livrable;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class ClientSucess extends AppCompatActivity {


    TextView UserName;
    private String user = MainActivity.getUser();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_client_sucess);


        UserName = (TextView) findViewById(R.id.Username);
        UserName.setText("Bienvenue" + user + ", Vous etes connecté" );
    }





}