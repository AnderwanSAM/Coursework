package com.example.livrable;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class Subscribe_Success extends AppCompatActivity {

    private TextView Congrats;
    private String user = Subscribe.getUser();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_client_sucess);


        Congrats = (TextView) findViewById(R.id.Congrats);

        Congrats.setText(Congrats.getText() + "Bienvenue");

    }


}