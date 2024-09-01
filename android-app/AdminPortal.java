package com.example.novigrad;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import static com.example.novigrad.MainActivity.customers_database;

public class AdminPortal extends AppCompatActivity {
private Button view_users;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_admin_portal);
        view_users = (Button)findViewById(R.id.btnViewUsers);
        viewAll();
    }

    public void viewAll()
    {
        view_users.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Cursor result = customers_database.getAllData();
                if(result.getCount()  == 0 )
                {
                    showMessage("Error","No users");
                    return;
                }
                StringBuffer buffer = new StringBuffer();
                while(result.moveToNext())
                {
                    buffer.append("Name : "+ result.getString(0) + "\n");
                    buffer.append("password : " + result.getString(1)+ "\n");

                }
                showMessage("Users",buffer.toString());
            }
        });
    }

    public void showMessage(String title, String Message)
    {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setCancelable(true);
        builder.setTitle(title);
        builder.setMessage(Message);
        builder.show();
    }
}