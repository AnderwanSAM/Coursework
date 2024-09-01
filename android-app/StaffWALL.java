package com.example.novigrad;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import static com.example.novigrad.MainActivity.novigrad_code;

public class StaffWALL extends AppCompatActivity {
private EditText password;
private Button enter;

    public StaffWALL() {
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_staff_w_a_l_l);

        password = (EditText)findViewById(R.id.etNvgCode);
        enter = (Button)findViewById(R.id.etOK);

        enter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String code = password.getText().toString();
                if (code.equals(novigrad_code))
                {
                    Intent intent = new Intent(StaffWALL.this,StaffRegistration.class);
                    startActivity(intent);
                }
                else {
                    Intent i2 = new Intent(StaffWALL.this, MainActivity.class);
                    startActivity(i2);
                }
            }
        });
    }
}