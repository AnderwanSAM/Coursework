package com.example.novigrad;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {


static public DatabaseHelper customers_database;
private EditText userName;
private EditText password ;
private Button login;
private Button signup;
public final static String novigrad_code = "SCIO";
Customer [] List = new Customer[100000];
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        customers_database = new DatabaseHelper(this);
        userName = (EditText)findViewById(R.id.etUsername);
        password = (EditText)findViewById(R.id.etPassword);
        login = (Button)findViewById(R.id.btnLogin);
        signup = (Button)findViewById(R.id.btnSignUP);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, AdminPortal.class);
                startActivity(intent);
               if ((userName.getText().toString().equals("SCIO") ) && (  password.getText().toString().equals("SEG")))
               {
                   Intent intent2 = new Intent(MainActivity.this, AdminPortal.class);
                   startActivity(intent2);
               }
               else // rechercher dans la base de donnees
                   {
                       //rechercher parmi les clients
                       Cursor result = customers_database.getAllData();
                       for(int i = 0 ; i < result.getCount(); i++)
                       {

                       }
                       //rechercher parmi les employes

                   }

            }
        });

        signup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this,SignUp.class);
                startActivity(intent);
            }
        });
    }
/*public boolean isAdmin(String username , String Password)
{
    if ((username.y) && (password.equals("SEG")))
        return true;
    else
        return false;

}*/

}