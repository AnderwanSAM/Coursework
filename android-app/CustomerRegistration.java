package com.example.novigrad;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import static com.example.novigrad.MainActivity.customers_database;

public class CustomerRegistration extends AppCompatActivity {
private EditText name_user;
private EditText password_user;
private Button register ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_customer_registration);
        name_user = (EditText)findViewById(R.id.etClientName);
        password_user = (EditText)findViewById(R.id.etNPassword);
        register = (Button)findViewById(R.id.btnRegister);
        AddCustomer();
    }

    public void AddCustomer()
    {
        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean isInserted  = customers_database.insertData(name_user.getText().toString(),password_user.getText().toString());
                if(isInserted == true)
                {
                    Toast.makeText(CustomerRegistration.this,"Customer Added",Toast.LENGTH_LONG).show();
                }
                else
                    {
                        Toast.makeText(CustomerRegistration.this,"Customer Not Added",Toast.LENGTH_LONG).show();
                    }
            }
        });
    }
}