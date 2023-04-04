//
//  ViewController.swift
//  NativeReactMac
//
//  Created by Basit on 15/03/2023.
//

import Cocoa
// import React

class ViewController: NSViewController, RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
            #if DEBUG
            return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackExtension: nil)
            #else
            return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
            #endif
    }
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    

    @IBAction func countryFetchBtn(_ sender: Any) {
    }
//    var bridge: RCTBridge!

    @IBOutlet weak var reactViee: NSBox!
    override func viewDidLoad() {
            super.viewDidLoad()
                
//            bridge = RCTBridge(delegate: self, launchOptions: nil)
            loadReactNativeView()
            
        }
    func loadReactNativeView() {
       let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
        // let jsCodeLocation = URL(string: "http://localhost:8081/index.ios.bundle")!
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        let rootView = RCTRootView(bridge: appDelegate.bridge ?? RCTBridge(), moduleName: "app", initialProperties: nil)
//        let rootView =  RCTRootView(
//            bundleURL: jsCodeLocation,
//            moduleName: "app",
//            initialProperties: nil,
//            launchOptions: nil
//        )
        
        rootView.frame = CGRect(x: 0, y: 0, width: reactViee.frame.width, height: reactViee.frame.height)
//        rootView.backgroundColor = .red
               // Add the RCTRootView to your UIView
        reactViee.addSubview(rootView)
     
    }
}

