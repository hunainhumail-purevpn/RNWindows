package com.example.nativereactfinal;

import android.util.Log;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;

import java.util.ArrayList;

public class MyNativeModule extends ReactContextBaseJavaModule {

    public MyNativeModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }
    @NonNull
    @Override
    public String getName() {
        return "MyNativeModule";
    }

    @ReactMethod
    public void receiveData(ReadableArray array) {

        WritableArray newArray = Arguments.createArray();

        for (int i = 0; i < array.size(); i++) {
            WritableMap item = Arguments.createMap();
            item.putString("name", array.getMap(i).getString("name"));
            item.putString("iso_code", array.getMap(i).getString("iso_code"));
            newArray.pushMap(item);
        }

        Log.v("NATIVE ARRAY: ", array.toString());

//        Log.v("MY LOG", String.valueOf(dataArray));
//        for (int i = 0; i < dataArray.size(); i++) {
//            WritableMap data = (WritableMap) dataArray.getMap(i);
//            String name = data.getString("name");
//            String isoCode = data.getString("iso_code");
//
//            Log.v("NAAAAM", name);
//            Log.v("CODE", isoCode);
//            // do something with the data
//        }
//        ArrayList<DataObject> dataList = new ArrayList<DataObject>();
//
//        for (int i = 0; i < dataArray.size(); i++) {
//            WritableMap data = (WritableMap) dataArray.getMap(i);
//            String name = data.getString("name");
//            String isoCode = data.getString("iso_code");
//            Log.v("DAATAA", name);
//            dataList.add(new DataObject(name, isoCode));
//        }

        // do something with the data
//        ReadableMap data1 = readableMap.getMap()
//        int size = data.size();
//        Log.i("DAATAA", readableMap.toString());
//        String name = data.getString("name");
//        String isoCode = data.getString("iso_code");
//        Log.v("DAATAA", name);
//        for (int i = 0; i < data.size(); i++) {
//            String name = data.getMap(i).getString("name");
//            String isoCode = data.getMap(i).getString("iso_code");
//
//            Log.v("NAME", name);
//            Log.v("ISO_CODE", isoCode);
//
//            // Do something with the data
//            // ...
//        }

        // Do something with the data
        // ...
    }
    private class DataObject {
        private String name;
        private String isoCode;

        public DataObject(String name, String isoCode) {
            this.name = name;
            this.isoCode = isoCode;
        }
    }
}
