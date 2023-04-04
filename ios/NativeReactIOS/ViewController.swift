//
//  ViewController.swift
//  NativeReactIOS
//
//  Created by Basit on 14/03/2023.
//
//import React
import UIKit

//@objc(MyEventEmitterModule)
//class MyEventEmitterModule: RCTEventEmitter {
//    override func supportedEvents() -> [String]! {
//        return ["myJavscriptFunction"]
//    }
//
//    override func startObserving() {
//        // Call methods to set up any upstream subscriptions here
//    }
//
//    override func stopObserving() {
//        // Call methods to tear down any upstream subscriptions here
//    }
//
//    @objc
//    func emitMyJavscriptFunctionEvent(_ message: String) {
//        sendEvent(withName: "myJavscriptFunction", body: message)
//    }
//}

class ViewController: UIViewController, RCTBridgeDelegate {
    
    
    
    func sourceURL(for bridge: RCTBridge!) -> URL! {
            #if DEBUG
            return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackExtension: nil)
            #else
            return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
            #endif
        }
    
    
//    let eventEmitter = MyEventEmitter()

    var bridge: RCTBridge!
    @IBOutlet weak var reactView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bridge = RCTBridge(delegate: self, launchOptions: nil)
        

        // Do any additional setup after loading the view.
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.bridge.eventDispatcher()?.add(eventEmitter)
//        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
//        button.titleLabel?.text = "Button"
//        self.view.addSubview(button)
        
//             let myComponentView = MyComponentView(frame: view.bounds)
//        myComponentView.backgroundColor = .red
//             view.addSubview(myComponentView)
        loadReactNativeView()
        
    }
    
//    override func loadView() {
//    loadReactNativeView()
//    }

    func loadReactNativeView() {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootView = RCTRootView(bridge: appDelegate.bridge, moduleName: "ReactPOC", initialProperties: nil)
//        let rootView =  RCTRootView(
//            bundleURL: jsCodeLocation,
//            moduleName: "app",
//            initialProperties: nil,
//            launchOptions: nil
//        )
        
        rootView.frame = CGRect(x: 0, y: 0, width: reactView.frame.width, height: reactView.frame.height)
//        rootView.backgroundColor = .red
               // Add the RCTRootView to your UIView
        reactView.addSubview(rootView)
     
    }

    
    @IBAction func countryFetchBtn(_ sender: Any) {
        MyEventEmitter.shared?.emitEvent("HEELLLLLLOOOOO!!!!!")
//
//         let myEventEmitter = MyEventEmitter()
//        let eventData = ["message": "Hello from Swift!"]
////        myEventEmitter.emitEvent("myJavscriptFunction", body: eventData)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.bridge.eventDispatcher().sendAppEvent(withName: "myJavscriptFunction", body: eventData)
        
        
        
        
//        eventEmitter.emitMyJavscriptFunctionEvent("myJavscriptFunction", additionalData: "Hello from Javascript")
//        let eventDispatcher = bridge.eventDispatcher()
//        eventDispatcher?.sendDeviceEvent(withName: "myJavscriptFunction", body: "Hello from Swift!")
//        let myEventEmitter = bridge.module(for: MyEventEmitter.self) as! MyEventEmitter
//                myEventEmitter.emitMyJavscriptFunctionEvent("Hello from Swift!")
        
        
        
//        if let myEventEmitter = bridge.module(for: MyEventEmitter.self) as? MyEventEmitter {
//            // Call the JavaScript function with DeviceEventEmitter
//            let eventName = "myJavscriptFunction"
//            let eventData = ["someData": "Some value"]
//            myEventEmitter.sendEvent(withName: eventName, body: eventData)
//        } else {
//            // Handle the case where the module is not available
//            print("MyEventEmitter module is not available")
//        }
        
        
        
        
        
        // Get a reference to the React Native bridge
//          guard let bridge = (UIApplication.shared.delegate as? AppDelegate)?.bridge else {
//            print("Failed to get bridge")
//            return
//          }
//
//          // Get a reference to the MyEventEmitter module
//          let myEventEmitter = bridge.module(for: MyEventEmitter.self) as? MyEventEmitter
//
//          // Make sure we were able to get a valid reference to the MyEventEmitter module
//          guard let emitter = myEventEmitter else {
//            print("Failed to get MyEventEmitter module")
//            return
//          }
//
//          // Define some data to pass along with the event
//          let eventData: [String: Any] = [
//            "message": "Hello from Swift!",
//            "timestamp": Date().timeIntervalSince1970
//          ]
//
//          // Call the `emitMyJavascriptFunction` method on the MyEventEmitter module
//          emitter.emitMyJavascriptFunction(eventData)
        
    }
    
    
}


//class MyComponentView: UIView {
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//
//    let jsCodeLocation = URL(string: "main.jsbundle")
//    let rootView = RCTRootView(
//      bundleURL: jsCodeLocation!,
//      moduleName: "App",
//      initialProperties: nil,
//      launchOptions: nil
//    )
//
//    addSubview(rootView)
//    rootView.frame = bounds
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//}
//
//
//
//
