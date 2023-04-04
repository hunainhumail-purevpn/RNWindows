package com.example.nativereactfinal;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

import com.facebook.react.BuildConfig;
import com.facebook.react.ReactInstanceManager;
import com.facebook.react.ReactPackage;
import com.facebook.react.ReactRootView;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.common.LifecycleState;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.facebook.soloader.SoLoader;
import com.facebook.react.PackageList;

//import com.example.nativereactfinal.Countries;


import java.util.List;

public class MainActivity extends AppCompatActivity {
    private final int OVERLAY_PERMISSION_REQ_CODE = 1;  // Choose any value

    private ReactRootView mReactRootView;
    private ReactInstanceManager mReactInstanceManager;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SoLoader.init(this, false);
        mReactRootView = new ReactRootView(this);

        List<ReactPackage> packages = new PackageList(getApplication()).getPackages();
//        mReactInstanceManager.getDevSupportManager().setReloadOnJSChangeEnabled(true);

        mReactInstanceManager = ReactInstanceManager.builder()
                .setApplication(getApplication())
                .setCurrentActivity(this)
                .setBundleAssetName("index.android.bundle")
                // .setJSMainModulePath("node_modules/reactnativecountryfetch/index.js")
                .setJSMainModulePath("index.js")
                .addPackages(packages)
                .addPackage(new MyNativeModulePackage())
                .setUseDeveloperSupport(true) // set to false when in production
                .setInitialLifecycleState(LifecycleState.RESUMED)
                .build();

//        mReactInstanceManager.getDevSupportManager().setHotModuleReplacementEnabled(true);
//        mReactInstanceManager.getDevSupportManager().setDevSupportEnabled(true);
//        mReactInstanceManager.getDevSupportManager().setHotModuleReplacementEnabled(true);
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
//            if (!Settings.canDrawOverlays(this)) {
//                Intent intent = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
//                        Uri.parse("package:" + getPackageName()));
//                startActivityForResult(intent, OVERLAY_PERMISSION_REQ_CODE);
//            }
//        }
        mReactRootView.startReactApplication(mReactInstanceManager, "ReactPOC", null);
// Get the ReactContext
        ReactContext reactContext = mReactInstanceManager.getCurrentReactContext();
//        Countries countries = reactContext.getNativeModule(Countries.class);
//        countries.myJavscriptFunction();

          setContentView(R.layout.activity_main);
//        setContentView(mReactRootView);
//
        LinearLayout reactLayout = (LinearLayout)findViewById(R.id.reactlayout);
        reactLayout.addView(mReactRootView);

//        onConnect();
//        fetchCountries();
        myJavscriptFunction();
    }

//    @ReactMethod
//    public void customMethod(int param, Callback callback) {
//        try {
//            // do something
//            callback.invoke(value); // Invoke the callback here
//        } catch (Exception e) {
//            // exception code here
//        }
//    }

    void myJavscriptFunction(){
        Button buttonConnect = (Button)findViewById(R.id.fetchCountriesBtn);
        buttonConnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String functionName = "myJavscriptFunction";
                String state = "CONNECT";
                Log.v("BTNPRESS", functionName);
                mReactInstanceManager.getCurrentReactContext().getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class)
                        .emit(functionName, null);
                Log.v("EVENT", "DONE");


            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == OVERLAY_PERMISSION_REQ_CODE) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (!Settings.canDrawOverlays(this)) {
                    // SYSTEM_ALERT_WINDOW permission not granted
                }
            }
        }
        mReactInstanceManager.onActivityResult(this, requestCode, resultCode, data);
    }

}