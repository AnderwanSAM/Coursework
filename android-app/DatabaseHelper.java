package com.example.novigrad;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

public class DatabaseHelper extends SQLiteOpenHelper {

    public static String DATABASE_name = "Customers.db";
    public static String Table_name = "customer_table";
    public static String Col_1 = "Name";
    public static String Col_2 = "Password";

    public DatabaseHelper( Context context) {
        super(context, DATABASE_name, null , 1);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("create table " + Table_name +" (Name Text, Password TEXT)" );
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
         db.execSQL("DROP TABLE IF EXISTS " + Table_name);
         onCreate(db);
    }
    public boolean insertData(String name , String password)
    {
        SQLiteDatabase DB = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put(Col_1,name);
        contentValues.put(Col_2,password);
        long result = DB.insert(Table_name,null,contentValues);
        if(result == - 1 )
            return false;
        else
            return true ;
    };

    public Cursor getAllData()
    {
        SQLiteDatabase DB = this.getWritableDatabase();
        Cursor result = DB.rawQuery("select * from " + Table_name,null);
        return result;
    }
}
